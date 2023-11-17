---
layout: note
title: "Get a grip on your quality by using Quality Views"
event:
  name: Agile Testing Days
  date: 2023-11-15
author:
  name: Sonja Nesic
  twitter: testingido 
created_at: 2023-11-15
category: notes
tags: [ Testing, Agile Testing Days ]
image: /images/agiletd-get-a-grip-on-your-quality-using-quality-views-sonja-nesic/quality-views.jpg
---

Quality is complex. Quality is subjective. Even if we all talk about the same system and have the same professional background, our assessment of a system’s quality might wildly differ. So, when I got the request to detect the quality gaps among multiple teams, I knew I needed a uniform way to scan and assess in order to provide this information.

This is when I discovered Colin Breck’s Quality Views. What initially was meant to only help me detect the next focus area as a test engineer, turned out to be a powerful tool that helped the teams and our management to create a common understanding of our systems and their quality. Quality Views help us balance the effort put in delivering new functionality to customers with the effort needed to improve & maintain the quality of our systems.

---

Company through a transformation to product lead -> one product!

4 teams - 12 services
1 monolith
2 testers

Working really hard on shifting left
But also shifting right using metrics, monitoring, …

## Define quality

You need to know what quality means for your org

> Uniformly assess and effectively communicate the current state of the system to allow us to make the right investments and enable us to track its evolution.

uniformly assess over 4 teams and 12 services

Quality Views by Colin Breck

[Using Quality Views to Tackle Tech Debt @Tesla](https://www.infoq.com/presentations/quality-views-technical-debt/)

## The approach

visualise the system

score every part of the system over different evaluation criteria -> heat map

![Quality Views](/images/agiletd-get-a-grip-on-your-quality-using-quality-views-sonja-nesic/quality-views.jpg)

more details on Collin’s blog

## Preparation

determine evaluation criteria

- code
- tests
- deployment
- monitoring
- alerting
- security
- SLA
- business risk
- + Risk Mangement
= 9

binary evaluation of each criteria => sum up to a score on 9

define clarifying questions, ex: is monitoring available so someone can troubleshoot and operate the component

…

pick a first team

## Round no 1

drawing the system can be challenging

what classifies a component

### Evaluation criteria

- binary is hard: zero or one is harsh
- some questions are too long, too vague or irrelevant

### Quality Views

=> engineering and business are aligned, aha moments

generates actionable actions: what do we want to tackle in the coming months

### Learnings

functional components vs technical implementation

Clarified the way a criteria gets a 1 or a zero: min(q1:q2)

=> holistic view of the whole system

=> one way to assess the system

Because we kept the functional component more important than the technical implementation => clarified the desired architecture

Discovered some teams/services lacked functional metrics

## Round no 2

Updated the system diagram

Only rescored the components that were touched coz action points were defined

## Final notes

If you think that would help, just do it!

Initial criteria list require to define quality

It is a whole team approach

- the team discussions while scoring are really valuable
