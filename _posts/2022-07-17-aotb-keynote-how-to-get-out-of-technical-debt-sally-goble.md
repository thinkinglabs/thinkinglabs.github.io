---
layout: note
title: Closing Keynote - How to get out of (technical) debt!
event:
  name: Agile on the Beach
  date: 2022-07-08
author:
  name: Sally Goble
  twitter: sallygoble
created_at: 2022-07-08
category: notes
tags: [ Technical Debt, Keynote, Agile on the Beach ]
image: /images/aotb-keynote-how-to-get-out-of-technical-debt-sally-goble/business-problem.jpeg
---

We’ll discuss what debt looks like, and how easy it is to get into debt in the first place. Then we’ll put a plan into action,

---

[So what do you do if you don't do testing?](https://learn.pipelineconf.info/2016/03/24/sally-goble-so-what-do-you-do-if-you-dont-do-testing-pipeline-conference-2016/), PipelineConf 2016

don't get me wrong, I care passionately about technical debt

## Tech Debt: the elephant in the room

- engineers cry about it and do it in secret
- CTOs have sleepless nights worrying about it
- Product Owners lure on it

The success of your business is the result of everyone not only your engineers caring about tech debt, [@sallygoble](https://twitter.com/sallygoble)

at Accurx: first job: find a way to sustainably manage the tech debt

> Technical Debt is the implied cost of additional rework caused by choosing an easy (limited) solution now instead of using a better approach that would take longer
>
> -- [Wikipedia](https://en.wikipedia.org/wiki/Technical_debt)

you borrow money because you want something and you want something fast, and then you realise you will have to pay that money back -> you borrow something from your future self

you want to go to the market fast, you decide to make a trade-off and not build the perfect solution -> same as money loan, you borrowed something from your future self

Even faster pace means more debt!

=> the more you will be in debt as you go along, you build debt on top of debt, you still have to pay your initial debt back

## Fast <> Bad

accumulating technical debt is inevitable if you want to move fast and beat your competitors, [@sallygoble](https://twitter.com/sallygoble)

There are a few different types of Tech Debt

- Code or Application debt: inconsistent, duplication, hard to understand, to read, poorly documented -> maintenance slow down, engineers are frustrated

- Design or Architecture debt: not taking the time to evolve the system

- Testing debt: lack of unit tests, integration tests, end-to-end tests -> more bugs, less confidence of engineers in e.g. refactoring -> more debt

- Tooling debt: not keeping your tools and libraries up to date because you don't have time -> you miss on new features, end of life of tools, ...

- Reliability or Performance debt -> ability to scale of the org is questioned, bad user experience

- Knowledge/Skills debt: difficult to on-board new engineers, bad balance of skills inside the team (too many juniors, too many seniors, lack of some specialised skills, ..)

## How do you know you're in debt?

I've never used tools to measure tech debt because the truth is you know you are in tech debt!, [@sallygoble](https://twitter.com/sallygoble)

"*One unit test took me 3 days to write ...*" this is tech debt, [@sallygoble](https://twitter.com/sallygoble)

"*We don't have time to refactor*" this is tech debt, [@sallygoble](https://twitter.com/sallygoble)

"*Product Y stopped working when a feature was released for a totally unrelated Product X*" this is tech debt, [@sallygoble](https://twitter.com/sallygoble)

"*He doesn't want to be part of Team X because then he has to manage all the 'spaghetti' code*" this is tech debt, [@sallygoble](https://twitter.com/sallygoble)

You don't need tools to measure tech debt

your engineers know it

your product managers know it

the impact of tech debt is a business problem

- speed of delivery slows down
- your reputation is tarnished
- you experience attrition: difficult to retain talent

> “Technical Debt is a business problem”
[@sallygoble](https://twitter.com/sallygoble) pointing out an unpopular truth at [#AOTB2022](https://twitter.com/hashtag/AOTB2022)
>
> -- Chris Pitts ([@thirstybear](https://twitter.com/thirstybear)), [Jul 8, 2022](https://twitter.com/thirstybear/status/1545425425542807552)

> Yes [@sallygoble](https://twitter.com/sallygoble) hitting the nail on the head right there 👍 [#AOTB2022](https://twitter.com/hashtag/AOTB2022) [#technicaldebt](https://twitter.com/hashtag/technicaldebt)
>
> ![Technical Debt is a business problem](/images/aotb-keynote-how-to-get-out-of-technical-debt-sally-goble/business-problem.jpeg)
>
> -- Matt Hosking [@MattAgileCoach](https://twitter.com/MattAgileCoach), [Jul 8, 2022](https://twitter.com/MattAgileCoach/status/1545425300900794372)

> I haven't seen the talk, obviously, but calling the "business" guilty for every decision a software dev has made is not fair and surely not helpful
> -- Krisztina ([@YellowBrickC](https://twitter.com/YellowBrickC)), [Jul 8, 2022](https://twitter.com/YellowBrickC/status/1545428141061152774)

> I get you, however, the point is that sometimes we (everyone) take the decision to take short cuts to move fast to market for business reasons. Afterwards tech debt is everyone’s responsibility.
>
> -- Thierry de Pauw ([@tdpauw](https://twitter.com/tdpauw)), [Jul 8, 2022](https://twitter.com/tdpauw/status/1545446675967246340)

> In the end, not tackling tech debt because of feature, feature, feature is a business problem as in it impacts the whole organisation for various reasons.
> -- Thierry de Pauw ([@tdpauw](https://twitter.com/tdpauw)), [Jul 8, 2022](https://twitter.com/tdpauw/status/1545446902224887810)

> But the comment didn’t call the business was guilty of causing tech debt. My talk was saying that the *impact* of tech debt is on the business not on tech.
>
> -- Sally Goble ([@sallygoble](https://twitter.com/sallygoble)), [Jul 9, 2022](https://twitter.com/sallygoble/status/1545698818381041665)

Face up to all the debt you're in

ask your engineers, your testers, your architects what is missing

we wanted to rephrase Tech Debt into Tech Investment

## Managing repayments

-> work on our investments

- one-off repayments
- dedicated teams
- ad hoc repayments
- sustainable repayments

### One-off repayment aka The debt bash

-> a break week: everyone in the room works on the tech investment

Pros:

- can get a fair bit done in a short time

Cons:

- in reality this happens once or twice a year, you are not getting much through as you think you are

### Dedicated teams

-> all they do is manage tech debt, own people or contractors

Pro:

- does not interrupt delivery
- does not impact your product
- no context switching
- can deliver quite large-scale pieces

Cons:

- people don't want to do it, people go to product company because they want to work on products
- "sucks"/siffons quite off from senior engineers
- engineers not working on tech debt have no exposure to the pain points -> no learning
- contractors don't know the code -> requires senior engineers need to explain and review

### Ad-hoc repayment

-> here's the backlog of tech investment, take some when you have some time

it wasn't really working for us, we didn't get much through

Pros:

- flexible and efficient use of time

Cons:

- product delivery trumps all: everyone wants to work on the product, you will always choose to deliver the features, that's what the CEO wants
- schedule clashes: never find time
- lack of transparency: what is this engineer working on
- some tech debt is too big because of ad-hoc, always small pieces

### Sustainable repayments

-> take our tech investment and embed it into the product teams and make everyone in the team responsible of delivering them

how do you do it?

- got buy-in from senior stakeholders: takes a lot of time
- embed into teams
- empower teams

got buy-in from senior stakeholders

- describe the problem in business language
- showed the scale of the problem using the backlog + estimate how long it would take to work on + estimate the impact if we did not work on them
- agreed how much time -> engineering time budget (10% on tech investment and 90% on product delivery)
- bring the Product Managers on the journey: really, really tricky; they are on the hook of delivering value to customers
  => 90% of their product goals would be delivered (not 100%)
  won't overload critical projects: no tech investments for those teams
  iterate: start with one cycle and adapt

embed

- tech investment 'cycle' planning: same cycle as product delivery but shifted two weeks earlier than product planning
- prioritise the tech invest work
- size the cycle: we know how much engineering time we have for tech investment, fill until the budget is full and draw a line under it
- matching tech investment to teams: consider skills in teams, alignment with teams (code ownership), development goals and interests

empower

- trust your teams: do we do the tech investment at the start or end of the cycle, it is your responsibility, do it when it works for you, at the end of the cycle you need to deliver
- hold them accountable: leadership expected them to deliver the tech investment => check-in with senior leadership team: 20mins on product delivery and 5min on tech investment
- bring investment out of the shadows: celebrate the tech investment; it's usual to celebrate when certain features are delivered, do the same with tech investment

## Has it worked? Yes!

- we managed to get through a fair bit
- teams embraced it! Product Managers asking why are you not refactoring this instead of why are you refactoring
- engineers don't feel guilty
- transparency
- helped engineers with career progression

Cons:

- feels a bit top-down

## How to avoid accumulating debt?

Good habits:

- be aware of compromise: fast vs perfect, but don't er too much on the super fast
- document your trade-offs
- use lean UX methods: wireframes, mocks, ... you don't need to build everything
- invest in knowledge: writes things down
- upgrade technologies
- keep your tech investment list up to date
- reward continuous improvement

## Conclusion

the aim of my talk is that the success of your business relies on all, not only the engineers

Tread technical debt as a business problem, not a tech problem

Tell your business why you need to reduce it and have a plan
