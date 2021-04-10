---
layout: note
title: Measuring Continuous Delivery
event:
  name: PipelineConf
  date: 2017-03-21
author:
  name: Steve Smith
  twitter: SteveSmith_Tech
date: 2020-11-16
video: https://www.youtube.com/watch?v=uzydNhFZRGY
slides: https://speakerdeck.com/stevesmithcd/measuring-continuous-delivery
meta: 20 min read
categories: 
tags: [ Continuous Delivery, PipelineConf ]
redirect_from:
  - /notes/2017-pipelineconf-measuring-continuous-delivery-steve-smith
---

> This is a full write out, almost word for word, of Steve Smith's presentation '*Measuring Continuous Delivery*' at
> Pipeline Conf 2017. I've written down this presentation, together with the first version of this presentation at the [LondonCD meetup](https://www.meetup.com/London-Continuous-Delivery/), to be
> better prepared to review Steve's book [Measuring Continuous Delivery](https://leanpub.com/measuringcontinuousdelivery).
>
> -- Thierry

Who of you thinks Continuous Delivery is difficult ?

...

The rest of you are or in denial or you are liars.

Continuous Delivery is very difficult. And I will show you some measurement techniques that you will use tomorrow with very little implementation effort to find out for yourself how you can better guide your adoption of Continuous Delivery.

## Continuous Delivery

> Speed is essential because there is an opportunity cost associated with not delivering software.
>
> -- Dave Farley and Jez Humble

I am not going to explain what Continuous Delivery is. This is not the right conference to do that. What I will ask is:

> What does it actually mean to be doing Continuous Delivery ?

People get a bit vague about it. I asked Dave a while ago and he kind of looked at me carefully and said: "*I think when you are able to deploy whenever you want*". That was not quite what I was looking for.

To me an organisation is in a state of Continuous Delivery when the speed and stability of your IT delivery can satisfy business demand.

> **Continuous Delivery**: when stability and speed can satisfy business demand

When you do not have that. When you are too slow or not stable enough to satisfy business demand, you are in a state of Discontinuous Delivery.

> **Discontinuous Delivery**: when stability and speed are insufficient

## Why is Continuous Delivery so difficult?

It is the amount of the technology and organisational changes involved. And that is demonstrated by the size of the [book](https://www.goodreads.com/book/show/8686650-continuous-delivery).

### Technology changes

From the book and some others I cooked up this list at my dining room table:

- Version Control
- Automated Configuration
- Automated Infrastructure
- Deployment Pipeline
- Trunk Based Development
- Continuous Integration
- Evolutionary Architecture
- Database Migration
- Test Driven Development
- Acceptance & Smoke Tests
- Exploratory Testing
- Dynamic Test Data
- Monitoring and Alerting
- Canary Deployment

All of these changes are hard. All of these changes are very valuable, because they are all in there own part an enabler of Continuous Delivery.

Let's pick one: *Database Migrations*.

How hard will it be to get that in place? I don't mean the people side, the implementation, the technology part of it. Even using some of the tools that are around now like Axel Fountains [FlyWay](https://flywaydb.org/) or [DbDeploy](https://code.google.com/archive/p/dbdeploy/).
It is very challenging to set in place. But when you do, it will help stability and speed.

But all of these will do that. So which should you do first ? Which should you do next ? Which will work, which won't for you ?

On top of that, you have to think about the tools involved. There are a smorgasbord of tools available now.

The good news about tools, it doesn't matter too much which tools you use as long as you avoid the really, really bad ones.
It doesn't matter if you use Docker, Kubernetes or Solaris zones just don't use WebSphere.

### Organisational changes

- Small Batch Sizes
- Devolved Decision Making
- Shared Incentives
- Blameless Post-Mortems
- Everyone does On-Call
- Continuous Change Reviews
- Traceability of Changes
- Upskil Employees
- Cross-Functional Teams
- Conway's Law Alignment

These organisational changes are hinted at in [the book](https://www.goodreads.com/book/show/8686650-continuous-delivery) and in the Continuous Delivery literature for the last 7 to 10 years.

All of these are  more valuable than the technology changes. And all of them are more time consuming and all are more challenging.

Again let's pick one: *Everyone does On-Call*.

Everyone in a team doing on-call is very rare and I don't just mean Developers and Ops.

I'm getting tired of hearing how these roles are treated like special people. I am talking about Business Analysts, Product Owners, Testers, UX people. Everybody having the potential to be called at 4 in the morning and to care about it.

That is very, very, very hard to get in place. But when you do, that will make a big difference to the stability of your IT services.

It is not these technological and organisational changes that actually make Continuous Delivery hard. It is the application of them to the unique circumstances and constraints of your organisation.

Your organisation is a complex, adaptive system in which every individual has a limited amount of information and the cause and effect of any event can only be established in retrospect.

Baring that in mind, if you are just lying around doing technical stuff and organisational stuff, some will work and some will not. And as people here will know, if you try to adopt Continuous Delivery, if you make a bad enough mistake, it will end. Because you have to be probably perfect all the way through. Or at least good enough, that you have some good will for when you inevitably make mistakes.

The question than is "**What gives us the best chance to adopt Continuous Delivery**"?

And the answer is: "**We need to continuously improve the stability and speed of our IT delivery until it can satisfy business demand**".

That's when you move from Discontinuous Delivery to Continuous Delivery.

That sounds very easy. You should do this in an incremental, iterative fashion off course. How can we do that ?

## The Improvement Kata

In the Improvement Kata we put structure around our existing ways of working in order to facilitate incremental and iterative changes. What we do is repeated cycles of the 4 step process:

1. **Understand the DIRECTION:** the vision of success

   Create a direction, we outline the stability and speed that we need in order to succeed.

   One of the sponsored lightening talks talked about their vision: the speed that they are looking for - 10000 deploy/day. That was their success for speed. They didn't talk about stability, which they should have. If you have 10.000 deploys/day and a high failure rate, things are going to stop very quickly.

2. **Grasp the CURRENT CONDITION:**

   Create an analysis of how far we've got. We understand the distance we came so far and from that we gain an understanding of how far we still have to go. We don't know the exact path, but we have the direction of travel in front of us.

3. **Establish a TARGET CONDITION:**

   Establish an improvement milestone. We want to work towards an extra small leap forward. That might have a stability or speed success criteria. And we attach a time horizon to that.

4. **ITERATE towards the Target Condition:**

   Then we work towards until we meet one of those. We use the Deming cycle to run experiments. That's where we try technology and organisational changes out.

   **Plan - Do - Check - Act**

That's lovely, but than the question becomes:

- How do we know we are actually improving ?
- How do we know we are moving towards that vision of success ?
- How do we know we have to work on stability or speed next ?
- How do we know if particular technology or organisational changes are actually having a positive impact, a neglectable impact or a negative impact ?

The obvious answer to that is that you need to measure the stability and speed of your IT release process in order to reduce uncertainty and to make better decisions.

## Continuous Delivery Measures

Luckily for us Nicole Forsgren and Jez Humble has laid the groundwork of measuring IT stability and speed.

I watched last year keynote of Jez Humble at Pipeline and went back to where I was working at the time. The feedback on the keynote was really positive. But the people I was working with were like "oh, yeah, we're kind of doing that already, aren't we ?". Which was kind of a sign we were heading in the right direction ourselves.

Jez and Nicole work for a number of years on the annual State of DevOps Report. And they found all kinds of nice things such as:

- an organisation that deploy very frequently to production, is twice as likely to exceed market share, productivity, profitability expectations

> Higher throughput and higher levels of stability are possible at scale
>
> -- DevOps: Profiles in ITSM Performance and Contributing Factors, Nicole Forsgren and Jez Humble (WDSI 2016)

> Continuous Delivery improves throughput and stability in unison

> Continuous Delivery leads to strong IT performance

They also have peer-reviewed academic research that shows:

- as you improve throughput, stability improves in kind and vice-versa.

There is a really delicious virtuous circle waiting for you.

Unfortunately for years large consultancy have told you that you have to choose between features and stability. They have been lying to you (because they want your money).

How is this pertinent to us ?

Nicole, Jez and friends have always used the same 4 measures of stability and speed and they are of enormous interest.

> **Stability** = Change Failure Rate + Failure Recovery Time

- Change Failure Rate: how often changes go wrong
- Failure Recovery Time: how long it takes to recover from a failed change

> **Throughput** = Lead Time + Frequency

- Lead Time: how long it takes to make a change
- Frequency: how often you make changes

These are **Measures**. These are one off quantifications of a thing at a particular point in time. That gives you a certain amount of information.

But what if we take these and we turn these into **Metrics**. If we measure over a period of time at set intervals then we can understand how we are improving or regressing on throughput and stability over time.

What if we actually weave these metrics together into a single visualisation to create **Indicators**. And then we can see how these different metrics are interacting with one another. If I change something does it have a positive impact upon *Lead Time* or *Frequency*, one or the other.

## Deployment Indicators

A couple of years ago I thought about applying these measures to production deployments specifically to create *Deployment Stability* and *Deployment Throughput* Indicators.

> **Deployment Stability** = Deployment Failure Rate + Deployment Failure Recovery Time

- Deployment Failure Rate
- Deployment Failure Recovery Time

> **Deployment Throughput** = Deployment Lead Time + Deployment Interval

- Deployment Lead Time (or cycle time, Jez and Dave actively avoid this term because they gave it multiple definitions in the same book)
- Deployment Interval

It is important to measure these things together. It is not enough to measure one of them. Like said earlier: the 10.000 deploys is great, but you need other stuff as well.

Your *Deployment Failure Rate* may only be 1%, but you shouldn't high-fiving yourself around, because if you are operating in an extremely volatile market conditions (i.e. you are building a financial exchange). If your unmeasured *Deployment Failure Recovery Time* is 5 days, then one production instance can finish off your company.

If your *Deployment Lead Time* is 1 day, that is super duper. But if you only deploy to production every 6 month then you can almost here the opportunity cost sliding away from you.

### Deployment Stability Indicator

A generic code value stream will look as follows:

- code is committed
- it is build
- it goes to production

**Deployment Failure Rate**: the percentage of production deployments that cause a failure

**Deployment Failure Recovery Time**: the average and variation in the time between the start of a production failure and its remediation

We look at average and variation in order to understand if changes are consistent and sustainable or just a one off.

### Deployment Throughput Indicator

**Deployment Lead Time**: the average and variation in time between creating an artefact and deploying it into production

**Deployment Interval**: the average and variation in time between production deployments

Don't be fooled by the little arrow representing *Deployment Interval*. This is where you are going to be loosing an awful lot of the time.

Everyone is talking about doing value stream mapping: let's look at where our *Deployment Lead Time* is going. But a lot of time is lost in between builds being actually created.

## The Government Dept - 60 teams

The past years we have been measuring Continuous Delivery for 60 teams.

Operations team on a private, secured, multi-cloud platform as a service. We have around 60 teams operating 100 digital services made up of 500 micro-services.

Obviously you have different time to market, different stability requirements.

This operations team is responsible for delivering consultancy and release engineering. We own the deployment pipeline and we also help teams to incrementally improve stability and speed.

One interesting thing of working with 60 teams, no-one can say your thing can not work at scale.

The technology value stream was as follows:

- commit code
- build an artefact
- optional integration testing
- mandatory performance testing
- production

Functional testing happens locally,

Each of the 60 teams have the same technology value stream.

There is one fully automated release process.

Every team is cross-functional. Every team has developers, testers, business analysts, user experience specialists, user researchers. They don't have operations engineers because these are centrally based.
And teams can do all of their own deployments.

When we started out on this team, we wanted to help people improve their stability and speed. But we had no idea of how they are doing at the moment.

All of the usual constraints you would think of, like mandatory end-2-end testing, crazy change approval system, or too many test environments, they were simply not the problem.

On top of that, which team do you help first when you have so many teams? Do you help the team in London with whom you have lunch with ? Do you help the team in Lincoln stuck on a "pickfile" not screaming for help ? Do you help the team in Aberdeen trapped in a cupboard just bashing out code not knowing what they are doing ?

How do you help teams to help themselves before they need help ?

The way you can do this is to measure Continuous Delivery and show teams their own metrics. Show teams their own indicators and let them improve for themselves. Never compare one team against another. That is a waste of time. It won't work. Show a team itself and how they are improving.

### Deployment Indicators

**Vision of Success**: every one will have ...

For Deployment Stability:

- Deployment Failure Rate <= 5%
- Deployment Failure Recovery Time <= 1 day
  
For Deployment Throughput:

- Deployment Lead Time <= 7 days
- Deployment Interval <= 14 days

Very conservative numbers for this kind of department. On purpose.

The idea is we want to split our teams in 2 cohorts of teams:

- a cohort of teams practising *Continuous Delivery*, which we hypothesis would be a small group, those are the teams we can learn from and amplify their successes
- a cohort of teams practising *Discontinuous Delivery*, a large set of teams, those are the teams where we want to dam their failures and help them to get better

We build an *Indicator Service*. This is very, very easy.

Who here when they do deployments record the deployment result in a database ? Not enough people. Start doing that tomorrow. That information is a gold mine.

We had a database of 2 years worth of data.

- We wrote a couple of scripts,
- suck the data out,
- we did some pretty poor median and standard deviation calculations,
- and fed that information as JSON in a charting engine.

We published the charts on an internal website where every team can see it and we got a very senior person in the department saying to the teams this is information on how you are currently doing.

We did this with some discs, scripts and some charts. There were no new tools, no new expenses incurred. You really could start tomorrow if you have the data, if you don't start collecting tomorrow.

How are we doing?

#### Deployment Stability Indicator

- Deployment Failure Rate: 0 - 10 %
- Deployment Failure Recovery Time: 0 vs 5 days

We had a minority of teams that were satisfying our vision of success.

We had a small number of teams where the *Deployment Failure Rate* was 0% and they averaged a *Deployment Failure Recovery Time* of 0 days. That's good, these are teams we can learn from.

We had a majority of teams that needed our help. They had an average *Deployment Failure Rate* of 10% and a *Deployment Failure Recovery Time* of 5 days. Now obviously some defects may have a different priority than others, but that is a little bit of a worrying average I think.

Of that cohort of teams that were in this Continuous Delivery, there were teams with a recent decline in stability and teams that were improving steadily on stability. That were teams I wanted to talk to.

> Apples Team:
>
> In 6 months time:
>
> - Deployment Failure Rate: from 20% to 0%
> - Deployment Failure Recovery Time: from 9 days to 0

We spent time learning from the team and we found out their throughput had improved at the same time: 1 deployment every few days to 4 deploys/day. And at the same time stability had improved.

One of the things we found about the team is that they were manually creating monitoring dashboards. They were kinda blaze about this, as they just kinda worked for us.
And we realised our other 59 teams didn't have dashboards as good.

So we exported the JSON, automated it, put a DSL on top of it and created some default dashboards. Within a few days everyone had dashboards of the same standards. And we saw a marked improvement in time to uncover issues in production.

#### Deployment Throughput Indicator

- Deployment Lead Time: 1 vs 12 days
- Deployment Frequency: 5 vs 21 days

We had a minority of teams that had an average *Deployment Lead Time* of 1 day and an average *Deployment Frequency* every 5 days. So they deploy into production in about a week, and it takes them a day to do it.

But we had a majority of teams that were going into production every 21 days and it took them 12 days. That is in the context of this Government Department pretty slow and we want those teams to do better.

One team we found had one production deployment in a year and it is taking them 3 months to do it from building an artefact to going to production through 2 test environments.

> Bananas Team:
>
> A gradual decline over 6 months,
>
> - Deployment Frequency: once every 3 days to once every 14 days

You can try to guess what happens, but ...

**Ludic Fallacy** (Anti-fragile, Nassim Taleb): people assume they can tell a story from one or two data points.

This is not about telling stories. This is about telling you where to go and find the stories.

No other team had this profile. We wanted to talk to them and understand their situation.
They had a lot of turn-over and quick succession. The new team members were trying to get the grips with the new digital service and trying to retain the cadence of once every few days into production. You can't just do that.

We did a value stream mapping with them. We helped them understand where they were loosing some time in their technology value stream. Above all we offered them encouragement and later on they improved again.

## Build Indicators

But there is more. It occurs to me not only you can take these measures and turn these into indicators, but you can apply them to different aspects of the technology value stream.

In the past Nicole, Jez and friends have shown that Continuous Integration is a statistically significant predictor of Continuous Delivery too. Which the Continuous Delivery community largely went through.

But it is nice when someone shows a piece of paper: look its written down.

Stands to reason: If you build more frequently from master, you have the option to deploy more frequently.

But what if we measure *Build Stability* and *Build Throughput*?

If a team has their Build Stability and Build Throughput where we want it to be then either they can do or will be doing Continuous Delivery.

If a team doesn't have Build Stability and Build Throughput where we want it to be, and suddenly they try to deploy to production more frequently, that's when its time to go to your monitoring dashboards ;)

> **Build Stability** = Build Failure Rate + Build Failure Recovery Time

- **Build Failure Rate**: percentage of builds that fail
- **Build Failure Recovery Time**: median and standard deviation in time between the start and end of all build failures

> **Build Throughput** = Build Lead Time + Build Interval

- **Build Lead Time**: median and standard deviation in time between committing code to master and producing an artefact
- **Build Interval**: the time between building artefacts

And again the little arrow of *Build Interval* is where lots of time gets lost.

## The Government Dept - 60 teams

**Vision of Success**: For builds we simply applied the *Continuous Integration* vision requirements to it.

We simply said you have a very low *Build Failure Rate*, very fast *Build Recovery Time*, you had to have a very fast *Build Lead Time* (less then an hour between committing to master and producing a build) and we want you to build at least once a day.

Again pretty conservative.

Build Stability:

- Build Failure Rate <= 1%
- Build Failure Recovery Time <= 0 hours

Build Throughput:

- Build Lead Time <= 0 hours
- Build Interval <= 24 hours

How are we doing ?

### Build Stability Indicator

- Build Failure Rate: 0 vs 19%
- Build Failure Recovery Time: 0 vs 4 hours

We found a tiny minority of teams were practising Continuous Integration (and yes this included the Apples team from earlier). They had a *Build Failure Rate* of 0% and a *Failure Recovery Time* was less than an hour.

But a vast majority of teams were not practising Continuous Integration. *Build Failure Rate* was at 19% and *Build Recovery Time* was at 4 hours. One team had an average Recovery Time of 12 days. Which is an awfully long time for the builds to be red.

> Grapes team:
>
> Very few Build Failures.
>
> But the average time to resolve a Build Failure was 10 hours.

Again we used this information and go talk to the team. Have a good conversation. And we learned that their Acceptance Tests took 10 hours. When they are under pressure to produce builds, they simply did the build first and ran the Acceptance Tests afterwards.

Question: Acceptance Tests are part of the commit build?

What they viewed as an acceptable risk. But obviously when something went wrong, they had to go back and create a new build. So we send someone in the team to help them accelerate the Acceptance Tests to actually run them before creating artefacts.

### Build Throughput Indicator

- Build Lead Time: 0 hours
- Build Interval: 2 hours vs 2 days

Again we found a couple of teams average the *Build Lead Time* of 0 hours and they had a *Build Interval* of every 2 hours. If you are producing artefacts every 2 hours you are doing pretty well.

But a majority of teams weren't there yet, and an average *Build Interval* of 2 days is not too great. We had plenty of teams that needed help with their builds.

> Oranges team:
>
> Build Interval: improved from 4 days to 28 hours ... then regressed to 4 days

We spook to the team and found out they had a significant business event in the spring and they have been under pressure to produce as many builds as possible. So they just focussed on builds and improving builds.

The moment the business event past, they had to go off doing features again and the builds started to slight again.

So with this team, this was really powerful because we actually send someone to work with them and whenever they felt they went down about things, we could say "*we know you can do this, because you've done it before*".

## Code Indicator

Finally, I decided to go beyond builds and look at *Trunk Based Development* as well.

So during years Continuous Delivery practitioners have found individuals committing code to master more frequently, means you can build more frequently, means you can deploy more frequently.

I don't understand why this is so controversial. Jez says it is the most controversial thing he's ever spoken about. He liked to be parachuted into countries to talk about Trunk Based Development before ThoughtWorks.

Jez, Nicole and friends found that Trunk Based Development and Continuous Integration together are a statistically significant predictor of Continuous Delivery.

Question: Where is this mentioned in the paper ?

I believe we'll find at some point soon that Trunk Based Development itself is a statistically significant predictor of Continuous Integration.

Can't really do a *Code Stability* Indicator because Version Control Systems weren't serving that information to me very easily.

But you can do *Code Throughput*.

> **Code Throughput** = Mainline Commit Lead Time + Mainline Commit Interval

- **Mainline Commit Lead Time**: the time between you commit something to a branch and subsequently merge to master. If you go straight to master you get a score of zero (and you are my friend).
- **Mainline Commit Interval**: the average time and variation between commits to master.

## The Government Dept - 60 teams

**Vision of Success**:

Code Throughput:

- Mainline Commit Lead Time <= 0 hours (between branch to master)
- Mainline Commit Interval <= 24 hours (go to master at least once a day)
  Obviously this should be smaller for larger teams because everyone has to commit to master for Continuous Integration to happen.

How are we doing ?

When we looked at this, the numbers were pretty shocking.

- Mainline Commit Lead Time: 0 hours
- Mainline Commit Interval: 2 hours vs 5 days

We found that the teams that were practising Continuous Integration were committing to master every 2 hours. That's pretty good.

But the average of the cohort practising Discontinuous Delivery was 5 days.

Those teams are teams that we need to help. Especially those teams are going in the wrong direction and are perhaps experimenting with changes that worsen their situation.

> Pears team:
>
> This team wanted the Release Engineering team to allow them to build branches on the  build server.

They believed it would help their *Build Throughput* as well as their *Build Stability*. We patiently explained it would not help Build Throughput in other ways than to have Build Stability. Their request was declined, they were a little sad.

We looked at their Code Throughput together and we found out they had a pretty bad problem.

Average *Mainline Commit Lead Time* increased from 0 hours to 6 hours in 6 months.

Average *Mainline Commit Interval* increased from 4 to 27 days in 6 months. They are committing to master once a month.

I went to talk to the team lead and it turned out they've been asked to make sweeping architectural changes while continuing delivering features. Branching was the only solution they knew to do that.

They adopted Feature Toggles everywhere, their *Build Lead Time* came down, their *Build Interval* came down after this but they also had some Operability benefits from this: they had a situation where a third party supplier API stopped working in production, and before anyone could get into full panic mode, they simply said "oh let's turn off that toggle and just return some dummy data for that supplier until they can sort themselves out".

## Summary

I shared with you some stories from a 3 years, 60 teams program where Continuous Delivery got real traction.

Measuring Continuous Delivery did not tell us what decisions to make. It did tell us where to go to find the stories that will give us that information of a high value.

Who here wants to incrementally and interactively adopt Continuous Delivery? The Improvement Kata is a perfect fit for Continuous Delivery.

Who here wants a way to understand progress and make better decisions while adopting Continuous Delivery?

Continuous Delivery is really, really difficult. And often it is because you simply have a fog around you. You don't know what you are doing.

Measuring Throughput and Stability as Indicators (not just as measures), continuously measuring stuff, will give you powerful insights into your Continuous Delivery journey.
