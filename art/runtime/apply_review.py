#!/usr/bin/env python3
"""Opt-in local overlay for existing exact-SHA Godot checkout. No Git writes or publication."""
import argparse, hashlib, json, pathlib, subprocess, zipfile, shutil, struct, zlib
HERE=pathlib.Path(__file__).resolve().parent
BASE="a7ecee6ad6a7f58f7bf928a297e8e5373737c950"
PACK="5c21d3bcfd94197b952f162c19a9371e62299d72bf644920abaf8b4a1ba02895"
IDS=["NIN-041","NIN-042","NIN-043","NIN-004","NIN-060","NIN-093"]
def once(s,old,new):
    if s.count(old)!=1: raise ValueError("Expected unique source marker: "+old[:90])
    return s.replace(old,new,1)
def png(path,w,h,fn):
    def chunk(tag,data):
        return struct.pack(">I",len(data))+tag+data+struct.pack(">I",zlib.crc32(tag+data)&0xffffffff)
    raw=b"".join(b"\0"+bytes(c for x in range(w) for c in fn(x,y)) for y in range(h))
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_bytes(b"\x89PNG\r\n\x1a\n"+chunk(b"IHDR",struct.pack(">2I5B",w,h,8,6,0,0,0))+chunk(b"IDAT",zlib.compress(raw))+chunk(b"IEND",b""))
def fixture(root):
    # Generic geometric DEV textures only. No character likeness or protected fan art.
    for i,n in enumerate(IDS):
        def actor(x,y):
            a=(x-48)**2+(y-40)**2<16**2
            b=30<x<66 and 58<y<88
            c=(32<x<44 or 52<x<64) and 88<=y<104
            return (95+i*21,155,205-i*16,255) if a or b or c else (0,0,0,0)
        png(root/"characters"/(n+".png"),96,112,actor)
        for slot in range(8):
            for phase in ("charge","travel","impact","residual"):
                def fx(x,y):
                    frame=x//128; u=x%128-64;v=y-64;r=8+frame*5
                    return (80,220,255,220) if abs(u*u+v*v-r*r)<r*4 else (0,0,0,0)
                png(root/"vfx"/f"VFX-{n}-S{slot}"/(phase+".png"),768,128,fx)
    for i in range(4):
        png(root/"environment"/f"grass_{i}.png",64,32,lambda x,y:(52+i*6,92+i*4,72,255) if abs(x-31.5)/32+abs(y-15.5)/16<=1 else (0,0,0,0))
def private_pack(root,archive):
    if hashlib.sha256(archive.read_bytes()).hexdigest()!=PACK: raise ValueError("Archive SHA mismatch")
    with zipfile.ZipFile(archive) as z:
        if z.testzip(): raise ValueError("Bad ZIP")
        for name in z.namelist():
            p=pathlib.PurePosixPath(name)
            if p.is_absolute() or ".." in p.parts: raise ValueError("Unsafe path")
            if p.parts[0] in ("characters","vfx","environment") and p.suffix==".png":
                dst=root.joinpath(*p.parts);dst.parent.mkdir(parents=True,exist_ok=True);dst.write_bytes(z.read(name))
def main():
    p=argparse.ArgumentParser()
    p.add_argument("checkout",type=pathlib.Path)
    a=p.add_mutually_exclusive_group(required=True)
    a.add_argument("--private-zip",type=pathlib.Path)
    a.add_argument("--dev-fixture",action="store_true")
    args=p.parse_args(); root=args.checkout.resolve()
    def git(*s):return subprocess.check_output(["git","-C",str(root),*s],text=True).strip()
    if git("rev-parse","HEAD")!=BASE: raise ValueError("Wrong gameplay HEAD, reconcile before patching")
    if git("status","--porcelain","--","game/main.gd","game/combat.gd"): raise ValueError("Modified source")
    art=root/"art_private"
    if art.exists() or (root/"game/art_review_adapter.gd").exists(): raise ValueError("Overlay already exists")
    m=root/"game/main.gd";c=root/"game/combat.gd"
    ms=m.read_text();cs=c.read_text()
    ms=once(ms,"var web_qa=false","var web_qa=false\nconst ArtReview=preload(\"res://game/art_review_adapter.gd\")\nvar art_review=ArtReview.new()\nvar art_fixture=false\nvar art_elapsed=0.0\nvar art_initial_count=0\nvar art_moved=false\nvar art_initial_pos: Dictionary={}")
    ms=once(ms,"\tstore.load_or_new(reg)\n\tif \"--smoke\"","\tif \"--art-review-smoke\" in OS.get_cmdline_user_args():\n\t\t_art_review_boot()\n\t\treturn\n\tstore.load_or_new(reg)\n\tif \"--smoke\"")
    ms=once(ms,"\tfield=Control.new()","\tfield=Control.new()\n\tfield.texture_filter=CanvasItem.TEXTURE_FILTER_NEAREST")
    ms=once(ms,'\t\t\tfield.draw_colored_polygon(points,Color("#405b50") if (x+y)%2==0 else Color("#354e45"))','\t\t\tif not art_review.tile(field,p,x,y):\n\t\t\t\tfield.draw_colored_polygon(points,Color("#405b50") if (x+y)%2==0 else Color("#354e45"))')
    ms=once(ms,'\t\tfield.draw_rect(Rect2(p-Vector2(9,30),Vector2(18,26)),c)\n\t\tfield.draw_circle(p-Vector2(0,34),9,Color("#e4bc91"))','\t\tif not art_review.actor(field,a,p):\n\t\t\tfield.draw_rect(Rect2(p-Vector2(9,30),Vector2(18,26)),c)\n\t\t\tfield.draw_circle(p-Vector2(0,34),9,Color("#e4bc91"))')
    ms=once(ms,'\t\tfield.draw_string(ThemeDB.fallback_font,p+Vector2(-16,12),str(a.id).right(3),HORIZONTAL_ALIGNMENT_LEFT,-1,14)','\t\tfield.draw_string(ThemeDB.fallback_font,p+Vector2(-16,12),str(a.id).right(3),HORIZONTAL_ALIGNMENT_LEFT,-1,14)\n\tart_review.effects(field,sim,iso)')
    ms=once(ms,"func _process(delta: float) -> void:\n","func _process(delta: float) -> void:\n\tif art_fixture:\n\t\t_art_review_tick(delta)\n\t\treturn\n")
    # Clamp label minimum width, center projected 12x8 field, keep art HP above head.
    ms=once(ms,'\tlog_label=label(root,"",16)','\tlog_label=label(root,"",16)\n\tlog_label.clip_text=true')
    ms=once(ms,'return Vector2(field.size.x*0.45+(p.x-p.y)*38,45+(p.x+p.y)*20)','return Vector2(field.size.x*0.5-76+(p.x-p.y)*38,maxf(88.0,(field.size.y-400.0)*0.5)+(p.x+p.y)*20)')
    ms=once(ms,'\tif sim==null:return\n\tfor x in range(12):','\tif sim==null:return\n\tart_review.background(field,sim.environment=="forest")\n\tfor x in range(12):')
    ms=once(ms,'\t\tif not art_review.actor(field,a,p):','\t\tvar has_sprite: bool=art_review.actor(field,a,p)\n\t\tif not has_sprite:')
    ms=once(ms,'\t\tfield.draw_rect(Rect2(p-Vector2(20,52),Vector2(40,4)),Color("#222733"))\n\t\tfield.draw_rect(Rect2(p-Vector2(20,52),Vector2(40*float(a.hp)/float(a.max_hp),4)),Color("#80c484"))','\t\tvar hp_y: float=88.0 if has_sprite else 52.0\n\t\tfield.draw_rect(Rect2(p-Vector2(20,hp_y),Vector2(40,4)),Color("#222733"))\n\t\tfield.draw_rect(Rect2(p-Vector2(20,hp_y),Vector2(40*clampf(float(a.hp)/float(a.max_hp),0,1),4)),Color("#80c484") if a.side==0 else Color("#db7068"))')
    ms += (HERE/"fixture.gdinc").read_text()
    cs=once(cs,"var deadlock=false","var deadlock=false\nvar art_events: Array[Dictionary]=[]")
    cs=once(cs,"\tvar field_factor=spatial_reaction(a,s,b)","\tart_events.append({\"tick\":ticks,\"skill_id\":str(s.skill_id),\"target_pos\":b.pos})\n\tif art_events.size()>128: art_events.pop_front()\n\tvar field_factor=spatial_reaction(a,s,b)")
    # All source markers checked before writing. Private textures excluded from git.
    if args.dev_fixture: fixture(art)
    else: private_pack(art,args.private_zip)
    exclude=pathlib.Path(git("rev-parse","--git-path","info/exclude"))
    if not exclude.is_absolute(): exclude=root/exclude
    with exclude.open("a") as f:f.write("\n/art_private/\n")
    shutil.copyfile(HERE/"art_review_adapter.gd",root/"game/art_review_adapter.gd")
    m.write_text(ms);c.write_text(cs)
    print("ART_OVERLAY_PREPARED",BASE,"DEV_FIXTURE" if args.dev_fixture else "PRIVATE_REVIEW")
if __name__=="__main__":main()
