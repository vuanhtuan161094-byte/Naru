const { chromium } = require('playwright');
(async()=>{
 const browser=await chromium.launch({headless:true,args:['--enable-unsafe-swiftshader','--use-gl=angle','--use-angle=swiftshader']});
 const page=await browser.newPage({viewport:{width:1280,height:720}});
 const errors=[];
 page.on('pageerror', e=>errors.push(String(e)));
 page.on('console', msg=>{if(msg.type()==='error') console.log('BROWSER',msg.text());});
 try{
  await page.goto('http://127.0.0.1:8765/index.html?qa=1');
  await page.waitForFunction(()=>window.naruReady===true,{},{timeout:120000});
  await page.waitForFunction(()=>typeof window.naruProbe==='boolean',{},{timeout:120000});
  if(!(await page.evaluate(()=>window.naruProbe)))throw new Error('browser gameplay probe failed');
  await page.screenshot({path:'web-menu.png'});
  if(errors.length)throw new Error(errors.join('\n'));
  console.log('NARU_WEB_PROBE_PASS');
 }finally{await browser.close();}
})().catch(e=>{console.error(e);process.exit(1)});
