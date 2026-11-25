#!/usr/bin/env python3
"""Build a private review JSON for existing V4 importer. Never modifies game source."""
import argparse, base64, hashlib, io, json, pathlib, struct, zipfile
ROOTS={"characters","portraits","environment","animation","vfx"}
def sha(b):return hashlib.sha256(b).hexdigest()
def build(archives):
    assets={}
    for archive in archives:
        with zipfile.ZipFile(archive) as z:
            if z.testzip():raise ValueError("Corrupt ZIP: "+str(archive))
            for name in z.namelist():
                p=pathlib.PurePosixPath(name)
                if p.is_absolute() or ".." in p.parts:raise ValueError("Unsafe path")
                if p.parts and p.parts[0]=="assets":p=pathlib.PurePosixPath(*p.parts[1:])
                if not p.parts or p.parts[0] not in ROOTS or p.suffix!=".png":continue
                b=z.read(name)
                if b[:16]!=b"\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR":raise ValueError("Invalid PNG header: "+name)
                w,h=struct.unpack(">II",b[16:24])
                if not (1<=w<=4096 and 1<=h<=2048):raise ValueError("Dimensions: "+name)
                if p.parts[0]=="characters" and (w,h)!=(96,112):raise ValueError("Character dimensions: "+name)
                assets[str(p)]={"width":w,"height":h,"sha256":sha(b),"png":base64.b64encode(b).decode("ascii")}
    if not 1<=len(assets)<=240:raise ValueError("Asset count")
    if sum(a["width"]*a["height"] for a in assets.values())>18000000:raise ValueError("Pixel budget")
    raw=json.dumps({"schema":1,"status":"REVIEW_ONLY","assets":assets},ensure_ascii=True,separators=(",",":"),sort_keys=True).encode()
    if len(raw)>12000000:raise ValueError("Pack byte budget")
    return raw
def main():
    p=argparse.ArgumentParser()
    p.add_argument("output",type=pathlib.Path)
    p.add_argument("archives",nargs="+",type=pathlib.Path)
    a=p.parse_args()
    raw=build(a.archives)
    with a.output.open("xb") as f:f.write(raw)
    print("V4_REVIEW_PACK",len(json.loads(raw)["assets"]),len(raw),sha(raw))
if __name__=="__main__":main()
