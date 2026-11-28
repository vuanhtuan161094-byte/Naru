"""Index R15's completed model/clip reports without downloading 16GB of character cels."""
import argparse,json,pathlib,collections
p=argparse.ArgumentParser();p.add_argument('--reports',type=pathlib.Path,required=True);p.add_argument('--out',type=pathlib.Path,required=True);a=p.parse_args()
rows=[];parts=set()
for path in a.reports.rglob('OFFLINE_REPORT.json'):
    doc=json.loads(path.read_text());parts.add(doc['part'])
    for r in doc['records']:
        rows.append(dict(r,shard=doc['part']))
assert len(parts)==16 and len(rows)==991,(len(parts),len(rows))
assert len({r['id'] for r in rows})==991
effects=[r for r in rows if r['kind']=='effect']
assert len(effects)==98
report={'scope':'R15 source candidate index; no assertion of visual approval or cleared rights; no new character imports','models':len(rows),'statuses':dict(collections.Counter(r['status'] for r in rows)),'effect_models':len(effects),'effect_statuses':dict(collections.Counter(r['status'] for r in effects)),'effect_ready_clips':sum(c['status']=='FRAME_READY' for r in effects for c in r['clips']),'effect_ready_frames':sum(c.get('frames',0) for r in effects for c in r['clips'] if c['status']=='FRAME_READY'),'effects':effects}
a.out.parent.mkdir(parents=True,exist_ok=True);a.out.write_text(json.dumps(report,ensure_ascii=False,indent=2));print('NARU_R15_VFX_INDEX',json.dumps({k:v for k,v in report.items() if k!='effects'}))
