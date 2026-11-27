"""Public-page discovery and local archive review; no protected endpoints or guessed frames.
Usage:
  python art/external/premium_review.py discover --out premium-discovery
  python art/external/premium_review.py inspect --input local-archives --out premium-local
  python art/external/premium_review.py gif --input premium-local --selection selection.json --out premium-local/gifs
"""
import argparse, collections, csv, hashlib, html, io, json, pathlib, re, time, urllib.error, urllib.parse, urllib.request, zipfile
from html.parser import HTMLParser
from PIL import Image, ImageDraw, ImageFont
MANIFEST=json.loads(pathlib.Path(__file__).with_name('PREMIUM_SOURCES.json').read_text())
MAX_DOWNLOAD=32*1024*1024
MAX_FILE=32*1024*1024
MAX_PIXELS=16000000
class Links(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True);self.links=[];self.text=[];self.title=[];self.in_title=False
    def handle_starttag(self,tag,attrs):
        a=dict(attrs)
        if tag=='title':self.in_title=True
        if tag in ('a','img','source'):
            for k in ('href','src','data-src','data-href','data-download','data-url'):
                if a.get(k):self.links.append({'tag':tag,'attr':k,'value':a[k],'label':a.get('title',a.get('alt',''))})
    def handle_endtag(self,tag):
        if tag=='title':self.in_title=False
    def handle_data(self,data):
        if self.in_title:self.title.append(data.strip())
def request(url,limit):
    # Normal public GET only. Respect forbidden/rate-limit responses; no proxy, cookies or bypass.
    req=urllib.request.Request(url,headers={'User-Agent':'Naru-Asset-Review/1.0 (public asset catalog audit)','Accept':'*/*'})
    with urllib.request.urlopen(req,timeout=30) as res:
        payload=res.read(limit+1)
        if len(payload)>limit:raise ValueError('response exceeds review limit')
        return payload,res.geturl(),res.headers.get('Content-Type','')
def discover(out,local_samples=False):
    out.mkdir(parents=True,exist_ok=True);result=[]
    for source in MANIFEST['sources']:
        for sample in [{'id':'CATALOG','url':source['url'],'title':source['name']}]+source['samples']:
            rec={'source':source['name'],**sample}
            try:
                data,url,typ=request(sample['url'],8*1024*1024);p=Links();p.feed(data.decode('utf-8','replace'))
                links=[]
                for a in p.links:
                    u=urllib.parse.urljoin(url,a['value']);parts=urllib.parse.urlsplit(u)
                    if parts.scheme not in ('http','https'):continue
                    if re.search(r'/asset/\d+/?$|\.zip(?:$|\?)|/download(?:/|$)|\.png(?:$|\?)|\.gif(?:$|\?)|/view/\d+-\d+',u,re.I):
                        links.append({'url':u,'tag':a['tag'],'label':a['label']})
                rec.update(status='PAGE_READ',title=' '.join(p.title),content_type=typ,links=list({x['url']:x for x in links}.values()))
                if local_samples and sample['id']!='CATALOG':
                    archives=[x['url'] for x in links if x['tag']=='a' and re.search(r'\.zip(?:$|\?)|/download(?:/|$)',x['url'],re.I)]
                    rec['archive_status']='NO_EXPLICIT_PUBLIC_DOWNLOAD_LINK'
                    for link in archives[:1]:
                        try:
                            blob,final,mime=request(link,MAX_DOWNLOAD)
                            if not zipfile.is_zipfile(io.BytesIO(blob)):raise ValueError('not an archive response')
                            dst=out/'local-archives';dst.mkdir(exist_ok=True)
                            (dst/(sample['id']+'.zip')).write_bytes(blob)
                            rec['archive_status']='LOCAL_SAMPLE_DOWNLOADED';rec['archive_bytes']=len(blob)
                        except Exception as e:rec['archive_status']='HOLD';rec['archive_error']=str(e)
            except urllib.error.HTTPError as e:rec.update(status='HTTP_'+str(e.code),error=str(e))
            except Exception as e:rec.update(status='UNAVAILABLE',error=str(e))
            result.append(rec);print('NARU_PREMIUM_SOURCE',sample['id'],rec['status'],rec.get('archive_status',''),flush=True)
            time.sleep(0.5)
    (out/'DISCOVERY.json').write_text(json.dumps(result,indent=2,ensure_ascii=False))
    return result
def natural(s):
    return [int(x) if x.isdigit() else x.lower() for x in re.split(r'(\d+)',s)]
def inspect(root,out):
    out.mkdir(parents=True,exist_ok=True);media=out/'media';media.mkdir(exist_ok=True)
    records=[];seen={};groups=collections.defaultdict(list)
    def accept(data,source,name):
        if len(data)>MAX_FILE:return
        sha=hashlib.sha256(data).hexdigest();ident=sha[:20]
        try:
            with Image.open(io.BytesIO(data)) as raw:
                if raw.width*raw.height>MAX_PIXELS:return
                n=getattr(raw,'n_frames',1);im=raw.convert('RGBA')
                bb=im.getchannel('A').getbbox()
                if bb is None:return
                alpha=im.getchannel('A').getextrema()
                rec={'source':source,'path':name,'id':ident,'sha256':sha,'width':im.width,'height':im.height,'alpha':alpha[0]<255,'bbox':list(bb),'embedded_frames':n,'duplicate_of':seen.get(sha,''),'status':'UNREVIEWED'}
                records.append(rec)
                if sha in seen:return
                seen[sha]=ident
                im.save(media/(ident+'.png'))
                groups[source].append(rec)
                if n>1:
                    dst=out/'embedded-animations';dst.mkdir(exist_ok=True)
                    frames=[];times=[]
                    if n>300 or raw.width*raw.height*n>24000000:return
                    for j in range(n):
                        raw.seek(j);frames.append(raw.convert('RGBA'));times.append(max(20,int(raw.info.get('duration',100))))
                    frames[0].save(dst/(ident+'.gif'),save_all=True,append_images=frames[1:],duration=times,loop=0,disposal=2)
                    rec['status']='EMBEDDED_ANIMATION_REVIEW'
        except Exception as e:records.append({'source':source,'path':name,'status':'DECODE_FAIL','error':str(e)})
    for path in sorted(root.rglob('*')):
        if not path.is_file():continue
        if path.suffix.lower()=='.zip':
            try:
                with zipfile.ZipFile(path) as z:
                    for item in sorted(z.infolist(),key=lambda a:natural(a.filename)):
                        if item.is_dir() or item.file_size>MAX_FILE or pathlib.PurePosixPath(item.filename).suffix.lower() not in ('.png','.gif','.webp','.jpg','.jpeg','.bmp','.tga'):continue
                        accept(z.read(item),path.stem,item.filename)
            except Exception as e:records.append({'source':path.stem,'path':str(path),'status':'ARCHIVE_FAIL','error':str(e)})
        elif path.suffix.lower() in ('.png','.gif','.webp','.jpg','.jpeg','.bmp','.tga'):
            accept(path.read_bytes(),path.parent.name,path.relative_to(root).as_posix())
    fonts=ImageFont.load_default()
    for group,items in groups.items():
        dest=out/'contact-sheets'/re.sub(r'[^A-Za-z0-9_.-]','_',group);dest.mkdir(parents=True,exist_ok=True)
        for start in range(0,len(items),80):
            batch=items[start:start+80];cw,ch=165,146;cols=8
            page=Image.new('RGB',(cols*cw,((len(batch)+cols-1)//cols)*ch),'#202830');d=ImageDraw.Draw(page)
            for j,r in enumerate(batch):
                x=j%cols*cw;y=j//cols*ch
                with Image.open(media/(r['id']+'.png')) as im:
                    im=im.convert('RGBA');im.thumbnail((155,108),Image.Resampling.LANCZOS)
                    bg=Image.new('RGBA',im.size,'#65717b');bg.alpha_composite(im);page.paste(bg.convert('RGB'),(x+(cw-im.width)//2,y+2+(108-im.height)//2))
                d.text((x+3,y+112),r['id'][:12],font=fonts,fill='white')
                d.text((x+3,y+125),f"{r['width']}x{r['height']}  {pathlib.PurePosixPath(r['path']).name[:13]}".encode('ascii','replace').decode(),font=fonts,fill='#bdd0df')
            page.save(dest/f'{start//80+1:03d}.jpg',quality=90)
            (dest/f'{start//80+1:03d}.json').write_text(json.dumps(batch,indent=2))
    summary={'records':len(records),'unique_images':len(seen),'source_groups':len(groups),'embedded_animations':sum(r.get('status')=='EMBEDDED_ANIMATION_REVIEW' for r in records),'ordered_actions_approved':0,'records_detail':records}
    (out/'REVIEW_INDEX.json').write_text(json.dumps(summary,indent=2,ensure_ascii=False))
    print('NARU_PREMIUM_INSPECT',len(records),len(seen),len(groups),flush=True)
def gifs(root,selection,out):
    out.mkdir(parents=True,exist_ok=True)
    spec=json.loads(selection.read_text())
    for clip in spec['clips']:
        if clip.get('verified_frame_order') is not True or clip.get('complete_cels') is not True:raise ValueError('review and confirm frame order and complete cels first')
        name=re.sub(r'[^A-Za-z0-9_.-]','_',clip['name'])
        frames=clip['frames'];duration=clip['duration_ms']
        if not frames or len(frames)!=len(duration) or any(not isinstance(t,int) or t<20 or t>5000 for t in duration):raise ValueError('bad timing')
        imgs=[]
        for frame in frames:
            ident=frame['id']
            if not re.fullmatch(r'[0-9a-f]{20}',ident):raise ValueError('bad ID')
            im=Image.open(root/'media'/(ident+'.png')).convert('RGBA')
            x,y=frame['anchor'];imgs.append((im,float(x),float(y)))
        # One shared scale and anchor; never resize each cel separately.
        l=min(-x for im,x,y in imgs);r=max(im.width-x for im,x,y in imgs)
        t=min(-y for im,x,y in imgs);b=max(im.height-y for im,x,y in imgs)
        scale=min(1,110/max(1,-l),110/max(1,r),208/max(1,-t),14/max(1,b))
        result=[]
        for im,x,y in imgs:
            im=im.resize((max(1,round(im.width*scale)),max(1,round(im.height*scale))),Image.Resampling.LANCZOS)
            dx=round(112-x*scale);dy=round(210-y*scale)
            if dx<0 or dy<0 or dx+im.width>224 or dy+im.height>226:raise ValueError('frame clipping')
            bg=Image.new('RGBA',(224,226),'#27333d');bg.alpha_composite(im,(dx,dy));result.append(bg.convert('RGB'))
        result[0].save(out/(name+'.gif'),save_all=True,append_images=result[1:],duration=duration,loop=0,disposal=2,optimize=False)
        print('NARU_PREMIUM_GIF',name,len(result),flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('mode',choices=['discover','inspect','gif']);p.add_argument('--out',type=pathlib.Path,required=True);p.add_argument('--input',type=pathlib.Path);p.add_argument('--selection',type=pathlib.Path);p.add_argument('--local-samples',action='store_true');a=p.parse_args()
    if a.mode=='discover':
        discover(a.out,a.local_samples)
        if a.local_samples and (a.out/'local-archives').exists():inspect(a.out/'local-archives',a.out/'local-review')
    elif a.mode=='inspect':
        if a.input is None:p.error('--input required')
        inspect(a.input,a.out)
    else:
        if a.input is None or a.selection is None:p.error('--input and --selection required')
        gifs(a.input,a.selection,a.out)
