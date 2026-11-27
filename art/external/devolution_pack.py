"""D2: pinned frame-by-frame local review production, separate from public game art.
Generate GIFs for all usable source actions, normalized 96x112 sheets, and an opt-in Godot pack.
Do not execute source code or publish source assets. Only the report is uploaded by public CI.
"""
import argparse, base64, collections, hashlib, json, math, pathlib, statistics, urllib.request, zipfile
from io import BytesIO
from PIL import Image, ImageDraw
BASE='https://codeload.github.com/kentaro456/naruto-devolution/zip/48af70cf0fe07931f923ef86e1740d7c6f45e942'
ANCHOR=(48,104)
CELL=(96,112)
ACTION_KEYS={'idle':['IDLE'],'move':['RUN','WALK'],'attack':['ATTACK_LIGHT_1','ATTACK_LIGHT'],'cast':['HAND_SEAL','CAST','SEAL','CHARGE'],'hit':['HIT'],'fall':['KO']}
TIMING={'idle':120,'move':83,'attack':83,'cast':100,'hit':83,'fall':100}
MAP=json.loads(pathlib.Path(__file__).with_name('DEVOLUTION_IDENTITY_MAP.json').read_text())
def download(path):
    with urllib.request.urlopen(urllib.request.Request(BASE,headers={'User-Agent':'Naru-D2-review'}),timeout=180) as r, path.open('wb') as f:
        while True:
            block=r.read(1024*1024)
            if not block:break
            f.write(block)
def read_json(z,m,path):
    return json.loads(z.read(m[path])) if path in m else {}
def png(im):
    buf=BytesIO();im.save(buf,format='PNG');return buf.getvalue()
def safe_name(s):
    return ''.join(c if c.isalnum() or c in '-_' else '_' for c in str(s))[:120]
def run(z,out):
    members={}
    for n in z.namelist():
        p=pathlib.PurePosixPath(n)
        if len(p.parts)>1 and '..' not in p.parts and not p.is_absolute():members['/'.join(p.parts[1:])]=n
    prefix='assets/organized/characters/'
    files=[p for p in members if p.startswith(prefix) and p.endswith('/mapping.json') and len(p[len(prefix):].split('/'))==2]
    pack={'schema':1,'status':'LOCAL_DEVOLUTION_REVIEW','source_commit':'48af70cf0fe07931f923ef86e1740d7c6f45e942','characters':{}}
    report=[]
    for p in sorted(files):
        folder=p.rsplit('/',1)[0];ident=folder.rsplit('/',1)[1]
        data=read_json(z,members,p); states=data.get('stateMap',{})
        if not isinstance(states,dict):continue
        identity=MAP.get(ident,{'id':'','status':'HOLD_UNKNOWN'})
        rec={'source_id':ident,'name':data.get('targetName',ident),'identity':identity,'source_direction':'screen_right_candidate','actions':{},'all_source_states':{}}
        src=read_json(z,members,folder+'/source_project.json')
        pivots={}
        for target in src.get('targets',[]):
            if target.get('isStage'):continue
            for c in target.get('costumes',[]):
                name=c.get('md5ext','')
                if name and isinstance(c.get('rotationCenterX'),(int,float)) and isinstance(c.get('rotationCenterY'),(int,float)):
                    pivots[name]=(float(c['rotationCenterX']),float(c['rotationCenterY']))
        cache={}
        def frame(name):
            if not isinstance(name,str) or '/' in name or '\\' in name:raise ValueError('invalid name')
            if name in cache:return cache[name]
            path=folder+'/frames/'+name
            if path not in members:raise ValueError('missing frame '+name)
            im=Image.open(BytesIO(z.read(members[path]))).convert('RGBA')
            bb=im.getchannel('A').getbbox()
            if not bb:raise ValueError('empty alpha '+name)
            pivot=pivots.get(name)
            if pivot and not (-im.width<=pivot[0]<=2*im.width and -im.height<=pivot[1]<=2*im.height):pivot=None
            cache[name]=(im,bb,pivot)
            return cache[name]
        candidates={}
        for state,seq in states.items():
            if not isinstance(seq,list) or not seq:continue
            try:
                for n in seq:frame(n)
                candidates[state]=seq
                rec['all_source_states'][state]={'frames':len(seq),'status':'DECODED'}
            except Exception as e:rec['all_source_states'][state]={'frames':len(seq),'status':'HOLD','error':str(e)}
        selected={}
        for action,keys in ACTION_KEYS.items():
            for key in keys:
                seq=candidates.get(key)
                if not seq:continue
                if action=='cast' and (key=='CHARGE' or set(seq).issubset(set(candidates.get('IDLE',[])))):continue
                selected[action]=(key,seq);break
        # Use Scratch source rotation center and one stable ground offset derived from idle.
        # It is a candidate alignment, not a source-certified foot anchor.
        idle=selected.get('idle',('',[]))[1]
        deltas=[frame(n)[1][3]-frame(n)[2][1] for n in idle if frame(n)[2] is not None]
        ground=statistics.median(deltas) if deltas else None
        def anchor(name):
            im,bb,pv=frame(name)
            if pv is not None and ground is not None:return pv[0],pv[1]+ground
            return (bb[0]+bb[2])/2,bb[3]
        core_names=list(dict.fromkeys(n for _,seq in selected.values() for n in seq))
        ext=[]
        for n in core_names:
            im,bb,pv=frame(n);x,y=anchor(n)
            ext.append((bb[0]-x,bb[1]-y,bb[2]-x,bb[3]-y))
        if ext:
            l=min(t[0] for t in ext);t=min(t[1] for t in ext);r=max(t[2] for t in ext);b=max(t[3] for t in ext)
            scale=min(1.0,46/max(1,-l),46/max(1,r),102/max(1,-t),6/max(1,b))
        else:scale=1.0
        rec['shared_scale']=scale;rec['source_center_frames']=sum(frame(n)[2] is not None for n in core_names);rec['selected_unique_frames']=len(core_names)
        sub=out/'local-gifs'/safe_name(ident);sub.mkdir(parents=True,exist_ok=True)
        sheetdir=out/'local-sheets'/safe_name(ident);sheetdir.mkdir(parents=True,exist_ok=True)
        def normalized(name,s):
            im,bb,pv=frame(name);x,y=anchor(name)
            crop=im.crop(bb)
            crop=crop.resize((max(1,round(crop.width*s)),max(1,round(crop.height*s))),Image.Resampling.NEAREST)
            dx=round(ANCHOR[0]+(bb[0]-x)*s);dy=round(ANCHOR[1]+(bb[1]-y)*s)
            if dx<0 or dy<0 or dx+crop.width>CELL[0] or dy+crop.height>CELL[1]:raise ValueError('frame outside canvas '+name)
            dst=Image.new('RGBA',CELL);dst.alpha_composite(crop,(dx,dy));return dst
        def gif(cels,path,ms):
            # Opaque dark neutral review background avoids GIF alpha/disposal glitches.
            seq=[]
            for cel in cels:
                bg=Image.new('RGBA',cel.size,(32,40,48,255));bg.alpha_composite(cel);seq.append(bg.convert('RGB').resize((cel.width*2,cel.height*2),Image.Resampling.NEAREST))
            seq[0].save(path,save_all=True,append_images=seq[1:],duration=ms,loop=0,disposal=2,optimize=False)
        clips={}
        for action,(state,seq) in selected.items():
            try:
                cels=[normalized(n,scale) for n in seq]
                ms=TIMING[action];gif(cels,sub/(action+'.gif'),ms)
                if len(cels)>42:raise ValueError('core clip exceeds 4096px strip limit')
                sheet=Image.new('RGBA',(CELL[0]*len(cels),CELL[1]))
                for i,cel in enumerate(cels):sheet.alpha_composite(cel,(i*CELL[0],0))
                raw=png(sheet);(sheetdir/(action+'.png')).write_bytes(raw)
                rec['actions'][action]={'state':state,'frames':len(cels),'timing_ms':ms,'status':'CANDIDATE','sha256':hashlib.sha256(raw).hexdigest()}
                # Require source centers for every frame and a directly inspected identity.
                if identity['status']=='VISUAL_IDLE_MATCH' and ground is not None and all(frame(n)[2] is not None for n in seq):
                    clips[action]={'png':base64.b64encode(raw).decode(),'sha256':hashlib.sha256(raw).hexdigest(),'frames':len(cels),'frame_ms':ms}
            except Exception as e:rec['actions'][action]={'status':'HOLD','error':str(e)}
        # Preserve all other source states as independent GIFs without implying Naru gameplay mapping.
        for state,seq in candidates.items():
            if state in [s for s,_ in selected.values()]:continue
            try:
                cells=[frame(n) for n in seq]
                width=max(im.width for im,_,_ in cells);height=max(im.height for im,_,_ in cells)
                if width*height*len(cells)>18000000:raise ValueError('preview exceeds pixel budget')
                padded=[]
                for im,_,_ in cells:
                    canvas=Image.new('RGBA',(width,height));canvas.alpha_composite(im,((width-im.width)//2,height-im.height));padded.append(canvas)
                gif(padded,sub/('source-'+safe_name(state)+'.gif'),100)
                rec['all_source_states'][state]['gif']='GENERATED_SOURCE_PREVIEW'
            except Exception as e:rec['all_source_states'][state]['gif_error']=str(e)
        if 'idle' in clips and identity['id'] and '-F' not in identity['id']:
            pack['characters'][identity['id']]={'source_id':ident,'direction':'screen_right','clips':clips}
        rec['runtime_candidate_actions']=sorted(clips)
        rec['six_action_complete']=all(rec['actions'].get(a,{}).get('status')=='CANDIDATE' for a in ACTION_KEYS)
        rec['gif_count']=len(list(sub.glob('*.gif')))
        report.append(rec)
    (out/'LOCAL_NINJA_PACK.json').write_text(json.dumps(pack,separators=(',',':')))
    summary={'source_commit':pack['source_commit'],'mapped_groups':len(report),'core_clips':sum(a.get('status')=='CANDIDATE' for r in report for a in r['actions'].values()),'core_frames':sum(a.get('frames',0) for r in report for a in r['actions'].values()),'gifs':sum(r['gif_count'] for r in report),'complete_six_actions':sum(r['six_action_complete'] for r in report),'runtime_candidate_ids':sorted(pack['characters']),'runtime_candidate_clips':sum(len(c['clips']) for c in pack['characters'].values()),'characters':report,'limitations':'Local source assets only; side-view screen-right candidates; provisional timing and center-derived anchors; no fabricated cast or left/back frames.'}
    (out/'D2_REPORT.json').write_text(json.dumps(summary,indent=2))
    print('NARU_D2_PRODUCTION',json.dumps({k:v for k,v in summary.items() if k!='characters'}),flush=True)
    if not pack['characters']:raise RuntimeError('no runtime candidates')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);p.add_argument('--source-zip',type=pathlib.Path);a=p.parse_args();a.out.mkdir(parents=True,exist_ok=True)
    path=a.source_zip or a.out/'source.zip'
    if not path.exists():download(path)
    with zipfile.ZipFile(path) as z:run(z,a.out)
