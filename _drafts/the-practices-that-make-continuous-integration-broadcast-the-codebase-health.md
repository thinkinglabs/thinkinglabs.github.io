---
layout: article
title: The Practices That Make Continuous Integration - Broadcast the Codebase's Health
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-have-reliable-tests.jpg
---

One of the key principles for continuous improvement is feedback. To create feedback loops, we need to broadcast information. In the case of Continuous Integration, it requires broadcasting the codebase's health. But feedback alone is not enough. Teams have to act upon feedback. For this teams have to be empowered.

---

The objective of Continuous Integration is to have always working software on [*Mainline*](#mainline). Therefore, it is prevalent to [*Agree as a Team to Never Break the Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). This ensures *Mainline* is always releasable, allowing us to perform on-demand production releases at any given moment in time. Thus, reducing time to market and cost of delay.

However, as already mentioned in [*Fix a Broken Build within 10 Minutes*]({% post_url 2024-10-17-the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes%}), builds will eventually break at some point in time. That is a fact of life and that is fine. Because there is a second objective of Continuous Integration: to receive feedback within minutes on whether a change broke the system or not. For a team to react on feedback that also means broadcasting information. Hence we need to *Broadcast the Codebase's Health* to the whole team. If the tests fail, static code analysis finds messy code, a vulnerability is found in a library, the whole team owns the failure, [*Stops the Line*](https://en.wikipedia.org/wiki/Andon_(manufacturing)), stops all work, and *Fixes the Broken Build within 10 Minutes* to satisfy *Agree as a Team to Never Break the Build* as quickly as possible. Because, when the build is broken, we do not have Continuous Integration. Once we do not have Continuous Integration, the system is broken until someone else confirms it is not. Consequently, this incurs time and thus impacts time to market negatively.

To *Broadcast the Codebase's Health* we need dashboards showing the state of our builds. But that is not enough. When builds fail, the team needs to be notified in the most annoying way to ensure they will *Stop the Line*. To exasperate teams, make sure notifications land in their day-to-day communication chat channel. For sure they will notice them.

At one customer, I had a painful discussion with a team lead about exactly this. We were a small team of six managing the whole eco-system. At the time, we had some issues with one system. I configured alerting to be send to the dev-channel, i.e. the channel used for our day-to-day communication. That system was sending alerts every so often. Soon the team lead complained the alerts blurred the communication in the channel. They suggested to send the alerts to a dedicated alerting channel. Sending alerts to a channel nobody is displeased with, is like sending a signal to a black hole. That is just an alerting trash bin. Nobody will care about it. Whereas, if it is vexing, maybe the team should do something about it and stop the line instead of expecting to disappear magically or hoping one person in the team will fix it. That is not a team. That will impact performance.

Dashboards about the state of our builds is not enough. Preferably, we also have dashboards showing trends. How do our builds evolve? Does our build lead time shrink or increase? How often does the build break? Are the number of unreliable tests going down? Preferably yes! If not, we have a problem and we should act upon that.

All of that is valuable information that should feed into our continuous improvement to emphasise positive trends. When we observe an unexpected negative disruption in the trends, we should analyse what recently changed in our habits or our setup. When such turmoils interfere with our work, they should be tackled immediately. Please, do not plan improvements. Backlogs is where improvement dies. To keep the team at par, improvements happen right away.

Accordingly, there is an economical reason to *Broadcasting the Codebase's Health*. This is not to have shiny dashboards and to look smart. No, this is to allow us to fix a broken build in a glimpse and to improve. Ultimately, to keep times to market short and so to accelerate user feedback. Once we accelerate feedback, we can run more experiments and find more ways to delight our users.

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
8. Have Reliable Tests
9. Broadcast the Codebase's Health

## Definitions

### Mainline

The Mainline is the line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.
