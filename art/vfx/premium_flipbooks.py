"""Download pinned anime flipbooks for embedded game review, never publish as raw pack.
Credit: VFX: KanaWorks_AI (@KanaWorks_AI). Asset license v1.0; free grant conditional on revenue < USD 1m.
"""
import argparse,concurrent.futures,io,json,math,pathlib,urllib.request,hashlib
from PIL import Image
BASE='https://raw.githubusercontent.com/kanaworksai-hue/kanaworks-sakuga-vfx/7cfc9e6bd6ecc0239f3c141e9c5c42cbdc8bb365/'
PICKS={'fire':['charge_01','impact_01','impact_02','projectile_01','slash_01'],'thunder':['charge_01','impact_01','strike_01','slash_01'],'water':['charge_01','impact_01','column_01','slash_01'],'wind':['charge_01','impact_01','vortex_01','slash_01'],'rock':['impact_01','column_01'],'light':['charge_01','impact_01','column_01','shield_01'],'dark':['charge_01','impact_01','projectile_01','slash_01'],'ice':['impact_01','projectile_01'],'poison':['impact_01','projectile_01']}
GROUPS={'FX-FIRE':'fire','FX-LIGHTNING':'thunder','FX-WATER':'water','FX-WIND':'wind','FX-EARTH':'rock','FX-SUPPORT':'light','FX-MIND':'dark','FX-SPACE':'dark','FX-TOXIC':'poison','FX-RASENGAN':'wind','FX-CHAKRA':'light','FX-SUSANOO':'dark'}
def get(p):
    for n in range(3):
        try:
            with urllib.request.urlopen(BASE+p,timeout=45) as r:return r.read()
        except Exception:
            if n==2:raise
def convert(e,s,out):
    key=e+'_'+s;path='assets/'+e+'/'+key+'/'+key
    meta=json.loads(get(path+'.flipbook.json'))
    raw=get(path+'.png')
    with Image.open(io.BytesIO(raw)) as im:img=im.convert('RGBA')
    cols,rows=meta['grid'];w,h=meta['cell'];n=int(meta['frames'])
    assert img.size==(cols*w,rows*h) and 1<n<=cols*rows
    # preserve source positions and timing, select evenly distributed real cels (never interpolate)
    count=min(n,30);idx=[round(i*(n-1)/(count-1)) for i in range(count)]
    cels=[img.crop(((i%cols)*w,(i//cols)*h,(i%cols+1)*w,(i//cols+1)*h)) for i in idx]
    boxes=[c.getchannel('A').point(lambda a:255 if a>=24 else 0).getbbox() for c in cels]
    boxes=[b for b in boxes if b]
    assert len(boxes)>=2
    # center on the source pivot; use a common crop across all cels so empty padding no longer hides effect.
    px=float(meta.get('pivot',[.5,.5])[0])*w;py=float(meta.get('pivot',[.5,.5])[1])*h
    rad=max(max(abs(b[0]-px),abs(b[2]-px),abs(b[1]-py),abs(b[3]-py)) for b in boxes)+4
    left=math.floor(px-rad);top=math.floor(py-rad);right=math.ceil(px+rad);bottom=math.ceil(py+rad)
    cell=192;gc=6;gr=math.ceil(count/gc)
    dst=Image.new('RGBA',(gc*cell,gr*cell))
    for j,c in enumerate(cels):
        q=c.crop((left,top,right,bottom));q.thumbnail((cell,cell),Image.Resampling.LANCZOS)
        dst.alpha_composite(q,((j%gc)*cell+(cell-q.width)//2,(j//gc)*cell+(cell-q.height)//2))
    id='hd_'+key;dest=out/(id+'.png');dst.save(dest,optimize=True)
    return id,{'source':key,'frames':count,'cell':cell,'cols':gc,'duration_s':float(meta['duration_s']),'source_indices':idx,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'bytes':dest.stat().st_size}
def main(out):
    routes=json.loads((out/'factory_routes.json').read_text())
    ready={};holds=[]
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
        jobs={pool.submit(convert,e,s,out):(e,s) for e,ss in PICKS.items() for s in ss}
        for j in concurrent.futures.as_completed(jobs):
            try:k,v=j.result();ready[k]=v
            except Exception as ex:holds.append({'source':jobs[j],'error':str(ex)})
    def choose(key,old):return 'hd_'+key if 'hd_'+key in ready else old
    # Exact family exceptions plus elemental group phases. Signature effects remain provisional.
    for id,r in routes['skills'].items():
        e=GROUPS.get(r['group'])
        if not e:continue
        f=r['family'];impact=e+'_impact_01';charge=e+'_charge_01';travel=e+'_projectile_01'
        if f in ('kirin','lightning_lance','lightning_dash'):impact='thunder_strike_01'
        if f in ('water_dragon','water'):impact='water_column_01'
        if f in ('earth_wall','earth','wood','sand'):impact='rock_column_01'
        if f in ('rasenshuriken','wind'):impact='wind_vortex_01'
        if f in ('shield','susanoo_shield','barrier','space_barrier'):impact='light_shield_01'
        if f in ('black_flame','blackfire','kamui','susanoo'):impact='dark_impact_01'
        r['impact']=choose(impact,r['impact']);r['charge']=choose(charge,r['charge']);r['travel']=choose(travel,r['travel'])
    routes['premium']=ready;routes['premium_credit']='VFX: KanaWorks_AI (@KanaWorks_AI)'
    (out/'factory_routes.json').write_text(json.dumps(routes,ensure_ascii=False,separators=(',',':')))
    report={'ready':len(ready),'planned':sum(map(len,PICKS.values())),'holds':holds,'frames':sum(v['frames'] for v in ready.values()),'bytes':sum(v['bytes'] for v in ready.values()),'premium_skill_routes':sum(any(str(r[p]).startswith('hd_') for p in ('impact','charge','travel')) for r in routes['skills'].values()),'credit':routes['premium_credit'],'source':BASE}
    (out/'PREMIUM_REPORT.json').write_text(json.dumps(report,indent=2));print('NARU_PREMIUM_VFX',json.dumps(report),flush=True)
    if len(ready)<18:raise ValueError('too few anime effects')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);main(p.parse_args().out)
