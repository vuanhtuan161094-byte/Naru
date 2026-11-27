"""Acquire pinned raw GitHub source data. Parse only source animation metadata, never execute game code.
Private local review output; public workflow publishes only numeric evidence."""
import argparse,concurrent.futures,hashlib,io,json,pathlib,re,struct,urllib.parse,urllib.request,time,collections
from PIL import Image
MANIFEST=json.loads(pathlib.Path(__file__).with_name('HD_GITHUB_SOURCES.json').read_text())
def acquire(source,root):
    root.mkdir(parents=True,exist_ok=True)
    def one(f):
        path=root.joinpath(*pathlib.PurePosixPath(f['path']).parts)
        path.parent.mkdir(parents=True,exist_ok=True)
        url='https://raw.githubusercontent.com/'+source['repo']+'/'+source['sha']+'/'+urllib.parse.quote(f['path'],safe='/')
        for attempt in range(3):
            try:
                if not path.exists():
                    with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Naru-HD-asset-audit'}),timeout=45) as r:payload=r.read(f['bytes']+1)
                    if len(payload)!=f['bytes']:raise ValueError('source length mismatch')
                    if hashlib.sha1(('blob '+str(len(payload))+'\0').encode()+payload).hexdigest()!=f['blob']:raise ValueError('source blob hash mismatch')
                    path.write_bytes(payload)
                else:
                    payload=path.read_bytes()
                    if len(payload)!=f['bytes'] or hashlib.sha1(('blob '+str(len(payload))+'\0').encode()+payload).hexdigest()!=f['blob']:raise ValueError('existing source blob hash mismatch')
                return {'path':f['path'],'bytes':f['bytes'],'status':'FETCHED'}
            except Exception as e:
                if attempt<2:time.sleep(attempt+1)
                else:return {'path':f['path'],'bytes':f['bytes'],'status':'HOLD','error':str(e)}
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as pool: result=list(pool.map(one,source['files']))
    return result
def parse_scene(path):
    text=path.read_text(encoding='utf-8')
    ext={m[1]:m[0] for m in re.findall(r'\[ext_resource type="Texture2D"[^\]\n]*?path="res://([^"]+)"[^\]\n]*?id="([^"]+)"\]',text)}
    ids=re.findall(r'^sprite_frames\s*=\s*SubResource\("([^"]+)"\)',text,re.M)
    if not ids:raise ValueError('no AnimatedSprite2D SpriteFrames')
    # Main character is first AnimatedSprite2D assignment; other effects remain separate.
    blocks=re.findall(r'\[sub_resource type="SpriteFrames" id="([^"]+)"\]\s*([\s\S]*?)(?=\n\[(?:sub_resource|node|connection)|\Z)',text)
    block=dict(blocks).get(ids[0],'')
    clips=[]
    for m in re.finditer(r'"frames":\s*\[(.*?)\],\s*"loop":\s*(true|false),\s*"name":\s*&"([^"]+)",\s*"speed":\s*([\d.]+)',block,re.S):
        fps=float(m[4]);frames=[]
        for duration,key in re.findall(r'"duration":\s*([\d.]+),\s*"texture":\s*ExtResource\("([^"]+)"\)',m[1]):
            if key not in ext:raise ValueError('unresolved frame '+key)
            frames.append((ext[key],max(20,round(1000*float(duration)/fps))))
        if frames:clips.append((m[3],frames,fps,m[2]=='true'))
    return clips
def visual_clip(root,frames,path):
    # Do not crop each frame independently: preserve original relative positions in same-size canvases.
    images=[];bounds=[];sizes=[]
    for name,ms in frames:
        with Image.open(root/name) as raw:
            im=raw.convert('RGBA')
            if im.width*im.height>16000000:raise ValueError('image too large')
            bb=im.getchannel('A').getbbox()
            if not bb:raise ValueError('transparent frame')
            images.append((im.crop(bb),bb,im.size,ms))
            bounds.append((bb[2]-bb[0],bb[3]-bb[1]));sizes.append(im.size)
    uniform=len(set(sizes))==1
    if uniform:
        l=min(x[1][0] for x in images);t=min(x[1][1] for x in images);r=max(x[1][2] for x in images);b=max(x[1][3] for x in images)
        W,H=r-l,b-t
    else:
        W=max(x[0].width for x in images);H=max(x[0].height for x in images)
    scale=min(1,512/max(W,H));dst=(max(1,round(W*scale)),max(1,round(H*scale)))
    rendered=[];timing=[]
    for im,bb,sz,ms in images:
        frame=Image.new('RGBA',(W,H),'#28323d')
        offset=(bb[0]-l,bb[1]-t) if uniform else ((W-im.width)//2,H-im.height)
        frame.alpha_composite(im,offset)
        rendered.append(frame.convert('RGB').resize(dst,Image.Resampling.LANCZOS));timing.append(ms)
    rendered[0].save(path,save_all=True,append_images=rendered[1:],duration=timing,loop=0,disposal=2,optimize=False)
    return {'frames':len(frames),'unique_paths':len(set(x[0] for x in frames)),'max_visible_height':max(x[1] for x in bounds),'min_visible_height':min(x[1] for x in bounds),'original_canvas_consistent':uniform,'timing_ms':timing,'alignment':'shared source canvas' if uniform else 'provisional bottom-center review only'}
def mobile(root,out):
    report=[]
    for group in MANIFEST['mobile']['groups']:
        base=root/'assets/entities'/group;clips=parse_scene(base/'entity.tscn')
        rec={'group':group,'clips':[]}
        target=out/'local-gifs'/group;target.mkdir(parents=True,exist_ok=True)
        for name,frames,fps,loop in clips:
            item={'action':name,'fps':fps,'loop':loop,'status':'HOLD'}
            try:
                safe=re.sub(r'[^a-zA-Z0-9_-]','_',name).strip('_') or 'clip'
                item.update(visual_clip(root,frames,target/(safe+'.gif')));item['status']='GIF_READY'
            except Exception as e:item['error']=str(e)
            rec['clips'].append(item)
        report.append(rec)
        print('NARU_HD_MOBILE_GROUP',group,len(clips),sum(x['status']=='GIF_READY' for x in rec['clips']),flush=True)
    return report
def sff_report(root,source):
    records=[]
    for f in source['files']:
        if not f['path'].lower().endswith('.sff'):continue
        p=root/f['path'];rec={'path':f['path'],'status':'HOLD'}
        try:
            raw=p.read_bytes()
            if raw[:12]!=b'ElecbyteSpr\0':raise ValueError('not SFF binary')
            ver=list(raw[12:16]);rec['version_bytes']=ver
            air=p.with_suffix('.air').read_text(encoding='latin1')
            a=re.search(r'\[Begin Action 0\]([\s\S]*?)(?=\[Begin Action|\Z)',air,re.I)
            seq=re.findall(r'^\s*(-?\d+)\s*,\s*(-?\d+)\s*,\s*(-?\d+)\s*,\s*(-?\d+)\s*,\s*(-?\d+)',a[1],re.M) if a else []
            rec['air_actions']=len(re.findall(r'\[Begin Action\s+\d+\]',air,re.I));rec['idle_air_frames']=len(seq);rec['status']='BINARY_AND_AIR_FETCHED'
            # SFF v2 sprite header table, dimensions only. No rendering claimed.
            if ver[3]==2 and len(raw)>=68:
                off,n=struct.unpack_from('<II',raw,36)
                if n<100000 and off>=68 and off+28*n<=len(raw):
                    dims={}
                    for i in range(n):
                        g,k,w,h=struct.unpack_from('<hhHH',raw,off+i*28)
                        dims[(g,k)]=(w,h)
                    rec['sff_sprites']=n;rec['idle_sprite_dimensions']=[list(dims.get((int(x[0]),int(x[1])),(0,0))) for x in seq]
        except Exception as e:rec['error']=str(e)
        records.append(rec)
        print('NARU_HD_SFF',p.parent.name,rec['status'],rec.get('idle_sprite_dimensions',[]),flush=True)
    return records
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);a=p.parse_args();out=a.out;out.mkdir(parents=True,exist_ok=True)
    mr=acquire(MANIFEST['mobile'],out/'source-mobile')
    sr=acquire(MANIFEST['mugen'],out/'source-mugen')
    groups=mobile(out/'source-mobile',out)
    sff=sff_report(out/'source-mugen',MANIFEST['mugen'])
    summary={'mobile_downloads':sum(x['status']=='FETCHED' for x in mr),'mobile_bytes':sum(x['bytes'] for x in mr if x['status']=='FETCHED'),'mobile_groups':len(groups),'mobile_gifs':sum(c['status']=='GIF_READY' for g in groups for c in g['clips']),'mugen_downloads':sum(x['status']=='FETCHED' for x in sr),'mugen_bytes':sum(x['bytes'] for x in sr if x['status']=='FETCHED'),'mugen_sff_ready':sum(x['status']=='BINARY_AND_AIR_FETCHED' for x in sff),'mobile':groups,'mugen':sff,'download_errors':[x for x in mr+sr if x['status']!='FETCHED'],'lfs_audit':MANIFEST['lfs_audit'],'note':'No runtime integration or final visual acceptance; source images not publicly redistributed. SFF dimensions are metadata, not proof of native HD.'}
    (out/'HD_REPORT.json').write_text(json.dumps(summary,indent=2,ensure_ascii=False));print('NARU_HD_SUMMARY',json.dumps({k:v for k,v in summary.items() if k not in ('mobile','mugen','download_errors','lfs_audit')},ensure_ascii=False),flush=True)
    if not summary['mobile_gifs']:raise ValueError('no mobile GIF generated')
