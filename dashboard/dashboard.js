const monthly = [
  {m:"Jan",r:0},{m:"Feb",r:0},{m:"Mar",r:0},{m:"Apr",r:0},
  {m:"May",r:0},{m:"Jun",r:0},{m:"Jul",r:0},{m:"Aug",r:0},
  {m:"Sep",r:0},{m:"Oct",r:0},{m:"Nov",r:0},{m:"Dec",r:0}
];
// Dataset mirrors the SQL seed and query logic: completed orders only.
const orders = [
 ["2025-01",1001,"Direct",650.0,335],["2025-01",1002,"Online",486,225],
 ["2025-02",1003,"Online",200,80],["2025-02",1004,"Partner",1012.8,555],
 ["2025-03",1005,"Direct",247,110],["2025-04",1007,"Partner",808,405],
 ["2025-04",1008,"Online",360,150],["2025-05",1009,"Direct",558,250],
 ["2025-05",1010,"Online",180,75],["2025-06",1011,"Partner",696,330],
 ["2025-07",1013,"Online",351,165],["2025-08",1014,"Partner",320,140],
 ["2025-09",1015,"Online",342,150],["2025-10",1016,"Direct",240,120],
 ["2025-11",1017,"Online",200,120],["2025-12",1018,"Partner",469,240]
];
const products = [
 {name:"Analytics Suite",category:"Software",units:13,revenue:2760,profit:1200},
 {name:"Workflow Pro",category:"Software",units:8,revenue:1548,profit:948},
 {name:"Data Connector",category:"Integration",units:10,revenue:1241,profit:691},
 {name:"Support Package",category:"Services",units:4,revenue:400,profit:240},
 {name:"Training Workshop",category:"Services",units:5,revenue:800,profit:350}
];
const money = n => new Intl.NumberFormat("en-US",{style:"currency",currency:"USD",maximumFractionDigits:0}).format(n);
const period = document.querySelector("#period");
function render(){
 const p=period.value, filtered=orders.filter(o=>p==="all"||(p==="h1"?Number(o[0].slice(5))<=6:Number(o[0].slice(5))>=7));
 const revenue=filtered.reduce((s,o)=>s+o[3],0), profit=filtered.reduce((s,o)=>s+o[4],0), count=filtered.length;
 document.querySelector("#revenue").textContent=money(revenue);
 document.querySelector("#profit").textContent=money(profit);
 document.querySelector("#orders").textContent=count;
 document.querySelector("#aov").textContent=money(count?revenue/count:0);
 document.querySelector("#revenueNote").textContent=p==="all"?"Completed orders":"Selected period · completed orders";
 const byMonth=monthly.map((x,i)=>({...x,r:filtered.filter(o=>Number(o[0].slice(5))===i+1).reduce((s,o)=>s+o[3],0)}));
 const max=Math.max(...byMonth.map(x=>x.r),1);
 document.querySelector("#chart").innerHTML=byMonth.map(x=>`<div class="bar-item"><div class="bar" style="height:${Math.max(2,x.r/max*100)}%" title="${money(x.r)}"></div><small>${x.m}</small></div>`).join("");
 const channels=["Online","Direct","Partner"].map(c=>({name:c,value:filtered.filter(o=>o[2]===c).reduce((s,o)=>s+o[3],0)}));
 const total=channels.reduce((s,c)=>s+c.value,0)||1;
 document.querySelector("#channels").innerHTML=channels.map(c=>`<div class="channel-row"><span>${c.name}</span><div class="track"><div class="fill" style="width:${c.value/Math.max(...channels.map(x=>x.value),1)*100}%"></div></div><strong>${money(c.value)}</strong></div>`).join("");
 document.querySelector("#products").innerHTML=products.map(x=>`<tr><td>${x.name}</td><td>${x.category}</td><td>${x.units}</td><td>${money(x.revenue)}</td><td>${money(x.profit)}</td></tr>`).join("");
}
period.addEventListener("change",render);render();
