---
layout: note
title: Estimates or No Estimates, Let's explore the possibilities
author:
  name: Woody Zuill
  linkedin: woodyzuill
  twitter: WoodyZuill
event:
  name: Domain Driven Design Europe
  date: 2019-01-31
created_at: 2019-01-31
category: notes
slides: https://speakerdeck.com/agilelatvia/no-estimates-lets-explore-the-possibilities-by-woody-zuill
image: /images/dddeu-estimates-or-noestimates-lets-explore-the-possibilities-woody-zuil/noestimates.jpg
tags: [ NoEstimates, Domain Driven Design Europe ]
---

> The only sure thing about forecasts is that they are WRONG
>
> -- James P. Womack and Daniel T. Jones.

Estimates have been the bane of software development managers and programmers for decades. Customers want to know: When will it be done? How much will it cost? Managers need to provide a budget, and a timeline. Programmers are told "We won't hold you to the estimate", and yet they often are.

Estimates themselves are not the problem, it's more likely our dependence on following an estimate-driven approach. Our decision making process requires that we use estimates, and yet the results are mediocre at best, and even worse they misinform the decisions they are meant to support. Do we really need estimates? Is simply "getting better" at estimates worthwhile? Can we live without them? Will things be better without them?

We must be open to discussing the possible problems, and to search for alternatives. I don't necessarily have answers for you, but I've worked with "no estimates" for over 8 years and I'm still alive. I want to explore the idea of estimates, why they are pervasive in the programming world, how they might be harmful, and see if we can grow the dialogue about finding a better way to make decisions.

---

## Beyond Estimates: Estimates or No Estimates?

Why did you come to this workshop?

Why are we doing something that doesn't make us happy?

In our industry we do things nobody believes in because some others need them.

depressing workshop because at the end of the workshop everybody asks himself: what are we going to do now?
I don't know what will work in your environment.

### What is an estimate?

"The value of another's experience is to give us hope, not to tell us how or whether to proceed.", Peter Block

I cannot tell you what to do on whether or not you should do it.

### Warnings

Have an open mind. People become very defensive about the practices they now apply.

## First Part

### Lessons Learned

19+ years ago, 1999

"Large", critical projects

Over 200 developers

IID - Pre Agile

- 6 weeks iterations
- 2 weeks "design"
- 2 weeks "code"
- 2 weeks "integrate and test"
- lessons learned
- do again

![Lessons Learned: Scenario](/images/dddeu-estimates-or-noestimates-lets-explore-the-possibilities-woody-zuil/lessons-learned-scenario.jpg)

At that time I already did XP.

Everyone was half my age: developers were usually 22 years old. I was 45 years old.

The project manager was 32 age old.

There is a problem with a 32 year old manager: experience. How many times did they fail? How many projects would he have managed? one? none?

First Iteration - First Lessons Learned (6th week)

1. our estimates were off.

   => we need to be better at estimating

   At 45 year I already knew the fraud in estimates

2. the requirements weren't clear when we started

   => make them clearer: we need to get better at understanding requirements

3. requirements kept changing

   => we need to control changes => change control management: you are not allowed to change

   Is that good? I don't think that is good

Second Iteration - Second Lessons Learned (12th week)

same lessons as in the first iteration.

We worked hard to get better at estimating, understand requirements and then control changes.

what did we do to fix things: exactly the same things

Third Estimates - Third Lessons Learned (18th week)

3 really big problems ...

We worked hard to get better at estimating, understand requirements and then control changes.

nth Iteration: there is a pattern in this

![Lessons Learned: nth iteration](/images/dddeu-estimates-or-noestimates-lets-explore-the-possibilities-woody-zuil/lessons-learned-nth-iteration.jpg)

we always suck at estimating and we try to get better at it

=> The Cycle of Continuous No-Improvement

> Insanity is doing the same thing over and over and expecting different results.
>
> -- Einstein's definition of insanity

We keep trying to improve the same things, why would it work this time.

If you see this, I believe you are working on a Symptom not a Problem

symptom: estimates are off; what is the problem?

symptom: requirements aren't clear; what is the problem?

symptom: requirements are always changing; what is the problem?

It's in the Doing of the Work that we Discover the Work: that is what software is about

our managers don't want us to talk with you

why would managers not want that 22 year olds to talk with a 42 years old?

because I and management knew it wasn't going to work

but managers try to earn as much money on top of the company as possible

How long does a 6 month project take? a year, two years, three years? => 35 million dollars instead of 5 million dollars

> The object isn't to make art, it's to be in that wonderful state which makes art inevitable
>
> -- Robert Henri

we have to find something other than controlling the making of the art

we have to find something other than controlling the making of the software => agile manifesto

Agile Manifesto is not a set of practices, it is a set of ideas.

## Part Second

#NoEstimates

it's just a hashtag

![First NoEstimates tweet](/images/dddeu-estimates-or-noestimates-lets-explore-the-possibilities-woody-zuil/noestimates.jpg)

I didn't "invent" it to be controversial

It was used to reference a blog post

It happened by accident

It is based on the experience I had working on a project using No Estimates.

It is NOT a commandment: Thou Shalt Do No Estimates

We are discussing: very specific types of estimates used for a very specific purpose.

not redoing the kitchen, we need an estimate on what this is going to cost

not about curing cancer, how much is that gonna cost?

### What is an estimate?

What you said:

- Guess
- Forecast => Guess
- Assumption => Guess
- Expectation => Guess
- Bet
- Lies
- Complexity
- Misunderstanding
- Number, Amount, Measure, Effort
- Empirical: this is based on the knowledge of doing this sort of work. Can you please show me your data points on which this is based?

  => work break down from something large into smaller things it is still a collection of smaller guesses

It is something like a guess that gives us an approximation of the cost that we can use as a measure or a metric for a plan, forecasting, getting a job, investment decisions.

What CIOs said:

An estimate is

- a promise.
- a SWAG: Scientific Wild Ag Guess
- an informed guess
- a confidence interval: we are 70% sure it is going to work => we made an estimate and we estimated how confident we are

### Let's do an Estimate

Story: 3 months from now you have to write your name on a white index card with a blue fountain pen.

How long will it take? 5 seconds

Story: right now you have to write your name on a white index card with a blue fountain pen.

How long will it take?

- do you have a blue fountain pen?
- when you got one, do you have a white index card
- what do you mean by blue?

Work Time: amount of time to do the actual work, not including waiting time

Elapsed (or Cycle) Time: amount of time that passes from when we first start on some work until it is completed

in software: how many times are you disturbed? how much time do you actually spend writing software?

Lead Time: amount of time that passes from when the request is first made until it is delivered

we don't know what will happen: network problems

**Our Working Definition of Estimates** :

> a guess of the amount of time (usually work time) to create a project, a feature, some bit of work in software development

## Part 2.5

(Exercise: How easy complexity can blow your estimates)

Exercise:

Let's explore: Why do WE do estimates in software development?

- deadlines, know if we are on track: newspapers have deadlines to have the paper ready to get it on the truck so people get the newspaper before going to work
- for negotiation
- investment decision, budget planning: how much it is going to cost and how much it will return => the person that wants the feature will overestimate the return in order to get the feature
- amount of resources, budget
- dependencies with others, roadmaps: schedule when other dependencies need to be ready
- informing the customer
- managing expectations, risk management
- kpi's
- because of the rules

We are doing wild guesses to realise all the above.

In software development we use estimates to try to predict the future.

Why do we want to know when it will be done, how much it will cost? To make a decision.

- What can be done this Sprint?
- How many people will we need?
- What can be done for this money?

These results are merely information. Not facts.

> We use estimates to help us make decisions ...
>
> or to spark a Conversation ...
>
> (... and the cow said, MOO!)
>
> ... so we can make a decision!

Business is not a science! It is an invention of people. Why do we manage business like we manage business today?

Napoleon? Planning war.

Book: [Accounting for slavery](https://www.goodreads.com/book/show/38502101-accounting-for-slavery): documents all the business practices we use today

## Part Third

About Questions.

I like to imagine Wonderful. Questions.

Exercise:

Questions are important. Answers are not important. Peter Block

> Questions are more transforming than answers.
>
> The skill is getting the questions right.
>
> The traditional conversations that seek to explain, study, analyze, define tools, and express the desire to change others are interesting but not powerful.
>
> Questions open the door to the future and are more powerful than answers in that they demand engagement.
>
> Engagement in the right questions is what creates accountability.
>
> How we frame the questions is decisive. They need to be ambiguous, personal, and stressful.
>
> Introduce the questions by defining the distinction the question addresses, namely what is different and unique about this conversation.
>
> -- Peter Block

A good question will lead to a better question.

> If you do not know how to ask the right question, you discover nothing
>
> -- Deming

Why do we want Control and Certainty about Time, Cost, and Schedule?

to earn more money? that would be a good point, but we would certainly not do it that way

Can we improve our chance of Wonderful if we give up on Certainty?

Can something that "seems so right" be so wrong?

How much work does it take to have enough understanding to take a decision?

How do we know it was a good decision?

Are the things "we think we want" a trap? => the fallacy of the sunk cost

Do we become less flexible? when we took a decision on information we thought was right

How easy is it to cancel a decision?

Is "getting better at estimates" the only way? Getting better at estimates really does not fix anything.

If we can make decisions on estimates ... are there other types of decisions we could be making?
what would be another approach to decide to do project A or project B ? do them both at the same time: set based engineering

Is On Time and On Budget a good measure of the results of our decision? being on time and on budget and returning nothing on investment, is that a good decision?

- "creative accounting":
  - feature cuts 
  - working late/extra hours to meet estimated date goals!! (tiger teams)
  - you are not allowed to record hours to the project so it looks like we met our goals!!

> Fear of losing control is a big barrier for change. Although, much control is only an illusion of control, fear is real and can’t be ignored.
>
> -- Bjarte Borgnes, Beyond Budgeting

> Please estimate: what percentage of worldwide programming effort is burned in dysfunctional behaviour driven by deadlines that are just guesses?
>
> — Kent Beck

> As teams progress they first struggle with estimation, then can get quite good at it, and then reach a point where they often don’t need it.
>
> — Martin Fowler, PurposeOfEstimation

> Be worry of anyone who tells you estimates are always needed, or never needed.
>
> — Martin Fowler, PurposeOfEstimation

> One of the problems with the schedule is that it gives you the idea that you can take that long.
>
> — Michele McCarthy

> Estimating when we’ll be done is wrong; Forcing the answer is worse.
>
> — Ron Jeffries

> In 2007 a series of experiments lead my colleagues and me to increase our agility by dropping story points and velocity calculations.
>
> — Joshua Kerievsky, Stop Using Story Points

> Estimates are for cost centres, not products
>
> -- Mary Poppendieck

...

> Estimates presuppose a solution
>
> -- Dhaval Panchal

Most of things that really matter cannot be measured, so instead we allow the things that can be measured to become what matters to us.

## Part Fourth

before 2009, from time to time I tricked somebody into why they think they need an estimate

since 2009, I didn't accept a job if they needed estimates

In software development, a lot of our time goes away in waiting for something.

> Queuing is the biggest waste in product development
>
> -- Donald Reinerdsen

Story Points:

if everybody comes up with a 5, it doesn't mean everybody thought about the same to come to the 5 => you should add up all the 5

If you get a range of points => teams want to come to an agreement

most of the time you will get differences between dev and test: it is easy to implement but hard to test => these people will never come to an agreement

The Twelve Calculations Examples:

1. draw tic-tac-toe and write numbers from 1-9
2. the same but the right column sums up to 15
3. the same but the top row sums up to 9
4. the same but the diagonal sums up to 18

What made the exercise hard? the combination of features

```
^
|
| ----->
```

time vs complexity => the more complex, the more time it takes

EFFORT of writing 9 digits

RISK: of new entry violating the constraints

UNCERTAINTY

I work since 10 years without estimates.

The beauty of working this way: whenever a product has diminishing returns, we were able to turn them off.

## Part Fifth

Our Project Description
(or old fashioned requirements documents)

but I think our Project really really is nebulous.

=> it' in doing the work that we discover what we need to do

=> doing exposes reality

Identify the most valuable thing to do.

Decouple it. Anything that is not cohesive, you take it off (not cohesive, what you don't need to do together)

Work on it.

Deploy it.

Collect feedback.

...

This never requires an estimate.

What is the next thing you want us to work on?

80/20 80/20

- 80% of the use of the app comes from 20% of the features

Let's CRANK UP our ability to have, many, small, inexpensive attempts at value.

=> let the architecture emerge

Express an idea -> design and code -> deploy - feedback: what have we learned -> start over

you learn at every stage

This is EXACTLY what Agile provides!

## Part Six

What does No Estimates bring us?

Turn up the good on our ability to rapidly deliver potentially useful software !
