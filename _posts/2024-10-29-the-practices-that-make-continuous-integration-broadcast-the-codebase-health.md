---
layout: article
title: The Practices That Make Continuous Integration - Broadcast the Codebase's Health
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-broadcast-the-codebase-health.jpg
---

One key principle for continuous improvement is feedback. To create feedback loops, we need to relay information. In the case of Continuous Integration, this requires *Broadcasting the Codebase's Health*. But feedback alone is not enough. Teams have to act upon feedback, and for this, teams have to be empowered.

---

The objective of Continuous Integration is to always have working software on [*Mainline*](#mainline). Therefore, it is prevalent to [*Agree as a Team to Never Break the Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). It ensures *Mainline* is always releasable, allowing us to perform on-demand production releases anytime. Thus, reducing time to market and the cost of delay.

![Broadcast the Codebase's Health](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-broadcast-the-codebase-health.jpg)

But despite that, as already mentioned in [*Fix a Broken Build within 10 Minutes*]({% post_url 2024-10-17-the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes%}), builds will eventually break someday at some time. That is a fact of life, and that is fine.

There is, however, a second objective for Continuous Integration: to receive feedback within minutes on whether a change broke the system or not. Nevertheless, enabling a team to react to feedback requires passing on information. Hence, we ought to *Broadcast the Codebase's Health* to the whole team. If the tests fail, static code analysis finds messy code, a vulnerability found in a library, at that instant, the whole team owns the failure, [*Stops the Line*](https://en.wikipedia.org/wiki/Andon_(manufacturing)), stops all work, and *Fixes the Broken Build within 10 Minutes* to satisfy *Agree as a Team to Never Break the Build* as quickly as possible. Because, when the build fails, we do not have Continuous Integration. Once we do not have Continuous Integration, the system collapses until someone else confirms it works. Consequently, this incurs time and thus impacts time to market negatively.

*Broadcast the Codebase's Health* needs dashboards showing the state of our builds. But that is not enough. When builds fail, the team has to be notified in the most annoying way to ensure they will *Stop the Line*. To exasperate teams, ensure notifications land in their everyday communication channel. For sure, they notice, pick it up and make certain it will not happen again.

At one customer, I had a difficult discussion with a team lead about precisely that. We were a small team of six managing the whole eco-system. At the time, we had some issues with one system. I configured the monitoring to send alerts to the channel where the team had its habitual communications. That system was sending alerts every so often. Soon, the team lead complained the alerts blurred the communication in the channel. They suggested sending the alerts to a dedicated alerting channel. Sending alerts to a channel nobody is bothered with is like sending a signal to a black hole. That is just an alerting trash bin. Nobody will care about it. Whereas, if it is vexing, annoying, or exasperating maybe the team should do something about it and stop the line instead of expecting it to magically disappear or hoping one person in the team will fix it. That is not a team. That will assuredly impact performance.

Dashboards about the state of our builds are, however, not sufficient. Advisably, we also have dashboards showing trends. How do our builds evolve? Does our [*Build Lead Time*](#build-lead-time) shrink or increase? How often does the build break? Are the number of unreliable tests going down? Preferably yes! If not, we have a problem, and we should act upon that.

![Build trend dashboards](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-broadcast-the-codebase-health-dashboard.png)

That is all valuable information that should feed into our continuous improvement to emphasise positive trends, encouraging the team to thrive. When we notice an unexpected negative disruption in the trends, we should analyse how our habits or setup changed recently. What caused the disruption?

When such turmoils interfere with our work, we must tackle them immediately. By all means, do not plan improvements. Backlogs are where improvement dies. So to keep the team at par, improvements happen and get implemented straightaway. For this to work, the team has to be empowered. The team controls its priorities. This feature will have to wait as this pesky thing hits us repeatedly, stopping us from delivering quality. Once fixed, we will return to that feature in a better shape.

Accordingly, *Broadcasting the Codebase's Health* has a financial reason to exist. It is not about having shiny dashboards and looking smart. No, this allows us to fix a broken build in a glimpse and to improve. Ultimately, to keep times to market short and in addition to accelerating user feedback. Once feedback grows, we can run more experiments and find additional ways to delight our users. A particular competitive advantage.

## Bibliography

- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery), Chapter 1 - The Problem of Delivering Software, Dave Farley and Jez Humble
- [Measuring Continuous Delivery](https://leanpub.com/measuringcontinuousdelivery), Steve Smith

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. [Team working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %})
2. [Coding for Continuous Integration]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %})
3. [Building for Continuous Integration]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %})
4. [Make the Build Self-Testing]({% post_url 2024-09-15-the-practices-that-make-continuous-integration-make-the-build-self-testing %})
5. [Push Every Day]({% post_url 2024-09-16-the-practices-that-make-continuous-integration-push-every-day %})
6. [Trigger the Build on Every Push]({% post_url 2024-10-15-the-practices-that-make-continuous-integration-trigger-the-build-on-every-push %})
7. [Fix a Broken Build within 10 Minutes]({% post_url 2024-10-17-the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes %})
8. [Have Reliable Tests]({% post_url 2024-10-19-the-practices-that-make-continuous-integration-have-reliable-tests %})
9. Broadcast the Codebase's Health

## Definitions

### Mainline

The Mainline is the line of development in Version Control which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Build Lead Time

Build Lead Time is the [*Lead Time*](#lead-time) between committing code into a Version Control System and producing a binary build artefact.

It is only a fraction of the total Lead Time, which encompasses all the testing and deploying to production. Yet, an important fraction, as it is the time engineers wait for essential feedback produced by the [*Local Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) and the [*Commit Build*](#commit-build) before moving on with work.

### Lead Time

From [Monday.com](https://monday.com/blog/project-management/what-is-lead-time/) and [Wikipedia](https://en.wikipedia.org/wiki/Lead_time): the "latency" (time interval) between the start and completion of a certain task.

It is most often used in Manufacturing and Supply Chain. Yet, it is applicable to all product-based businesses including the business of software.

In IT, lead time is the time between receiving a user request, prioritising it, designing, implementing and getting it released into the hands of the users in production.

For IT delivery, lead time is often limited to the time between committing code into a Version Control System and getting that code into the hands of the users in production.

### Commit Build

The Commit Build is a build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at a minimum compiling the sources, running a set of [*Commit Tests*](#commit-tests), and building a binary artefact for deployment.

### Commit Tests

The Commit Tests comprise all of the Unit Tests along with a small simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback.
