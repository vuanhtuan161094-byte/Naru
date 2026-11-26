const {chromium}=require("playwright");
const fs=require("fs");
(async()=>{
 const browser=await chromium.launch({headless:true,args:["--enable-unsafe-swiftshader","--use-gl=angle","--use-angle=swiftshader"]});
 try{
  const page=await browser.newPage({viewport:{width:1280,height:720}});
  const errors=[];
  page.on("pageerror",e=>errors.push(String(e)));
  page.on("console",m=>{if(/SCRIPT ERROR|Parse Error|NARU_PUBLIC_ART_FAIL/.test(m.text()))errors.push(m.text());});
  await page.goto("http://127.0.0.1:8765/index.html?qa=1");
  await page.waitForFunction(()=>window.naruPublicArtCount===224&&window.naruReady===true&&window.naruProbe===true,null,{timeout:150000});
  const state=()=>page.evaluate(()=>window.naruUI);
  const click=async(text,id)=>{
   await page.waitForFunction(t=>window.naruUI?.buttons?.some(b=>b.text===t&&!b.disabled),text,{timeout:30000});
   const u=await state(),b=u.buttons.find(b=>b.text===text&&!b.disabled);
   const c=await page.locator("canvas").boundingBox();
   await page.mouse.click(c.x+b.x*c.width/u.width,c.y+b.y*c.height/u.height);
   await page.waitForFunction(id=>window.naruUI?.screen===id,id,{timeout:30000});
  };
  await page.waitForFunction(()=>window.naruUI?.screen==="home"&&window.naruUI.art_count===224);
  fs.mkdirSync("public-qa",{recursive:true});
  await page.screenshot({path:"public-qa/home.png"});
  await click("Cốt truyện","campaign");
  await click("Vào STG-001","battle");
  await page.waitForFunction(()=>window.naruUI?.art_draws>0,null,{timeout:30000});
  await page.screenshot({path:"public-qa/starter-battle.png"});
  const u=await state();if(u.art_count!==224||u.art_draws<=0||errors.length)throw Error(JSON.stringify({art:u.art_count,draws:u.art_draws,errors}));
  console.log("NARU_PUBLIC_WEB_PASS",JSON.stringify({art:u.art_count,draws:u.art_draws,screen:u.screen}));
 }finally{await browser.close()}
})().catch(e=>{console.error(e);process.exit(1)});
