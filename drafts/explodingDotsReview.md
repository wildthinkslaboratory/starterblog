---
layout: post
title: The Exploding Dots Model Part 1
date: 2020-01-17
smartdown: true
categories: explodingDots
comments: false
background: '/img/posts/expDots1.jpg'
---


### Introduction

We're a few years into what I call **the exploding dots revolution** and for many of us, James Tanton's innovative approach to math curriculum has changed the way we teach and do math.  After a few years reflection, I wanted to share some of my experiences teaching exploding dots and how it has shaped my thinking about mathematics in general.  I have two major take aways, and both are rather involved so I'm going to divide them into two posts. My first take away from exploding dots is that we need to radically rethink mathematical notation and the role it plays in both math education and math research.  Historical analysis of what constitutes good mathematical notation is remarkably slim and many of the criteria are completely outdated in a digital world.  I argue that current notational systems create an uneccessary burden on learners, teachers and mathematical researchers. Reducing the cognitive load required to decipher notational symbols should be an important criteria for good mathematical notation.  In my next post I'll argue that notational changes like the ones we see in exploding dots seem to lead  to increased mathematical creativity in learners.  It's possible that a radical revision of mathematical notation might lead to increased mathematical creativity for learners in the short term and increased mathematical innovation in research areas in the long term.


### Syntax vs. Semantics: the Task of Doing Mathematics


Let's break down the **doing** of mathematics into two parts.  The first part is to understand the [model](::model/tooltip).  The model may be a phyisical model like the *base machine* from exploding dots.  It's something we can build, see and manipulate.  Models can also be abstract.  For example, we might imagine a machine that counts.  Then we imagine the machine counting forever and never stopping.  Then we call the result of that machine's process infinity.  We can't build this machine and we might have some doubt about whether the result of a process that never ends is a meaningful idea, but the imagining of this machine provides a model for the concept of infinity.  

[An aside on models](::modelaside)
# :::: modelaside
I'm side stepping some important issues around mathematical models.  Many mathematical topics may have more than one model. Some models may be better than others. There are also areas of mathematics that don't have a model rooted in the physical world.  However, mathematical questions that can't be phrased in terms of a physical process we can imagine are likely to be [formally independent](::formally_independent/tooltip).  Fortunately, you aren't likely to run into these types of questions in a K-12 math classroom.  
# ::::

# :::: model
Here I mean **model** in the usual sense.   In first order logic the term model has a more specific definition.
# ::::

# :::: formally_independent
A mathematical statement is [formally independent](https://en.wikipedia.org/wiki/Independence_(mathematical_logic)) if the truth of that statement cannot be proven or disproven within the standard axiom systems, such as Zermelo- Fraenkel set theory.  The [continuum hypothesis](https://en.wikipedia.org/wiki/Continuum_hypothesis) and the [axiom of choice](https://en.wikipedia.org/wiki/Axiom_of_choice) are examples of statements that are formally independent.
# ::::


The second part to the **doing** of mathematics is writing and reading statements about the model.   This is where mathematical notation enters the picture.  Notation is the set of symbols and arrangement of symbols we use to write statements about the model.  We use these statements to communicate ideas about the model, to pose questions and to write solutions.  We also use these statements to write proofs. For example, if I have two algebraic expressions that are known to be equal, 
$$2x - 4 = 3x$$
I can derive a new equality that is the same as the first but with the symbols $ + 4$ added to both expressions.
$$2x - 4 + 4 = 3x + 4$$

We manipulate the symbols in our sentence according to an established rule to derive a new statement about the model.  If the rules we use are correct (sound) and the original statement is true, then we've constructed a new true statement about our model.  This process is essential for proving mathematical results and it requires that we have a notational system to describe our model.  However, this kind of symbolic manipulation can be done without any knowledge of the model the statements are representing.  In fact this is a requirement of formal proof systems.  The notational syntax and inference rules are deliberately seperated from the meaning of the statements.  

So in math, we work with the model to understand it, but we translate our thoughts about the model into statements written with symbols to communicate with others and to prove things about the model.  Working a problem through may require multiple translations back and forth between the model and the notation.  If we are solving a complex problem that requires a lot of inference, a common experience is to temporarily get lost in the symbolic reasoning side of mathematics, pushing symbols around.  During this time we may lose track of what the symbols mean in terms of the model.

I believe that the thinking we do about the model and the thinking we do when working with the notation are two very different skill sets that likely use different parts of the brain.  I'm not sure if there is evidence, perhaps in the cognitive science literature, to back this up but I hope to do some reading in this area soon.  




### Historical Review of Mathematical Notation

Recently I did some research to see what has been said and written about what constitutes good mathematical notation.  I found that remarkably little has been written about this topic.  The seminal book on mathematical notation is [*A History of Mathematical Notations*](https://www.amazon.com/History-Mathematical-Notations-Dover-Mathematics/dp/0486677664) written by Florian Cajori in 1928.  Since then, not much has happened.  I found a nice [survey paper](https://web.wpi.edu/Pubs/E-project/Available/E-project-110815-204313/unrestricted/notation.pdf) by Biletch, Kay and Yu, and there's an interesting [speech](https://www.stephenwolfram.com/publications/mathematical-notation-past-future/) by Stephen Wolfram on this topic.  

How are mathematical notations created?  The answer is that notations have evolved in parallel with mathematics.  Our earliest notations reflect the problems they evolved to solve, such as commerce, counting money and goods and land surveying. The symbols we use are very old, most between 100 and 500 years old. The notations that have survived aren't necessarily the *best* ones.  As Cajori points out, there has never been any agreed upon criterial for what is good notation, nor any communal process for identifying or encouraging good notations. Our notations are often restricted by whatever form of writing was possible at the time, scratches in bones, clay tablets, pen and paper and most recently typesetting on printing presses. 

Although there is no mechanism for encouraging or enforcing criteria for mathematical notation, some criteria have emerged from previous writing on the subject.  A good mathematical notation should be:

| Criteria | Notes |
| :-------------- |    :----  |
| **precise** | Good notation must lend itself to symbolic manipulations for inference and proof writing.  This requires well formed unambiguous statements. |
| **efficient to write** | Most notations were created in the era of pen and paper.  One purpose of notation was to act as shorthand for prose.  This criteria may be outdated in the digital age.|
| **easy to typeset** | As mathematical documents moved from hand written to printed, this became an important criteria. This criteria is definitely outdated in the digital age.|
| **language independent** | Hard to argue with this criteria.  One of the nice things about math notation is it's ability to transcend culture and language barriers. |
| **easily extendable**| |
| **easy to understand** | This is undoubtably important, but also very vague.|
| **respect precedent** | This last one I added myself.  I didn't find many people saying that limiting notations to previously used ones is important, it just seems like it must have been important considering the fact that there have been so few innovations in mathetical notations. |


A natural question to ask is: How do choices about mathematical notaion affect the learning process and how does it affect progress in mathematical research?  We don't seem to know.  I will argue that an important criteria for notation should be to decrease the cognitive burden of the task of interpreting symbols.  Deriving meaning from the symbols.  in other words translating between symbols and model.


### Lessons from Exploding Dots

MOdel:

Exploding dots definitely has a very compelling model to work with (dots and boxes), but it also has a radical approach to notation.  Dr. Tanton had the audacity to abandon all historical notations and created instead a new notation that closely mirrors the model itself.  

Notation: 

he exploding dots often we'll write standard base ten numbers to annotate the dots and boxes, but these annotations arent' necessary, and they aren't the focus.

examples?


I suspect that he has greatly reduced the cognitive load required to encode and decode statements and also reduced the difficultly of task switching.  This leads to the interesting question: Can we design mathematical notation in a way that reduces the cognitive load of certain mathematical tasks?  Might this lead to deeper understanding of mathematical concepts by students and mathmaticians alike?




For me, one of the main take aways of exploding dots and many other areas of James Tanton's innovative math curriculum is that we need to radically rethink mathematical notation and the role notation plays in both math education and math research.


Propose a hypothesis.

I propose that the main problem with current notation is cognitive load.  We are no longer constrained by earlier criteria needed for pen and paper, typography.  Computers show most notations.



- efficient. (outdated)
- precise  ( how formal? depends on context )
- easy to understand (What does this mean?  Should be changed to low cognitive load for translation. )

- efficiency is outmoded requirement
- typographic restrictions are outmoded.
- the most important requirement should be reducing cognitive load.
	- this will fuel mathematical creativity

	1. notations doesn't suggest correct model.
	2. the notation causes high cognitive load in interpretation.

	- example from algebra.  letters to represent variables.  Wouldn't it be better to have a box.  The idea of a hidden or mystery element.  We know things about it and can infer more removing the mystery.  Our notation says none of this.  

### Cognitive Load

Doing math requires at least two different cognitive tasks.  Constantly switching between the two tasks.  

 [Flanker Test](https://www.psytoolkit.org/experiment-library/experiment_flanker.html)
 [Stroop Test](https://www.psytoolkit.org/experiment-library/experiment_stroop.html)

Task Switching is hard.

1. My personal experience leads me to this model
2. Math is aware of this Syntax vs. Semantics
3. My teaching experience suggests this model
4. is there research on cognitive tasks of notation in lit?
5. what can we gleen from more general research on information processing?

Most mathematical notation is a pain in the ass.  When we do math, we are constantly translating back and forth between the model and the notation.  We read a problem written with some symbols, we figure out what that means in terms of the model.  We figure out how to solve the problem by thinking about the model and then we translate our answer back into symbols so others can read it.  The constant translation creates an enormous cognitive load on the brain.  This brain suck doesn't have to do with the actual math, it's just about interpreting symbols.  A challenging problem will often require repeated translations between model and notation.  It's like a tiresome game of telephone where small details get lost or mutated. Digits are transposed, decimals are dropped. The additional strain of the translating is a constant distraction, errors are made and meaning gets lost.  

It seems reasonable to assume that a large part of doing mathematics is processing symbols into meaning about the model.  There is substantial cognitive load that comes from this.  Can we improve notations to reduce this load on the brain, freeing it up to concentrate on the model itself.

In my time in the classroom, I've often had students who were sad and frustrated and felt they were no good at math.  Upon further investigation, I often discover that they understand the model perfectly.  They were struggling to decipher the symbols and do the translation.  Many of these students spend their life thinking they are no good at math, but that's not an accurate description of the situation.  It's more often that they struggle with deciphering symbols.  This always makes me sad.


Enter James Tanton and exploding dots.  The brilliance of exploding dots is that the model and the notation have merged.  He abandons standard notation for number theory and just a draws a picture of a physical model (also, it's a very good model).  There's no strain from  deciphering crazy symbols.  There's no translation errors.  What's left is pure mathematical exploration and understanding.  We all know the dopamine release you get when you have a mathematical insight or see the answer to a challenging problem.  Exploding dots makes these joyful moments more concentrated.  

It's hard to argue with the result.  If you've witnessed, as I have 4th and 5th graders master the kind of number theory basics usually reserved for undergraduate math majors there's really no going back.  It's clear that we've been making math so much harder than it needs to be.

Now it's true there is a point when working large complicated problems that drawing all the dots and boxes can get tedious and we sometimes revert back to our old base ten representation.  There may still be a need for consise pen and paper notations sometimes.  However, going forward into the digital age, this need will become less and less as more of our mathematical communication becomes digital.  I say this as someone who prefers to teach exploding dots with a handful of rocks and sidewalk chalk on a sunny day to the online exploding dots experience, fabulous as it is.  

It makes you wonder, what other areas of mathematics could benefit from the same kind of notational restart?  How do we recreate the exploding dots success?  I think it's  time to revise all of our mathematical notation.  We need to start from scratch, work with a good model and build new notations that are closer visually to the model.  Computers can help by allowing us to work with notations that we would never attempt if we had to write them with pen and paper.

I'm not advocating abandoning all mathematical notation.  There will always be a role for ..... computers will use bizarre notations.  Pen and paper will limit.  

### Rethinking Symbolic Reasoning: A Layered Approach 


- at the heart of mathematical notation will always be strings.  The role that strings play in math is essential. Formal proof systems determine mathematical proof.  Formal proof systems are mechanical manipulation of symbols. This marry's the field of mathematics and computer science.  This will always require symbolic manipulation.  Strings.  Computers.  This creates a layering of notations. Human notations are different than computer notations.
	- Semantics / model
	- human readable logic statements about the model. F.O.L.
	- statements for input to a deductions system.  SAT
	- unicode
	- binary strings
	- registers with varying current.

- IDEA: the layered approach to notation.  With computers we can create notation that can be layered.  A picture that shows the model that can reveal a logic string and under that a 0-1 string.
- Make the learning process aware of the translation process between syntax and semantics.  A high level notation where you could look under the hood so to speak.








- some notations hold back progress.  exploding dots enhances mathematical creativity.





Florian Cajori. A History of Mathematical Notations. Dover Publications, 1928.

An Analysis of Mathematical Notations: For Better or For Worse
Barry Biletch, Kathleen Kay, & Hongji Yu


Goals / To Do

- get rid of preachy tone.
- Make article readable for non eXp dots audience
- Wolfram makes an interesting point about how notations can limit thinking and hold back mathematical breakthroughs. 
- identify areas that need research.
- cognitive load in information processing.

---

### Outline

4. Exploding Dots notation 
	- why does it work?
	- the model and the notation are the same.
	- hands on equations as another example of notation mirroring model.

	Reducing Cognitive Load Hypothesis
	- this research hasn't been done, but we have the methodology to test these questions.
	- we shouldn't be afraid to start over.  
	- requirement of respecting precedence (not making radical changes)

7. Building a layered notational system.
	- students learn to differentiate syntax from semantics and learn awareness of the two main tasks.  
	- educational materials make these differences explicit.
	- example app, maybe from calculus.


Wolfram Speech
- most notation is between 100 and 500 years old.
Generally, this failure to see that one could name numerical variables is sort of an interesting case of the language or notation one uses preventing a certain kind of thinking. That's something that's certainly discussed in ordinary linguistics. In its popular versions, it's often called the Sapir–Whorf hypothesis.

- the idea that mathematical notation shapes the math that we create.  And can limit it too.

named vars as example of notation -> progress


### Letter to Phil Morris

I have a question about the cognitive tasks involved in doing mathematics. I am a mathematician and a teacher so I have no background psychology. I tend to break down the doing of mathematics into two sub tasks.  

1. Thinking about the model. All mathematical concepts have an underlying model.  For example, in counting, the model could be some pebbles.  Models can be abstract rather than physical.  For example, we might imagine a machine that counts.  Then we imagine the machine counting forever and never stopping.  Then we call the result of that machine's process infinity.  We can't build this machine and we might have some doubt about whether the result of a process that never ends is a meaningful idea, but the imagining of this machine provides a model for the concept of infinity.  The primary task in mathematics is to think and reason about the model. This is often involves visual-spatial reasoning, but probably others.

2. Ideas and concepts about the model need to be written down as statements so we can communicate our ideas and so logical inference can be used to prove ideas correct.  This requires mathematical notation, which is the set of symbols and arrangement of symbols we use to write statements about the model. This requires encoding and decoding notational statements. It also requires manipulating notational statements during inference.  For example, if I have a statement like

2x - 4 = 3

Then I'm allowed to manipulate it notationally by adding the symbols '+ 4' on both sides of the equal sign.  

2x - 4 + 4 = 3 + 4

This kind of rule can be applied correctly with no understanding of what the symbols mean.

It feels like several very different tasks are involved that might use different parts of the brain.  In addition, the process of math requires people to shift rapidly and often between these tasks.  

Recently, a man named James Tanton created a really fabulous math curriculum called exploding dots that everyone informally agrees has made a large amount of K-12 mathematics more enjoyable and easier to learn.  Upon reflection, I believe he has done two things.  First he has a very compelling model to work with.  Perhaps more importantly, he had the audacity to abandon all historical notations and created instead a new notation that closely mirrors the model itself.  I suspect that he has greatly reduced the cognitive load required to encode and decode statements and also reduced the difficultly of task switching.  This leads to the interesting question: Can we design mathematical notation in a way that reduces the cognitive load of certain mathematical tasks?  Might this lead to deeper understanding of mathematical concepts by students and mathmaticians alike?

I'm having trouble finding my way through the cognitive science literature.  I'd love to find relavent research papers.




### What is Exploding Dots?

It's hard to explain exploding dots is in a few paragraphs. It's a large curriculum presenting familiar topics in a fundamentally new way.  The best way to understand it is to experience it. I recommend checking out the following sites if you're new to exploding dots and want to get a feel for it.

1. [exploding dots interactive web experience](https://www.explodingdots.org/)
2. [G'Day Math: Exploding Dots Course](https://gdaymath.com/courses/exploding-dots/)

The [exploding dots app page]() is a fabulous interactive experience, but an equally compelling low tech experience can be had with pen and paper or by heading outside with a bucket of chalk and some pebbles.
![thumbnail](https://www.youtube.com/watch?v=cwicTRuLT4Y)


##### Short Description of Exploding Dots

Exploding dots is a general introduction to [positional numeral systems](https://en.wikipedia.org/wiki/Positional_notation).  It explores grade school arithmetic in different base systems and connects it to arithmetic on polynomials.  In the process it covers large amounts of K-12 mathematics through a very broad yet integrated perspective.  It's intended for students in 4th grade and up. 

It's all based on a simple model called a machine.  Here's an interactive example of a **two to one** or $\fbox{$\bullet$} \leftarrow \fbox{${\bullet \bullet}$}$ machine that you can play with.  If you have two dots in a box, you can drag one dot to the left creating an explosion.

[Application Instructions](::app_instructions/tooltip)

# :::: app_instructions
- Click on a box to add a dot.
- If there are at least two dots in a box, drag one of the dots to the left to create an explosion.
- Click the **Add** button to toggle between adding dots and antidots.
- If you drag a dot and an antidot together, they will annihilate each other.
- and finally, drag a dot out of the box area to delete it
# ::::

```javascript /autoplay/p5js

//xsmartdown.import=http://127.0.0.1:8080/dots.js


// import the dots library
//smartdown.import=/smartblog/assets/dots.js


// this is the url for the background picture
const bgURL = 'https://gist.githubusercontent.com/wildthinkslaboratory/ac98c0bb68ccf7528dc39fa1922d2bdb/raw/0fe1c494e0a94243f3b6d10dd38ef2a341d92f95/bgRedCream-20.jpg';


// Adjust the surrounding DIV(s) a little
const myDiv = this.div;                                  // This chunk of code is some HTML/CSS stuff
myDiv.style.position = 'relative';                       // to make the playable look pretty
myDiv.style['background-image'] = `url(${bgURL})`;
myDiv.style['background-repeat'] = 'no-repeat';
myDiv.style['background-size'] = 'cover';
myDiv.style.height = '100%';
myDiv.style.width = '100%';
myDiv.style.padding = '0';
myDiv.style.margin = '0';
myDiv.style.overflow = 'hidden';
myDiv.style.border = '5px solid gray';
this.div.style.margin = '10px auto'; // shorthand for '10px auto 10px auto'
this.div.innerHTML = '';
myDiv.style.overflow = 'auto';

const widthScale = 0.80;
const heightScale = 0.5;
const base = 2;               // set the base for the machine
const numberBoxes = 5;         // set how many boxes you want

var dots = new dotlib.Dots(p5, this.div);  // create the dots and boxes machine


p5.setup = function() {                          // this function is called when you start the
                                                 // playable. 
  dots.setup(base, numberBoxes, 'red', false);     // initialize the machine with the base and number of boxes. 
  var canvasWidth = p5.windowWidth * widthScale;   // set the size of the playable
  var canvasHeight = p5.windowHeight * heightScale;
  p5.createCanvas(canvasWidth,canvasHeight);     // create the canvas we will draw on
  p5.windowResized();                            

  dots.loadSounds();                             // load the sounds for the app            
};


p5.windowResized = function() {                  // this function is called when the user changes
  const canvasWidth = p5.windowWidth * widthScale;   // the size of the window.  It will rescale all the 
  const canvasHeight = p5.windowHeight * heightScale;    // components to fit into the new window size.
  dots.windowResized(canvasWidth, canvasHeight);
  p5.resizeCanvas(canvasWidth, canvasHeight);
}


p5.draw = function() {                           // this function gets called repeatedly in a loop.
  dots.draw();                                   // The machine is redrawn multiple times a second.
}


p5.mousePressed = function()                     // this function is called everytime the user clicks the mouse
{
  dots.mousePressed();
}


p5.mouseDragged = function() {                   // this function is called everytime the user drags the mouse
  dots.mouseDragged();
}


p5.mouseReleased = function() {                  // this function is called when the user releases the mouse 
  dots.mouseReleased();                          // button after a click.
}


```
It's true that mathematicians tend to be very good at deciphering symbols.  They are so good at it that they don't really notice that they are doing it.  It's tempting to say that this is an important prerequisite for a career in mathematics.  But perhaps, if we had better notational systems we'd have an entirely different set of mathematicians.  Mathematicians wouldn't need such strong symbol reading skills and would have a skill set focosed on imagining, interpreting and proving things about models.  Which world do you want to do math in?
