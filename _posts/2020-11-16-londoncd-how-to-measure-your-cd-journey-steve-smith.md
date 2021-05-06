---
layout: note
title: How to Measure your CD Journey, Steve Smith
event:
  name: LondonCD
  date: 2017-02-28
author:
  name: Steve Smith
  twitter: SteveSmith_Tech
video: https://www.youtube.com/watch?v=wFRdYLcPwns
slides: https://speakerdeck.com/stevesmithcd/measuring-continuous-delivery
meta: 17 min read
created_at: 2017-03-22
date: 2020-11-16
published: false
category: notes
tags: [ Continuous Delivery ]
redirect_from:
  - /notes/20170228-londoncd-how-to-measure-your-cd-journey-steve-smith
---

Several criticism on Dave and Jez's book: Continuous Delivery is very valuable
but it is extremely difficult and the book do underplay how hard this thing is

## How do you know what to fix first ?

The thing that is missing in the CD book and that is hinted at in the Lean Enterprise book:
you should be measuring stuff.

I know that trunk based development is a good thing, I know that having devs on call is a good thing because I have been that person doing this. And then wondering why people had stopped listening to me after a year.

Because you get compliance, not commitment. To get commitment you need to measure stuff.

>Speed is essential because there is an opportunity cost associated with not delivering software" on time
>-- Dave Farley and Jez Humble

Originally the CD book talked about reducing cycle time.

Now Continuous Delivery is about improving the stability and speed of IT delivery. It is important to mention both of those things.  It is not just about speed.

You are in a state of Continuous Delivery when the stability and speed of your release process satisfies business demand. If you can't satisfy business demand you are in a state of Discontinued Delivery.

When an organisation successfully adopts Continuous Delivery is a wonderful experience because it can try out new product ideas and search for new revenue streams much faster than competitors. And that is a real business advantage.

But as Dave and Jez hinted in the book, that is very difficult to do as there is an awful thing to do. And that list has only grown over the past 7 years that the book came out.

Continuous Delivery is a holistic approach to improving time to market.
It requires a large number of technological and organisational changes.

The list of technology improvement that you need to adopt:

- version control
- automated configuration
- automated infrastructure
- deployment pipeline
- trunk based development
- continuous integration
- evolutionary architecture
- database migrations
- test driven development
- acceptance & smoke tests
- exploratory testing
- dynamic test data
- monitoring and alerting
- canary deployments

All of these things are very hard to do, they are vary valuable, rewarding, challenging.

After that (or before that) there is a long list of organisational changes to adopt:

- small batch size
- devolved decision making
- shared incentives
- blameless post-mortems
- everyone does on-call
- continuous change reviews
- traceability of changes
- upskill employees
- cross-functional teams
- conway's law alignment

which are much more time consuming and much more challenging and much more valuable then all the technical stuff.

Which one of these should you do first ?

There is no right answer. The heuristic of do monitoring first is a good one, but it is not always the right answer.

Anyone saying I know what you should do first is wrong. Because it is the technology changes, the organisational changes, it's the constraints and circumstances of your organisation together that makes Continuous Delivery so difficult. It is all those things together that you need to understand.

The way to figure out what you should do is to measure your CD adoption. And get insights into what you should be doing next and if the thing you're doing is actually taking you in the direction you want to go.

The CD book contains a maturity model. Using the maturity model to frame a training is a really good idea. Because in the context of a one or 2 day engagement it is a really good way to start up conversations.

But in the long term, I don't think the maturity model is good enough. It is like a checklist of practices. It is something that is very subjective. It is prone to bias. It is only one of the measures and it is very expensive because one has to sit down and actually do stuff and ticking off the checklist while doing it. This takes an awful amount of time. That would be great if we could automate this.

How can we automate that kind of stuff ?

### Example: A Government Dept

Team is responsible for delivery consulting and the release engineering toolchain and services for 60 teams.

When the team started out we didn't know an awful lot. We knew that every team had the same technology value stream between version control and production.

Exploratory testing happened locally.

Automated acceptance tests ran on the build environment.

There was an optional integration testing environment.

There was also a mandatory performance testing environment.

And then we went into production.

We wanted to evangelise CD to the 60 teams but we didn't actually know how long each team took to go to production. Some teams in London were going awfully fast, but some teams around the country that we didn't know all about and that we never spook to. And we didn't know which team to speak to first.

We did know that the usual suspects, the normal impediments that you often see in different companies weren't the problem. There was one automated release process for all of the teams. There was one value stream. There were minimal change approvals. You didn't have to tick boxes or have 35 sign-offs from different people. The teams were cross-functionals.

So the classical constraints were not a problem. So what were the constraints (there are always constraints). And we had absolutely no clue. Fortunately for me it wasn't the first time I measured things and I knew that wouldn't be the thing that we thought it was.

This was late 2014. We wanted a way to consistently introduce Continuous Delivery. And then the Lean Enterprise book came out that really advocated the Improvement Kata. So that is the direction we went in.

## The Improvement Kata, Mike Rother

It is a continuous improvement framework. It creates a regular cycle of iterative incremental improvements around the existing practices of your organisation. So you don't have to start changing the way that you work. You simply create structure around the way you already work to encourage a culture of experimentation.

1. Understand the Direction (What is our Vision ?)
   Create a vision of success to inspire people, to create a sense of urgency amongst people.

2. Grasp the Current Condition (What is our current state ?)
   You then analyse your quantitative and qualitative data to understand the progress you made so far.
  
3. Establish a Target Condition (What is our next step ?)
   You then create an improvement milestone. The next thing you want to aim for. You give it a success criteria. You give it a time horizon.

4. Iterate towards the Target Condition
   Then you use the Deming Cycle: Plan, Do, Check, Act

   You plan an experiment, you do it, you check the results, you incorporate it in your baseline if it is successful, you discard if it is not successful

So the Improvement Kata is completely aligned with the CD thought of small, regular changes.

Setting a direction for 60 teams was easier then you might think.
I published during lunch time "We are going to aim for everyone to deploy every 2 weeks". This was a really foolish thing to do, because it didn't got traction. And it wasn't urgent. That didn't really work.

But we refined over time. And a while later we published a thing noting that if you deploy earlier, defects would go down, and you deliver value faster. We backed that with data and that got a lot more traction.

So creating a direction is not that difficult, but there should be some kind of business urgency behind it to get peoples attraction.

The hard thing comes after that.

When you have 1 team or 60 how do you know you should focus on stability or speed next. How do you know what your next improvement milestone should be ? If you currently deploy every 6 month, should you aim for 1 month or 1 day or 3 month ? Once you decided upon that, what's the next thing you do, what's the next improvement, which technology or organisational change do you try to work towards that milestone.

With 1 team that's quite hard, with 60 teams that is even harder. How do you know which of the 60 teams you help first ? You have no clue and there is no point pretending that you know. The answer is that you are part of a complex ever changing system of which you and everyone else only have a limited amount of information. If you want to make better decisions, you have to reduce uncertainty and that is where measuring stuff comes in.

But what should you measure and how should you do it ?

Luckily Jez Humble and Nicole Forsgren did over the last years a lot of work for us. They published:

- State of DevOps reports
- The Role of Continuous Delivery in IT and Organisational Performance: a peer-reviewed academic research paper on Continuous Delivery

2015 State of DevOps report:

> => Organisations that are high performing, that deploy to production frequently were twice as likely to exceed market share, productivity and profitability.

Peer-reviewed academic research paper (this one makes the difference because it is less open for challenge):

> => When you adopt Continuous Delivery over a sustained period of time then Throughput and Stability will improve together.

They have proven what a lot of people have long suspected: the choice between features and stability is not a zero-sum game and that effectively every large consulting firm was lying to us for many, many years.

How did that help us measure stuff in Government ?

Jez and Nicole have always used the same metrics.

They have quantified:

**Stability** = Change Failure Rate  + Failure Recovery Time

- Change Failure Rate: how often a change goes wrong
- Failure Recovery Time: how long it takes to remediate a change that went wrong (hasn't worked)

**Throughput** = Change Lead Time + Change Frequency

- change Lead Time: how long it takes to make a change
- change Frequency: how often often you make changes

These are *Measures*: quantifications of a thing (an object or an event) at a single point in time.

But when we perform these measures over a sustained period of time at regular periods of time => they become *Metrics*.

=> we can create *Indicators*: weave these metrics together by applying the same Temporality to them

ex: Change Lead Time and Change Interval once every six month for a month and see how these metrics relate to one another.

It is this interaction between these metrics that allows you to see trends and problems in a domain.

We applied the measures to production deployments =>

**Deployment Stability indicator**: Deployment Failure Rate + Deployment Failure Recovery Time

**Deployment Throughput indicator**: Deployment Lead Time + Deployment Interval

Each time our release tool was used to do something in production it persisted snippets of data to a database. That database is the very gold mine.

If you are not persisting meta-data about your release process today, start doing it tomorrow. If you start tomorrow, or over a year from now, you are granted you want that data.
All you need:

- application name
- application version
- what you did
- when you started
- when you finished

We build an Indicator Service, and a couple of scripts. This collected the deployment data and exposed  the data as JSON and CSV.

CSV is used to dump the data into a spreadsheet and to prototype. So people get a proof of concept.

Once people were convinced, we used JSON and generated a lot of different graphs and put them on an internal website. So all of the teams could see the indicators for themselves.

We did all of this with some discs, some scripts and some charts. There were no new tools.

=> a tool agnostic solution !!!

A couple of scripts and a database of data, that is all you need.
Any tools you are currently using, you can carry on using to figure out what your deployment frequency is and how often things break.

Deployment Stability Indicator was composed of Deployment Failure Rate and Deployment Failure Recovery Time.

Deployment Throughput Indicator was composed of Deployment Lead Time and Deployment Interval.
With exception of Failure Rate, we measured average and variation for each of these (something we've build on top of Jez and Nicole's stuff). Because average and variation are very useful. 
We can then find out if the improvements or regressions are consistent and predictable and stable or if they are just a flash.

## Deployment Stability Indicator

**Deployment Failure Rate**: the percentage of production deployments that caused failures

**Deployment Failure Recovery Time**: the median and standard deviation in time between old???? production failures

### Deployment Failure Rate

One quirk: we planned to collect failure data by collecting it from the issue tracking system (JIRA, JIRA sucks but to be faire the data usage was not rich enough).

Alternative: use the hot-fix deployment as a proxy measurement for failures. The idea being that if you are doing a hot-fix deployment something has been broken.

=> calculated the percentages of hot-fix deployments to calculate the percentage of failed deployments

### Deployment Failure Recovery Time

Much easier. Just look at the time between deployments.

### What we found out over the 60 teams

Dan Norths once said: if you do a value stream mapping and you don't slap yourself in the face afterwards, than your measurements are wrong.

failure rate:

- 1 team never had production failure
- some teams had failures as often as in 1 in 3 production deployments

recovery time:

- some teams could respond to failures within a day
- one team needed up to 15 days to recover

This was a wake up call as we wanted to introduce Continuous Delivery.

Many people think Continuous Delivery is about speed.

You have to fix your stability problems first, before trying to go faster. Otherwise you are getting into pain quicker. But it will still be pain.

This helped us. We have 60 different teams that tell 60 different stories. You can't talk to all 60 teams.

Now we know:

- we want to talk to the team at zero to learn and amplify their success to help other teams learn how to achieve their success
- and immediately we want to go and see if we can help the teams that have a lot of production failures
- and we want to see if we can help the team that spent a fortnight (15days) to fix a problem in production

So we have some teams in Continuous Delivery and some teams in Discontinuous Delivery.

This indicator helps us pinpoint where we need to go to have the right conversations. It is not about using numbers to tell a story. This is what I call a ludic fallacy (the misuse of games to model real-life situations, Nassim Nicholas Taleb). It is about using your indicator to go and find out where stories need to be told are.

Apples team:
Median Deployment Failure Recovery Time and Deployment Failure Rate goes down
=> going towards Continuous Delivery

Jez and Nicole proved that Throughput and Stability improve together when you are getting Continuous Delivery right.

The team wasn't aware of how good they were at it.

We had to go back and ask them what they did during this period of time:

- automated their acceptance tests
- improved their production monitoring

we could now share those lessons with the other teams

That team also introduced Timebased Feature Toggles to be able to release features at midnight.

## Deployment Throughput Indicator

**Deployment Lead Time**: the time between creating a release artefact and deploying into production

**Deployment Interval**: median and standard deviation of time between production deployments

### What we found out over 60 teams

Deployment Lead Time: 1-26 days (26 days is pretty amazing when you don't have silo-ed teams, you don't have mandatory end-to-end tests, you don't have manual releases)

Deployment Interval: 1-58 days (58 days is a lot when other teams are deploying each day and you don't have the usual constraints)

This was a surprise.

Again these numbers show which teams we should speak to, which teams we need to learn from and which teams we can help.

Bananas team:

Deployment Lead Time and Deployment Interval were very good (below 8 days) and suddenly went up.

=> asked the team what happened: they had a number of departures in the team (a number of developers left the team on short notice), new team members still getting grips, and the team was still trying to retain the original deploy cadence.

But that is not how it works. If you have new team members, you have to slow down a bit before you can go fast again.

We did a value stream mapping with that team and we figured out their constraints was the Integration Test environment. It turned out the new team members didn't know that was optional. That was easily fixed.

That was a very unusual constraint. Something we didn't expect: a bunch of people that left the team.

We often did value stream mapping exercises with teams to help understand where they were loosing time, where waste is killing their value stream. We had very unusual things come up.

## Build Indicators

Jez and Nicole's original measures of Stability and Throughput can be reapplied to different aspects of the technology value stream. You don't have to use them only for deployments.

In their research they found that Continuous Integration is a statistically significant predictor of Continuous Delivery. It is kind of common sense: if you build things frequently it is possible to delivery things frequently. (one without the other would be interesting to watch from a distance ;) ).

We can take these indicators and just apply them to builds.

**Build Stability** = Build Failure Rate + Build Failure Recovery Time

**Build Throughput** = Build Lead Time + Build Interval

All we had to do is to update our Indicator Service to scrape information out of the Artefact Repository and out of the Version Control System. And again look at the median and standard deviation.

### Build Stability Indicator

- **Build Failure Rate**: the percentage of builds that failed (0-41%)
- **Build Failure Recovery Time**: the median and standard deviation of time to recover from the build failure. (0-291 hours or 12 days)

#### What we found out over the 60 teams

Build Failure Rate:

- some teams never had build failures.
- one team had 41% of their builds fail.

Build Failure Recovery Time:

- varied between 0 hours and 12 days. (is it something we need to fix in the build tool chain, or is it something in the team culture we can help about)

Grapes team:

very low Build Failure Rate (<20%).

but the Build Failure Recovery Time is very high, it was over 12 hours with a very low standard deviation (very low variation).

So that doesn't feel quite right: something doesn't fail very often, but when it does, it takes ages to fix and always the same amount of time.

In my experience when something infrequently fails, it is very hard to predict how long it takes to resolve.

So we spook to the team. There acceptance tests took over 10 hours to run and they didn't know there was a team available to help them.

They were under pressure to release at a certain date. So they build the artefact in advance and ran the acceptance tests after wards. If they failed, it took them that many time to rerun the acceptance tests which explains the long recovery time.

=> replaced the UI acceptance tests by API acceptance tests + unit tests, run acceptance tests in parallel => acceptance tests are ran on each build

### Build Throughput Indicator

- **Build Lead Time**: time between committing a change to master and creating an artefact (0 - 34 hours)
- **Build Interval**: time between creating build artefacts (15 - 1128 hours)

#### What we found out over the 60 teams

Build Lead Time:

- some teams needed 0 hours to build an artefact from master
- other teams needed 34 hours to build an artefact from master

Build Interval:

- for one team the build frequency was 15 hours (that was pretty good if you count in calendar days, building in the weekends)
- for one team it was 47 days between builds

Oranges team:

Build interval went from once every 4 days to each day and than suddenly went again.

We spook the team and found out: the team had a business event planned and they literally crunched work to go faster, after the event they let go and went back to their usual way of working.

Again we did a value stream mapping around there builds. Found out they had some issues around their UI acceptance tests. But they never said this can't be too hard or we can't do it, because we showed them the number. You've done it in the past, you've done this massive improvement in one month, only this time you'll do it without anyone saying you must do it.

## Code Indicators

Finally I decided to go further and apply the throughput indicator to code.

For years, Continuous Delivery practitioners have found out that individuals committing code to master at least once a day makes Continuous Integration much easier.

Continuous Integration is a practice in which every member of a team commits to master at least once a day.

Trunk Based Development is this other heresy (opinion profoundly at odds with what is generally accepted). Jez Humble says it is still the most controversial practice.

Trunk Based Development is not a heresy, it is just hard. You kinda forget how hard it is to get started with, just like TDD and Continuous Integration.

**Code Throughput** = Mainline Commit Lead Time + Mainline Commit Interval

- **Mainline Commit Lead Time**: time from committing to a branch and merging it to master (0-29 hours)
- **Mainline Commit Interval**: frequency in which you are merging to master (5-745 hours)

If you do Trunk Based Development you get 0 for Mainline Commit Lead Time as you are committing straight to main line.

### What we found out over the 60 teams

Mainline Commit Interval:

- one team was pushing to master every 5 hours
- one team had 31 days between commits to master

I advised Github Flow as branching strategy. It is a stepping stone towards Trunk Based Development. (they probably didn't know what was intended with it)

Pears team:

commit interval goes up from below 100 hours to more than 600 hours (every 4 days to 27 days)
lead time goes from 0 to 34 hours (between branch and master)

They were the team that wanted to build branches. They believed very strongly that building branches would speed up their build frequency.

We politely declined on the grounds that Continuous Delivery and our experience of other teams thought us you didn't need that.

When you have 60 teams and just one team asks "can I be different" why do the the other 59 teams do not need that.

The team had to do some big re-architecturing and still deliver new features. The way they found out to do this is by using branches and that doesn't work. The problem is until you never done it, you don't know that doesn't work.

We had a chat with them and told them about using Feature Toggles. And in the end it was a real operational benefit: they were able to turn off a feature that was supposed to use a new API that was late to be delivered.

## Summary

This is the result of 2,5 years and 60 teams using indicators.

Measuring Continuous Delivery didn't tell us what to do, but it did tell us where to go to find out what to do.

Whether you have 60 teams or 1 team, this is enormously powerful because the combination of the indicators is your quantified data and the conversations you have the qualified data. That delivers you very interesting insights on how you should be adopting Continuous Delivery in your organisation.
