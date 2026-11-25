const { chromium } = require('playwright');
const fs=require('fs');
const crypto=require('crypto');
(async()=>{
 const browser=await chromium.launch({headless:true,args:['--enable-unsafe-swiftshader','--use-gl=angle','--use-angle=swiftshader']});
 const page=await browser.newPage({viewport:{width:1280,height:720},hasTouch:true});
 const errors=[];
 page.on('pageerror', e=>errors.push(String(e)));
 page.on('console', msg=>{if(msg.type()==='error'){const s=msg.text();console.log('BROWSER',s);if(/SCRIPT ERROR|Parse Error/.test(s))errors.push(s)}});
 const seen=new Set();
 async function state(){return page.evaluate(()=>window.naruUI)}
 async function waitScreen(id){await page.waitForFunction(id=>window.naruUI?.screen===id,id,{timeout:30000});await page.waitForTimeout(350);seen.add(id);fs.mkdirSync('ui-shots',{recursive:true});await page.screenshot({path:'ui-shots/'+id+'.png'});}
 async function click(text,id){await page.waitForFunction(text=>window.naruUI?.buttons?.some(b=>!b.disabled&&b.text===text),text,{timeout:15000});const ui=await state();const b=ui.buttons.find(b=>!b.disabled&&b.text===text);const canvas=await page.locator('canvas').first().boundingBox();await page.mouse.click(canvas.x+b.x*canvas.width/ui.width,canvas.y+b.y*canvas.height/ui.height);await page.waitForTimeout(400);if(id)await waitScreen(id)}
 async function clickPrefix(prefix,id){const ui=await state();const b=ui.buttons.find(b=>!b.disabled&&b.text.startsWith(prefix));if(!b)throw Error('missing '+prefix+' on '+ui.screen+' '+JSON.stringify(ui.buttons.map(x=>x.text)));await click(b.text,id)}
 try{
  await page.goto('http://127.0.0.1:8765/index.html?qa=1');
  await page.waitForFunction(()=>window.naruReady===true,{},{timeout:120000});
  await page.waitForFunction(()=>window.naruProbe===true,{},{timeout:120000});
  await waitScreen('home');
  await click('Phân công khởi đầu','home');
  await clickPrefix('Tổng bộ','building');
  await click('Xây/nâng cấp: 100 Ryo, 10 gỗ, 5 đá','building');
  await click('Làng','home');
  await click('Chế tạo','craft');
  await click('Kho','inventory');
  await click('Ninja','ninja_roster');
  await clickPrefix('Naruto Uzumaki','ninja_detail');
  await click('Nhẫn thuật','skill_tree');
  await click('Ninja','ninja_roster');
  await clickPrefix('Naruto Uzumaki','ninja_detail');
  await click('Tu luyện EXP','ninja_detail');
  await click('Dùng 1','ninja_detail');
  await click('Chiêu mộ','recruit');
  const draws=(await state()).draws;
  await click('Chiêu mộ 1 • 100 ngọc','recruit');
  if((await state()).draws!==draws+1)throw Error('draw did not commit');
  await click('Bố trận','formation');
  if(!(await state()).buttons.some(b=>b.text.startsWith('9 • ')))throw Error('missing ninth slot');
  await clickPrefix('Nâng trận pháp','formation');
  if((await state()).formation_levels['FRM-01']!==2)throw Error('upgrade not committed');
  await clickPrefix('9 • Ô trống');
  const newNinja=(await state()).buttons.find(b=>!b.disabled&&b.text.includes(' | Cấp ')&&!b.text.includes('Đang trong đội'));
  if(newNinja)await click(newNinja.text,'formation');
  await click('Nhẫn giới','world');
  await click('Ngoại giao','diplomacy');
  await click('Vĩ Thú','beasts');
  await click('Nhiệm vụ','quest');
  await click('Cài đặt','settings');
  await click('Lưu game','settings');
  await click('Cốt truyện','campaign');
  await click('Vào STG-001','battle');
  if((await state()).arena_width!==14||(await state()).arena_height!==10)throw Error('wrong standard arena');
  await click('Tạm dừng','battle');
  if(!(await state()).paused)throw Error('pause state');
  await click('4x','battle');
  if((await state()).speed!==4)throw Error('speed state');
  await click('Tiếp tục','battle');
  await waitScreen('results');
  if((await state()).cleared<1)throw Error('starter real UI battle did not win');
  await click('Về làng','home');
  await page.screenshot({path:'web-menu.png'});
  if(seen.size!==17)throw Error('expected 17 screen IDs; got '+[...seen].join(','));
  await page.setViewportSize({width:960,height:540});
  await page.waitForTimeout(700);
  await click('Ninja','ninja_roster');
  await page.screenshot({path:'ui-shots/landscape-960.png'});
  const touchUI=await state();const touchButton=touchUI.buttons.find(b=>b.text==='Kho'&&!b.disabled);const touchCanvas=await page.locator('canvas').first().boundingBox();await page.touchscreen.tap(touchCanvas.x+touchButton.x*touchCanvas.width/touchUI.width,touchCanvas.y+touchButton.y*touchCanvas.height/touchUI.height);await waitScreen('inventory');
  console.log('NARU_UI_TOUCH_PASS');
  await page.setViewportSize({width:1280,height:720});
  await page.waitForTimeout(700);
  await click('Cài đặt','settings');
  // Test only generic CI texture, never upload private candidate images to GitHub.
  const b64=await page.evaluate(()=>{const c=document.createElement('canvas');c.width=96;c.height=112;const g=c.getContext('2d');g.fillStyle='#466c86';g.fillRect(16,12,64,92);g.fillStyle='#d8bf8c';g.fillRect(30,20,36,34);return c.toDataURL('image/png').split(',')[1]});
  const png=Buffer.from(b64,'base64');
  const pack={schema:1,status:'REVIEW_ONLY',assets:{'characters/NIN-041.png':{width:96,height:112,sha256:crypto.createHash('sha256').update(png).digest('hex'),png:b64}}};
  await click('Nạp gói mỹ thuật riêng','settings');
  await page.locator('#naru-review-file').setInputFiles({name:'ci-review.json',mimeType:'application/json',buffer:Buffer.from(JSON.stringify(pack))});
  await page.waitForFunction(()=>window.naruUI?.art_count===1,{},{timeout:15000});
  await click('Trận thử mỹ thuật 6v6','battle');
  await page.waitForFunction(()=>window.naruUI?.review===true&&window.naruUI?.art_draws>0,{},{timeout:15000});
  await page.screenshot({path:'ui-shots/review-generic-ci.png'});
  await click('Rút lui','settings');
  console.log('NARU_ART_IMPORT_WEB_PASS');
  if(errors.length)throw new Error(errors.join('\n'));
  console.log('NARU_WEB_PROBE_PASS');
  console.log('NARU_UI_17_PASS '+[...seen].join(','));
 }finally{await browser.close();}
})().catch(e=>{console.error(e);process.exit(1)});
