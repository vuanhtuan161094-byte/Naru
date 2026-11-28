"""Build optional candidate-review pack for existing Naru combat renderer. Never changes roster IDs."""
import argparse,base64,hashlib,json,pathlib,statistics
from PIL import Image
MAP={'vdfno_100304':'NIN-041','vdfno_100306':'NIN-042','vdfno_100311':'NIN-043','vdfno_100361':'NIN-004'}
ROLES={'idle':'idle','attack':'attack','cast':'cast','hurt1':'hit','die':'fall'}
def main(root,out):
    base=root/'source/android/app/src/main/assets/assets/characters'
    pack={'schema':1,'status':'SHINOBI_R15_REVIEW_ONLY','characters':{}}
    for folder,id in MAP.items():
        src=base/folder
        doc=json.loads((src/'character.json').read_text())
        rec={'source_id':folder,'name':doc['name'],'direction':'screen_right','clips':{}}
        for a in doc['animations']:
            action=ROLES.get(a['slug'])
            if not action:continue
            meta=json.loads((src/a['jsonFile']).read_text())
            p=src/a['imageFiles'][0];raw=p.read_bytes()
            with Image.open(p) as im:
                if max(im.size)>4096:raise ValueError('atlas exceeds review texture limit')
                frames=[]
                idle_heights=[]
                for k,v in sorted(meta['frames'].items(),key=lambda x:int(x[0].rsplit('_',1)[1].split('.')[0])):
                    f=v['frame'];x,y,w,h=(int(f[k]) for k in ('x','y','w','h'))
                    assert not v.get('rotated') and not v.get('trimmed'),k
                    pivot=v['pivot'];ms=int(v.get('duration',42))
                    frames.append([x,y,w,h,float(pivot['x']),float(pivot['y']),max(10,ms)])
                    if action=='idle':
                        b=im.crop((x,y,x+w,y+h)).convert('RGBA').getchannel('A').getbbox()
                        if b:idle_heights.append(b[3]-b[1])
                if action=='idle':rec['scale']=92/max(1,statistics.median(idle_heights))
            rec['clips'][action]={'png':base64.b64encode(raw).decode(),'sha256':hashlib.sha256(raw).hexdigest(),'frames':frames}
        assert len(rec['clips'])==5,(id,rec['clips'].keys())
        pack['characters'][id]=rec
    out.write_text(json.dumps(pack,separators=(',',':')))
    print('NARU_R15_RUNTIME_PACK',len(pack['characters']),sum(len(x['clips']) for x in pack['characters'].values()),out.stat().st_size)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--root',type=pathlib.Path,required=True);p.add_argument('--out',type=pathlib.Path,required=True);a=p.parse_args();main(a.root,a.out)
