"""Senki R3: opt-in local battle candidate, no source gameplay import.
Uses the tested R2 texture decoder. Outputs local GIFs, normalized sheets and a separate Godot pack.
"""
import argparse,base64,collections,hashlib,io,json,pathlib,statistics,urllib.request,zipfile,plistlib,xml.etree.ElementTree as ET
from PIL import Image
from senki_review import decode,restore,BASE,preview
PREFIX='projects/NarutoSenki/Resources/Element/'
# Exact identity candidates; era and costume still require visual approval.
ROSTER={'Naruto':'NIN-041','Sasuke':'NIN-042','Sakura':'NIN-043','Kakashi':'NIN-004','Itachi':'NIN-060','Minato':'NIN-093','Jiraiya':'NIN-020','Orochimaru':'NIN-022','Nagato':'NIN-068','DevaPath':'NIN-067','Gaara':'NIN-055','Hinata':'NIN-049','Asuma':'NIN-017','Hiruzen':'NIN-019','Kisame':'NIN-061','Hidan':'NIN-064','Deidara':'NIN-062','Konan':'NIN-066','Tsunade':'NIN-021','Chiyo':'NIN-058','Jugo':'NIN-075','Karin':'NIN-074','Kakuzu':'NIN-065','Sai':'NIN-044','Suigetsu':'NIN-073','Tobirama':'NIN-096','Shino':'NIN-051','Shikamaru':'NIN-046','Tenten':'NIN-054','Ino':'NIN-048','Choji':'NIN-047','Kiba':'NIN-050','Neji':'NIN-052','Lee':'NIN-053','Roshi':'NIN-102','Han':'NIN-103'}
ACTION={'idle':'Idle','move':'Walk','attack':'nAttack','hit':'Hurt','fall':'Dead'}
FX_MAP={'Amaterasu':'black_flame','SandWave':'sand','Steam':'steam','SuiRyuDan':'water_wave','FireRain':'fire_impact','ThunderWave':'lightning'}
def data(im,count,ms):
    b=io.BytesIO();im.save(b,format='PNG');raw=b.getvalue()
    return {'png':base64.b64encode(raw).decode(),'sha256':hashlib.sha256(raw).hexdigest(),'frames':count,'frame_ms':ms}
def atlas(z,files,stem):
    p=plistlib.loads(z.read(files[stem+'.plist']))
    t=next((stem+s for s in ('.png','.pvr.ccz','.ccz','.pvr') if stem+s in files),None)
    if t is None:raise ValueError('missing texture')
    im,fmt=decode(z.read(files[t]))
    return im,p['frames'],fmt
def actions(z,files,p):
    x=ET.fromstring(z.read(files[p]))
    return {a.attrib.get('value',''):[(f.text or '').strip() for f in a.findall('./frame/frameName')] for a in x.findall('action')}
def normalize(cels,scale,cell=(96,112),anchor=(48,104),center=False):
    # Shared pixel scale across the five core actions. Source canvas center/bottom is a provisional anchor.
    out=[]
    for im in cels:
        bb=im.getchannel('A').getbbox()
        if not bb:raise ValueError('empty cel')
        crop=im.crop(bb);crop=crop.resize((max(1,round(crop.width*scale)),max(1,round(crop.height*scale))),Image.Resampling.LANCZOS)
        ax=im.width/2;ay=im.height/2 if center else im.height
        dx=round(anchor[0]+(bb[0]-ax)*scale);dy=round(anchor[1]+(bb[1]-ay)*scale)
        if dx<0 or dy<0 or dx+crop.width>cell[0] or dy+crop.height>cell[1]:raise ValueError('normalized cel clips')
        dst=Image.new('RGBA',cell);dst.alpha_composite(crop,(dx,dy));out.append(dst)
    return out
def fit(cels,anchor,cell,center=False):
    ext=[]
    for im in cels:
        b=im.getchannel('A').getbbox()
        if not b:raise ValueError('empty cel')
        ax=im.width/2;ay=im.height/2 if center else im.height
        ext.append((b[0]-ax,b[1]-ay,b[2]-ax,b[3]-ay))
    x,y=anchor;w,h=cell
    return min(1.35,(x-2)/max(1,-min(b[0] for b in ext)),(y-2)/max(1,-min(b[1] for b in ext)),(w-x-2)/max(1,max(b[2] for b in ext)),(h-y-2)/max(1,max(b[3] for b in ext)))
def strip(cels,cell):
    out=Image.new('RGBA',(cell[0]*len(cels),cell[1]))
    for i,im in enumerate(cels):out.alpha_composite(im,(i*cell[0],0))
    return out
def gif(cels,path,ms):
    frames=[]
    for im in cels:
        bg=Image.new('RGBA',im.size,'#26313b');bg.alpha_composite(im);frames.append(bg.convert('RGB').resize((im.width*2,im.height*2),Image.Resampling.NEAREST))
    frames[0].save(path,save_all=True,append_images=frames[1:],duration=ms,loop=0,disposal=2,optimize=False)
def run(z,out):
    files={}
    for n in z.namelist():
        p=pathlib.PurePosixPath(n)
        if len(p.parts)>1 and '..' not in p.parts:files['/'.join(p.parts[1:])]=n
    pack={'schema':1,'status':'LOCAL_SENKI_REVIEW','characters':{},'vfx':{}}
    report=[]
    for p in sorted(files):
        if not p.startswith(PREFIX) or not p.endswith('.xml'):continue
        rel=p[len(PREFIX):].split('/')
        if len(rel)!=2 or rel[1]!=rel[0]+'.xml':continue
        name=rel[0];stem=p[:-4]
        if stem+'.plist' not in files:continue
        rec={'source':name,'id':ROSTER.get(name,''),'status':'HOLD','clips':{}}
        try:
            im,meta,fmt=atlas(z,files,stem);seqs=actions(z,files,p)
            raw={}
            for key,src in ACTION.items():
                seq=seqs.get(src,[])
                if not seq:continue
                try:raw[key]=[restore(im,meta[f]) for f in seq]
                except Exception as e:rec['clips'][key]={'status':'HOLD','error':str(e)}
            if not raw.get('idle'):raise ValueError('no valid idle')
            cels=[x for seq in raw.values() for x in seq]
            scale=fit(cels,(48,104),(96,112))
            rec['scale']=scale;rec['idle_native_size']=[list(x.size) for x in raw['idle']];rec['texture_format']=fmt
            dst=out/'local-character-gifs'/name;dst.mkdir(parents=True,exist_ok=True)
            clips={}
            for key,seq in raw.items():
                try:
                    if len(seq)>42:raise ValueError('strip > 4096px')
                    cels=normalize(seq,scale);ms=120 if key=='idle' else 90 if key=='move' else 100
                    gif(cels,dst/(key+'.gif'),ms)
                    sheet=strip(cels,(96,112));sheet.save(dst/(key+'.png'))
                    clips[key]=data(sheet,len(cels),ms);rec['clips'][key]={'status':'READY','frames':len(cels)}
                except Exception as e:rec['clips'][key]={'status':'HOLD','error':str(e)}
            rec['status']='CANDIDATE' if clips.get('idle') else 'HOLD'
            # No generic cast manufactured from skill01 etc. Transformations remain separate source candidates.
            if rec['id'] and all(k in clips for k in ACTION):
                pack['characters'][rec['id']]={'source_id':name,'direction':'screen_right','clips':clips}
                rec['runtime_pack']=True
        except Exception as e:rec['error']=str(e)
        report.append(rec)
    # Index exact frame IDs in source skill atlases; ambiguous IDs are excluded.
    candidates=collections.defaultdict(list);sources={}
    for p in sorted(files):
        if not p.startswith(PREFIX+'Skills/') or not p.endswith('.plist'):continue
        stem=p[:-6]
        try:
            im,meta,fmt=atlas(z,files,stem)
            sources[stem]=(im,meta)
            for f in meta:candidates[f].append(stem)
        except Exception as e:print('SENKI_R3_SKILL_ATLAS_HOLD',p,str(e))
    fx=[]
    for p in sorted(files):
        if not p.startswith(PREFIX) or not p.endswith('.xml') or not any('/'+k+'/' in p for k in ('Monster','Bullet')):continue
        name=pathlib.PurePosixPath(p).stem
        rec={'source':name,'actions':{}}
        try:
            seqs=actions(z,files,p)
            for label,seq in seqs.items():
                if not seq:continue
                try:
                    if any(len(candidates[f])!=1 for f in seq):raise ValueError('missing or ambiguous source frame')
                    cels=[]
                    for f in seq:
                        im,meta=sources[candidates[f][0]];cels.append(restore(im,meta[f]))
                    dst=out/'local-vfx-gifs'/name;dst.mkdir(parents=True,exist_ok=True)
                    preview(cels,dst/(label+'.gif'))
                    rec['actions'][label]={'status':'READY','frames':len(seq)}
                    # Only exact named effect mapping, and only multi-frame effect candidates, not generic hit.
                    family=FX_MAP.get(name)
                    if family and family not in pack['vfx'] and label.lower() in ('dead','nattack','skill01','idle') and 2<=len(cels)<=32:
                        scale=fit(cels,(64,64),(128,128),True)
                        normalized=normalize(cels,scale,(128,128),(64,64),True)
                        pack['vfx'][family]=data(strip(normalized,(128,128)),len(normalized),100)
                        rec['runtime_candidate']={'family':family,'action':label}
                except Exception as e:rec['actions'][label]={'status':'HOLD','error':str(e)}
        except Exception as e:rec['error']=str(e)
        fx.append(rec)
    (out/'LOCAL_SENKI_PACK.json').write_text(json.dumps(pack,separators=(',',':')))
    summary={'groups':len(report),'core_clips':sum(v.get('status')=='READY' for r in report for v in r['clips'].values()),'runtime_ninjas':len(pack['characters']),'runtime_ids':sorted(pack['characters']),'runtime_clips':sum(len(c['clips']) for c in pack['characters'].values()),'skill_atlases':len(sources),'vfx_xml_groups':len(fx),'vfx_gifs':sum(v.get('status')=='READY' for r in fx for v in r['actions'].values()),'runtime_vfx':sorted(pack['vfx']),'characters':report,'vfx':fx,'limitations':'Side-facing review only; source foot anchor and timing provisional; forms/era not visually accepted; no generic cast.'}
    (out/'R3_REPORT.json').write_text(json.dumps(summary,indent=2));print('NARU_R3_SUMMARY',json.dumps({k:v for k,v in summary.items() if k not in ('characters','vfx')}),flush=True)
    if len(pack['characters'])<6:raise ValueError('fewer than six core candidates')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);p.add_argument('--source-zip',type=pathlib.Path);a=p.parse_args();a.out.mkdir(parents=True,exist_ok=True)
    path=a.source_zip or a.out/'senki-source.zip'
    if not path.exists():
        with urllib.request.urlopen(urllib.request.Request(BASE,headers={'User-Agent':'Naru-R3-review'}),timeout=180) as r,path.open('wb') as f:
            while True:
                chunk=r.read(1024*1024)
                if not chunk:break
                f.write(chunk)
    with zipfile.ZipFile(path) as z:run(z,a.out)
