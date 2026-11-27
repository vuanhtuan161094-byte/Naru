"""Convert original baked sprite atlases into Naru review strips; no external code executed."""
import argparse, json, pathlib, re, urllib.request, math
from PIL import Image
from io import BytesIO
ROOT=pathlib.Path(__file__).resolve().parents[2]
BASE='https://raw.githubusercontent.com/BaronCyrus/PixelEffects/6fff781bb7ba26eefe31232938d8160fbd9a06ed/Packages/com.baroncyrus.pixelfx/Effects/'
FX={'charge':'arcane/spell-charge','hit':'impacts/hit-spark','heal':'holy/heal','smoke':'spawn/poof','fire':'fire/fireball','lightning':'lightning/zap-hit','water':'water/splash','wind':'nature/tornado','earth':'nature/earth-spike','sword':'melee/sword-slash','chakra':'arcane/mana-burst','poison':'nature/poison-cloud','ice':'ice/ice-shatter','shadow':'shadow/dark-explosion','wood':'nature/root-snare','shield':'holy/divine-shield','gravity':'arcane/mana-burst','explosion':'explosions/small-explosion'}
FX.update({"gravity":"shadow/black-hole","fire_travel":"fire/fireball","fire_impact":"explosions/small-explosion","lightning_travel":"lightning/ball-lightning","water_travel":"water/water-orb","chakra_travel":"arcane/arcane-orb","beam":"arcane/arcane-beam","arrow":"projectiles/arrow","needle":"projectiles/magic-missile","wind_travel":"projectiles/energy-disc","wind_impact":"nature/leaf-storm","space":"arcane/blink-in","seal":"arcane/rune-circle","curse":"shadow/curse","cleanse":"holy/blessing","sand":"explosions/dirt-explosion","rock":"nature/boulder","lava":"fire/flame-pillar","steam":"explosions/smoke-bomb","acid":"nature/acid-splash","spore":"nature/spore-burst","insect":"critters/butterfly","snake":"critters/snake","scythe":"melee/scythe-reap","palm":"impacts/blunt-hit","kick":"impacts/ground-slam","melee_combo":"melee/double-slash","ground_smash":"impacts/ground-slam","mark":"shadow/hex-sigil","stun":"status/stunned","haste":"status/haste","burn":"status/burning","freeze":"status/frozen","poison_status":"status/poisoned","barrier":"scifi/force-field","black_flame":"shadow/shadow-flames","lightning_aura":"lightning/electrified","meteor":"fire/meteor","summon":"spawn/summon-rise","wind":"nature/tornado","water_wave":"water/wave-crash","water_jet":"water/water-jet","water_vortex":"water/whirlpool","lightning_strike":"lightning/lightning-strike","fire_ring":"fire/fire-ring","earth_quake":"nature/quake","heal_aoe":"holy/heal-aoe"})
def get(path):
    with urllib.request.urlopen(urllib.request.Request(BASE+path,headers={'User-Agent':'Naru-art-review'}),timeout=60) as r: return r.read()
def rects(meta):
    result={}
    for m in re.finditer(r'(?m)^    - serializedVersion: 2\n      name: .*?\n      rect:\n(.*?)(?=^    - serializedVersion: 2|^    outline:|\Z)',meta,re.S|re.M):
        s=m.group(1)
        xy=[re.search(r'(?m)^        '+k+r': (-?\d+)',s) for k in ['x','y','width','height']]
        pivot=re.search(r'(?m)^      pivot: \{x: ([\d.eE+-]+), y: ([\d.eE+-]+)\}',s)
        fid=re.search(r'(?m)^      internalID: (-?\d+)',s)
        if all(xy) and pivot and fid: result[fid.group(1)]=(*[int(x.group(1)) for x in xy],float(pivot.group(1)),float(pivot.group(2)))
    return result
def strip(frames, size, anchor, limit=30):
    # Shared source scale, shared source pivot. Never crop a cel independently.
    l=min(-x for _,x,y in frames);t=min(-y for _,x,y in frames)
    r=max(im.width-x for im,x,y in frames);b=max(im.height-y for im,x,y in frames)
    ax,ay=anchor
    scale=min(ax/max(1,-l),(size[0]-ax)/max(1,r),ay/max(1,-t),(size[1]-ay)/max(1,b),1)
    indices=[i for i in range(len(frames))] if len(frames)<=limit else [round(i*(len(frames)-1)/(limit-1)) for i in range(limit)]
    out=Image.new('RGBA',(size[0]*len(indices),size[1]))
    for j,i in enumerate(indices):
        im,x,y=frames[i]
        im=im.resize((max(1,round(im.width*scale)),max(1,round(im.height*scale))),Image.Resampling.NEAREST)
        dx=round(ax-x*scale);dy=round(ay-y*scale)
        if dx<0 or dy<0 or dx+im.width>size[0] or dy+im.height>size[1]: raise ValueError('cel exceeds canvas')
        out.alpha_composite(im,(j*size[0]+dx,dy))
    return out,indices
def vfx(out):
    out.mkdir(parents=True,exist_ok=True); report={}
    preview=out/'previews';preview.mkdir(exist_ok=True)
    for name,src in FX.items():
        asset=get(src+'.asset').decode()
        refs=re.findall(r'(?m)^  - \{fileID: (-?\d+), guid: ([a-f0-9]+), type: 3\}',asset)
        if not refs: raise ValueError(src+' empty frame list')
        wanted={g for _,g in refs}; pages={}
        for page in range(1,33):
            if wanted.issubset(pages): break
            stem=src if page==1 else src+'.'+str(page)
            meta=get(stem+'.png.meta').decode()
            guid=re.search(r'(?m)^guid: ([a-f0-9]+)',meta).group(1)
            pages[guid]=(Image.open(BytesIO(get(stem+'.png'))).convert('RGBA'),rects(meta))
        frames=[]
        for i,guid in refs:
            sheet,lookup=pages[guid]
            if i not in lookup: raise ValueError(src+' invalid frame ID '+i)
            x,y,w,h,px,py=lookup[i]; top=sheet.height-y-h
            if x<0 or top<0 or x+w>sheet.width or top+h>sheet.height: raise ValueError(src+' invalid rect')
            frames.append((sheet.crop((x,top,x+w,top+h)),px*w,(1-py)*h))
        img,indices=strip(frames,(128,128),(64,64)); img.save(out/(name+'.png'))
        fps=re.search(r'(?m)^  frameRate: (\d+)',asset)
        report[name]={'source':src,'original_frames':len(frames),'output_frames':len(indices),'indices':indices,'fps':int(fps.group(1)) if fps else None,'anchor':[64,64],'status':'REVIEW_CANDIDATE'}
        gifs=[img.crop((j*128,0,(j+1)*128,128)).resize((192,192),Image.Resampling.NEAREST) for j in range(len(indices))]
        source_fps=report[name]['fps'] or 24
        ms=max(20,round(1000*len(frames)/source_fps/len(indices)))
        gifs[0].save(preview/(name+'.gif'),save_all=True,append_images=gifs[1:],duration=ms,loop=0,disposal=2)
        print('NARU_EXTERNAL_FX',name,len(indices),flush=True)
    (out/'manifest.json').write_text(json.dumps(report,indent=2))
    # Keep original license/notice with generated assets, no font or runtime code.
    root=BASE.split('/Packages/')[0]+'/'
    for name in ('LICENSE','NOTICE.md'):
        try:
            with urllib.request.urlopen(root+name,timeout=30) as r: (out/name).write_bytes(r.read())
        except Exception:
            raise
def ninja(source,out):
    # User-supplied local atlas folder. Do not download or redistribute unverified character art.
    out.mkdir(parents=True,exist_ok=True); report=[]
    for path in sorted(source.glob('**/anims/*.json')):
        data=json.loads(path.read_text()); frames=data.get('frames',{}); meta=data.get('meta',{})
        if not isinstance(frames,dict) or not frames: continue
        png=path.with_suffix('.png')
        if not png.is_file(): continue
        image=Image.open(png).convert('RGBA'); seq=data.get('animations',{}).get(meta.get('animation',path.stem),list(frames))
        cells=[]; durations=[]
        for key in seq:
            f=frames[key]; q=f['frame']; s=f.get('spriteSourceSize',{'x':0,'y':0}); full=f.get('sourceSize',{'w':q['w'],'h':q['h']}); pivot=f.get('pivot',meta.get('anchor',{}))
            if f.get('rotated'): raise ValueError(str(path)+' rotated atlas requires explicit converter')
            x,y,w,h=[q[k] for k in ('x','y','w','h')]
            if x<0 or y<0 or x+w>image.width or y+h>image.height: raise ValueError(str(path)+' invalid rect')
            cel=image.crop((x,y,x+w,y+h))
            cells.append((cel,float(pivot['x'])*full['w']-s['x'],float(pivot['y'])*full['h']-s['y']))
            durations.append(int(f.get('duration',100)))
        img,indices=strip(cells,(96,112),(48,104),limit=len(cells))
        ident=path.parent.parent.name; dest=out/ident;dest.mkdir(exist_ok=True)
        img.save(dest/(path.stem+'.png'))
        frames_gif=[img.crop((i*96,0,(i+1)*96,112)).resize((288,336),Image.Resampling.NEAREST) for i in range(len(indices))]
        frames_gif[0].save(dest/(path.stem+'.gif'),save_all=True,append_images=frames_gif[1:],duration=[sum(durations[i:(indices[j+1] if j+1<len(indices) else len(durations))]) for j,i in enumerate(indices)],loop=0,disposal=2)
        report.append({'source_id':ident,'action':path.stem,'source_frames':len(cells),'frames':len(indices),'source_indices':indices,'source_duration_ms':sum(durations),'anchor':[48,104],'direction':'UNVERIFIED','identity':'UNVERIFIED','status':'LOCAL_REVIEW_ONLY'})
    (out/'NINJA_REVIEW.json').write_text(json.dumps(report,indent=2))
    if not report: raise ValueError('No compatible atlas found')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('mode',choices=['vfx','ninja']);p.add_argument('--source',type=pathlib.Path);p.add_argument('--out',type=pathlib.Path,required=True);a=p.parse_args()
    if a.mode=='vfx':vfx(a.out)
    else:
        if a.source is None:p.error('--source required')
        ninja(a.source,a.out)
