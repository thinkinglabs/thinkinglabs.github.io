---
layout: article
title: The Practices That Make Continuous Integration - Building for Continuous Integration
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

In [part 1 - Team Working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}) we looked into the team practices that make Continuous Integration. In [part 2 - Coding for Continuous Integration]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}) we explored the engineering practices that make Continuous Integration. In this last part, we investigate the required practices for a team to succeed with Continuous Integration, i.e. which are the building practices and how to improve builds to support all the coding practices and in particular [Make Changes in Small Increments]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-5-make-changes-in-small-increments) and [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-6-commit-frequently).

---

## Practice 11: Automate the Build

It should be possible for every new team member to check out the code from Version Control, build the application and run all automated tests using a single command, the build script, from the command-line.

The [*Commit Build*](#commit-build) on the centralised build server will use the exact same build script.

The build script is treated the same way as the production code. It is versioned, tested and constantly refactored. The same design principles (e.g. [Simple Design](https://wiki.c2.com/?SimpleDesign), [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single-responsibility_principle), abstractions, small files, small methods, ...) apply to the build script to keep it simple and easy to understand.

The build script ensures a deterministic, repeatable, consistent and reliable build that can be executed over and over again without any side effects. It is [idempotent](https://en.wikipedia.org/wiki/Idempotence).

This build script needs to produce a single unambiguous result: it is either SUCCESS or FAILURE.

Finally, the build script is a prerequisite to [*Run a Local Build*](#practice-12-run-a-local-build), a required practice to prevent broken builds and keeping the software always working. In the end, it increases productivity and thus throughput of the IT delivery process and time to market. It also increases team morale and drives down burnout.

This is the second of two practices that verily need a tool to implement the practice. The other practice being [Version Control Everything]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-1-version-control-everything) that introduces the Version Control System.

## Practice 12: Run a Local Build

---
Comment: developer should be able to run the build when offline.

---

To perform on-demand production releases at any given moment in time, it requires to have an always working software application. This means [*Agree As a Team To Never Break The Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). Meaning everyone in the team has to run a local private build before [committing](#commit) into [*Mainline*](#mainline).

Running a *Local Build* means:

- refreshing the local workspace by obtaining the latest changes from *Mainline*,
- executing the build script,
- when the build script says SUCCESS, we are ready to commit into *Mainline*.

The *Local Build* is exactly the same as the [*Commit Build*](#commit-build) performed by the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server.

The *Local Build* integrates the local work with the work all other team members made available on mainline. It will detect any conflicts between local changes and remote changes. Not doing so, will defer this conflict detection to the *Commit Build*. As a result, this will introduce a broken build. Inevitably, this will hamper the team, impacting the throughput of IT delivery and time to market.

Upon commit the *Commit Build* gets triggered where the code will again get compiled and [*Commit Tests*](#commit-tests) get rerun.

The team member that triggers the *Commit Build*, should monitor the build's progress and not start any new task until the commit tests pass successfully.

*Run a Local Build* and monitor the *Commit Build* before moving on, are a strong argument for [*Have a Fast Build*](#practice-14-have-a-fast-build) to optimise engineering time.

## Practice 13: Have A Vast Amount of Automated Tests

---
Comment from Seb Rose: How many is vast? If we have lots of tests, does that automatically mean we have the right tests? I would rephrase this.

---

If we do not have an automated test suite, the only information we get from running the build is whether the code compiles and whether a binary artefact for deployment was created. We do not receive any feedback on whether a change broke the application or not.

Remember, the purpose of Continuous Integration is to ensure always working software and **receiving feedback within minutes on whether a change broke the application or not**.

In that case, the only way of knowing if the application still works is by relying on time-consuming, repetitive, boring manual regression testing. This is a waste of time and energy. More over, it is a waste of the value of test engineers and might introduce burn-out due to either boring work or being pressured to execute manual testing within an impossible time frame.

Because we now depend on time-consuming manual testing, we cannot [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-6-commit-frequently) any more into [*Mainline*](#mainline). As a consequence, we are starting to batch up work. From [Lean Manufacturing](https://en.wikipedia.org/wiki/Lean_manufacturing), we know that big batches drive down throughput and time to market.

To gain confidence we are not breaking any existing functionality while committing overly frequent into *Mainline*, we thus need a vast amount of automated tests. Test engineers will be of great value here. They can help design the acceptance criteria for the automated tests.

In implementing automated tests, we should consider 3 types of tests:

- *Unit Tests*: These should be the largest part of the automated test suite. We are speaking 100s or 1000s of them. They should run in less than 30 seconds.
- *Integration Tests*: They should test the *Adapters* (from [Ports and Adapters](https://alistair.cockburn.us/hexagonal-architecture/)). These may hit the database, file systems and other systems. They will take longer to run, so we want to limit these.
- *Automated Acceptance Tests*: They test the application in isolation with a database and a front-end as if it was a user using the application. Often these are implemented using [Behaviour-Driven Development](https://cucumber.io/docs/bdd/) techniques. We should have 100s of them. Their total execution time is less than 10 minutes.

Going the extra mile towards Continuous Delivery, we would also have *Smoke Tests*. These are a restricted set, usually 1-5, of end-to-end tests that execute your most important transactions to check everything works as expected right after the deployment of a new release. They take less than 5 minutes.

During the *Local Build* and [*Commit Build*](#commit-build) only Unit Tests are executed together with a small simple smoke test suite. This smoke test suite performs a few simple Integration and Acceptance Tests to make sure the most commonly used features are not broken.

To commit frequently into *Mainline*, we need to run these tests repeatedly. Therefore, they should be expeditious. The rest of the Integration Tests and the Automated Acceptance Tests will run in later build stages of the *Deployment Pipeline* or the central build server.

## Practice 14: Have a Fast Build

---
Comment: impacts how fast we can fix a broken build, should be fixed within 10 mins

---

If everyone in the team wants to commit multiple times per day into [*Mainline*](#mainline), the *Local Build* has to be prompt. To prevent breaking the build, we need to execute this *Local Build* before [committing](#commit) into *Mainline*.

When the build is slow, two things may happen:

- Either people tend to not execute the *Local Build* before committing into *Mainline*.

  From then on, we run the risk of introducing regressions and having a broken build for an extended period of time. In turn, this prevents on-demand production releases to happen. Consequently, this impacts the delivery throughput and time to market.

- Or people tend to execute the build less often.

  From then on, batch work is introduced. When we build less often, we will commit less frequently into *Mainline* as we are supposed to only commit after running a successful Local Build and having all tests green.
  
  This batch work initiates larger changesets. Larger changesets introduce higher risks. Our build will have to process a large changeset. If the build happens to break, finding the root cause will take a far longer time. Therefore, we run the risk of having a broken build for long period of time. From then on, we have lost the monitoring of the health of our application impacting the quality of the software. From then on, we have again lost the ability to perform on-demand production releases, which again impacts throughput and time to market.

  Batch work also delays feedback. Delaying feedback drives quality down. Bad quality will impact the use of software engineering time to introduce new changes. Again this impacts throughput and time to market.

But what is a fast build?

Twenty years ago [Extreme Programming](http://www.extremeprogramming.org/) suggested the build should take no longer than 10 minutes.

Dave Farley advises in [Optimising Continuous Delivery](https://www.youtube.com/watch?v=gDgAVqkFYWs) we keep the [*Commit Build*](#commit-build) under 5 minutes.

To conclude, 10 minutes is the limit, everything under 5 minutes is better, 90 seconds is nirvana.

Take into account that every integration takes two builds: one local and one central commit stage build. We should wait for the central *Commit Build* to be successful before moving on because we can never let the build break. One more reason to keep the build short.

*Have a Fast Build* seem to contradict with [*Have a Vast Amount of Automated Tests*](#practice-13-have-a-vast-amount-of-automated-tests). The first thing to consider is to make tests run faster. Second, at some point we will need to split the tests in several stages. We first run the fastest tests during the *Commit Build*. Longer running tests are ran later.

## Conclusion

These building practices do not look like, but they are quite important. They support both the [Team Working]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}) and [Coding]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}) practices that enable Continuous Integration. Failing to implement these building practices will surely fail to implement the other practices and therefore fail to reach Continuous Integration.

This closes this series. As we can see, [Continuous Integration is really not a tooling problem]({% post_url 2020-03-23-continuous-integration-is-not-a-tooling-problem %}).

Many practices are involved to realise Continuous Integration. Each practice is valuable. Each practice is on its own an enabler of Continuous Integration. But no single practice exists on its own. They are all tangled.

Each practice amplifies the benefits of the others. Which makes it very hard to select which practice to adopt first, which practice to adopt next. This depends on the unique context and circumstances of our team. Therefore, we should use a Continuous Improvement framework that takes context into account. use the [Improvement Kata](http://www-personal.umich.edu/~mrother/The_Improvement_Kata.html) to kick-start a Continuous Integration program.

Because of all the benefits put forward on each and every practice, Continuous Integration will improve quality and throughput of IT changes. Dr. [Nicole Forsgren](https://twitter.com/nicolefv) and [Jez Humble](https://twitter.com/jezhumble) proved in their 2016 academic reviewed paper [The Role of Continuous Delivery in IT and Organizational Performance](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2681909) that Continuous Integration together with Trunk-Based Development are statistically significant predictors for adopting Continuous Delivery. In turn, Continuous Delivery predicts higher IT delivery performance. Together with the adoption of Lean Product Management and a [Generative Organisational Culture](https://cloud.google.com/architecture/devops/devops-culture-westrum-organizational-culture), they predict higher organisational performance.

To conclude, if you want to be ahead of your competition, not adopting these practices is just not an option.

## Acknowledgments

## Bibliography

- [Software Configuration Management Patterns](https://www.goodreads.com/book/show/367720.Software_Configuration_Management_Patterns), Steve Berczuk with Brad Appleton
- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, Jez Humble and Dave Farley
- [Continuous Integration](https://www.goodreads.com/book/show/1311542.Continuous_Integration) book, Paul Duval
- [The Role of Continuous Delivery in IT and Organizational Performance](<https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2681909>), Dr Nicole Forsgren and Jez Humble
- [Feature Branching is Evil]({% post_url 2016-10-29-feature-branching-considered-evil %}), Thierry de Pauw

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. [Team working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %})
2. [Coding for Continuous Integration]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %})
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