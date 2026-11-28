"""Reconstruct exact authored runtime PNGs from immutable Naru P3 and recovered V3 overlay.
No image generation. GIF previews are derived from actual cels, not new art."""
import base64,hashlib,io,json,pathlib
from PIL import Image,ImageDraw
ROOT=pathlib.Path(__file__).resolve().parents[1]
OUT=ROOT/'art/factory/references/generated'
IDS={'NIN-041':'Naruto Shippuden','NIN-042':'Sasuke Shippuden','NIN-043':'Sakura Shippuden','NIN-004':'Kakashi','NIN-060':'Itachi','NIN-093':'Minato','NIN-068':'Nagato'}
WALK=list(IDS)[:6]
ACTIONS=['idle','move','attack','cast','hit','fall']
def read(p):return json.loads(p.read_text())
def source_pack():
    parts=sorted((ROOT/'assets/public').glob('naru-art.part.*'))
    raw=b''.join(p.read_bytes() for p in parts)
    assert len(parts)==15 and hashlib.sha256(raw).hexdigest()=='a0d34b650e4569ac22fe643d242e75296f5e79ecf29a45c259b8c2c0577a657e'
    return json.loads(raw)
def png(pack,key,path):
    item=pack['assets'][key];raw=base64.b64decode(item['png'],validate=True)
    assert hashlib.sha256(raw).hexdigest()==item['sha256']
    path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(raw)
    return Image.open(io.BytesIO(raw)).convert('RGBA')
def cells(pack,key,folder):
    path=folder/(pathlib.PurePosixPath(key).stem+'.png')
    im=png(pack,key,path);m=pack['clips'][key]
    fs=[];ds=[]
    for f in m['frames']:
        x,y,w,h=f['rect'];fs.append(im.crop((x,y,x+w,y+h)));ds.append(f['duration_ms'])
    assert fs and all(f.size==(96,112) for f in fs)
    return fs,ds
def visual(im,scale=2):
    im=im.resize((im.width*scale,im.height*scale),Image.Resampling.NEAREST)
    bg=Image.new('RGBA',im.size,'#26313b');bg.alpha_composite(im);return bg.convert('RGB')
def gif(path,frames,durations):
    path.parent.mkdir(parents=True,exist_ok=True)
    frames[0].save(path,save_all=True,append_images=frames[1:],duration=durations,loop=0,disposal=2,optimize=True)
def writejson(path,obj):path.write_text(json.dumps(obj,indent=2,ensure_ascii=False)+'\n')
def main():
    OUT.mkdir(parents=True,exist_ok=True)
    pack=source_pack();contract=read(ROOT/'data/art-review/move-r3-contract.json')
    manifest={'source_pack_sha256':'a0d34b650e4569ac22fe643d242e75296f5e79ecf29a45c259b8c2c0577a657e','p3_candidates':[],'sasuke_v3':[]}
    walks={};board=Image.new('RGB',(7*160,8*132),'#1f2937');d=ImageDraw.Draw(board);d.text((10,10),'NARU P3 / older action references (Move R3 approved)',fill='white')
    for i,a in enumerate(ACTIONS):d.text(((i+1)*160+12,43),a.upper(),fill='white')
    for row,(id,name) in enumerate(IDS.items()):
        target=OUT/'p3'/id;target.mkdir(parents=True,exist_ok=True)
        png(pack,'characters/'+id+'.png',target/'static.png')
        d.text((8,(row+1)*132+12),name,fill='white')
        for col,a in enumerate(ACTIONS):
            namekey='walk_screen_right_r3' if a=='move' and id in WALK else a+'_se'
            key=f'animation/{id}/{namekey}.png'
            if key not in pack['assets'] or key not in pack['clips']:
                d.text(((col+1)*160+12,(row+1)*132+40),'MISSING',fill='#fbbf24');continue
            fs,ds=cells(pack,key,target);gif(target/(namekey+'.gif'),[visual(f) for f in fs],ds)
            board.paste(visual(fs[len(fs)//2],1),((col+1)*160+32,(row+1)*132+10))
            approved=a=='move' and id in WALK
            if approved:
                approved_record=next(x for x in contract['clips'] if x['id']==id)
                assert pack['assets'][key]['sha256']==approved_record['sha256']
                walks[id]=fs
            manifest['p3_candidates'].append({'id':id,'clip':namekey,'frames':len(fs),'source_sha256':pack['assets'][key]['sha256'],'owner_visual_approved':approved,'status':'APPROVED_MOVE_R3' if approved else 'OLDER_CANDIDATE'})
    board.save(OUT/'Original_Action_Contact_Sheet.png')
    pages=[]
    for f in range(8):
        b=Image.new('RGB',(3*224,2*270),'#1f2937');d=ImageDraw.Draw(b)
        for i,id in enumerate(WALK):
            x=(i%3)*224;y=(i//3)*270
            b.paste(visual(walks[id][f]),(x+16,y+28));d.text((x+12,y+8),IDS[id],fill='white')
        pages.append(b)
    gif(OUT/'Move_R3_6_Ninja.gif',pages,[100]*8)
    s=read(ROOT/'art/factory/references/source/NIN-002.json');target=OUT/'sasuke_v3';target.mkdir(exist_ok=True)
    png(s,'characters/NIN-002.png',target/'static.png')
    sheet=Image.new('RGB',(8*100,14*132),'#1f2937');d=ImageDraw.Draw(sheet)
    for row,(key,m) in enumerate(s['clips'].items()):
        fs,ds=cells(s,key,target);slug=pathlib.PurePosixPath(key).stem
        gif(target/(slug+'.gif'),[visual(f) for f in fs],ds)
        d.text((4,row*132+4),slug,fill='white')
        for i,f in enumerate(fs):sheet.paste(visual(f,1),(i*100,row*132+20))
        manifest['sasuke_v3'].append({'clip':slug,'frames':len(fs),'source_sha256':s['assets'][key]['sha256'],'status':'V3_RUNTIME_DERIVATIVE_NOT_RUNTIME_TESTED'})
    sheet.save(OUT/'Sasuke_V3_84_Contact_Sheet.png')
    assert len(manifest['p3_candidates'])==41 and len(manifest['sasuke_v3'])==14 and sum(x['frames'] for x in manifest['sasuke_v3'])==84
    writejson(OUT/'MANIFEST.json',manifest)
    print('NARU_FACTORY_REFERENCES_PASS 41 P3 clips, 6 approved Move R3, 14 Sasuke V3 clips, 84 cels')
if __name__=='__main__':main()
