"""Build a review-only catalog and contact sheets from collected media."""
import collections, csv, hashlib, json, pathlib, sys
from PIL import Image, ImageDraw, ImageFont, ImageOps
root=pathlib.Path(sys.argv[1])
out=pathlib.Path(sys.argv[2]); out.mkdir(parents=True,exist_ok=True)
rows=[]; groups=collections.defaultdict(list); hashes={}
raster={'.png','.webp','.jpg','.jpeg','.gif','.bmp','.tga'}
def category(p):
    s=p.lower()
    if any(x in s for x in ('particle','effect','vfx','spell','explosion','slash','flame')): return 'vfx'
    if any(x in s for x in ('building','house','village','interior','furniture')): return 'building'
    if any(x in s for x in ('character','monster','ninja','npc','sprite')): return 'character'
    if any(x in s for x in ('tile','terrain','nature','background','environment','texture')): return 'environment'
    if any(x in s for x in ('icon','ui','inventory')): return 'ui'
    return 'other'
for index in sorted(root.glob('*/MEDIA_INDEX.json')):
    source=index.parent.name
    for entry in json.loads(index.read_text()):
        rel=entry['path']; path=index.parent/rel; ext=path.suffix.lower()
        ident=source+'/'+rel; sha=entry['sha256']
        first=hashes.setdefault(sha,ident)
        row=dict(source=source,path=rel,category=category(rel),sha256=sha,bytes=entry['bytes'],duplicate_of='' if first==ident else first,width='',height='',frames='',alpha='',status='SOURCE_UNREVIEWED')
        if ext in raster:
            try:
                with Image.open(path) as im:
                    row.update(width=im.width,height=im.height,frames=getattr(im,'n_frames',1),alpha='yes' if ('A' in im.getbands() or 'transparency' in im.info) else 'no')
                if first==ident: groups[(source,row['category'])].append((path,row))
            except Exception as e: row['status']='DECODE_ERROR:'+type(e).__name__
        rows.append(row)
fields=['source','path','category','sha256','bytes','duplicate_of','width','height','frames','alpha','status']
with (out/'MEDIA_REVIEW_INDEX.csv').open('w',newline='',encoding='utf-8-sig') as f:
    writer=csv.DictWriter(f,fieldnames=fields);writer.writeheader();writer.writerows(rows)
font=ImageFont.load_default()
for (source,cat),items in sorted(groups.items()):
    folder=out/'sheets'/source/cat;folder.mkdir(parents=True,exist_ok=True)
    for start in range(0,len(items),80):
        batch=items[start:start+80]; cols=8; cw=180; ch=132
        canvas=Image.new('RGB',(cols*cw,((len(batch)+cols-1)//cols)*ch),'#242a33');d=ImageDraw.Draw(canvas)
        for j,(path,row) in enumerate(batch):
            x=(j%cols)*cw;y=(j//cols)*ch
            try:
                with Image.open(path) as im:
                    im=im.convert('RGBA')
                    im.thumbnail((170,94),Image.Resampling.NEAREST)
                    bg=Image.new('RGBA',im.size,'#606873')
                    bg.alpha_composite(im)
                    canvas.paste(bg.convert('RGB'),(x+(cw-im.width)//2,y+2+(94-im.height)//2))
                label=path.stem[:22].encode('ascii','replace').decode()
                d.text((x+4,y+99),label,fill='white',font=font)
                d.text((x+4,y+112),f"{start+j+1:04d} {row['width']}x{row['height']} f{row['frames']}",fill='#bac9dc',font=font)
            except Exception: d.text((x+4,y+5),'DECODE ERROR',fill='white',font=font)
        canvas.save(folder/f'page-{start//80+1:03d}.jpg',quality=88)
        (folder/f'page-{start//80+1:03d}.json').write_text(json.dumps([r for _,r in batch],ensure_ascii=False,indent=2))
summary=dict(total=len(rows),unique=len(hashes),exact_duplicates=len(rows)-len(hashes),raster_candidates=sum(map(len,groups.values())),decode_errors=sum(r['status'].startswith('DECODE_ERROR') for r in rows),category_counts=dict(collections.Counter(r['category'] for r in rows)),runtime_status='NOT_INTEGRATED')
(out/'REVIEW_SUMMARY.json').write_text(json.dumps(summary,indent=2))
print('NARU_EXTERNAL_REVIEW',json.dumps(summary))
