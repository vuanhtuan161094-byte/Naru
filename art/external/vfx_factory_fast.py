"""FAST VFX library: reuse pinned, baked source frames, one shared atlas per source.
No rig, no generated character art, no combat rules. Source license and notice retained.
"""
import argparse,collections,concurrent.futures,hashlib,io,json,pathlib,re,shutil,sys,urllib.request
from PIL import Image,ImageDraw
import convert_reuse as src
ROOT=pathlib.Path(__file__).resolve().parents[2]
PLAN=json.loads((ROOT/'art/vfx/FACTORY_PLAN.json').read_text())
def dump(p,v):p.parent.mkdir(parents=True,exist_ok=True);p.write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
def fetch(path):
    for i in range(3):
        try:return src.get(path)
        except Exception:
            if i==2:raise
def one(stem,dest):
    asset=fetch(stem+'.asset').decode()
    refs=re.findall(r'(?m)^  - \{fileID: (-?\d+), guid: ([a-f0-9]+), type: 3\}',asset)
    if not refs:raise ValueError('empty frame list')
    wanted={g for _,g in refs};pages={}
    for page in range(1,33):
        if wanted.issubset(pages):break
        p=stem if page==1 else stem+'.'+str(page)
        meta=fetch(p+'.png.meta').decode()
        guid=re.search(r'(?m)^guid: ([a-f0-9]+)',meta).group(1)
        pages[guid]=(Image.open(io.BytesIO(fetch(p+'.png'))).convert('RGBA'),src.rects(meta))
    frames=[]
    for id,g in refs:
        im,lookup=pages[g];x,y,w,h,px,py=lookup[id];top=im.height-y-h
        if min(x,top)<0 or x+w>im.width or top+h>im.height:raise ValueError('invalid source rect')
        frames.append((im.crop((x,top,x+w,top+h)),px*w,(1-py)*h))
    strip,indices=src.strip(frames,(128,128),(64,64),limit=30)
    cells=[strip.crop((128*i,0,128*(i+1),128)) for i in range(len(indices))]
    visible=sum(bool(im.getchannel('A').getbbox()) for im in cells)
    distinct=len({hashlib.sha256(im.tobytes()).hexdigest() for im in cells})
    if visible<2 or distinct<2:raise ValueError('not a usable multi-frame clip')
    id='fx_'+hashlib.sha1(stem.encode()).hexdigest()[:12]
    p=dest/(id+'.png');strip.save(p,optimize=True)
    fps=re.search(r'(?m)^  frameRate: (\d+)',asset);fps=int(fps.group(1)) if fps else 24
    duration_ms=max(20,round(1000*len(frames)/fps/len(indices)))
    (dest/'previews').mkdir(exist_ok=True)
    bg=[]
    for im in cells:
        a=Image.new('RGBA',(128,128),'#17232b');a.alpha_composite(im);bg.append(a.convert('RGB'))
    bg[0].save(dest/'previews'/(id+'.gif'),save_all=True,append_images=bg[1:],duration=duration_ms,loop=0,disposal=2,optimize=True)
    return {'source':stem,'id':id,'frames':len(cells),'source_frames':len(frames),'fps':fps,'duration_ms':duration_ms,'visible':visible,'distinct':distinct,'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'status':'FRAME_READY'}
def routes(aliases):
    families=json.loads((ROOT/'data/skill-p2/vfx_families.json').read_text())
    skills=json.loads((ROOT/'data/skills.json').read_text())+json.loads((ROOT/'data/additional_skills.json').read_text())
    by_id={s['id']:s for s in skills};mapped={};family_rows=[];fallbacks=[]
    def pick(alias,fallback='hit'):
        return aliases.get(alias,aliases.get(fallback,''))
    for f in families:
        fid=f['id'];g=f['production_group'];impact=PLAN['overrides'].get(fid,PLAN['group'].get(g,'hit'))
        travel=PLAN['travel_overrides'].get(fid,PLAN['travel_group'].get(g,'needle'))
        charge=PLAN['charge_group'].get(g,'charge')
        grade='SHARED_SIGNATURE_PLACEHOLDER' if fid in PLAN['signature_hold'] else 'SHARED_FAMILY'
        if impact not in aliases:grade='GENERIC_FALLBACK';fallbacks.append(fid)
        r={'family':fid,'group':g,'impact':pick(impact),'travel':pick(travel,'needle'),'charge':pick(charge,'charge'),'quality':grade}
        family_rows.append(dict(r,skill_count=len(f['skills'])))
        for id in f['skills']:
            if id not in by_id or id in mapped:raise ValueError('bad/duplicate skill '+id)
            s=by_id[id];area=s.get('area') or {};radius=float(area.get('radius_m') or 0)
            mapped[id]=dict(r,scale=round(min(1.55,1+radius*.10+(0.18 if s.get('kind')=='ultimate' else 0)),2))
    assert len(skills)==1152 and len(mapped)==1152 and len(family_rows)==146
    assert all(r['impact'] and r['travel'] and r['charge'] for r in mapped.values())
    return {'schema':1,'skills':mapped,'families':family_rows,'aliases':aliases,'statuses':{k:pick(v) for k,v in PLAN['status'].items()},'signature_hold':PLAN['signature_hold'],'fallback_families':fallbacks,'counts':{'skills':len(mapped),'families':len(family_rows),'signature_placeholder_skills':sum(x['quality']=='SHARED_SIGNATURE_PLACEHOLDER' for x in mapped.values())}}
def main(out):
    out.mkdir(parents=True,exist_ok=True)
    mapping=dict(src.FX);mapping.update(PLAN['extra'])
    stems=sorted(set(mapping.values()))
    results={}
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as pool:
        pending={pool.submit(one,s,out):s for s in stems}
        for f in concurrent.futures.as_completed(pending):
            s=pending[f]
            try:results[s]=f.result()
            except Exception as e:results[s]={'source':s,'status':'HOLD','error':str(e)}
            print('NARU_FX_SOURCE',s,results[s]['status'],flush=True)
    aliases={k:results[v]['id'] for k,v in mapping.items() if results[v]['status']=='FRAME_READY'}
    assert all(k in aliases for k in ('hit','charge','needle','heal','smoke','fire_impact','lightning','water','wind','earth'))
    config=routes(aliases);dump(out/'factory_routes.json',config)
    for name in ('LICENSE','NOTICE.md'):
        root=src.BASE.split('/Packages/')[0]+'/'
        with urllib.request.urlopen(root+name,timeout=30) as r:(out/name).write_bytes(r.read())
    ready=sorted((r for r in results.values() if r['status']=='FRAME_READY'),key=lambda x:x['source'])
    for page in range(0,len(ready),30):
        chunk=ready[page:page+30];sheet=Image.new('RGB',(6*180,((len(chunk)+5)//6)*156),'#17232b');draw=ImageDraw.Draw(sheet)
        for i,r in enumerate(chunk):
            im=Image.open(out/(r['id']+'.png')).convert('RGBA');n=r['frames'];best=max(range(n),key=lambda j:im.crop((j*128,0,(j+1)*128,128)).getchannel('A').getbbox() is not None and sum(im.crop((j*128,0,(j+1)*128,128)).getchannel('A').histogram()[32:]))
            cel=im.crop((best*128,0,(best+1)*128,128));x=(i%6)*180;y=(i//6)*156;sheet.paste(cel,(x+26,y),cel);draw.text((x+3,y+130),r['source'].split('/')[-1][:26],fill='white')
        sheet.save(out/'previews'/('CONTACT_%02d.png'%(page//30+1)))
    report={'planned_sources':len(stems),'ready_sources':len(ready),'holds':[r for r in results.values() if r['status']!='FRAME_READY'],'native_frames':sum(r['frames'] for r in ready),'atlas_bytes':sum(r['bytes'] for r in ready),'route_counts':config['counts'],'fallback_families':config['fallback_families'],'records':ready}
    dump(out/'FACTORY_REPORT.json',report);print('NARU_FX_FACTORY',json.dumps({k:v for k,v in report.items() if k!='records'}),flush=True)
    if len(ready)<80:raise ValueError('too few usable shared sources')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',required=True,type=pathlib.Path);main(p.parse_args().out)
