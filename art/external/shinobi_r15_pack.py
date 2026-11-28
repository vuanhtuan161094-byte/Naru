"""Build optional candidate-review pack from fully restored original cels, including trimmed source atlases."""
import argparse,base64,hashlib,io,json,pathlib,statistics,math
from PIL import Image
MAP={'vdfno_100304':'NIN-041','vdfno_100306':'NIN-042','vdfno_100311':'NIN-043','vdfno_100361':'NIN-004'}
ROLES={'idle':'idle','attack':'attack','cast':'cast','hurt1':'hit','die':'fall'}
def main(root,out):
    base=root/'source/android/app/src/main/assets/assets/characters'
    pack={'schema':1,'status':'SHINOBI_R15_REVIEW_ONLY','characters':{}}
    for folder,id in MAP.items():
        doc=json.loads((base/folder/'character.json').read_text())
        rec={'source_id':folder,'name':doc['name'],'direction':'screen_right','clips':{}}
        for a in doc['animations']:
            action=ROLES.get(a['slug'])
            if not action:continue
            path=root/'library/frames'/folder/a['slug']
            meta=json.loads((path/'clip.json').read_text())
            records=meta['frames']
            W=max(v['size'][0] for v in records);H=max(v['size'][1] for v in records)
            cols=min(len(records),4096//W);rows=math.ceil(len(records)/max(1,cols))
            if cols<1 or rows*H>4096:raise ValueError('restored atlas exceeds review texture limit '+folder+'/'+action)
            atlas=Image.new('RGBA',(cols*W,rows*H))
            frames=[];idle_heights=[]
            for i,v in enumerate(records):
                with Image.open(path/('%04d.png'%i)) as raw:im=raw.convert('RGBA')
                assert list(im.size)==v['size']
                x=(i%cols)*W;y=(i//cols)*H
                atlas.alpha_composite(im,(x,y))
                frames.append([x,y,im.width,im.height,float(v['pivot'][0]),float(v['pivot'][1]),max(10,int(v['duration_ms']))])
                if action=='idle':
                    b=im.getchannel('A').getbbox()
                    if b:idle_heights.append(b[3]-b[1])
            if action=='idle':rec['scale']=92/max(1,statistics.median(idle_heights))
            buf=io.BytesIO();atlas.save(buf,format='PNG');raw=buf.getvalue()
            rec['clips'][action]={'png':base64.b64encode(raw).decode(),'sha256':hashlib.sha256(raw).hexdigest(),'frames':frames}
        assert len(rec['clips'])==5,(id,rec['clips'].keys())
        pack['characters'][id]=rec
    out.write_text(json.dumps(pack,separators=(',',':')))
    print('NARU_R15_RUNTIME_PACK',len(pack['characters']),sum(len(x['clips']) for x in pack['characters'].values()),out.stat().st_size)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--root',type=pathlib.Path,required=True);p.add_argument('--out',type=pathlib.Path,required=True);a=p.parse_args();main(a.root,a.out)
