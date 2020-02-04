---
layout: post
title: Visualizing Slopes
date: 2020-02-07
smartdown: true
categories: calculus
comments: false
background: '/img/posts/change.JPG'
---


### The Slope Model

### Visualizing Slopes

### The Number Line in Slopes

Mapping the slope of a line to a value on the real number line.  Mapping a value on the real number line back to the slope of a line.

```javascript /playable/autoplay
//smartdown.import=https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js

smartdown.importCssUrl('https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css');

const myDiv = this.div;
myDiv.style.width = '100%';
myDiv.style.height = '100%';
myDiv.style.margin = 'auto';
myDiv.innerHTML = `<div id='box1' class='jxgbox' style='height:600px;'>`;



let height = 15;
let width = height * (myDiv.offsetWidth / 600);

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

for (let i=1; i < 10; i++) {
  let s1 = board0.create('point', [ 
    Math.sqrt(95 / (i*i + 1)),
    i * Math.sqrt(95 / (i*i + 1)) ], 
    {visible:false});
  let s2 = board0.create('point', [ 
    Math.sqrt(105 / (i*i + 1)),
    i * Math.sqrt(105 / (i*i + 1)) ], 
    {visible:false});
  board0.create('segment', [s1,s2],{strokeColor:'#999999', strokeWidth:1});

  let s3 = board0.create('point', [ 
    -Math.sqrt(95 / (i*i + 1)),
    i * Math.sqrt(95 / (i*i + 1)) ], 
    {visible:false});
  let s4 = board0.create('point', [ 
    -Math.sqrt(105 / (i*i + 1)),
    i * Math.sqrt(105 / (i*i + 1)) ], 
    {visible:false});
  board0.create('segment', [s3,s4],{strokeColor:'#999999', strokeWidth:1});


  if (i < 6) {
    let sText1 = board0.create('text', [
    Math.sqrt(110.25 / (i*i + 1)),
    i * Math.sqrt(110.25 / (i*i + 1)),
    i ], 
    {fontSize:12, color:'#999999'});

    let sText2 = board0.create('text', [
    - Math.sqrt(120 / (i*i + 1)),
    i * Math.sqrt(120 / (i*i + 1)),
    -i ], 
    {fontSize:12, color:'#999999'});

  }

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
  function() { return p.Y().toString() + ' / ' + p.X().toString(); }], 
  {fontSize:12});


this.sizeChanged = function() {     
  
};

// this.dependOn = [''];
// this.depend = function() {

// };

````
