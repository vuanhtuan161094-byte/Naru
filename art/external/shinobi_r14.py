"""R14: pinned GitHub source archive and independent frame conversion. No source scripts executed."""
import argparse,base64,collections,concurrent.futures,hashlib,io,json,pathlib,re,urllib.parse,urllib.request,time,unicodedata,zipfile
from PIL import Image,ImageDraw
MANIFEST=json.loads(pathlib.Path(__file__).with_name('SHINOBI_R14_SOURCES.json').read_text())
def dump(path,value):
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(json.dumps(value,ensure_ascii=False,indent=2),encoding='utf-8')
def fetch(source,f,root):
    rel=pathlib.PurePosixPath(f['path'])
    if rel.is_absolute() or '..' in rel.parts:raise ValueError('unsafe path')
    dest=root/source['key']/rel
    dest.parent.mkdir(parents=True,exist_ok=True)
    url='https://raw.githubusercontent.com/'+source['repo']+'/'+source['sha']+'/'+urllib.parse.quote(f['path'],safe='/')
    for attempt in range(3):
        try:
            if dest.is_file():raw=dest.read_bytes()
            else:
                with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Naru-R14-source-review'}),timeout=60) as r:raw=r.read(f['bytes']+1)
            if len(raw)!=f['bytes'] or hashlib.sha1(('blob '+str(len(raw))+'\0').encode()+raw).hexdigest()!=f['blob']:
                raise ValueError('size/blob mismatch')
            dest.write_bytes(raw)
            return {'source':source['key'],'path':f['path'],'bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'status':'FETCHED'}
        except Exception as e:
            if attempt<2:time.sleep(attempt+1)
            else:return {'source':source['key'],'path':f['path'],'status':'HOLD','error':str(e)}
def norm(v):
    return ' '.join(re.findall(r'[a-z0-9]+',unicodedata.normalize('NFKD',str(v).lower()).encode('ascii','ignore').decode()))
def read_catalog(root,out):
    p=root/'studio/public/data/naruto-catalog.json'
    catalog=json.loads(p.read_text(encoding='utf-8'))
    ninja=catalog['ninjas']
    roster=json.loads(pathlib.Path('data/ninjas.json').read_text())
    forms=json.loads(pathlib.Path('data/ninja_forms.json').read_text())
    # Name candidates only; never silently map different costumes/eras to the same identity.
    records=[]
    for n in roster:
        tokens=norm(n['identity_id']).split()
        if not tokens:tokens=norm(n['name_vi']).split()[:1]
        ranked=[]
        for model in ninja:
            if model.get('kind')!='character':continue
            label=norm(model.get('name',''))
            matches=sum(t in label.split() for t in tokens)
            if not matches:continue
            ranked.append((matches,model))
        ranked.sort(key=lambda x:-x[0])
        records.append({'ninja_id':n['id'],'name':n['name_vi'],'identity_id':n.get('identity_id'),'era':n.get('era'),'forms':[f for f in forms if f['ninja_id']==n['id']], 'status':'REVIEW_REQUIRED','candidates':[{'id':m['id'],'name':m.get('name'),'score':s,'atlas_url':m.get('atlasUrl'),'skeleton_url':m.get('skeletonUrl')} for s,m in ranked[:30]]})
    dump(out/'library/CATALOG.json',catalog)
    dump(out/'library/ROSTER_CANDIDATES.json',records)
    return {'models':len(ninja),'model_kinds':dict(collections.Counter(x.get('kind','unknown') for x in ninja)),'textures':len(catalog.get('sheets',[])),'other_assets':len(catalog.get('assets',[])),'roster':len(roster),'forms':len(forms),'roster_with_candidates':sum(bool(x['candidates']) for x in records)}
def inspect_archives(root,out):
    report=[]
    for p in sorted((root/'studio').rglob('*.zip')):
        row={'name':p.name,'entries':0,'file_types':{},'status':'HOLD'}
        try:
            with zipfile.ZipFile(p) as z:
                members=[i for i in z.infolist() if not i.is_dir()]
                row['entries']=len(members)
                row['file_types']=dict(collections.Counter(pathlib.PurePosixPath(x.filename).suffix.lower() for x in members))
                row['uncompressed_bytes']=sum(x.file_size for x in members)
                row['status']='INDEXED'
        except Exception as e:row['error']=str(e)
        report.append(row)
    dump(out/'library/ARCHIVE_INDEX.json',report)
    return report
def split_clip(base,anim,dest):
    meta=json.loads((base/anim['jsonFile']).read_text(encoding='utf-8'))
    frames=meta.get('frames',{})
    if not isinstance(frames,dict):raise ValueError('unsupported frame format')
    if len(anim['imageFiles'])!=1:raise ValueError('multiatlas HOLD')
    with Image.open(base/anim['imageFiles'][0]) as raw:
        atlas=raw.convert('RGBA')
    cels=[];timing=[];frame_records=[]
    for key,v in sorted(frames.items(),key=lambda item:[int(x) if x.isdigit() else x for x in re.split(r'(\d+)',item[0])]):
        fr=v['frame'];x,y,w,h=[int(fr[k]) for k in ('x','y','w','h')]
        if min(x,y)<0 or min(w,h)<1 or x+w>atlas.width or y+h>atlas.height or v.get('rotated'):raise ValueError('invalid/rotated rect')
        im=atlas.crop((x,y,x+w,y+h))
        if v.get('trimmed'):
            ss=v['sourceSize'];box=v['spriteSourceSize']
            restored=Image.new('RGBA',(ss['w'],ss['h']));restored.alpha_composite(im,(box['x'],box['y']));im=restored
        if not im.getchannel('A').getbbox() and anim['slug'] not in ('win','out'):raise ValueError('empty cel')
        pivot=v.get('pivot')
        if not isinstance(pivot,dict) or 'x' not in pivot or 'y' not in pivot:raise ValueError('missing pivot')
        ms=max(10,int(v.get('duration',round(1000/float(anim.get('fps',24))))))
        cels.append(im);timing.append(ms)
        frame_records.append({'name':key,'pivot':[float(pivot['x']),float(pivot['y'])],'size':list(im.size),'duration_ms':ms})
    if len(cels)!=int(anim['frameCount']):raise ValueError('frame count mismatch')
    dest.mkdir(parents=True,exist_ok=True)
    for i,im in enumerate(cels):im.save(dest/('%04d.png'%i))
    dump(dest/'clip.json',{'source':anim['slug'],'direction':'screen_right','frames':frame_records,'status':'SOURCE_REVIEW_ONLY'})
    # common pivot coordinate; preserve origin and dimensions; never upscale or mirror.
    rects=[]
    for im,r in zip(cels,frame_records):
        b=im.getchannel('A').getbbox() or (0,0,0,0);px=r['pivot'][0]*im.width;py=r['pivot'][1]*im.height
        rects.append((b[0]-px,b[1]-py,b[2]-px,b[3]-py))
    left=min(r[0] for r in rects);top=min(r[1] for r in rects);right=max(r[2] for r in rects);bottom=max(r[3] for r in rects)
    s=min(1,400/max(1,right-left,bottom-top))
    W=max(1,round((right-left)*s)+4);H=max(1,round((bottom-top)*s)+4)
    gif=[]
    for im,r,bb in zip(cels,frame_records,rects):
        crop=im.crop(im.getchannel('A').getbbox() or (0,0,1,1))
        if s<1:crop=crop.resize((max(1,round(crop.width*s)),max(1,round(crop.height*s))),Image.Resampling.LANCZOS)
        bg=Image.new('RGBA',(W,H),'#26313b');bg.alpha_composite(crop,(round((bb[0]-left)*s)+2,round((bb[1]-top)*s)+2));gif.append(bg.convert('RGB'))
    gif[0].save(dest/'preview.gif',save_all=True,append_images=gif[1:],duration=timing,loop=0,disposal=2,optimize=True)
    return {'slug':anim['slug'],'status':'FRAME_READY','count':len(cels),'distinct_pixels':len(set(hashlib.sha256(im.tobytes()).hexdigest() for im in cels)),'native_sizes':sorted({tuple(im.size) for im in cels}),'preview':str(dest/'preview.gif'),'direction':'screen_right'}
def convert(root,out):
    base=root/'android/app/src/main/assets/assets/characters'
    records=[]
    for p in sorted(base.glob('*/character.json')):
        m=json.loads(p.read_text(encoding='utf-8'))
        group=p.parent.name
        rec={'source_id':group,'name':m['name'],'clips':[]}
        for a in m['animations']:
            try:
                slug=a['slug']
                if not re.fullmatch(r'[A-Za-z0-9_-]+',slug):raise ValueError('unsafe clip name')
                row=split_clip(p.parent,a,out/'library/frames'/group/slug)
                row['preview']=str(pathlib.Path(row['preview']).relative_to(out))
            except Exception as e:row={'slug':a['slug'],'status':'HOLD','error':str(e)}
            rec['clips'].append(row)
        rec['ready_clips']=sum(c['status']=='FRAME_READY' for c in rec['clips'])
        rec['frames']=sum(c.get('count',0) for c in rec['clips'])
        records.append(rec)
        print('NARU_R14_CHARACTER',group,rec['ready_clips'],rec['frames'],flush=True)
    dump(out/'library/CLIP_INDEX.json',records)
    # Catalog-to-game staging: native frames and indexes only; no false isometric directions.
    dump(out/'library/GAME_IMPORT_STATUS.json',{'schema':1,'status':'ART_LIBRARY_REVIEW_ONLY','original_action_map':{'idle':'idle','attack':'attack','cast':'cast','hurt1':'hit','die':'fall','run':'HOLD_DASH_ONLY'},'source_direction':'screen_right','missing_directions':['se','sw','ne','nw'],'production_overlay':'HOLD','reason':'Require era/form verification and visual approval. No substitute for base ninja or protected approved art.'})
    return records
def main(out):
    root=out/'source';tasks=[(s,f) for s in MANIFEST['sources'] for f in s['files']]
    with concurrent.futures.ThreadPoolExecutor(max_workers=10) as pool:res=list(pool.map(lambda p:fetch(p[0],p[1],root),tasks))
    dump(out/'DOWNLOAD_LEDGER.json',res)
    report={'expected':len(tasks),'fetched':sum(x['status']=='FETCHED' for x in res),'bytes':sum(x.get('bytes',0) for x in res),'holds':[x for x in res if x['status']!='FETCHED']}
    report['catalog']=read_catalog(root,out)
    report['archives']=inspect_archives(root,out)
    report['characters']=convert(root,out)
    report['ready_clips']=sum(x['ready_clips'] for x in report['characters'])
    report['ready_frames']=sum(x['frames'] for x in report['characters'])
    dump(out/'R14_REPORT.json',report)
    print('NARU_R14_SUMMARY',json.dumps({k:v for k,v in report.items() if k not in ('archives','characters','holds')},ensure_ascii=False),flush=True)
    if report['fetched']!=report['expected'] or report['ready_clips']!=79:raise ValueError('incomplete pinned acquisition or frame extraction')
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True);main(p.parse_args().out)
