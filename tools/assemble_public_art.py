import base64, hashlib, json, pathlib
root=pathlib.Path("assets/public")
parts=sorted(root.glob("naru-art.part.*"))
assert len(parts)==15, len(parts)
data=b"".join(p.read_bytes() for p in parts)
assert len(data)==12662164
assert hashlib.sha256(data).hexdigest()=="a0d34b650e4569ac22fe643d242e75296f5e79ecf29a45c259b8c2c0577a657e"
pack=json.loads(data)
assert pack["schema"]==1 and pack["status"]=="REVIEW_ONLY"
assert len(pack["assets"])==224
for name, a in pack["assets"].items():
    b=base64.b64decode(a["png"],validate=True)
    assert hashlib.sha256(b).hexdigest()==a["sha256"], name
    assert b.startswith(b"\x89PNG\r\n\x1a\n"),name
    assert int.from_bytes(b[16:20],"big")==a["width"] and int.from_bytes(b[20:24],"big")==a["height"],name
(root/"naru-art.json").write_bytes(data)
print("NARU_PUBLIC_PACK_PASS 224 textures, exact source SHA256")
