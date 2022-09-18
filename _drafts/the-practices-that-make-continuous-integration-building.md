---
layout: article
title: The Practices That Make Continuous Integration - Building for Continuous Integration
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

In [part 1 - Team Working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}) we looked into the team practices that make Continuous Integration. In part 2 - Coding for Continuous Integration we explored the engineering practices that make Continuous Integration. Now, in this last part, we are going to investigate what are the practices a team needs to implement to improve their builds so that they can, in effect, reach a state of Continuous Integration.

---

## Practice 11: Automate the Build

It should be possible for every new team member to check out the code from
Version Control, build the application and run all automated tests using a
single command, the build script, from the command-line.

The commit build on the centralised build server will use the exact same build
script.

The build script is treated the same way as the production code. It is
versioned, tested and constantly refactored. The same design principles () apply
to the build script to keep it simple and easy to understand.

The build script ensures a deterministic, repeatable, consistent and reliable
build that can be executed over and over again without any side effects.

This build script needs to produce a single unambiguous result: it is either
SUCCESS or FAILURE.

Finally, the build script is a prerequisite to *Run a Local Build*, a required
practice to prevent broken builds and keeping the software always working. In
the end increases productivity and thus throughput of the IT-delivery process
and time to market. It also increases team morale and drives down burnout.

This is the second and last tool you actually need to achieve Continuous
Integration.

## Practice 12: Run a Local Offline Build

---
Comment: developer should be able to run the build when offline.

---

To perform on-demand production releases at any given moment in time, it
requires to have an always working software application. This
means the team needs to prevent broken builds. Meaning everyone
in the team has to run a local private build before committing into mainline.

Running a *Local Build* means:

- refreshing the local workspace by obtaining the latest changes from mainline,
- executing the build script,
- when the build script says SUCCESS, we are ready to commit into mainline.

The *Local Build* is exactly the same as the *Commit Build* performed by the
[Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline)
or the central build server.

The *Local Build* integrates the local work with the work all other
team members made available on mainline. It will detect any
conflicts between local changes and remote changes. Not doing so, will defer
this conflict detection to the *Commit Build*. As a result, this will
introduce a broken build. Inevitably, this will hamper the team, impacting
the throughput of IT-delivery and time to market.

Upon commit the *Commit Build* gets triggered where the code will again get
compiled and commit tests get rerun.

The team member that triggers the *Commit Build*, should monitor the build's
progress and not start any new task until the commit tests pass successfully.

*Run a Local Build* and monitor the *Commit Build* before moving on, are a
strong argument for *Have a Fast Build* to optimise engineering time.

## Practice 13: Have A Vast Amount of Automated Tests

--> comment from Seb Rose: How many is vast? If you have lots of tests, does that automatically mean you have the right tests? I would rephrase this.

If we don't have an automated test suite, the only information we get from
running the build is whether the code compiles and whether a binary artefact for
deployment was created. We do not receive any feedback on whether a change
broke the application or not.

In that case, the only way of knowing if the application still works is by
relying on time-consuming, repetitive, boring manual regression testing. This is
a waste of time, energy and the value of test engineers.

Because we now depend on time-consuming manual testing, we cannot *Commit
Frequently* any more into mainline. As a consequence, we are starting to batch up
work. From lean manufacturing, we know that big batches drive down throughput
and time to market.

To gain confidence we are not breaking any existing functionality while
committing very frequently into mainline, we thus need a vast amount of
automated tests. Test engineers will be of great value here. They can help
design the acceptance criteria for the automated tests.

In implementing automated tests, we should consider 3 types of tests:

- *Unit Tests*: These should be the largest part of the automated test suite. We
  are speaking 100s or 1000s of them. They should run in less than 30s.
- *Integration Tests*: They should test the *Adapters* (from *Ports and
  Adapters*). These may hit the database, file systems and other systems. They
  will take longer to run, so we want to limit these.
- *Automated Acceptance Tests*: They test the application in isolation with a
  database and a front-end as if it was a user using the application. We should
  have 100s of them. Their total execution time is less than 10min.

Going the extra mile towards Continuous Delivery, we would also have
*Smoke Tests*. These are a very limited set (1-5) of end-to-end tests that
execute your most important transactions to check everything works as expected
right after the deployment of a new release. They take less than 5min.

During the *Local Build* and *Commit Build* only Unit Tests are executed
together with a small simple smoke test suite. This smoke test suite performs
a few simple Integration and Acceptance Tests to make sure the most commonly
used features are not broken. To commit frequently into mainline, we need to
run these tests repeatedly. Therefore, they should be very fast. The rest of the
Integration Tests and the Automated Acceptance Tests will run in later
build stages of the Deployment Pipeline or the central build server.

## Practice 14: Have a Fast Build

--> comment: impacts how fast you can fix a broken build, should be fixed within 10 mins

If everyone in the team wants to commit multiple times per day into mainline,
the *Local Build* has to be very fast. Because to prevent breaking the build,
we need to execute this local build before committing into mainline.

When the build is slow, two things may happen:

- Either people tend to not execute the Local Build before committing into
  mainline.

  From then on, they run the risk of introducing regressions and having a broken
  build for an extended period of time. Preventing on-demand production releases
  which will impact their delivery throughput and time to
  market.

- Or people tend to execute the build less often.

  From then on, batch work is introduced. When you build less often, you will
  commit less frequently into mainline as you are supposed to only commit after
  running a successful local build and having all tests green.
  
  This batch work initiates larger changesets. Larger changesets introduce
  higher risks. Your build will have to process a large changeset. If the build
  happens to break, finding the root cause will take a far longer time. So they
  run the risk of having a broken build for long period of time. From then on,
  they have lost the monitoring of the health of their application impacting the
  quality of the software. From then on, they have again also lost the ability
  to perform on-demand production releases, which again impacts throughput and
  time to market.

  Batch work also delays feedback. Delaying feedback drives quality down. Bad
  quality will impact the use of software engineering time to introduce
  new changes. Again this impacts throughput and time to market.

But what is a fast build?

Twenty years ago Extreme Programming suggested the build should take no longer
than 10 minutes.

Dave Farley advises in
[Optimising Continuous Delivery](https://www.youtube.com/watch?v=gDgAVqkFYWs)
we keep the *Commit Build* under 5min.

To conclude, 10 minutes is the limit, everything under 5 minutes is better,
90 seconds is nirvana.

Take into account that every integration takes two builds: one local and
one central commit stage build. We should wait for the central *Commit Build* to
be successful before moving on because you can never let the build break. One
more reason to keep the build short.

*Have a Fast Build* seem to contradict with *Have a Vast Amount of Automated
Tests*. The first thing to consider is to make tests run faster. Second, at some
point we will need to split the tests in several stages. We first run the
fastest tests during the *Commit Build*. Longer running tests are ran later.

## Conclusion

As we can see, Continuous Integration is really not a tooling problem. Many practices are involved to achieve Continuous Integration as a team.

Each practice is valuable. Each practice is an enabler of Continuous Integration. But no single practice exists on its own. They are all tangled.
Each practice amplifies the benefits of the others. Which makes it very hard select which practice to adopt first, which practice to adopt next. This depends on the unique context and circumstances of our team. Therefore, use the [Improvement Kata](http://www-personal.umich.edu/~mrother/The_Improvement_Kata.html) to kick-start a Continuous Integration program.

Because of all the benefits put forward on each and every practice, Continuous Integration will improve quality and throughput of IT changes.

## Acknowledgments

## Bibliography

- [Software Configuration Management Patterns](https://www.goodreads.com/book/show/367720.Software_Configuration_Management_Patterns), Steve Berczuk with Brad Appleton
- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, Jez Humble and Dave Farley
- [Continuous Integration](https://www.goodreads.com/book/show/1311542.Continuous_Integration) book, Paul Duval
- [Feature Branching is Evil]({% post_url 2016-10-29-feature-branching-considered-evil %}), Thierry de Pauw

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. [Team working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %})
2. Coding for Continuous Integration
3. Building for Continuous Integration

## Definitions

### Commit

In the context of Distributed Version Control Systems (DVCS), when I say commit I honestly mean *commit-and-push*.

### Mainline

The line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at a minimum compiling the sources, running a set of *Commit Tests*, and building a binary artefact for deployment.

### Commit Tests

All of the Unit Tests together with a small simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback on.
