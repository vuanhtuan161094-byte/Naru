#!/usr/bin/env python3
"""Validate real R13 source deliveries against the full roster. Inventory, not visual approval."""
import argparse, hashlib, json, pathlib, sys
p=argparse.ArgumentParser()
p.add_argument("pack", type=pathlib.Path, help="JSON asset pack with PNG paths and SHA-256 entries")
p.add_argument("--require-complete", action="store_true")
a=p.parse_args()
root=pathlib.Path(__file__).resolve().parents[1]
manifest=json.loads((root/"data/art-review/r13-full-roster.json").read_text())
pack=json.loads(a.pack.read_text())
assets=pack["assets"]
import base64
def valid(path, expected=None):
    v=assets.get(path)
    if not v:return False
    try:
        data=base64.b64decode(v["png"],validate=True)
        if data[:8]!=b"\x89PNG\r\n\x1a\n":return False
        sha=hashlib.sha256(data).hexdigest()
        if sha!=v["sha256"] or (expected and sha!=expected):return False
        w,h=int.from_bytes(data[16:20],"big"),int.from_bytes(data[20:24],"big")
        if (w,h)!=(v["width"],v["height"]):return False
        if path.startswith("characters/") and (w,h)!=(96,112):return False
        return True
    except (ValueError, KeyError, TypeError):return False
missing=[];present=[];locked=[]
for n in manifest["items"]:
    path="characters/"+n["id"]+".png"
    if n["state"]=="OWNER_KEEP_STATIC":
        if not valid(path,n["locked_static_sha256"]):raise SystemExit("LOCKED STATIC CHANGED OR MISSING: "+n["id"])
        locked.append(n["id"])
    elif valid(path):
        present.append(n["id"])
    else:
        missing.append(n["id"])
print(json.dumps({"locked_unchanged":len(locked),"target_static_present":len(present),"target_static_missing":len(missing),"missing_ids":missing,"visual_approval":"NOT_EVALUATED"},ensure_ascii=False))
if a.require_complete and missing:sys.exit(1)
