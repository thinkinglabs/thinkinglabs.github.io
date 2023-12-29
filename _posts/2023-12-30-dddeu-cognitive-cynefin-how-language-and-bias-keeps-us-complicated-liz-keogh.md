---
layout: note
title: "Cognitive Cynefin: How language and bias keep us complicated"
author:
  name: Liz Keogh
  website: https://lizkeogh.com/
event:
  name: Domain Driven Design Europe
  date: 2016-01-28
created_at: 2016-01-28
category: notes
video: https://www.youtube.com/watch?v=73uwRe7ctVg
tags: [ Cynefin, Domain Driven Design, DDDEU ]
---

For millenia, human beings have survived by learning, then applying our learning to different contexts. We’re so good at it that we’re driven to find those patterns, even when they don’t exist. Our desire for the predictable suffuses everything we do; our beliefs, our behaviour and even our identity. From cognitive bias to the metaphors that underlie our language, we create constructs of words and imagination that keep us from innovating… and yet, they’re the same constructs that help us move forward in uncertainty. Without them, we’d be unable to make decisions at all! In this talk we look at how our language and perceptions can hold us back, and how changing the things we say and the way we look at the world might help us become more resilient, happy and innovative.

---

> A system is never finished being developed until it ceases to be used
>
> -- Jerry Weinberg

Done vs Ready (on scrum boards): work is never done, it is ready (when it is in production)

## Metafors for work

### The part of the whole

"Placeholder for a conversation" about cards on a scrumboard

"*The tester picks it up*"

"*They hand it back to the devs*"

"it" it is a thing, but we mean all of the things that are associated with this card

"*I couldn't do much testing until the end of the sprint*"
=> we treat testing like if it is a thing (cheese, I wanted 200 gr of it but I got only 100 gr)

*"Our code quality needs to improve*"
by code we mean coding (this stuff does not grow on trees)

### Work as a container

"*I've put a lot of work in it*"

"*This is a stretch goal. We might not fit it into the sprint.*"
stretch goal = target

#### We deliberately reinforce the container boundaries

"*That's out of scope for Release 1*"
we define a box

"*We need not close all the open tickets*"
literally like it is a box: they are all open and now we need to close it,
we don't want to know what's in it

"*How many stories are in that feature ?*"
there's a box that is the feature that contains more boxes for the tasks/user stories and they get smaller and smaller

### Breaking Things Down

see game Astroids : shooting the big rocks, become medium rocks, become smaller rocks that  goes very fast
=> refining the backlog (chasing the smaller boxes because you opened all bigger boxes)

"*Work is a container*" is pervasive

We are uncovering better ways of developing software by doing it

We are discovering how to discover stuff by doing it

Why is it we cannot model everything as boxes ???

## The Innovation Cycle

- Differentiators -> Spoilers -> Commodities -> Build-on Differentiators
(mobile phone with cameras, Nokia spoiled it, and now it is commodities (1 or 2 cameras, front and back))

=> that is your core domain and your core domain is always shifting

## Cynefin [ku-nev-in]

[Cynefin framework]({% post_url 2023-12-29-cynefin-framework-dave-snowden %}) consists of 4 domains:

- Obvious domain (simple)
  
  a child can understand it

  **sense, categorise and respond** to the problem
  
  hierarchy works very well to organise work
  
  people do not need to talk to each other to get their work done

- Complicated
  
  you need experts, analysis
  
  **sense, analyse and respond**
  
  the solution is still predictive, you know what to get
  
  people need to be put together and told what to do
  
  hierarchy

- Complex

  you cannot predict the solution
  
  Flickr: was first intended to share screenshots of how people play games, and people started to share photos of kitten, family, ...
  
  **probe, sense and respond**
  
- Chaotic

  you can't make sense of it
  
  **act, sense and respond**
  
  and act quickly, get out of the house
  
  we act as individuals

- Disorder

  domain where we do not know which of the 4 other domains is more important
  ex. estimating  something you never did before, and where this estimation becomes a promise

It is very easy to go from the Obvious domain into Chaotic: Complacence???

## Estimating Complexity

5. Nobody has ever done it before
4. Someone outside the org has done it before (probably a competitor)
3. Someone in the company did it before
2. Someone in the team did it before
1. I did it before
{: reversed="reversed"}

4 and 5: interesting => Complex

3: perfect for analysis => Complicated

2 and 1: are boring => Obvious

"*If a project, has no risks, don't do it.*"

if we only do what we already know how to do it, we are only giving the organisation something they can do

there is always something we did not had before

Everything where you say "Oh my God" is Chaotic

## Why probe before we sense ?

Complex: probe, sense, respond

why do we want to do something before trying to understand the problem?

### Epiphany vs Apophany

> **epiphany** = oh I get it (aha moment)

> **apophany** = they think something is there, but that is not true

when we start believing something, we start finding things that enforce this => **Confirmation Bias**

there are different kinds of Biases

- Obvious: known knowns
  
  we have the expertise, we know

- Complicated: known unknowns
  
  we know what we do not know
  
  risk manager that is going over the unknowns
  
  things are made of the sum of their parts

- Complex: unknown unknowns
  
  so we have to try something out that is safe to fail
  
  things are made of the interactions of the agents

- Chaotic: unknowable unknowns

### People

"*I couldn't do much testing until the end of the sprint*"

- => "*I wasn't able to give the dev any feedback before the end of the sprint.*"
- => "*I wasn't able to give the dev any feedback before they showed their work to the stakeholder*"

Talk about work in the context of the relationship between people

"*That's out of scope for Release 1*"

- => "*Our main stakeholder wants to satisfy the need of the s people in the next release*"

Before you ask why, ask who ?
=> look at the Value Stream for the people

- work from the back: what do we want to achieve
- work from the Dev Team: how does work get to the Dev Team (the board, feasibility study, ...) and who is blocking the Dev Team to get into production (qa, ops, ...)

Draw a line around the part of the Value Stream where you have influence on. Their problem is usually outside of that line.

### Consensus

you get this when you get people together

"feel together"

how you go to consensus: voting, polling => that is: you go to the person that has the loudest voice in the team (this is not consensus)

If you go for consensus, the result will be average.

You get more insights from diversity:

retrospectives: different group of people (devs, tests, customer) bring different problems, you group them and vote them

### Cause and Effect

are correlated in retrospect

Agile works with relationships, feedback loops => that is why Agile works

- Individuals and interactions
- Working software
- Customer collaboration
- Responding to change

still valid 15 years later

What if we worked with our customers and not for our customers ?

> No matter what the problem is, it is always a people problem
>
> -- Jerry Weinberg

## How does this relate to DDD ?

Before trying to model your problem, try something out to get feedback especially in the Complex and Chaos

> DDD is not really good for Obvious and Chaotic, but it is really good for Complex and Complicated
>
> -- Eric Evans

=>  do very little model upfront and quickly prototype to test which model fits
