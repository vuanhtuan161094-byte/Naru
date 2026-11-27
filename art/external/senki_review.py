"""Senki atlas review: decode documented texture containers, restore trimmed/rotated cels,
read original XML action sequences, create local GIFs. Do not execute upstream game code.
"""
import argparse,collections,hashlib,io,json,pathlib,plistlib,re,struct,urllib.request,zipfile,zlib,xml.etree.ElementTree as ET
from PIL import Image,ImageDraw
import numpy as np
SOURCE='LeaderOnePro/NarutoSenki-cocos2dx'
SHA='187fca6efd1ba6b89a91659fa7c591dde3995280'
BASE='https://codeload.github.com/'+SOURCE+'/zip/'+SHA
PRIORITY=['Naruto','Sasuke','Sakura','Kakashi','Itachi','Minato','Jiraiya','Orochimaru','Pain','Nagato','Gaara','Hinata']
def nums(value,n):
    a=[int(float(x)) for x in re.findall(r'-?\d+(?:\.\d+)?',str(value))]
    if len(a)!=n:raise ValueError('invalid atlas rectangle '+str(value))
    return a
def decode(data):
    if data.startswith(b'\x89PNG'):return Image.open(io.BytesIO(data)).convert('RGBA'),'PNG'
    if data[:4]==b'CCZ!':
        typ,ver,reserved,length=struct.unpack('>HHII',data[4:16])
        if typ!=0 or length>128*1024*1024:raise ValueError('unsupported CCZ')
        d=zlib.decompressobj();data=d.decompress(data[16:],length+1)
        if len(data)!=length or not d.eof:raise ValueError('CCZ length mismatch')
    if data[:4]==b'CCZp':raise ValueError('encrypted CCZ: HOLD')
    if data[44:48]==b'PVR!':
        size,h,w,mips,flags,dl,bpp,rm,gm,bm,am,tag,surfaces=struct.unpack_from('<13I',data)
        fmt=flags&255; payload=data[size:];kind='v2:'+hex(fmt)
        modes={0x10:'4444',0x11:'5551',0x12:'RGBA',0x13:'565',0x15:'RGB',0x18:'PVRTC2',0x19:'PVRTC4',0x1a:'BGRA'}
        mode=modes.get(fmt)
    elif data[:4]==b'PVR\x03':
        _,flags,fmt,cs,ct,h,w,depth,surfaces,faces,mips,meta=struct.unpack_from('<IIQ9I',data)
        payload=data[52+meta:];kind='v3:'+hex(fmt)
        mode={0:'PVRTC2',1:'PVRTC2',2:'PVRTC4',3:'PVRTC4',0x0808080861626772:'RGBA',0x0808080861726762:'BGRA',0x0404040461626772:'4444',0x0105050561626772:'5551',0x0005060500626772:'565',0x0008080800626772:'RGB'}.get(fmt)
    else:raise ValueError('unrecognized texture header')
    if not w or not h or w*h>16777216 or surfaces>1:raise ValueError('unsupported texture dimensions')
    if mode in ('RGBA','BGRA','RGB'):
        channels=3 if mode=='RGB' else 4
        im=Image.frombytes('RGB' if channels==3 else 'RGBA',(w,h),payload[:w*h*channels],'raw',mode)
        return im.convert('RGBA'),kind+'/'+mode
    if mode in ('4444','5551','565'):
        v=np.frombuffer(payload[:w*h*2],dtype='<u2').astype(np.uint32)
        if mode=='4444':c=[((v>>12)&15)*17,((v>>8)&15)*17,((v>>4)&15)*17,(v&15)*17]
        elif mode=='5551':c=[((v>>11)&31)*255//31,((v>>6)&31)*255//31,((v>>1)&31)*255//31,(v&1)*255]
        else:c=[((v>>11)&31)*255//31,((v>>5)&63)*255//63,(v&31)*255//31,np.full(w*h,255)]
        return Image.fromarray(np.stack(c,axis=1).astype(np.uint8).reshape(h,w,4),'RGBA'),kind+'/'+mode
    if mode in ('PVRTC2','PVRTC4'):
        import texture2ddecoder
        raw=texture2ddecoder.decode_pvrtc(payload,w,h,mode=='PVRTC2')
        return Image.frombytes('RGBA',(w,h),raw,'raw','BGRA'),kind+'/'+mode
    raise ValueError('unsupported PVR '+kind)
def restore(atlas,f):
    x,y,w,h=nums(f.get('frame',f.get('textureRect')),4)
    rot=bool(f.get('rotated',f.get('textureRotated',False)))
    aw,ah=(h,w) if rot else (w,h)
    if x<0 or y<0 or x+aw>atlas.width or y+ah>atlas.height:raise ValueError('atlas region out of bounds')
    crop=atlas.crop((x,y,x+aw,y+ah))
    if rot:crop=crop.transpose(Image.Transpose.ROTATE_90)
    if crop.size!=(w,h):raise ValueError('rotation mismatch')
    sw,sh=nums(f.get('sourceSize',f.get('spriteSourceSize',str((w,h)))),2)
    if sw*sh>16000000 or sw<1 or sh<1:raise ValueError('invalid original canvas')
    if 'sourceColorRect' in f:
        dx,dy,rw,rh=nums(f['sourceColorRect'],4)
        if (rw,rh)!=(w,h):raise ValueError('source rectangle mismatch')
    else:
        ox,oy=nums(f.get('offset',f.get('spriteOffset','{0,0}')),2)
        dx=round((sw-w)/2+ox);dy=round((sh-h)/2-oy)
    if dx<0 or dy<0 or dx+w>sw or dy+h>sh:raise ValueError('restored region out of bounds')
    cell=Image.new('RGBA',(sw,sh));cell.alpha_composite(crop,(dx,dy))
    if not cell.getchannel('A').getbbox():raise ValueError('transparent cel')
    return cell
def preview(cels,path):
    # Source canvas bottom-center alignment, same scale across all cels in an action.
    # Animation timing remains a review assumption, not a port of source gameplay.
    w=max(im.width for im in cels);h=max(im.height for im in cels)
    if w*h*len(cels)>32000000:raise ValueError('clip pixel budget exceeded')
    scale=min(3,256/max(w,h));W=max(1,round(w*scale));H=max(1,round(h*scale))
    frames=[]
    for im in cels:
        canvas=Image.new('RGBA',(w,h),(34,42,50,255));canvas.alpha_composite(im,((w-im.width)//2,h-im.height))
        frames.append(canvas.convert('RGB').resize((W,H),Image.Resampling.NEAREST))
    frames[0].save(path,save_all=True,append_images=frames[1:],duration=100,loop=0,disposal=2,optimize=False)
def audit(z,out):
    members={}
    for n in z.namelist():
        p=pathlib.PurePosixPath(n)
        if len(p.parts)>1 and '..' not in p.parts:members['/'.join(p.parts[1:])]=n
    prefix='projects/NarutoSenki/Resources/Element/'
    folders=[]
    for p in members:
        if not p.startswith(prefix) or not p.endswith('.xml'):continue
        rel=p[len(prefix):].split('/')
        if len(rel)==2 and rel[1]==rel[0]+'.xml' and prefix+rel[0]+'/'+rel[0]+'.plist' in members:folders.append(rel[0])
    records=[];out.mkdir(parents=True,exist_ok=True)
    for name in sorted(set(folders),key=lambda n:(PRIORITY.index(n) if n in PRIORITY else 999,n)):
        stem=prefix+name+'/'+name;rec={'id':name,'status':'HOLD','actions':{},'priority':name in PRIORITY}
        try:
            pl=plistlib.loads(z.read(members[stem+'.plist']))
            frames=pl.get('frames',{})
            tex=next((stem+s for s in ('.png','.pvr.ccz','.ccz','.pvr') if stem+s in members),None)
            if tex is None:raise ValueError('missing texture')
            im,fmt=decode(z.read(members[tex]));rec.update(texture_format=fmt,atlas_size=list(im.size),atlas_frames=len(frames))
            xml=ET.fromstring(z.read(members[stem+'.xml']))
            dest=out/'local-gifs'/name;dest.mkdir(parents=True,exist_ok=True)
            cache={}
            for action in xml.findall('action'):
                label=action.attrib.get('value','unknown')
                seq=[(a.text or '').strip() for a in action.findall('./frame/frameName')]
                if not seq:continue
                try:
                    for key in seq:
                        if key not in cache:cache[key]=restore(im,frames[key])
                    cels=[cache[k] for k in seq]
                    fn=re.sub(r'[^A-Za-z0-9_-]','_',label)
                    preview(cels,dest/(fn+'.gif'))
                    rec['actions'][label]={'frames':len(seq),'distinct_frames':len(set(seq)),'status':'GIF_GENERATED','frame_order':'source XML','timing':'100ms review only'}
                except Exception as e:rec['actions'][label]={'frames':len(seq),'status':'HOLD','error':str(e)}
            valid=[k for k,v in rec['actions'].items() if v['status']=='GIF_GENERATED']
            rec['basic_coverage']={k:any(a.lower()==k.lower() for a in valid) for k in ['Idle','Walk','nAttack','Hurt','Dead']}
            rec['status']='REVIEW_CANDIDATE' if valid else 'HOLD'
            rec['decoded_unique_cels']=len(cache)
            rec['idle_extent']=list(cache[next(iter([s.text.strip() for a in xml.findall('action') if a.attrib.get('value')=='Idle' for s in a.findall('./frame/frameName') if s.text]),'')].size) if rec['basic_coverage']['Idle'] else None
            rec['source_sha256']=hashlib.sha256(z.read(members[tex])).hexdigest()
        except Exception as e:rec['error']=str(e)
        records.append(rec)
        print('NARU_SENKI_GROUP',name,rec['status'],sum(v['status']=='GIF_GENERATED' for v in rec['actions'].values()),rec.get('error',''),flush=True)
    summary={'source':SOURCE,'sha':SHA,'groups':len(records),'decoded_groups':sum(r['status']=='REVIEW_CANDIDATE' for r in records),'gifs':sum(v['status']=='GIF_GENERATED' for r in records for v in r['actions'].values()),'frames':sum(v['frames'] for r in records for v in r['actions'].values() if v['status']=='GIF_GENERATED'),'five_basic_actions':sum(all(r.get('basic_coverage',{}).values()) and bool(r.get('basic_coverage')) for r in records),'groups_detail':records,'note':'No visual approval, source timing and foot anchor are provisional. Source graphics stay local; no rig or combat code imported.'}
    (out/'SENKI_REPORT.json').write_text(json.dumps(summary,indent=2))
    print('NARU_SENKI_SUMMARY',json.dumps({k:v for k,v in summary.items() if k!='groups_detail'}),flush=True)
    if not summary['gifs']:raise ValueError('no animations generated')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);p.add_argument('--source-zip',type=pathlib.Path);a=p.parse_args();a.out.mkdir(parents=True,exist_ok=True)
    path=a.source_zip or a.out/'senki-source.zip'
    if not path.exists():
        with urllib.request.urlopen(urllib.request.Request(BASE,headers={'User-Agent':'Naru-Senki-review'}),timeout=180) as r,path.open('wb') as f:
            while True:
                block=r.read(1024*1024)
                if not block:break
                f.write(block)
    with zipfile.ZipFile(path) as z:audit(z,a.out)
