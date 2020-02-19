---
layout: post
title: Managing Complexity in Mathematical Explanations
date: 2020-01-06
smartdown: true
background: '/img/posts/calculus.jpg'
categories: [ calculus, smartdown ]
comments: false
---


For me, a mathematical explanation has three parts: the high level ideas, a picture of the model, and symbolic reasoning. The high level ideas tell us what we are doing and why we are doing it.  The picture of the model is a description of the actual problem.  It's where the real understanding happens. The symbolic reasoning is where we write statements with mathematical notation and do inference and reasoning with those statements.  This could include algebra or logical proof steps.  

Following the symbolic reasoning often requires significant effort. Even when people successfully follow each step, they often lose track of how these statements are related to the model and the high level ideas. My goal is to present complex problems in a way that doesn't lose track of the mapping between the symbolic notation and the meaning of those statements in relation to the model.  Currently, I write all my explanations using [smartdown](https://smartdown.site/#gallery/Home.md), so I'm trying to find a methodology for my process within the tools supplied by smartdown.  However, it's likely that this exploration will lead to the development of new smartdown tools. Explaining complex topics with challenging notation is not unique to the field of mathematics so lots of folks could benefit from tools for this kind of thing.  We begin with an example problem.  

```javascript /playable/kiosk
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
let x = board0.create('glider', [1,0, xaxis], {name:'x', size:6});
let fx = board0.create('point', [
	function() { return x.X(); }, 
	function() { return f(x.X()); }], {name:'', color:'blue', fixed:true});
let graph_f = board0.create('functiongraph', [f,-10,10], {strokeColor:'#999999'});
let graph_df = board0.create('functiongraph', [df,-10,10], {strokeColor:'#44AA44', visible:false});
let dfx = board0.create('point', [
	function() { return x.X(); }, 
	function() { return df(x.X()); }], {name:'', color:'#44AA44', fixed:true, visible:false});

// tangent line section
let tangent = board0.create('line', [
	function() { return f(x.X());},
	function() { return - df(x.X());},
	1], {visible:true});
let tangentSlopeText = board0.create('text',[
	function() { return x.X() + 0.5; },
	function() { return f(x.X()) + 0.5;},
	function(){ return 'slope = '+ df(x.X()).toFixed(2); }], {fontSize:15, visible:true});


// Secant line section
// the slider point for the secant
let x_h = board0.create('glider', [x.X() + 1, 0, xaxis], {name:'x + h', size:6, color:'green', visible:false} ); 

// sliding point on parabala 
let fx_h = board0.create('point', [
                function() { return x_h.X(); }, 
                function() { return f(x_h.X()); }
          ], {name:'', color: 'blue', fixed: true, size:3, visible:false});

let secant = board0.create('line', [fx, fx_h], {strokeColor:'blue', visible:false});
let secantSlope = function() { 
	if (x.X() == x_h.X()) { return "UNDEFINED: divide by zero"; }
	return ((f(x.X()) - f(x_h.X()))/(x.X() - x_h.X())).toFixed(3).toString(); 
}

let secantSlopeText = board0.create('text',[
	function() { return x.X() + (x_h.X() - x.X())/2 - 1.8; },
	function() { return f(x.X()) + (f(x_h.X()) - f(x.X()))/2;},
	function(){ return 'slope = '+ secantSlope(); }], {fontSize:15, visible:false});

let p = board0.create('point', [ 
	function() { return x_h.X(); }, 
	function() { return f(x.X());}], {visible:false});

let rise = board0.create('line', [fx_h, p], {color:'black', strokeWidth:1, straightFirst:false, straightLast:false, dash:2, visible:false});
let run = board0.create('line', [fx, p], {color:'black', strokeWidth:1, straightFirst:false, straightLast:false, dash:2, visible:false});
let riseText = board0.create('text', [
	function() { if (x_h.X() > x.X()) { return x_h.X() + 0.1; } 
				 return x_h.X() - 1.5; },
	function() { return (f(x_h.X()) - f(x.X()))/2 + f(x.X()); },
	'(x+h)^2 - x^2'], {fontSize:12, visible:false});

let runText = board0.create('text', [
	function() { return x.X() + (x_h.X() - x.X())/2; },
	function() { return f(x.X()) - 0.3; },
	'h'], {fontSize:12, visible:false});


// board0.on('update', function() {
// 	//smartdown.setVariable('hvalue', (x_h.X() - x.X()).toFixed(3));
// });

let showTangent = function() {
	tangent.setAttribute({visible:true});
	tangentSlopeText.setAttribute({visible:true});
};

let hideTangent = function() {
	tangent.setAttribute({visible:false});
	tangentSlopeText.setAttribute({visible:false});
};

let showSecant = function() {
	x_h.setAttribute({visible:true});
	fx_h.setAttribute({visible:true});
	secant.setAttribute({visible:true});
	secantSlopeText.setAttribute({visible:true});
	rise.setAttribute({visible:true});
	run.setAttribute({visible:true});
	riseText.setAttribute({visible:true});
	runText.setAttribute({visible:true});
};

let hideSecant = function() {
	x_h.setAttribute({visible:false});
	fx_h.setAttribute({visible:false});
	secant.setAttribute({visible:false});
	secantSlopeText.setAttribute({visible:false});
	rise.setAttribute({visible:false});
	run.setAttribute({visible:false});
	riseText.setAttribute({visible:false});
	runText.setAttribute({visible:false});
};


this.sizeChanged = function() {      
  board0.resizeContainer(myDiv.offsetWidth, myDiv.offsetHeight);
};

smartdown.showDisclosure('mi1', '', 'topright,shadow,draggable');
smartdown.setVariable('transition1', false);
smartdown.setVariable('transition2', false);
smartdown.setVariable('transition3', false);
smartdown.setVariable('transition4', false);
smartdown.setVariable('hValue', 1);

board0.on('update', function() {
	smartdown.setVariable('hValue', (x_h.X() - x.X()).toFixed(3));
});

this.dependOn = ['transition1', 'transition2', 'transition3', 'transition4'];
this.depend = function() {
	// board0.suspendUpdate();
	if (env.transition1 == true) {
		hideSecant();
		showTangent();
		smartdown.setVariable('transition1', false);
		smartdown.showDisclosure('mi1', '', 'topright,shadow,draggable');
		smartdown.hideDisclosure('mi2', '', 'topright,shadow,draggable');	
	}
	if (env.transition2 == true) {
		x.moveTo([1,0]);
		showSecant();
		hideTangent();
		smartdown.setVariable('transition2', false);
		smartdown.showDisclosure('mi2', '', 'topright,shadow,draggable');
		smartdown.hideDisclosure('mi1', '', 'topright,shadow,draggable');
		smartdown.hideDisclosure('mi3', '', 'topright,shadow,draggable');
	}
	if (env.transition3 == true) {
		smartdown.setVariable('transition3', false);
		smartdown.showDisclosure('mi3', '', 'topright,shadow,draggable');
		smartdown.hideDisclosure('mi2', '', 'topright,shadow,draggable');
	}
	if (env.transition4 == true) {
		graph_df.setAttribute({visible:true});
		dfx.setAttribute({visible:true});
	}
	// board0.unsuspendUpdate();
};
 
```

# :::: mi1
### Finding the Derivative
We want to find a function that tells us the **slope** 
of the tangent line for the function $f(x)=x^2$.
Drag the red dot to see the slope of the tangent line.
[Next](:=transition2=true)
# ::::

# :::: mi2
### Derivatives are Slopes
The derivative function starts with the **slope** of a secant line.  
That's the change in $f(x)$ over the change in $x$.
$$\frac{(x + h)^2 - x^2}{h}$$
[Do some algebra](::algebra/button,transparent)
# :::: algebra
$$\frac{x^2 + 2hx + h^2 - x^2}{h}$$
$$\frac{2hx + h^2}{h}$$
$$2x + h$$
The expression $2x + h$ represents the [[](:!secantSlope)](::pulldown1/tooltip).
# ::::
[Back](:=transition1=true) [Next](:=transition3=true)
# ::::

# :::: mi3
#### Use a Limit to Turn a Secant into a Tangent
If we drag the green dot towards the red dot the  
value of $h$ gets very small 
**h**[](:!hValue) 
and the secant gets closer to the tangent and the 
slope of the secant $2x + h$ gets close to $2x$.
We write this as
$$f'(x) = \lim_{h \to 0} 2x + h = 2x$$
The derivative of $f(x) = x^2$ is the function
$$f'(x) = 2x$$
[show derivative](:=transition4=true)
[Back](:=transition2=true)
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