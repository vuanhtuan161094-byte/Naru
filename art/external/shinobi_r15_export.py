"""R15 offline source-to-PNG batch. No runtime rig. Public texture URLs only; failed access is HOLD.
Upstream region renderer is not a complete Spine runtime. Mesh/IK/deform/draw-order sources are held,
not approximated as accepted game sprites. All catalog entries receive an evidence row.
"""
import argparse,collections,concurrent.futures,hashlib,io,json,math,pathlib,re,urllib.parse,urllib.request,zipfile
from PIL import Image
import shinobi_r14 as acquisition
import shinobi_offline_core as core
HOST='naruto.jotagame.com'
def read_json(p):return json.loads(p.read_text(encoding='utf-8'))
def write(p,obj):acquisition.dump(p,obj)
def meta_index(root):
    index={}
    for p in sorted(root.rglob('*.zip')):
        with zipfile.ZipFile(p) as z:
            for n in z.namelist():
                if n.lower().endswith(('.json','.atlas')):index.setdefault(pathlib.PurePosixPath(n).name,[]).append((p,n))
    return index
def read_meta(url,index):
    name=pathlib.PurePosixPath(urllib.parse.unquote(urllib.parse.urlparse(url).path)).name
    matches=index.get(name,[])
    if len(matches)!=1:raise ValueError('missing/ambiguous metadata: '+name)
    p,n=matches[0]
    with zipfile.ZipFile(p) as z:return z.read(n)
def public_texture(url,cache):
    parsed=urllib.parse.urlparse(url)
    if parsed.scheme!='https' or parsed.hostname!=HOST:raise ValueError('not allowlisted public texture host')
    key=hashlib.sha256(url.encode()).hexdigest()
    p=cache/key
    if p.is_file():raw=p.read_bytes()
    else:
        req=urllib.request.Request(url,headers={'User-Agent':'Naru asset format compatibility review'})
        with urllib.request.urlopen(req,timeout=20) as r:
            if urllib.parse.urlparse(r.geturl()).hostname!=HOST:raise ValueError('unexpected redirect')
            raw=r.read(24000001)
        if len(raw)>24000000:raise ValueError('texture exceeds bounded size')
        with Image.open(io.BytesIO(raw)) as img:
            if img.width*img.height>16000000:raise ValueError('texture exceeds pixel cap')
            img.verify()
        p.write_bytes(raw)
    with Image.open(io.BytesIO(raw)) as img:return img.convert('RGBA')
def unsupported(skel):
    bad=[]
    if skel.get('ik') or skel.get('transform') or skel.get('path'):bad.append('constraints')
    skins=core.get_default_skin_attachments(skel)
    for slot,atts in skins.items():
        for key,att in atts.items():
            if (att or {}).get('type','region')!='region':bad.append('non-region attachment')
    for a in (skel.get('animations') or {}).values():
        if any(a.get(k) for k in ('deform','ffd','drawOrder','draworder','ik','transform','paths')):bad.append('unsupported timeline')
    return sorted(set(bad))
def export_model(model,index,out,cache):
    id=str(model['id']);rec={'id':id,'name':model.get('name'),'kind':model.get('kind'),'status':'HOLD','clips':[]}
    try:
        if not re.fullmatch(r'[A-Za-z0-9_.-]+',id) or id in ('.','..'):raise ValueError('unsafe model id')
        atlas=read_meta(model['atlasUrl'],index).decode('utf-8')
        skel=json.loads(read_meta(model['skeletonUrl'],index))
        pages=core.parse_atlas(atlas)
        if not pages or not any(p['regions'] for p in pages):raise ValueError('atlas not parsed')
        rec['texture_pages']=len(pages)
        bad=unsupported(skel);rec['renderer_limitations']=bad
        if bad:
            rec['status']='HOLD_UNSUPPORTED_SPINE';return rec
        regions={};sizes={}
        for page in pages:
            url=urllib.parse.urljoin(model['atlasUrl'],page['name'])
            im=public_texture(url,cache)
            for r in page['regions']:
                crop=core.extract_region_pil(r,im)
                regions[r['name']]=crop;sizes[r['name']]=crop.size
        rec['texture_pages_ready']=len(pages)
        if not regions:raise ValueError('empty region map')
        for slot,atts in core.get_default_skin_attachments(skel).items():
            for key,att in atts.items():
                att=att or {};name=att.get('path') or att.get('name') or key
                if name not in regions:raise ValueError('missing region '+str(name))
        dest=out/'frames'/id;dest.mkdir(parents=True,exist_ok=True)
        for name in sorted((skel.get('animations') or {})):
            c={'name':name,'status':'HOLD'}
            try:
                duration=core.get_animation_duration(skel,name)
                count=max(1,math.ceil(duration*24))
                if count>720:raise ValueError('clip exceeds 30s review cap')
                bounds=core.compute_composite_bounds(skel,name,sizes,[],samples=min(count,48))
                w,h=core.compute_native_export_cell_size(bounds,max_dim=1024)
                scale=min(1.0,(w*.86)/bounds['width'],(h*.86)/bounds['height'])
                pivot=[(w/2-bounds['centerX']*scale)/w,(h/2+bounds['centerY']*scale)/h]
                slug=re.sub(r'[^A-Za-z0-9_-]','_',name)[:60]+'-'+hashlib.sha1(name.encode()).hexdigest()[:8]
                target=dest/slug;target.mkdir(exist_ok=True)
                distinct=set();visible=0
                for i in range(count):
                    im=core.render_spine_frame_pil(w,h,skel,name,min(i/24,max(0,duration-1e-6)),regions,bounds,[],.86,1.0)
                    distinct.add(hashlib.sha256(im.tobytes()).hexdigest())
                    visible+=bool(im.getchannel('A').getbbox())
                    im.save(target/('%04d.png'%i),compress_level=3)
                if not visible:raise ValueError('all frames transparent')
                write(target/'clip.json',{'name':name,'fps':24,'frames':count,'duration_s':duration,'pivot':pivot,'canvas':[w,h],'direction':'SOURCE_VIEW_ONLY','status':'REGION_RENDER_REVIEW_ONLY'})
                c.update(status='FRAME_READY',frames=count,distinct_frames=len(distinct),visible_frames=visible,folder=slug)
            except Exception as e:c['error']=str(e)
            rec['clips'].append(c)
        rec['status']='FRAME_READY' if any(c['status']=='FRAME_READY' for c in rec['clips']) else 'HOLD_NO_VISIBLE_CLIPS'
    except Exception as e:rec['error']=str(e)
    return rec
def main(out,part,parts,prepare):
    out.mkdir(parents=True,exist_ok=True)
    if prepare:
        src=next(s for s in acquisition.MANIFEST['sources'] if s['key']=='studio')
        root=out/'metadata'
        results=[acquisition.fetch(src,f,root) for f in src['files']]
        write(out/'metadata-ledger.json',results)
        if any(r['status']!='FETCHED' for r in results):raise ValueError('studio metadata incomplete')
        return
    root=out/'metadata/studio/public/data';cat=read_json(root/'naruto-catalog.json')
    index=meta_index(root)
    rows=sorted(cat['ninjas'],key=lambda x:(x.get('kind',''),x['id']))
    selected=rows[part::parts]
    cache=out/'texture-cache';cache.mkdir(exist_ok=True)
    ledger=[]
    for m in selected:
        r=export_model(m,index,out,cache);ledger.append(r)
        print('NARU_R15_OFFLINE',r['id'],r['status'],len(r['clips']),flush=True)
        write(out/'OFFLINE_REPORT.json',{'part':part,'parts':parts,'catalog_count':len(rows),'expected':len(selected),'processed':len(ledger),'status_counts':dict(collections.Counter(r['status'] for r in ledger)),'records':ledger})
    print('NARU_R15_OFFLINE_SUMMARY',part,len(ledger),dict(collections.Counter(r['status'] for r in ledger)),flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);p.add_argument('--part',type=int,default=0);p.add_argument('--parts',type=int,default=1);p.add_argument('--prepare',action='store_true');a=p.parse_args();main(a.out,a.part,a.parts,a.prepare)
