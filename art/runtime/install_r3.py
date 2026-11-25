#!/usr/bin/env python3
"""Local-only R3 review installer. Requires disposable clean checkout of pinned gameplay.
Do not commit generated/private assets. Reconcile with latest gameplay before integration.
"""
import hashlib, pathlib, subprocess, zipfile, sys
BASE="a7ecee6ad6a7f58f7bf928a297e8e5373737c950"
F1D="5c21d3bcfd94197b952f162c19a9371e62299d72bf644920abaf8b4a1ba02895"
R3="7950e331ea629a715e3a2396b1cca748540917fed7a558645daff91f43d28110"
SOURCE_HASHES={
  "tested_main.gd": "00160d18b8eef1326fee4ea9d3b0607b53f8533a56b4e061471e6077dd6f96ff",
  "tested_quality_renderer.gd": "2d2d43f17f890fe4a64c43c39b36ccadd087eaee910d1b4a3bde0e9a563067ec",
  "tested_combat.gd": "53eb11403508e0ef06865d9ed0706f560a4d828c1d9fc8a210d4d2646d192136"
}
ADAPTER_SHA="458b17f819c53ed2dd22fc0ac578e6129060e49f8b1be554acc298625895ae17"
def digest(data): return hashlib.sha256(data).hexdigest()
def checked(path,expected):
    if digest(path.read_bytes())!=expected: raise ValueError("Archive hash mismatch: "+str(path))
    z=zipfile.ZipFile(path)
    if z.testzip(): raise ValueError("Corrupt archive")
    return z
def main():
    if len(sys.argv)!=4: raise SystemExit("usage: install_r3.py GAME_CHECKOUT F1D_ZIP R3_ZIP")
    root,first,second=map(lambda s:pathlib.Path(s).resolve(),sys.argv[1:])
    def git(*args):return subprocess.check_output(["git","-C",str(root),*args],text=True).strip()
    if git("rev-parse","HEAD")!=BASE: raise ValueError("Wrong gameplay base; reconcile newer HEAD first")
    if git("status","--porcelain"): raise ValueError("Use a clean disposable checkout")
    art=root/"art_private"
    if art.exists():raise ValueError("Private overlay already present")
    adapter=(pathlib.Path(__file__).parent/"art_review_adapter.gd").read_bytes()
    if digest(adapter)!=ADAPTER_SHA:raise ValueError("R2 adapter hash mismatch")
    writes={}
    with checked(first,F1D) as z:
        for name in z.namelist():
            p=pathlib.PurePosixPath(name)
            if p.is_absolute() or ".." in p.parts:raise ValueError("Unsafe archive path")
            if p.parts[0] in ("characters","vfx","environment") and p.suffix==".png":
                writes[art.joinpath(*p.parts)]=z.read(name)
    with checked(second,R3) as z:
        for name,sha in SOURCE_HASHES.items():
            b=z.read("source/"+name)
            if digest(b)!=sha:raise ValueError("Source hash mismatch")
            writes[root/"game"/name.removeprefix("tested_")]=b
        for name in z.namelist():
            p=pathlib.PurePosixPath(name)
            if p.is_absolute() or ".." in p.parts:raise ValueError("Unsafe archive path")
            if len(p.parts)>2 and p.parts[0]=="assets" and p.parts[1] in ("animation","environment","vfx","portraits") and p.suffix==".png":
                writes[art.joinpath(*p.parts[1:])]=z.read(name)
    writes[root/"game/art_review_adapter.gd"]=adapter
    exclude=pathlib.Path(git("rev-parse","--git-path","info/exclude"))
    if not exclude.is_absolute():exclude=root/exclude
    with exclude.open("a") as f:f.write("\n/art_private/\n")
    for path,data in writes.items():
        path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
    print("ART_R3_LOCAL_OVERLAY",BASE,len(writes),"files; do not push")
if __name__=="__main__":main()
