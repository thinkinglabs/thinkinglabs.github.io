---
layout: article
title: Continuous Integrations! Where to start?
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/continuous-integration-where-to-start/continuous-integration-where-to-start.jpg
redirect_from:
- /articles/2024/11/01/beginning-with-continuous-integration.html
---

We read about Continuous Integration. The practice appeals to us. We see its value, especially as it unlocks our ability to release anytime with high confidence. But, where to start? Many teams believe Continuous Integration is just a tooling problem, to then say they practice Continuous Integration. Although, they often do not. Hence, they miss out on the benefits that come along with it. It takes more than only tooling. So, again, where should we start? After all, there are still [20 practices]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) to implement. Which ones to pick first?

---

![Continuous Integration! Where to start?](/images/continuous-integration-where-to-start/continuous-integration-where-to-start.jpg)

It all starts with [*Agree as a Team to Never Break the Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). This is unquestionably key to the success of Continuous Integration as a team. That is the number one practice to implement before anything else.

This practice is non-negotiable! No single acceptable reason allows us to break with this agreement. Failing to follow this settlement Continuous Integration will not work for the team. Once we do not have Continuous Integration, our application breaks down until someone else validates it works through manual regression testing. This costs a massive amount of money, requires an unseen length of time to complete, and as a result, uncommonly delays delivery. On top of that, because it is a process gate, research indicates it does not add at all to the quality. Lastly, of utmost importance, it is a waste of the qualities of Test Engineers and anyone else. It is dumb, boring work better handled by machines. People should be used for value-adding activities like Exploratory Testing.

But, this practice assumes we have a [sufficiently comprehensive set of automated tests]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-13-have-a-vast-amount-of-high-quality-automated-tests) that provides us feedback on whether a change broke the application or not within minutes. Despite that, at this point, we are only testing everything we know about the application. We have no idea whether the application is valuable for users or how it behaves in front of users. That is where the value lies in Test Engineers and Exploratory Testing. That will complete our knowledge with all the unknowns and the missing information.

Be aware, that builds will eventually fail sometimes. That is fine. That is how life happens as long as we have a process to recover quickly and the team learns and improves. Teams without any failing builds are teams that do not improve.

Ultimately, we integrate code to gain assurance about the quality of the code in the version control system.

This brings us to the second most important practice to adopt, maybe even before *Agree as a Team to Never Break the Build*: [*Version Control Everything*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-1-version-control-everything). We would think that by 2024 this is a done deal. It seems not.

Without version control, we do not have a single source of truth. Releasing a portion of software becomes a marathon chasing bits and pieces of code on engineers' laptops and shared drives. Further, rolling back a release that went astray becomes tremendously complicated because we do not have a single source of truth allowing us to return to the last known good state. We do not know what that last known good state is.

On top of that, a Version Control System is not merely about versioning source code. It is a communication tool for communicating code amongst team members. It helps in reaching a [Shared Understanding](https://en.wikipedia.org/wiki/Extreme_programming_practices#Shared_understanding) and achieving a [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html) about the codebase. Two key [eXtreme Programming](http://www.extremeprogramming.org/) principles that enable communication and collaboration inside the team. Inevitably, this instils superior quality and higher delivery throughput as well as better team morale.

Lastly, by everything, we verily mean everything, i.e. without doubt production code, but also test code, as well as application and system configuration, together with database schema migrations, infrastructure code, but also [architectural decision records](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions) and [runbooks](https://www.pagerduty.com/resources/learn/what-is-a-runbook/). When an engineer clones a version control repository they should find everything to build, test, deploy, release, run and operate the IT system.

To perform on-demand production releases anytime we have to have always-working software. This means we have to *Agree as a Team to Never Break the Build*. Therefore, every team member must [*Run a Local Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) and only commit and push to a remote [*Mainline*](#mainline) [on green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green).

We effectively integrate remote changes produced by the rest of the team with our local changes. We try to detect possible integration conflicts early. Not doing so defers this detection to the [*Commit Build*](#commit-build) which might introduce a broken build and violate *Agree As a Team to Never Break The Build*.

To *Run a Local build*, we ought to [*Automate the Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-11-automate-the-build). This is *not* about having a centralised build server. Having a centralised build server is helpful, but not essential to reach Continuous Integration. Too often teams claim they apply Continuous Integration because they have GitHub Actions, GitLab CI or Jenkins in place. Oftentimes, they do not.

Lastly, [*Make all Changes in Small Increments*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding%}#practice-5-make-all-changes-in-small-increments). From my humble experience, that seems to be the toughest practice to adopt. But together with *Agree as a Team to Never Break the Build* it is the most crucial practice to embrace.

Break large changes into a series of small incremental changes that keep our system always working, never tearing apart the application.

[Steve Freeman](https://www.linkedin.com/in/stevefreeman/) and [Nat Pryce](https://www.linkedin.com/in/natpryce/) make this analogy with surgery.

> Surgeons prefer keyhole surgery over opening a patient's body because it is less invasive and cheaper.
>
> -- [Growing Object-Oriented Software Guided by Tests](https://www.goodreads.com/book/show/4268826-growing-object-oriented-software-guided-by-tests)

For the same reasons, we prefer to work in small, incremental steps because it is less invasive. We are not ripping apart the application. Therefore it is cheaper because we keep the application always working. Thus, we can perform an on-demand production release at any time. As such, we are not incurring an opportunity cost. Delivery is not delayed.

But, this is hard work! We possibly will have to think harder. We might move a bit slower. But with the immense advantage of never breaking the application and being able to perform on-demand production releases when it suits.

Those five practices, *Version Control Everything*, *Agree as a Team to Never Break the Build*, *Run a Local Build*, *Automate the Build* and *Make all Changes in Small Increments*, provide the necessary foundations to experience the benefits of Continuous Integration, i.e. enabling the fast flow of work through the value stream and increased stability. From there, teams can start experimenting with [the remaining 15 practices that make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}).

Notice, it only takes two tools to implement Continuous Integration: a version control system and an automated build. That is all. Continuous Integration is undeniably about practices. That is the hard work.

## Definitions

### Mainline

The Mainline is the line of development in Version Control which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The Commit Build is a build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at minimum compiling the sources, running a set of [*Commit Tests*](#commit-tests), and building a binary artefact for deployment.

### Commit Tests

The Commit Tests comprise all of the Unit Tests along with a small simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback.
