---
layout: note
title: "The Code Quality Advantage: Debunking the speed vs. quality myth with empirical insights"
event:
  name: Agile Cambridge
  date: 2024-10-02
author:
  name: Adam Tornhill
  linkedin: adam-tornhill-71759b48
created_at: 2024-10-02
category: notes
tags: [ Code Quality, Agile Cambridge ]
slides: https://drive.google.com/file/d/1l_kEpACO10CITAFgBT0E50YPtgYHfpGT/view
---

Code quality is an abstract concept that fails to get traction at the business level. Consequently, software companies keep trading code quality for new features.

---

Can we get quality and speed? Yes and it seems we have empirical evidence to back this.

The industry costs of bad code and technical debt.

Several papers trying to quantify the consequences of tech debt.

Waste

- Software engineers spend 23-42% of their work week dealing with tech debt and bad code

Vulnerabilities

- statistical significant correlation between vulnerabilities and code smells

Research finds that engineers are often forced to introduce new tech debt

## The Laws of Software Evolution

### Continuing Change, Lehman

A system must be continually adapted or it becomes progressively less satisfactory 

-> quick reward

### Increasing Complexity, Lehman

As a system evolves its complexity increases unless work is done to maintain or reduce it

-> less feedback

Leads to wrong management decisions

Why short term gains win over long term maintainability

=> Hyperbolic Discounting (*often used to explain addiction and substance abuse*)

> There’s never enough time to do something right, but there is always enough time to do it over.
>
> —- Melvin Conway

Why is software hard?

Is source code hard to understand?

… imagine millions lines of code created by 100s of engineers …

## Can we visualise tech debt and code quality issues?

We need to understand what we want to visualise as good

-> **Code Health**

an aggregated metric based on ~25 factors

-> look at code smells

absence of code smells is seen as good code

### Module Smells

- Low Cohesion
- Brain Class: low cohesion + large class + at least one Brain Method
- Lack of Modularity

### Function Smells

- Brain Method: complex method centralising  the behaviour of the module
- Cooy-pasted logic
- Primitive Obsession

### Implementation Smells

- Deeply Nested Logic
- Bumpy Roads
- Complex Conditionals

=> three categories of code health:

- Healthy (green)
- Warning (yellow)
- Alert (red)

Code Health is important information for product managers. It gives information where to target the attention.

## Quantify the business impact of code quality

Everyone agrees code quality is important. But as soon as things hit the fences because a deadline code quality is the first to be sacrificed.

Paper: [Code Red: The business impact of code quality, Adam Tornhill and Markus Borg](https://arxiv.org/abs/2203.04374)

-> [InfoQ article](https://www.infoq.com/articles/business-impact-code-quality/)

## Findings

### Speed

Green Code: implementing a feature is twice as fast

Red Code: a feature takes up to 9 times longer

-> caused by uncertainty

### Defects

Red Code: 15 times more defects

-> they come back as unplanned work and context switching

Book: [Rethinking Productivity in Software Engineering, Caitlin Sadowski, Thomas Zimmermann](https://link.springer.com/book/10.1007/978-1-4842-4221-6) (free, collection of papers)

Most frequent causes of engineer’s unhappiness

- stuck in problem-solving
- time pressure
- work with bad code

=> bad code increases time required to implement a feature and causes time pressures (that lead to more bad code)

## How to use this data?

Create situational awareness 

-> give all stakeholders the same view on where the strong and weak parts are

Fight hyperbolic discounting when planning

-> discuss future risks

Build a business case for improvements

-> refactoring and improvements come with a business case

## Manage Tech Debt

Put a quality gate on the code, no matter where it is today and avoid trespassing that gate. Make it part of the CI.

## Behavioural Code Analysis

While code is important, it is even more important to understand how we interact with our code.

Version Control = a behavioural data source

Hotspots: change frequency of code

-> prioritise based on engineer behaviour

=> high interest tech debt (tech debt with high change frequency) vs low interest tech debt 

-> function hotspots

- Lines of code
- Cyclomatic Complexity: basically counts the branches

=> Hotspots: why we don’t have to fix all tech debt

Key takeaways:

- most code is the long-tail. Low interest debt
- Hotspots only make 2-4% of the codebase

## Technical Debt: a data based approach

Quality dimension

Hotspot dimension

=> Speed + Quality: we can have it all

## Questions

Lines of code is a brilliant easy metric that already gives a good indication of code quality but it is not actionable.

Code quality is equally applicable on test code and production code. Bad test code equally withhold teams.
