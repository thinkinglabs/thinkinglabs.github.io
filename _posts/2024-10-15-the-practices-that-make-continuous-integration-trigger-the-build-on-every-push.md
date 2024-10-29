---
layout: article
title: The Practices That Make Continuous Integration - Trigger the Build on Every Push
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-trigger-the-build-on-every-push.jpg
---

Continuous Integration is a practice that ensures always working software on mainline and gives us feedback within minutes as whether a change broke the application or not. To guarantee that the mainline is in a releasable state at all times, we need to verify every single commit. Therefore, every push to a remote mainline triggers an automated build and execution of all the automated tests.

---

We say a team is in a state of Continuous Integration when:

>- [Everyone in the team (or every pair) commits at least once a day to mainline, leading to multiple integrations per day for the whole team.]({% post_url 2024-09-16-the-practices-that-make-continuous-integration-push-every-day %})
>- **Every commit to mainline triggers an automated build and execution of all automated tests.**
>- [Whenever the build fails, the team can fix it within 10 mins.]({% post_url 2024-10-17-the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes %})
>
>-- [Jez Humble](https://bsky.app/profile/jezhumble.net)

![Trigger the Build on Every Push](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-trigger-the-build-on-every-push.jpg)

To certify our systems are invariably working and releasable it is paramount to verify each and every commit. Therefore, we mandate that every push to a remote [*Mainline*](#mainline) triggers an automated build. Now, To *Trigger the Build on Every Push*, it visibly involves [*Automate the Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-11-automate-the-build). Where the build includes

- compiling the code,
- executing all automated tests,
- optionally performing any linting and Static Application Security Testing (SAST) and
- finally producing a binary build artefact that will later be deployed in the different environments.

Be aware that *Automate the Build* does not thereby involve having a centralised build server. This assuredly helps but it is not a necessity. *Automating the Build* is really about having a versioned Build Script.

But, if we do not have a centralised build server, how can we possibly trigger the build on every push? Continuous Integration is first and foremost a [human process](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day). Whenever we [Commit on Green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green) and push after the successful [*Run of the Local Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build), we pull the latest code from the remote repository on an integration machine and again execute the build script on that integration machine to verify the integration. If the build passes, tada, the integration is done. If not, we [revert the last commit]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working%}#practice-4-revert-when-broken).

Admittedly, having a centralised build server helps. I give you that. Regrettably, many teams falsely assume they practice Continuous Integration because they have a centralised build server set up. If truth be told, it is often only [CI Theatre](https://www.thoughtworks.com/radar/techniques/ci-theatre). Hence, they miss out on all the benefits that true Continuous Integration brings.

Every time we push to the remote *Mainline*, the centralised build server clones the remote repository, checks out the code and executes the build script as part of the [*Commit Build*](#commit-build). Because of [*Agree as a Team to Never Break the Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build) it is only once the *Commit Build* turns green that a Software Engineer can move on with new work. This means, that when integrating code there are two builds involved: a Local Build and the *Commit Build*. So, when a build takes five minutes to run, an engineer waits for ten minutes. This puts a gentle pressure to [*Have a Fast Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build).

When the build is slow, teams lean towards practising *asynchronous integration*.  They commit and push to a remote branch without *Running a Local Build* and disregarding [*Commit Only on Green*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green). Instead of waiting for the central *Commit Build* to complete and tests to succeed, they start the next task immediately after triggering the remote build. But, asynchronous integrations tend to introduce abundant work in progress and context switching. If the build breaks, the desire to keep working on the ongoing task overrides the need to fix the broken build. If on the other hand, the push happens straight into the remote *Mainline*, having broken builds for extended periods is real and thus violates *Agree as a Team to Never Break the Build*. Consequently, teams ought to practice *synchronous integrations*.

By *Triggering the Build on Every Push*, when a fault is detected we know it was introduced in the latest push. This reduces the amount of code where to look for to fix the problem. To narrow this even more down, it is essential to [*Make all Changes in Small Increments*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-5-make-all-changes-in-small-increments) and [*Commit Frequently*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-6-commit-frequently). With [Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development), that should happen every few minutes.

One more thing, **the centralised build server monitors and verifies the remote *Mainline***. While running an automated build against branches is a good thing to hold, it is not Continuous Integration. At this point, we are not integrating. We only demonstrate that the isolated code on the branch works. However, we do not have any feedback on whether this code integrates with all other parallel branches, meaning when bringing all the branches together does the code still work, and do we still have a releasable, working application? The whole point of integration is to prove all commits coexist on a single main branch from where builds are created that feed into a deployment pipeline.

## Bibliography

- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
- [Continuous Integration Certification](https://martinfowler.com/bliki/ContinuousIntegrationCertification.html), Martin Fowler
- [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day), James Shore
- [The Art of Agile Development](https://www.goodreads.com/book/show/1654215.The_Art_of_Agile_Development), James Shore

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. [Team working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %})
2. [Coding for Continuous Integration]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %})
3. [Building for Continuous Integration]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %})
4. [Make the Build Self-Testing]({% post_url 2024-09-15-the-practices-that-make-continuous-integration-make-the-build-self-testing %})
5. [Push Every Day]({% post_url 2024-09-16-the-practices-that-make-continuous-integration-push-every-day %})
6. Trigger the Build on Every Push
7. [Fix a Broken Build within 10 Minutes]({% post_url 2024-10-17-the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes %})
8. [Have Reliable Tests]({% post_url 2024-10-19-the-practices-that-make-continuous-integration-have-reliable-tests %})
9. [Broadcast the Codebase's Health]({% post_url 2024-10-29-the-practices-that-make-continuous-integration-broadcast-the-codebase-health %})

## Definitions

### Mainline

The Mainline is the line of development in Version Control which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The Commit Build is a build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at a minimum compiling the sources, running a set of [*Commit Tests*](#commit-tests), and building a binary artefact for deployment.

### Commit Tests

The Commit Tests comprise all of the Unit Tests along with a small simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback.
