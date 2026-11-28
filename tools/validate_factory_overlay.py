"""Lean technical gate for Naru V4 and preserved V3 overlay. Visual approval remains separate."""
import argparse,base64,hashlib,io,json,pathlib,sys
from PIL import Image
C=pathlib.Path(__file__).resolve().parents[1]/'art/factory/CONTRACT.json'
def validate(path,revision='auto'):
    p=json.loads(path.read_text());id=p['character_id'];issues=[];warnings=[];metrics={}
    if revision=='auto':revision='v3' if len(p.get('clips',{}))==14 else 'v4'
    contract=json.loads((C.with_name('CONTRACT_V3_ARCHIVE.json') if revision=='v3' else C).read_text())
    required={f'animation/{id}/{a}_{d}.png':v for a,v in contract['actions'].items() for d in v['directions']}
    assets=p['assets'];clips=p['clips'];static=f'characters/{id}.png'
    if set(assets)!=set(required)|{static}:issues.append('exact asset keys mismatch')
    if set(clips)!=set(required):issues.append('exact clip keys mismatch')
    if p.get('status')!='REVIEW_ONLY' or p.get('schema')!=1:issues.append('wrong overlay contract')
    for key,n in {**required,static:None}.items():
        if key not in assets:continue
        try:
            entry=assets[key];raw=base64.b64decode(entry['png'],validate=True)
            if hashlib.sha256(raw).hexdigest()!=entry['sha256']:raise ValueError('asset SHA mismatch')
            im=Image.open(io.BytesIO(raw));im.load()
            if im.format!='PNG' or im.mode!='RGBA':raise ValueError('not RGBA PNG')
            count=n['frames'] if n else 1
            if im.size!=(96*count,112) or [entry['width'],entry['height']]!=list(im.size):raise ValueError('bad runtime dimensions')
            meta=clips.get(key)
            if n and (not meta or meta['sha256']!=entry['sha256'] or meta['anchor']!=[48,104] or len(meta['frames'])!=count):raise ValueError('bad clip metadata')
            seen=set();bboxes=[]
            for i in range(count):
                cell=im.crop((i*96,0,(i+1)*96,112))
                if n:
                    f=meta['frames'][i]
                    if f['rect']!=[i*96,0,96,112] or not 20<=f['duration_ms']<=2000:raise ValueError('bad rect/timing')
                b=cell.getchannel('A').point(lambda a:255 if a>=32 else 0).getbbox()
                if not b:raise ValueError(f'empty cel {i}')
                if b[0]==0 or b[1]==0 or b[2]==96 or b[3]==112:issues.append(f'{key}: edge contact in cel {i}, inspect clipping')
                seen.add(hashlib.sha256(cell.tobytes()).hexdigest());bboxes.append(b)
            if len(seen)!=count:issues.append(f'{key}: duplicate pixel frames {len(seen)}/{count}')
            heights=[b[3]-b[1] for b in bboxes];centers=[(b[0]+b[2])/2 for b in bboxes];bottoms=[b[3] for b in bboxes]
            m={'frames':count,'distinct':len(seen),'height_span':max(heights)-min(heights),'center_span':max(centers)-min(centers),'bottom_span':max(bottoms)-min(bottoms)}
            metrics[key]=m
            if '/move_' in key and any(m[k]>limit for k,limit in [('height_span',10),('center_span',3),('bottom_span',10)]):warnings.append(f'{key}: motion anchor/scale review {m}')
        except Exception as e:issues.append(f'{key}: {e}')
    return {'character_id':id,'revision':revision,'technical_status':'PASS' if not issues else 'HOLD','visual_status':'NOT_TESTED','runtime_status':'NOT_TESTED','issues':issues,'warnings':warnings,'metrics':metrics}
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('overlay',type=pathlib.Path);p.add_argument('--out',type=pathlib.Path);p.add_argument('--revision',choices=['auto','v3','v4'],default='auto');a=p.parse_args();r=validate(a.overlay,a.revision);s=json.dumps(r,indent=2);print(s)
    if a.out:a.out.write_text(s)
    sys.exit(0 if r['technical_status']=='PASS' else 1)
