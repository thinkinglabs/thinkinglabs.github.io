---
layout: note
title: You Build It You Run It sounds great… but it won’t work here!
event:
  name: Agile on the Beach
  date: 2022-07-07
author:
  name: Steve Smith
  twitter: SteveSmith_Tech
created_at: 2022-07-07
category: notes
tags: [ Operability, Agile on the Beach ]
image: /images/aotb-you-build-it-you-run-it-sounds-great-but-wont-work-here-steve-smith/self-service-incident-management.jpeg)
---

Since You Build It You Run It was outlined in 2006, on-call product teams as an operating model has gone from being a controversial idea… to being a controversial idea. Enterprise organisations don’t do it, but they do talk about why they don’t do it.

---

your organisation needs to thrive and survive

you need to achieve a new baseline for your digital services

=>

- Higher throughput: weekly or more frequent
- greater reliability: 99,0+% availability, and time to repair in minutes
- learning culture

but you have a hard problem in there
because you have one central operations team that needs to keep your services up and running

what you need is
=> you build it, you run it, an operating model in which product teams build, deploy, operate and support their own digital services

-> playbook: [Equal Experts - You Build It, You Run It playbook](https://equalexperts.com/playbooks/you-build-it-you-run-it)

How do you know you need You Build It, You Run It? and when do you not need it?

=> decision table: financial exposure on failure vs product feature demand (see playbook)

How does You Build It, You Run It look like for digital services?

- product teams: who do delivery and monitoring + level 1 on-call

How does Ops Run It look like for foundational systems?

- product team: build
- operations: deploy, monitoring
- operational enablers: DBA's, ...

## It sounds great ... but it Won't work here

### Developers won't want to do it

"*We haven't given our developers what they need*"

- have you explained the mission?
- have you asked what's wrong, and listened? -> listen to their concerns until you have a full understanding
- have you committed to putting things right?

=> give your developers what they need

- [2022 Atlassian survey: State of Developer Report](https://www.atlassian.com/blog/software-teams/state-of-the-developer-2022)

  59% developers on-call -> strong correlation with positive job feelings

- [2022 incident.io survey: Uncovering the mysteries of on-call](https://incident.io/blog/uncovering-the-mysteries-of-on-call)

  - 69% developers on-call
  - concerns include impact on personal life, solving issues beyond

  on-call is a social sacrifice

  - being worried about mobile signal availability
  - driving on a motorway -> wife needs to pick up the call
  - ...

  expertise, and unnecessary alerts

- [2019 on call survey: on-call, all things on-call](https://oncall.netlify.app)
  - 58% paid a flat rate
  - significant variation in payment models

  => pay people for being on-call to compensate the social sacrifice

> You need to pay your developers for being on-call due to the implicit social sacrifice. If you don’t understand this, someone else will, and they’ll move to that company”. [@SteveSmith_Tech](https://twitter.com/SteveSmith_Tech) [#AOTB2022](https://twitter.com/hashtag/AOTB2022)
>
> -- Abraham Marin-Perez ([@AbrahamMarin](https://twitter.com/AbrahamMarin)), [Jul 7, 2022](https://twitter.com/AbrahamMarin/status/1544986318735872001)

### It won't scale to lots of teams

"*We haven't balanced financial exposure and on-call costs*"

You Build It, You Run It is a multi-cost insurance for customer outcomes!!
-> recognise opportunity costs and revenue protection matter

- have you forecast teams, services and financial exposure?
- have you understood "*everything always on*" is a myth?

  you have a few services that are critical, they have a lot of money running through them

  you have a lot of services that are important, but not critical

  you have a few services that are not important at all

### Nobody won't be accountable

"We haven't tried trusting our people to do the right thing"

- have you explained to your leadership and teams why shifting accountabilities onto teams will help deliver customer outcomes
- have you linked operational objectives to outcomes
- have you encouraged delegating responsibilities

trust your people to do the right thing
=> RACI model (responsible, accountable, consulted, and informed)

this is really hard to do, to shift responsibility

### There'd be no incident management

"*We haven't made incident management self-service*"

- have you brought incident managers into the fold => ensure your incident managers and developers appreciate how their orthogonal workloads tie into the mission
- have you mapped out a self-service workflow => automate away all the manual, repetitive actions and handoffs
- have you run some chaos days

> How to make incident management self-service to make sure you can operate “You Build It, You Run It” by [@SteveSmith_Tech](https://twitter.com/SteveSmith_Tech) [#AOTB2022](https://twitter.com/hashtag/AOTB2022)
>
> ![Make incident management self service](/images/aotb-you-build-it-you-run-it-sounds-great-but-wont-work-here-steve-smith/self-service-incident-management.jpeg)
>
> -- Abraham Marin-Perez [(@AbrahamMarin](https://twitter.com/AbrahamMarin)), [Jul 7, 2022](https://twitter.com/AbrahamMarin/status/1544990089100640257)

automated alert
-> incident response platform (PagerDuty)
   -> incident updates -> Ticketing system (ServiceNow) -> incident managers
  -> incident channel -> collaboration platform (Slack) -> interested parties
  -> contact on-call -> phone/app -> on-call developer + incident managers

### Developers would be firefighters

developers would spend all their time on solving problems instead of spending all their time on building features because that is what generates money

"We don't measure or eliminate BAU work"

BAU is actually a synonym for unplanned work

- have you learned to manage unplanned work -> track BAU work items in your ticketing system -> prioritise BAU vs value work
- have you visualised per-team rework rate -> calculate the weekly % of unplanned work on each team
  add a label "BAU" to your tickets => you can search every week for that label
- have you built paved roads -> boost developer experience by automating their user journeys
  I do not mean a platform!!

=> measure and eliminate BAU work

### We can't hire a DBA for every team

we never asked for that!

"We haven't made repeatable, specialist tasks self-service"

- have you understood this isn't You Build It You Run It
  this is an unnecessary extreme!!
- have you rejected embedding specialists in teams
  -> DBAs will be stretched across teams, overworked/bored and unhappy
- have you automated repeatable specialist tasks
  offload low value tasks to the cloud provider
  automate high value tasks as self-service

-> solve specialists at scale as a problem

> Empowering a development team doesn’t necessarily mean get rid of experts like DBAs, it just means that those experts need to be engaged in the creation of self-service platforms for the developers to use [@SteveSmith_Tech](https://twitter.com/SteveSmith_Tech) [#AOTB2022](https://twitter.com/hashtag/AOTB2022)
>
> -- Abraham Marin-Perez [(@AbrahamMarin](https://twitter.com/AbrahamMarin)), [Jul 7, 2022](https://twitter.com/AbrahamMarin/status/1544993154813796353)

### We haven't this before

"We don't know how to get started"

-> share the mission
-> pick a pilot team: do not try this on all teams at once, try some small experiments
-> change the mindset

## Takeaways

You Build It You Run It is great and it can work here!

- ...
