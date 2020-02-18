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
1. **Find the Derivative** -- We want to find a function that tells us the derivative of the function $f(x)=x^2$.
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
```javascript /autoplay
//smartdown.import=https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraphcore.js

smartdown.importCssUrl('https://cdnjs.cloudflare.com/ajax/libs/jsxgraph/0.99.7/jsxgraph.css');

const myDiv = this.div;
myDiv.style.width = '100%';
myDiv.style.height = '100%';
myDiv.style.margin = 'auto';
myDiv.innerHTML = `<div id='box1' class='jxgbox' style='height:500px;'>`;

JXG.Options.axis.ticks.majorHeight = 40;
// create the board
board0 = JXG.JSXGraph.initBoard('box1', {boundingbox:[-5,10,20,-3], showCopyright:false, keepaspectratio:false, axis:false});

var xaxis = board0.create('axis', [[0, 0], [1,0]], 
      {name:'x', 
      withLabel: true,
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-20, 20]   // (in pixels)
      }
      });
var yaxis = board0.create('axis', [[0, 0], [0, 1]], 
      {name:'y', 
      withLabel: true, 
      label: {
        fontSize: 20,
        position: 'rt',  // possible values are 'lft', 'rt', 'top', 'bot'
        offset: [-30, -20]   // (in pixels)
        }
      });   

// parabala and it's derivative
var f = function(x) { return  x*x; };
var df = function(x) { return 2 * x; }
var graph_f = board0.create('functiongraph', [f,-10,10]);
//var graph_df = board0.create('functiongraph', [df,-10,10],{strokeColor: '#11AA66', visible:true});

// point x on axis we want to get derivative value
var x = board0.create('glider', [1,0, xaxis], {name:'x', size:6});
var fx = board0.create('point', [ 
	function() { return x.X(); },
	function() { return f(x.X()); }], {name:'', color:'blue', fixed:true});

// the slider point for the secant
var x_h = board0.create('glider', [x.X() + 1, 0, xaxis], {name:'x + h', size:6, color:'green'} ); 

// sliding point on parabala 
var fx_h = board0.create('point', [
                function() { return x_h.X(); }, 
                function() { return f(x_h.X()); }
          ], {name:'', color: 'blue', fixed: true, size:3});

// secant line
var secant = board0.create('line', [fx, fx_h], {strokeColor:'#FF5522'});
var secantSlope = function() { 
	if (x.X() == x_h.X()) { return "UNDEFINED: divide by zero"; }
	return ((f(x.X()) - f(x_h.X()))/(x.X() - x_h.X())).toFixed(3).toString(); 
}

// print the slope of the secant line
var slopeText = board0.create('text',[-4,-2,
	function(){ return 'Slope of Secant Line = '+ secantSlope(); }], {fontSize:20});

var hText = board0.create('text',[-4,-1,
	function(){ return 'h = '+ (x_h.X() - x.X()).toFixed(3); }], {fontSize:20});


var p = board0.create('point', [ 
	function() { return x_h.X(); }, 
	function() { return f(x.X());}], {visible:false});

var rise = board0.create('line', [fx_h, p], {color:'black', strokeWidth:1, straightFirst:false, straightLast:false, dash:2});
var run = board0.create('line', [fx, p], {color:'black', strokeWidth:1, straightFirst:false, straightLast:false, dash:2});
var riseText = board0.create('text', [
	function() { if (x_h.X() > x.X()) { return x_h.X() + 0.1; } 
				 return x_h.X() - 1.5; },
	function() { return (f(x_h.X()) - f(x.X()))/2 + f(x.X()); },
	'(x+h)^2 - x^2'], {fontSize:12});

var runText = board0.create('text', [
	function() { return x.X() + (x_h.X() - x.X())/2; },
	function() { return f(x.X()) - 0.3; },
	'h'], {fontSize:12});

smartdown.setVariable('f1', '');
smartdown.setVariable('f2', '');
smartdown.setVariable('f3', '');

this.dependOn = ['f1','f2','f3'];
this.depend = function() {
    if (env.f1 == 2) {
      smartdown.showDisclosure('correct','','bottomright,transparent,shadow'); 
      setTimeout(function () {
           smartdown.hideDisclosure('correct','','bottomright'); 
      }, 3000);
    }
    if (env.f2 == 4) {
      smartdown.showDisclosure('correct','','bottomright,transparent,shadow'); 
      setTimeout(function () {
           smartdown.hideDisclosure('correct','','bottomright'); 
      }, 3000);
    }
    if (env.f3 == 6) {
      smartdown.showDisclosure('correct','','bottomright,transparent,shadow'); 
      setTimeout(function () {
           smartdown.hideDisclosure('correct','','bottomright'); 
      }, 3000);
    }
    if (env.f1 == 2 && env.f2 == 4 && env.f3 == 6) {
      x.setPositionDirectly(JXG.COORDS_BY_USER, [1,0]); 
      x_h.setPositionDirectly(JXG.COORDS_BY_USER, [2,0]); 
	  x.prepareUpdate().update(true).updateRenderer();
      x_h.prepareUpdate().update(true).updateRenderer();
      fx.prepareUpdate().update(true).updateRenderer();
      fx_h.prepareUpdate().update(true).updateRenderer();
      board0.update();
    }
};
 
```

# :::: mi1
# --outlinebox ob1
### Finding the Derivative
[Next](::mi2/topright)
# --outlinebox
# ::::

# :::: mi2
# --outlinebox ob2
##### Start with the Slope of Secant Line
The slope is the change in $f(x)$ over the change in $x$.
$$\frac{(x + h)^2 - x^2}{h}$$
[Now we do some algebra.](::algebra/button,transparent)
# :::: algebra
$$\frac{x^2 + 2hx + h^2 - x^2}{h}$$
$$\frac{2hx + h^2}{h}$$
$$2x + h$$
The expression $2x + h$ represents the [[](:!secantSlope)](::pulldown1/tooltip).
# ::::
# --outlinebox
# ::::


# :::: mi4
# --outlinebox ob4
### Take the Limit
We have this expression $2x + h$ which represents the slope of any secant line on our function.  
# --outlinebox
# ::::


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
