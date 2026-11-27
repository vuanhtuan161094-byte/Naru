"""Review external ninja atlases locally, with an optional metadata-only CI output.
Sources are pinned; original media is not committed or published by CI.
"""
import argparse, json, pathlib, tempfile, urllib.request, zipfile, collections, re
from PIL import Image
from io import BytesIO
from convert_reuse import ninja
BOUND='https://codeload.github.com/WanderlanLima/Naruto-Bound-/zip/5c691ddeb1a81f712aa2e19b6fec18540fcebcc8'
NINJA='https://raw.githubusercontent.com/sparklinlabs/superpowers-asset-packs/e8674a03ab4456802f71f848c4df79eccca23f7a/ninja-adventure/'
def get(url):
    with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Naru-asset-review'}),timeout=120) as r:return r.read()
def audit(out,local):
    out.mkdir(parents=True,exist_ok=True)
    report=[]
    with tempfile.TemporaryDirectory() as tmp:
        dest=pathlib.Path(tmp); archive=dest/'source.zip';archive.write_bytes(get(BOUND))
        with zipfile.ZipFile(archive) as z:
            for n in z.namelist():
                p=pathlib.PurePosixPath(n); rel=p.parts[1:]
                if len(rel)<5 or rel[:3]!=('public','assets','characters') or '..' in rel or p.suffix.lower() not in ('.png','.json'):continue
                if not ('anims' in rel or p.name=='character.json'):continue
                path=dest.joinpath(*rel);path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(z.read(n))
        src=dest/'public/assets/characters'
        for character in sorted(src.iterdir()):
            if not character.is_dir():continue
            info=character/'character.json'
            meta=json.loads(info.read_text()) if info.is_file() else {}
            for p in sorted(character.glob('anims/*.json')):
                raw=json.loads(p.read_text()); f=raw.get('frames',{}); im=p.with_suffix('.png')
                if not isinstance(f,dict) or not f or not im.exists():continue
                status='CANDIDATE_SINGLE_SOURCE_DIRECTION'
                error=''
                try:
                    with Image.open(im) as img:
                        for key,frame in f.items():
                            q=frame['frame'];x,y,w,h=(q[k] for k in ('x','y','w','h'))
                            if x<0 or y<0 or x+w>img.width or y+h>img.height:raise ValueError('rect outside atlas')
                        dims=list(img.size)
                    if p.stem=='run':status='HOLD_SPEED_SMEAR_VISUAL' if character.name in ('vdfno_100304','vdfno_100306') else 'REVIEW_MOVE_VISUAL'
                except Exception as e:status='INVALID';error=str(e);dims=[]
                report.append({'source_id':character.name,'name':meta.get('name','UNVERIFIED'),'facing':meta.get('facing','UNVERIFIED'),'action':p.stem,'frames':len(f),'atlas_size':dims,'status':status,'error':error})
            if local:
                # Keep output on the user's machine; not public CI artifact.
                try:ninja(character, out/'local-ninja'/character.name)
                except Exception as e:print('LOCAL_NINJA_CONVERSION_ERROR',character.name,str(e))
    (out/'NARUTO_ATLAS_AUDIT.json').write_text(json.dumps(report,indent=2))
    print('NARU_NINJA_ATLAS_AUDIT',len({r['source_id'] for r in report}),len(report),sum(r['frames'] for r in report),flush=True)
def generic(out):
    dest=out/'generic-ninja';dest.mkdir(parents=True,exist_ok=True)
    # Source layout: 4 cardinal columns, 7 rows. Walk frames are rows 0-3; attack is row 4.
    report=[]
    for n in range(1,26):
        img=Image.open(BytesIO(get(NINJA+f'characters/{n}.png'))).convert('RGBA')
        if img.size!=(64,112):raise ValueError(f'unsupported sheet {n}: {img.size}')
        sub=dest/str(n);sub.mkdir(exist_ok=True)
        for col,direction in enumerate(('down','up','left','right')):
            frames=[img.crop((col*16,row*16,(col+1)*16,(row+1)*16)) for row in range(4)]
            strip=Image.new('RGBA',(64,16))
            for j,im in enumerate(frames):strip.alpha_composite(im,(j*16,0))
            strip.save(sub/(direction+'-move.png'))
            large=[f.resize((96,96),Image.Resampling.NEAREST) for f in frames]
            large[0].save(sub/(direction+'-move.gif'),save_all=True,append_images=large[1:],duration=167,loop=0,disposal=2)
        report.append({'source_id':n,'frame_size':[16,16],'cardinal_walk_directions':4,'walk_cels_per_direction':4,'status':'NPC_OR_WORLD_CANDIDATE_ONLY','reason':'16px source; not identity-mapped named Naruto battle art'})
    (dest/'manifest.json').write_text(json.dumps(report,indent=2))
    (dest/'SOURCE.txt').write_text('Superpowers Ninja Adventure CC0 art by Pixel-boy; source '+NINJA+'README.md')
    print('NARU_GENERIC_NINJA',len(report),len(report)*4,len(report)*16,flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);p.add_argument('--local-naruto-media',action='store_true');a=p.parse_args()
    audit(a.out,a.local_naruto_media);generic(a.out)
