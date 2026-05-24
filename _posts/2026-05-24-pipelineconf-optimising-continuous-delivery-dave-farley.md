---
layout: note
title: Optimising Continuous Delivery
event:
  name: Pipeline Conf
  date: 2018-03-20
author:
  name: Dave Farley
  linkedin: dave-farley-a67927
  mastodon: '@davefarley77@techhub.social'
created_at: 2018-03-20
video: https://www.youtube.com/watch?v=gDgAVqkFYWs
category: notes
tags: [ Continuous Delivery ]
---

The deployment pipeline is a central idea in Continuous Delivery. It represents the channel through which ideas inside your business flow to the outside world so that they can be delivered to your users in the form of working software. First steps in creating a working deployment pipeline are very rewarding. They help to improve the quality of the software that you create and usually lead to happier users.

As teams mature in their adoption of Continuous Delivery though, the pipeline often begins to slow. We have more tests, we are testing more complex things, our software becomes more complex and more difficult to deploy.

How do we address these growing pains? What are the next steps, beyond the CD beginner’s basic automation? How do we optimise our pipelines to meet our needs as these needs grow?

This talk will address the growing pains in Continuous Delivery and describe some strategies to cope with them.”

---

Faster is better

## What do we really want ?

idea => get it in the hands of our users and find out on how they use it

we optimise to get fast feedback => a repeatable reliable process to deploy software

If you employ an empirical approach on solving problems you drive out pretty much all of agile methodologies, devops principles ...

## What is the Scope of a Deployment Pipeline ?

a question I get regularly from my clients

we want the whole thing: we want an independently deployable thing

maybe we have a different system that consists of multiple independently deployable things
=> easy to add new things without impact on the system as a whole

Scope of a Deployment Pipeline is an independently deployable unit.

## Where to Test - Branching ?

feature branches: any testing happening earlier before the merge doesn't make sense, it only makes sense to test after the merge
=> deferring feedback, it takes longer to get feedback

we can test on the branch, but then we never test what gets into production

Feature Branches should be an exception when we cannot cope with the situation.

My advice to branching strategies:

```plain
don't branch
Don't Branch
DON'T BRANCH
```

## The Pipeline is a Strategic Resource

- it is our only channel to production
- all change in production flows through it
- so if it breaks or goes slow, the impact is enormous

## Pipeline Problems

- slow commit stage
- slow acceptance stage
- failing tests
- intermittent tests
- pipeline changes

### Slow Commit Stage

commit stage:

- compile
- unit test
- analysis
- build installers

Ideal feedback cycle for this stage **< 5min**

good reason: when I make a change, if it takes longer than 5min, I tend to do something else
=> developers start to defer the commit

The commit stage is the most valuable Feedback-cycle in the Pipeline.
=> it is worth investing time, energy and money to this stage

#### Slow Commit Stage - Compilation

simple solution:

- buy faster hardware
- parallelise the build

decompose your system into independent modules or services: each with it's own pipeline

but there are some dangers here:

- This is not as easy as it first seems
- Dependency Management is one of the really HARD problems in Computer Science.

Micro Services is no "Silver Bullet": if you test your micro services together because you don't trust it, you're not doing micro services. Run your microservice pipelines independent of each other. If you're building services independently.

**Remember: Independently Deployable Units**

Look at a modern build system: Gradle, Bazel, Buck, ...

Try running the build from RAM Disk: good for I/O bound compilation cycles e.g. C, C++

again: this is a good place to invest engineering time

### Slow Commit Stage - Testing

look to your tests !

commit tests should be mostly pure unit tests

- don't start the app
- don't write to disk
- don't write to the DB
- don't use the network
- fake external dependencies

accept slow tests grudgingly

always think about efficiency when writing tests

- use chicken counting (0, 1, many): don't have tests that do thousands of loops, if you iterate over a loop, loop 3 times
- use mocks & stubs

If a test never catches a bug, maybe have a think of if it's useful

run tests in parallel

- if this is difficult, your test isolation is poor - fix it

as a last resort: if you still can't get it performant, only then think of moving the test in a later stage

#### Slow Commit Stage - Analysis

static analysis can give valuable feedback

it needs to pay for itself though: if the analysis doesn't catch bugs, drop it !!

as a last resort: move the analysis out of the commit stage

as a last last resort: give up ! move analysis out of the pipeline

shortness of the feedback is more important

#### Slow Commit Stage - Installers

we want to test Release Candidates that may make it to production

if creating installers is slow, move it out of Commit Stage

this is fine because creating installers is not usually what creates problems

Human CI

...

CD is about optimising your process to keep the software in a releasable state

That means pipeline failures stop the line and fix it

### Commit Strategies

optimisation: gated CI: we commit to the commit stage if the tests pass the commit stage commits into our version control system

Performance of the Commit Stage matters

Teams with a fast Commit Stage keep the build green

...

## Slow Acceptance Tests

acceptance test stage

- configure env
- deploy in acc env
- smoke test/health check
- acceptance test

ideal feedback cycle for this stage **< 45 min**

=> I now have 5 to 6 attempts to fix a failing acceptance test

=> much more probability of keeping the tests green

### Slow Acceptance Tests - Configure Env

consider rates of change of different layers: OS changes less often than the app

consider the use of Containers

### Slow Acceptance Tests - Deploy

successful deployment ends with a running, working system

so for efficiency we need to consider

- time to deploy
- time to migrate data
- time to start the system
- time to validate the system

#### Time To Deploy:

- keep deployable artefacts lean: keep the stuff you need and remove the stuff you don't need
- packaging strategy can make a big difference (layering in containers)
- think about network/infrastructure constraints at deployment time: think about what you need, think about caching strategies
- minimise data-sets, where you can: I am not a big fan of production data in acceptance env.
- consider better modularisation - Independently Deployable services

#### Time To Start the system

- minimise startup dependencies & ordering
- invest in optimising the code executed during startup - make it efficient !

### Slow Acceptance Testing - Testing

There is a common cycle:

- teams start writing acceptance tests and run them all sequentially
- as number of Acc Testing increases the time they take to deliver feedback lengthens
- Teams paralyse Acc Testing tactically
- Teams move to more strategic (automated)  ...

Treat Acceptance Test isolation seriously from day one !

we don't have ordering problems of our tests, we don't have sharing problems.
=> makes scaling up easy

## Failing Tests

The efficiency of the feedback cycle is central to the ability of a team to keep tests green !

high performance trading company using C++: build lead time from 9h to 12m (we measured everything, we used RAM disks, ...)

from then on: every single build had green tests

Continuous Delivery is about: Keeping the build in a releasable state

=> priorities fixing tests

=> reduce the lead time and this will help

## Intermittent Tests

Some CI systems even support running failing tests several times !! Why???

- if the test passes once and fails once how do you know which result is correct ?

Treat intermittent tests as failing tests

Last Resort: if you can't fix it, is it really worth keeping it ?

Common Causes:

- race conditions
- poor test isolation
- poorly designed ..
- ...

## Finally Pipeline Changes

traditionally: CD tools are really poor at version control

**remember: the deployment pipeline is a strategic resource**

consider SLA's for the pipeline changes

the pipeline is a complex system in its own right
=> acceptance tests for the pipeline and a deployment pipeline for the pipeline

Consider writing test cases for some pipeline behaviours

Consider Blue/Green deployment strategies for pipeline changes

Use "Infrastructure as Code" for all pipeline

And do take it seriously: consider the pipeline as the only route to production

## Continuous Delivery as Competitive Advantage

it is not about the technical practices, it is about evaluating ideas in the hands of the users

=> learn, adapt, refine and exceed expectations

## Questions

### What do you think of Property Based Testing ?

I am not a big believer of Property Based Testing

I have the feeling that people use it because they don't do TDD properly.

it seems to be there to optimise typing, I prefer optimise thinking

### Acceptance Testing

at ThoughtWorks: a quite large amount of people didn't liked what Jez and I were writing about

you tent to over test things using Acceptance Testing
