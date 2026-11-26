#!/usr/bin/env python3
"""R13 sprite-first conversion; a normalized PNG is not visual acceptance.
Usage: prepare_batch.py input.json output_dir
Input lists character IDs, source PNGs, and optional explicit clip frame rectangles.
Never crops a battle screenshot, mirrors, pads repeated frames, or alters locked IDs.
"""
import argparse, hashlib, json, math
from pathlib import Path
from PIL import Image
from collections import Counter
LOCKED={'NIN-004','NIN-060','NIN-068','NIN-093'}
DIRECTIONS={'se','sw','ne','nw'}
ACTION_MIN={'idle':4,'move':8,'attack':6,'cast':6,'hit':4,'fall':4}
SIZE=(96,112); ANCHOR=(48,104)
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def rgba_source(path):
    im=Image.open(path)
    if im.mode!='RGBA':raise ValueError(f'{path}: RGBA source required; background removal must be reviewed first')
    if not im.getchannel('A').getextrema()[0]==0:raise ValueError(f'{path}: missing real alpha')
    return im

def crop_frame(im,rect,desc):
    x,y,w,h=map(int,rect)
    if min(x,y)<0 or w<8 or h<8 or x+w>im.width or y+h>im.height:raise ValueError(f'{desc}: invalid source rectangle')
    c=im.crop((x,y,x+w,y+h)); a=c.getchannel('A'); box=a.point(lambda n:255 if n>=24 else 0).getbbox()
    if box is None:raise ValueError(f'{desc}: empty cel')
    if box[0]==0 or box[1]==0 or box[2]==w or box[3]==h:raise ValueError(f'{desc}: foreground touches source rectangle boundary')
    return c,box

def fit(c,box,scale,foot):
    if not 0<scale<=8:raise ValueError('invalid common scale')
    x0,y0,x1,y1=box; fx,fy=foot
    # Preserve a single character-wide scale, no per-frame stretching.
    trim=c.crop(box).resize((max(1,round((x1-x0)*scale)),max(1,round((y1-y0)*scale))),Image.Resampling.LANCZOS)
    at=(round(ANCHOR[0]+(x0-fx)*scale),round(ANCHOR[1]+(y0-fy)*scale))
    if min(at)<0 or at[0]+trim.width>SIZE[0] or at[1]+trim.height>SIZE[1]:raise ValueError('normalized cel clips canvas; fix common scale/foot point')
    out=Image.new('RGBA',SIZE);out.alpha_composite(trim,at);return out

def read_sequence(root,spec,desc):
    im=rgba_source(root/spec['source']); frames=spec.get('frames') or [{'rect':[0,0,*im.size]}]; out=[]
    for i,f in enumerate(frames):
        c,box=crop_frame(im,f['rect'],f'{desc}/{i}')
        # Foot anchors must be manually provided for airborne/fall frames.
        foot=f.get('foot') or [(box[0]+box[2])/2,box[3]]
        if not (0<=foot[0]<=c.width and 0<=foot[1]<=c.height):raise ValueError('foot outside source cell')
        out.append((c,box,foot,int(f.get('duration_ms',100))))
    return out

def build(config,out):
    root=config.parent; specs=json.loads(config.read_text()); out.mkdir(parents=True,exist_ok=True); records=[]; ids=set()
    for ch in specs['characters']:
        id=ch['id']
        if id in ids or id in LOCKED or not id.startswith('NIN-') or not 1<=int(id[-3:])<=144:raise ValueError(f'{id}: duplicate, locked or invalid ID')
        ids.add(id); dest=out/id; dest.mkdir(exist_ok=True)
        if ch.get('review') not in ['HOLD','CANDIDATE']:raise ValueError('automatic visual approval prohibited')
        still=read_sequence(root,ch['static'],id+'/static')
        if len(still)!=1:raise ValueError('one static cel required')
        clips={}
        for spec in ch.get('clips',[]):
            act,direction=spec['action'],spec['direction']; key=act+'_'+direction
            if act not in ACTION_MIN or direction not in DIRECTIONS or key in clips:raise ValueError(f'{id}: invalid/duplicate action direction {key}')
            seq=read_sequence(root,spec,id+'/'+key)
            if len(seq)<ACTION_MIN[act]:raise ValueError(f'{id}/{key}: insufficient independently authored frames')
            if any(t<20 or t>2000 for _,_,_,t in seq):raise ValueError('bad frame timing')
            clips[key]=seq
        # Choose one scale per character, including wide attacks; explicit scale allowed.
        allframes=still+[f for seq in clips.values() for f in seq]
        limits=[]
        for c,(x0,y0,x1,y1),(fx,fy),t in allframes:
            for d,available in [(fx-x0,ANCHOR[0]-2),(x1-fx,SIZE[0]-ANCHOR[0]-2),(fy-y0,ANCHOR[1]-2),(y1-fy,SIZE[1]-ANCHOR[1]-2)]:
                if d>0:limits.append(available/d)
        scale=float(ch.get('scale',min(1.0,*limits)))
        static=fit(*still[0][:2],scale,still[0][2]); path=dest/'static.png'; static.save(path)
        rows=[]
        for key,seq in clips.items():
            im=Image.new('RGBA',(SIZE[0]*len(seq),SIZE[1])); meta=[]; hashes=[]
            for i,(c,b,foot,duration) in enumerate(seq):
                cel=fit(c,b,scale,foot); hashes.append(hashlib.sha256(cel.tobytes()).hexdigest()); im.alpha_composite(cel,(i*SIZE[0],0));meta.append({'rect':[i*SIZE[0],0,*SIZE],'duration_ms':duration})
            if len(set(hashes))!=len(hashes):raise ValueError(f'{id}/{key}: repeated frame; do not pad or reuse identical cels')
            path=dest/(key+'.png');im.save(path);rows.append({'key':key,'sha256':sha(path),'anchor':list(ANCHOR),'frames':meta,'distinct':len(set(hashes))})
        records.append({'id':id,'review':ch['review'],'scale':scale,'static_sha256':sha(dest/'static.png'),'clips':rows,'clip_count':len(rows),'complete_24':len(rows)==24,'runtime_integrated':False})
    manifest={'schema':1,'visual_approval':'NOT_EVALUATED','characters':records,'counts':{'static':len(records),'clips':sum(r['clip_count'] for r in records),'complete_24':sum(r['complete_24'] for r in records)}}
    (out/'manifest.json').write_text(json.dumps(manifest,indent=2,ensure_ascii=False)+'\n');print(json.dumps(manifest['counts']))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('config',type=Path);p.add_argument('output',type=Path);a=p.parse_args();build(a.config,a.output)
