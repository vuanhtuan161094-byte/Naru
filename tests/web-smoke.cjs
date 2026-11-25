const { chromium } = require('playwright');
const fs=require('fs');
(async()=>{
 const browser=await chromium.launch({headless:true,args:['--enable-unsafe-swiftshader','--use-gl=angle','--use-angle=swiftshader']});
 const page=await browser.newPage({viewport:{width:1280,height:720}});
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
  await clickPrefix('4 • Ô trống');
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
  await click('Tạm dừng','battle');
  if(!(await state()).paused)throw Error('pause state');
  await click('4x','battle');
  if((await state()).speed!==4)throw Error('speed state');
  await click('Tiếp tục','battle');
  await waitScreen('results');
  await click('Về làng','home');
  await page.screenshot({path:'web-menu.png'});
  if(seen.size!==17)throw Error('expected 17 screen IDs; got '+[...seen].join(','));
  await page.setViewportSize({width:960,height:540});
  await page.waitForTimeout(700);
  await click('Ninja','ninja_roster');
  await page.screenshot({path:'ui-shots/landscape-960.png'});
  if(errors.length)throw new Error(errors.join('\n'));
  console.log('NARU_WEB_PROBE_PASS');
  console.log('NARU_UI_17_PASS '+[...seen].join(','));
 }finally{await browser.close();}
})().catch(e=>{console.error(e);process.exit(1)});
