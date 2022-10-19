---
layout: note
title: Years of Mob Programming - tips and tricks
event:
  name: FlowCon 2022
  date: 2022-10-18
author:
  name: Tommy Tynjá
  twitter: Tommy Tynjá
created_at: 2022-10-18
category: notes
tags: [ Ensemble Programming, FlowCon ]
image: /images/flowcon-years-of-mob-programming-tips-and-tricks-tommy-tynja/ergonomics.jpg
---

Mob programming is when the whole development team works on the same thing, at the same time, in the same space and with one shared computer, screen and keyboard. I've been working as a software engineer in a development team where we've been mob programming for well over a year, every day, without exceptions. We've noticed an enormous boost in productivity and we really feel that we make the most use of the team's overall brain capacity to solve problems and to ship high quality software to our users. But it's not always that easy. We've learned to master this way of working the hard way, by continuously improving on our processes. 

In this presentation I will give an introduction to mob programming, the effects we've seen, why you should consider this way of working and some tips and tricks that we've learned along the way.

---

Mob programming is an evolutionary step to Pair Programming

multiple people work together and share one screen and one keyboard

main storyline is not from Spotify, but from a previous customer

## Mind the Gap

we did not have a process in place

we just had a couch and a big TV in the team

we had heard from teams that tried it, but didn't work for them

if you really want to succeed, do not give up, you need to put some effort and investment in this to make it work

we did not give up, had retrospectives every second week to discuss the matter and how to make it better

## One of the Biggest Problem

it felt like being in the middle of a hen house

everyone talks over each other, a lot of noise

=> focus on flow and on the problem here to solve

=> coding standards started to evolve naturally

## Commit Log

when you see a commit can you be sure it is that person that did the change?

it happens to be the person on which computer the commit happened

=> add the names of everyone present in the commit message

=> full traceability

## Someone hogs the keyboard for quite some long time

how can we make sure everyone is always engaged

=> timer to rotate keyboard

if you know you will have the keyboard in 5 min time, you will pay attention so you are able to move on

It is dragging to be continuously focussed

=> Pomodore technique

divide the work in half an hour slots
then go back to your desk do some other work, get some coffee, do that phone call

## Working Agreements

- use a linux computer
- use the external keyboard and mouse
- set a timer
- when everyone has been the driver, take a break
- have discipline: what is the problem we are trying to solve
- have fun!

=> bring an extra TV to publish this continuously to remind us of that

## Concept of Strong Pairing

comes from Pair Programming

- driver: keyboard
- navigator: thinks ahead, figures out how to solve the problem, but does not give instructions on how to do the job

when you think of how to solve the problem, you should not have the keyboard

Tests

it ensured the quality of the code base improved

but we realised we didn't really did TDD, test first

interesting side effect we did not anticipate
=> the whole team starts to think what problem are we trying to solve first

## Ergonomics

couch is not super from an ergonomics point view (back pain, ...)

=> proper tables, proper chairs

![Ergonomics](/images/flowcon-years-of-mob-programming-tips-and-tricks-tommy-tynja/ergonomics.jpg)

## Continuous Delivery

not a requirement for Mob Programming

but amplifies many of the benefits of Mob Programming

we only used trunk-based development

we are all working on the same thing, it doesn't make sense to create a branch

## Work in Parallel

one misconception is that we can't work in parallel

actually, you can

while the team is busy implementing the business logic, someone else can look at the SQL queries

when arriving at the point the SQL queries need to be called, it's there, ready to be integrated

## Benefit: Collective Skills

you can use all the skills present in the team

in our team: Java, TDD, Cloud, Ops

## Benefit: Fewer Meetings

decisions were just taken on the fly, we did not have to wait for a meeting room, everyone to be present

## Benefit: Product Manager was delighted

top priority things were always worked on

Kanban board only had two swimlanes

- feature being implemented
- urgent things that need attention

## Team Size

If you are 7, you should split the mob

## Definition of Ready

in Agile we spend a lot of time defining when something is done

is it done? is it done, done? is it really done?

we'd better define when it is ok to start work

if we know we are blocked by a dependency, we do not start work

=> reduce waste and rework

## Result

from 12 to 50 tickets in a month

compared with when we worked solo

4 x avg production deployments

## Remote Work

it is actually not a problem
the tooling is available to make that work

## Recap

- really focus on flow, what is the problem we are trying to solve
- use all the skills present in the team
