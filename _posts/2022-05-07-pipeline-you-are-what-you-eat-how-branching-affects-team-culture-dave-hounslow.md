---
layout: note
title: You Are What You Eat - How Branching Affects Team Culture
event:
  name: FlowCon
  date: 2016-03-23
author:
  name: Dave Hounslow
  twitter: thinkfoo
video: https://learn.pipelineconf.info/2016/03/24/dave-hounslow-you-are-what-you-eat-how-branching-affects-team-culture-pipeline-conference-2016/
created_at: 2016-03-23
category: notes
tags: [ Continuous Delivery, Version Control ]
---

Your branching strategy is an extremely important choice to make. In this talk I hope to show how a change of branching strategy can actually change your team’s mindset. Specifically I look at a shift from a feature branching strategy to a trunk based strategy affected the team. In my view these changes were for the better and I guess most at PIPELINE will agree but I leave that for others to decide on this occasion.

---

What CD says:

every developer commits frequently to an always releasable Trunk or Mainline !

This is really the core of CD  !

At least once a day: this is really the bare minimum, it should be 3, 4, 5 commits a day

Customer: your-loop.com, devices for measuring electricity and gas consumption vendor independent.

They used  Git Flow as branching model (this is fairly conventional, a lot of people are using it, although very complex and complicated)
but they were working with a third party that was using SVN

They had the electricity device and wanted to add the gas measure.

Plan: 3-6 month feature branch for gas

The plan:

- feature planning
- 4 weeks iterations
- release 3-4 months

=>

- mainline development
- 2 weeks iterations
- release frequently

Questions:

- Regression testing?
- Code reviews?
- ...

## Testing

must be automatic !!

because you are using feature branches, it pushes you down the path of manual regression testing

## Code Reviews

"*Please hold, your pull request is important to us.*"

because of feature branches, you tend to switch between features (context switching), takes more time, you feel you need to have code reviews to make sure everything is ok.

if you are committing to mainline every hour or so, this quite resembles pair programming.

=> with pair programming you do not need code reviews

The code base would not be good because we are rushing things.

Refactoring is really hard and really important: one person was really reluctant, because he wanted to make sure everything is ok before committing. But he had a aha moment by trying to split up the work.

"*This is awesome, I can refactor without upsetting my team mates*"

Really important to have these big radiator screens with the status of the CD pipeline.

A high performant CD team is much like a F1 car in the pit stop !

## Today

1000% more productive

The result:

If you are using Feature Branches, you run the risk of "Doing Agile".

**If you are using CD + TBD, you will "Being Agile"**.

## Questions

### How did pairing influence velocity ?

we did not measure velocity

The problem with story points: how can we improve velocity ? hehe we make the stories smaller.

=> the customer had the impression we did better

![How to improve velocity?](https://www.modernanalyst.com/Portals/0/Public%20Uploads/Fin648-increase-agile-sprint-velocity.jpg)
