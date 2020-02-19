---
layout: post
title: Managing Complexity in Mathematical Explanations
date: 2020-01-06
smartdown: true
background: '/img/posts/calculus.jpg'
categories: [ calculus, smartdown ]
comments: true
---


For me, a mathematical explanation has three parts: the high level ideas, a picture of the model, and symbolic reasoning. The high level ideas tell us what we are doing and why we are doing it.  The picture of the model is a description of the actual problem.  It's where the real understanding happens. The symbolic reasoning is where we write statements with mathematical notation and do inference and reasoning with those statements.  This could include algebra or logical proof steps.  

Following the symbolic reasoning often requires significant effort. Even when people successfully follow each step, they often lose track of how these statements are related to the model and the high level ideas. My goal is to present complex problems in a way that doesn't lose track of the mapping between the symbolic notation and the meaning of those statements in relation to the model.  Currently, I write all my explanations using [smartdown](https://smartdown.site/#gallery/Home.md), so I'm trying to find a methodology for my process within the tools supplied by smartdown.  However, it's likely that this exploration will lead to the development of new smartdown tools. Explaining complex topics with challenging notation is not unique to the field of mathematics so lots of folks could benefit from tools for this kind of thing.  We begin with an example problem.  

# --outlinebox ob1
**Problem:**
Find the derivative of the function $f(x) = x^2$ using the definition of the derivative.
# --outlinebox

First we'll look at the three pieces of the explanation separately. 

#### High Level Ideas
1. **Find the Derivative** -- We want to find a function that tells us the slope of the tangent line for the function $f(x)=x^2$.
2. **Derivatives are Slopes** -- The definition of the derivative is a generalized expression for the **slope** of a secant line.  
3. **Use a limit to turn a secant into a tangent** -- To make the definition work, we need to take the limit as the secant line gets very, very tiny and becomes a tangent.

#### Symbolic Reasoning
$$f'(x) = \lim_{h \to 0}\frac{f(x+h) - f(x)}{h}$$
$$f'(x) = \lim_{h \to 0}\frac{(x + h)^2 - x^2}{h}$$
$$f'(x) = \lim_{h \to 0} \frac{x^2 + 2hx + h^2 - x^2}{h}$$
$$f'(x) = \lim_{h \to 0} \frac{2hx + h^2}{h}$$
$$f'(x) = \lim_{h \to 0} 2x + h$$
$$f'(x) = 2x$$

##### Picture of the Model

**h**[](:-hvalue/0/2/0.01) [](:!hvalue)
```javascript /playable/kiosk
//smartdown.import=https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js

smartdown.importCssUrl('https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css');

const myDiv = this.div;
myDiv.style.width = '100%';
myDiv.style.height = '100%';
myDiv.style.margin = 'auto';
myDiv.innerHTML = `<div id='box1' class='jxgbox';'>`;

JXG.Options.axis.ticks.majorHeight = 40;
// create the board
board0 = JXG.JSXGraph.initBoard('box1', {boundingbox:[-5,10,20,-3], showCopyright:false, keepaspectratio:false, axis:false});
board0.resizeContainer(myDiv.offsetWidth, myDiv.offsetHeight);

let xaxis = board0.create('axis', [[0, 0], [1,0]], 
      {name:'x', 
      withLabel: true,
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-20, 20]   // (in pixels)
      }
      });
let yaxis = board0.create('axis', [[0, 0], [0, 1]], 
      {name:'y', 
      withLabel: true, 
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-30, -20]   // (in pixels)
        }
      });   

// parabala and it's derivative
let f = function(x) { return  x*x; };
let df = function(x) { return 2 * x; }
let graph_f = board0.create('functiongraph', [f,-10,10]);
//let graph_df = board0.create('functiongraph', [df,-10,10],{strokeColor: '#11AA66', visible:true});

// point x on axis we want to get derivative value
let x = board0.create('glider', [1,0, xaxis], {name:'x', size:6});
let fx = board0.create('point', [ 
	function() { return x.X(); },
	function() { return f(x.X()); }], {name:'', color:'blue', fixed:true});

// the slider point for the secant
let x_h = board0.create('glider', [x.X() + 1, 0, xaxis], {name:'x + h', size:6, color:'green'} ); 

// sliding point on parabala 
let fx_h = board0.create('point', [
                function() { return x_h.X(); }, 
                function() { return f(x_h.X()); }
          ], {name:'', color: 'blue', fixed: true, size:3});

// secant line
let secant = board0.create('line', [fx, fx_h], {strokeColor:'#FF5522'});
let secantSlope = function() { 
	if (x.X() == x_h.X()) { return "UNDEFINED: divide by zero"; }
	return ((f(x.X()) - f(x_h.X()))/(x.X() - x_h.X())).toFixed(3).toString(); 
}

// print the slope of the secant line
let slopeText = board0.create('text',[-4,-2,
	function(){ return 'Slope of Secant Line = '+ secantSlope(); }], {fontSize:20});

let hText = board0.create('text',[-4,-1,
	function(){ return 'h = '+ (x_h.X() - x.X()).toFixed(3); }], {fontSize:20});


let p = board0.create('point', [ 
	function() { return x_h.X(); }, 
	function() { return f(x.X());}], {visible:false});

let rise = board0.create('line', [fx_h, p], {color:'black', strokeWidth:1, straightFirst:false, straightLast:false, dash:2});
let run = board0.create('line', [fx, p], {color:'black', strokeWidth:1, straightFirst:false, straightLast:false, dash:2});
let riseText = board0.create('text', [
	function() { if (x_h.X() > x.X()) { return x_h.X() + 0.1; } 
				 return x_h.X() - 1.5; },
	function() { return (f(x_h.X()) - f(x.X()))/2 + f(x.X()); },
	'(x+h)^2 - x^2'], {fontSize:12});

let runText = board0.create('text', [
	function() { return x.X() + (x_h.X() - x.X())/2; },
	function() { return f(x.X()) - 0.3; },
	'h'], {fontSize:12});

smartdown.setVariable('hvalue', (x_h.X() - x.X()).toFixed(3));

board0.on('update', function() {
	smartdown.setVariable('hvalue', (x_h.X() - x.X()).toFixed(3));
});

this.sizeChanged = function() {      
  board0.resizeContainer(myDiv.offsetWidth, myDiv.offsetHeight);
};

this.dependOn = ['hvalue'];
this.depend = function() {
	board0.suspendUpdate();
	console.log(env.hvalue);
	//x_h.moveTo([env.hvalue,0]);
	board0.unsuspendUpdate();
};
 
```
### The Linear Sequential Approach

# --outlinebox ob1
**Problem:**
Find the derivative of the function $f(x) = x^2$ using the definition of the derivative.
# --outlinebox

We want to find a function that tells us the slope of the tangent line for the function $f(x)=x^2$.  
```javascript /autoplay
//smartdown.import=https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js

smartdown.importCssUrl('https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css');

const myDiv = this.div;
myDiv.style.width = '100%';
myDiv.style.height = '100%';
myDiv.style.margin = 'auto';
myDiv.innerHTML = `<div id='box2' class='jxgbox' style='height:500px;'>`;

JXG.Options.axis.ticks.majorHeight = 40;
// create the board
board0 = JXG.JSXGraph.initBoard('box2', {boundingbox:[-5,10,20,-3], showCopyright:false, keepaspectratio:false, axis:false});

let xaxis = board0.create('axis', [[0, 0], [1,0]], 
      {name:'x', 
      withLabel: true,
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-20, 20]   // (in pixels)
      }
      });
let yaxis = board0.create('axis', [[0, 0], [0, 1]], 
      {name:'y', 
      withLabel: true, 
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-30, -20]   // (in pixels)
        }
      });   

// parabala and it's derivative
let f = function(x) { return  x*x; };
let df = function(x) { return 2 * x; }

let x = board0.create('glider', [1,0, xaxis], {name:'x', size:6});
let fx = board0.create('point', [
	function() { return x.X(); }, 
	function() { return f(x.X()); }], {name:''})
let graph_f = board0.create('functiongraph', [f,-10,10], {strokeColor:'#999999'});
// let graph_df = board0.create('functiongraph', [df,-10,10],{strokeColor: '#11AA66', visible:true});
let tangent = board0.create('line', [
	function() { return f(x.X());},
	function() { return - df(x.X());},
	1]);

// print the slope of the secant line
let slopeText = board0.create('text',[
	function() { return x.X() + 0.5; },
	function() { return f(x.X()) + 0.5;},
	function(){ return 'slope = '+ df(x.X()).toFixed(2); }], {fontSize:15});


```
### Derivatives are Slopes
The definition of the derivative is a generalized expression for the **slope** of a secant line.  
# --outlinebox ob2
**Definition**
The derivative of a function $f(x)$ with respect to $x$ is the function
$$f'(x) = \lim_{h \to 0}\frac{f(x+h) - f(x)}{h}$$
# --outlinebox
We'll start with the definition of the derivative, but we need to substitute in the function we're interested in for the $f$.  That means we'll replace $f(x+h)$ with $(x + h)^2$ and $f(x)$ with $x^2$.
$$f'(x) = \lim_{h \to 0}\frac{(x + h)^2 - x^2}{h}$$
Now we're just going to do some algebra.
$$f'(x) = \lim_{h \to 0} \frac{x^2 + 2hx + h^2 - x^2}{h}$$
$$f'(x) = \lim_{h \to 0} \frac{2hx + h^2}{h}$$
$$f'(x) = \lim_{h \to 0} 2x + h$$
The expression $2x + h$ represents the [[](:!secantSlope)](::pulldown1/tooltip).
### Use a Limit to Turn a Secant into a Tangent
To make the definition work, we need to take the limit as the secant line gets very, very tiny and becomes a tangent.
$$f'(x) = \lim_{h \to 0} 2x + h$$
$$f'(x) = 2x$$





Add a popup that talks about limits and dividing by zero that shows up when h = 0.


# :::: pulldown1
[](:Xa1) price of tea in China
[](:Xa2) 10 meters
[](:Xa3) slope of the secant line
# ::::

```javascript/autoplay
smartdown.setVariable('a1', false);
smartdown.setVariable('a2', false);
smartdown.setVariable('a3', false);
smartdown.setVariable('secantSlope', '________');

this.dependOn = ['a1', 'a2', 'a3'];

this.depend = function() {
  if (env.a1 == false && env.a2 == false && env.a3 == true) {
      smartdown.setVariable('secantSlope', 'slope of the secant line');
      smartdown.showDisclosure('correct','','bottomright,transparent,shadow'); 
      setTimeout(function () {
           smartdown.hideDisclosure('correct','','bottomright'); 
      }, 3000);
    } 
  };
```

# :::: correct
# --colorbox right
correct! :grinning:
# --colorbox
# ::::
