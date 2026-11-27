"""Audit pinned Devolution source and optionally normalize locally supplied animation frames.
No source art is committed or uploaded by CI. The original state map is authoritative.
"""
import argparse, collections, hashlib, json, pathlib, tempfile, urllib.request, zipfile
from PIL import Image
from io import BytesIO
BASE='https://codeload.github.com/kentaro456/naruto-devolution/zip/48af70cf0fe07931f923ef86e1740d7c6f45e942'
ACTIONS={'idle':['IDLE'],'move':['RUN','WALK'],'attack':['ATTACK_LIGHT_1','ATTACK_LIGHT'],'cast':['CHARGE'],'hit':['HIT'],'fall':['KO']}
def download():
    with urllib.request.urlopen(urllib.request.Request(BASE,headers={'User-Agent':'Naru-review'}),timeout=120) as r:return r.read()
def evaluate(z,out,local):
    members={}
    for name in z.namelist():
        p=pathlib.PurePosixPath(name)
        if len(p.parts)<2 or '..' in p.parts:continue
        members['/'.join(p.parts[1:])]=name
    prefix='assets/organized/characters/'
    images=[p for p in members if p.startswith('assets/organized/') and p.lower().endswith('.png')]
    files=[p for p in members if p.startswith(prefix) and p.endswith('/mapping.json') and len(p[len(prefix):].split('/'))==2]
    report=[]
    for p in sorted(files):
        folder=p.rsplit('/',1)[0]; ident=folder.rsplit('/',1)[1]
        doc=json.loads(z.read(members[p])); state=doc.get('stateMap',{})
        if not isinstance(state,dict):continue
        info={'id':ident,'name':doc.get('targetName',ident),'states':{},'actions':{},'direction':'SIDE_VIEW_UNVERIFIED','status':'LOCAL_REVIEW_ONLY'}
        for k,seq in state.items():
            if not isinstance(seq,list):continue
            paths=[folder+'/frames/'+s for s in seq if isinstance(s,str) and '/' not in s and '\\' not in s]
            valid=[s for s in paths if s in members]
            info['states'][k]={'frames':len(seq),'found':len(valid)}
        for action,keys in ACTIONS.items():
            chosen=next((k for k in keys if k in info['states'] and info['states'][k]['frames']>0 and info['states'][k]['frames']==info['states'][k]['found']),None)
            if not chosen:continue
            seq=state[chosen]; frames=[]
            error=''
            try:
                for f in seq:
                    im=Image.open(BytesIO(z.read(members[folder+'/frames/'+f]))).convert('RGBA')
                    if im.getbbox() is None:raise ValueError('transparent empty frame')
                    frames.append(im)
            except Exception as e:error=str(e)
            info['actions'][action]={'source_state':chosen,'frames':len(frames),'error':error,'status':'VISUAL_PIVOT_REVIEW_REQUIRED'}
            if local and not error:
                # No guessed crop, no fabricated facing, no changes to artwork. Whole original frames in a local review GIF.
                width=max(im.width for im in frames);height=max(im.height for im in frames)
                padded=[]
                for im in frames:
                    canvas=Image.new('RGBA',(width,height));canvas.alpha_composite(im,((width-im.width)//2,height-im.height));padded.append(canvas)
                sub=out/'local-devolution'/ident;sub.mkdir(parents=True,exist_ok=True)
                padded[0].save(sub/(action+'.gif'),save_all=True,append_images=padded[1:],duration=100,loop=0,disposal=2)
        report.append(info)
    summary={'source_commit':'48af70cf0fe07931f923ef86e1740d7c6f45e942','organized_pngs':len(images),'characters_with_top_level_mapping':len(report),'complete_six_action_candidates':sum(len(c['actions'])==6 and all(not a['error'] for a in c['actions'].values()) for c in report),'verified_action_frames':sum(a['frames'] for c in report for a in c['actions'].values() if not a['error']),'characters':report,'warning':'Side-view only; source state map is not proof of visual quality or rights. Local previews use provisional 100ms timing and bottom-center padding, not approved runtime clips.'}
    (out/'DEVOLUTION_AUDIT.json').write_text(json.dumps(summary,indent=2))
    print('NARU_DEVOLUTION_AUDIT',summary['organized_pngs'],summary['characters_with_top_level_mapping'],summary['complete_six_action_candidates'],summary['verified_action_frames'],flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);p.add_argument('--source-zip',type=pathlib.Path);p.add_argument('--local-previews',action='store_true');a=p.parse_args();a.out.mkdir(parents=True,exist_ok=True)
    if a.local_previews and a.source_zip is None:p.error('local previews require an explicitly supplied source zip')
    with zipfile.ZipFile(a.source_zip if a.source_zip else BytesIO(download())) as z:evaluate(z,a.out,a.local_previews)
