---
layout: post
title: Visualizing Slopes
date: 2020-02-07
smartdown: true
categories: calculus
comments: false
background: '/img/posts/change.JPG'
---

Everyone is familiar with the **Area Model** for multiplication, but we don't really study the geometric inverse of this model, the **Slope Model** for division.  It doesn't help you understand the division algorithm, but it's crucial for understanding derivatives in calculus and how they relate to integrals.  

### The Area Model and the Slope Model

The area model is an intuitive geometric model for understanding multiplication.  It's used in classrooms around the world.  Given two quantities $A$ and $B$, we place these quantities at $90^\circ$ to each other. [show A and B](:=showAB=true)  The product of $A$ and $B$ is the area of the rectangle with sides of length $A$ and $B$. [show rectangle](:=showRect=true)

```javascript /playable/autoplay
//smartdown.import=https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js

smartdown.importCssUrl('https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css');

const myDiv = this.div;
myDiv.style.width = '100%';
myDiv.style.height = '100%';
myDiv.style.margin = 'auto';
myDiv.innerHTML = `<div id='box1' class='jxgbox' style='height:400px;'>`;



let height = 15;
let width = height * (myDiv.offsetWidth / 400);

//JXG.Options.axis.ticks.majorHeight = 40;
JXG.Options.layer['line'] = 5;
// create the board
board0 = JXG.JSXGraph.initBoard('box1', {boundingbox:[-width,height,width,-height], keepaspectratio:true, axis:false, showCopyright:false});

let xaxis = board0.create('axis', [[0, 0], [1,0]], 
      {name:'', 
      withLabel: true,
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-80, 20]   // (in pixels)
      }
      });
let yaxis = board0.create('axis', [[0, 0], [0, 1]], 
      {name:'', 
      withLabel: true, 
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-120, -20]   // (in pixels)
        }
      });   



let x1 = board0.create('point', [0, 0], {name: '', color:'blue', fixed: true, size:3});


let p = board0.create('point', [4,4], {name:'', color:'red', size:6, visible:true, showInfoBox:false});

// snap p to grid
board0.on('update', function() {
  let snapX = Math.floor(p.X());
  let snapY = Math.floor(p.Y());
  let delta = 0.5;

  if ((p.X() - snapX) > delta) { snapX += 1 }
  if ((p.Y() - snapY) > delta) { snapY += 1 }
  p.moveTo([snapX,snapY]);

});

let x2 = board0.create('point', [
  function() { return p.X(); },
  0 ], 
  {name:'', color:'blue', fixed:true, size:3 });

let rise = board0.create('segment', [p, x2], {strokeColor:'blue', dash:2, strokeWidth:3 });
let run = board0.create('segment', [x1, x2], {strokeColor:'blue', dash:2, strokeWidth:3 });
let p2 = board0.create('point', [
  function() { return x1.X(); },
  function() { return p.Y(); }], 
  {visible:false});
var rect = board0.create('polygon',[x1,p2,p,x2],{fillColor:'#7700FF',visible:true});

// let slope = function() { return p.Y()/p.X(); }
// let slopeText = board0.create('text', [
//   function() {  return p.X() + p.X() / Math.sqrt(p.X() * p.X() + p.Y() * p.Y()); },
//   function() {  return p.Y() + p.Y() / Math.sqrt(p.X() * p.X() + p.Y() * p.Y()); },
//   function() { 
//     if (p.X() == 0) { return 'Inf'; }
//     return p.Y().toString() + ' / ' + p.X().toString(); }], 
//   {fontSize:16});


this.sizeChanged = function() {     
  
};

// this.dependOn = [''];
// this.depend = function() {

// };

````


Now, instead of multiplying $A$ times $B$, let's divide $A$ by $B$?  

Slopes give us a way of geometrically modeling division, but it's not very intuitive visually.  If we take the set of real numbers

![](/smartblog/img/posts/slope2.pdf)

awe can map them onto a unit semi circle by placing each real number $m$ where on the unit circle where the graph $y = mx$ would intersect the circle.  

![](/smartblog/img/posts/slope.pdf)

It's a weird picture. Positive values between $0$ and $1$ take up the first $45^\circ$ of our circle.  The range $\[1 \ldots 10 \]$ use approximately the next $39^\circ$ and the range $\[10 \ldots + \infty \]$ is squished into the next $6$ degrees or so.  Negative slopes are a mirrored across the $y$ axis.





```javascript /playable/autoplay
//smartdown.import=https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js

smartdown.importCssUrl('https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css');

const myDiv = this.div;
myDiv.style.width = '100%';
myDiv.style.height = '100%';
myDiv.style.margin = 'auto';
myDiv.innerHTML = `<div id='box2' class='jxgbox' style='height:600px;'>`;



let height = 15;
let width = height * (myDiv.offsetWidth / 600);

//JXG.Options.axis.ticks.majorHeight = 40;
JXG.Options.layer['line'] = 5;
// create the board
let board0 = JXG.JSXGraph.initBoard('box2', {boundingbox:[-width,height,width,-height], keepaspectratio:true, axis:false, showCopyright:false});

let xaxis = board0.create('axis', [[0, 0], [1,0]], 
      {name:'', 
      withLabel: true,
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-80, 20]   // (in pixels)
      }
      });
let yaxis = board0.create('axis', [[0, 0], [0, 1]], 
      {name:'', 
      withLabel: true, 
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-120, -20]   // (in pixels)
        }
      });   



let x1 = board0.create('point', [0, 0], {name: '', color:'blue', fixed: true, size:3});

for (let i=1; i < 11; i += 9) {
  let s1 = board0.create('point', [ 
    Math.sqrt(95 / (i*i + 1)),
    i * Math.sqrt(95 / (i*i + 1)) ], 
    {visible:false});
  let s2 = board0.create('point', [ 
    Math.sqrt(105 / (i*i + 1)),
    i * Math.sqrt(105 / (i*i + 1)) ], 
    {visible:false});
  board0.create('line', [s1,s2],{strokeColor:'#BBBBBB', strokeWidth:1});

  let s3 = board0.create('point', [ 
    -Math.sqrt(95 / (i*i + 1)),
    i * Math.sqrt(95 / (i*i + 1)) ], 
    {visible:false});
  let s4 = board0.create('point', [ 
    -Math.sqrt(105 / (i*i + 1)),
    i * Math.sqrt(105 / (i*i + 1)) ], 
    {visible:false});
  board0.create('line', [s3,s4],{strokeColor:'#BBBBBB', strokeWidth:1});

  let sText1 = board0.create('text', [
  Math.sqrt(110.25 / (i*i + 1)),
  i * Math.sqrt(110.25 / (i*i + 1)),
  i ], 
  {fontSize:12, color:'black'});

  let sText2 = board0.create('text', [
  - Math.sqrt(110.25 / (i*i + 1)) - 1,
  i * Math.sqrt(110.25 / (i*i + 1)),
  -i ], 
  {fontSize:12, color:'black'});

}

let slope_circle = board0.create('circle', [x1, [10,0]], { strokeColor:'#999999', strokeWidth:2 });


let p = board0.create('point', [4,4], {name:'', color:'red', size:6, visible:true, showInfoBox:false});

// snap p to grid
board0.on('update', function() {
  let snapX = Math.floor(p.X());
  let snapY = Math.floor(p.Y());
  let delta = 0.5;

  if ((p.X() - snapX) > delta) { snapX += 1 }
  if ((p.Y() - snapY) > delta) { snapY += 1 }
  p.moveTo([snapX,snapY]);

});

let segment = board0.create('segment', [x1, p], {strokeColor:'blue', strokeWidth:3 });
let x2 = board0.create('point', [
  function() { return p.X(); },
  0 ], 
  {name:'', color:'blue', fixed:true, size:3 });

let rise = board0.create('segment', [p, x2], {strokeColor:'blue', dash:2, strokeWidth:3 });
let run = board0.create('segment', [x1, x2], {strokeColor:'blue', dash:2, strokeWidth:3 });
// let circle = board0.create('circle', [x1, p], { strokeColor:'black', strokeWidth:2 });

let slope = function() { return p.Y()/p.X(); }
let slopeText = board0.create('text', [
  function() {  return p.X() + p.X() / Math.sqrt(p.X() * p.X() + p.Y() * p.Y()); },
  function() {  return p.Y() + p.Y() / Math.sqrt(p.X() * p.X() + p.Y() * p.Y()); },
  function() { 
    if (p.X() == 0) { return 'Inf'; }
    return p.Y().toString() + ' / ' + p.X().toString(); }], 
  {fontSize:16});


this.sizeChanged = function() {     
  
};

// this.dependOn = [''];
// this.depend = function() {

// };

````
