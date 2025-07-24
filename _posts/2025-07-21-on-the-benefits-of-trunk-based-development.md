---
layout: article
title: On the Benefits of Trunk-based Development
author: Thierry de Pauw
category: articles
tags: [Continuous Integration]
image: /images/on-the-benefits-of-trunk-based-development/the-benefits-of-trunk-based-development.jpeg
---

Why should we adopt trunk-based development? What benefits does it bring? [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) and subsequent articles articulated several times how trunk-based development is a superior delivery approach to any of its alternatives. This article attempts to summarise the value of trunk-based development.

---

*Update July 24th, 2025: Add working in small incremental steps.*

---

Although the practice of Continuous Integration implies trunk-based development. Even though trunk-based development has been reported [since 2015 by the State of DevOps report](https://dora.dev/research/2015/2015-state-of-devops-report.pdf) and later by the book [Accelerate](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648), to lead to higher IT delivery performance. Although organisations like Microsoft, Netflix and Google practice trunk-based development. In the case of Google, even at an exceedingly large scale. In 2016, we were discussing 16.000 engineers working from a single trunk with 25.000 changes per day. It is yet one of the most disputed practices in the IT industry.

Whenever we suggest trunk-based development, we are called unprofessional and belittled. How can we possibly deliver quality without the assumed safety of feature branches and Pull Requests?

In all honesty, **for trunk-based development teams, quality is the highest concern**. That quality is reached due to the adoption of a [series of practices]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) that enable another sequence of benefits.

![The Benefits of Trunk-based Development](/images/on-the-benefits-of-trunk-based-development/the-benefits-of-trunk-based-development.jpeg)

First, because everyone is working on a single mainline, it nudges, or better, it demands collaboration. As a team, we need to inform the rest of the team about upcoming changes that might impact the team. Undoubtedly, it facilitates [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html), which leads to better quality.

Note that the Pull Requests were introduced by the Open Source Software community. It allows core teams to maintain a system and accept contributions from the outside world. The outside world is generally perceived as low-trust. Therefore, we want to verify those contributions. Pull Requests are pretty helpful in that regard. However, in a closed-source corporate setting, the Pull Request model essentially indicates that the team owns the codebase, but it is not allowed to contribute. This creates a low-trust environment. Rather than trunk-based development, where everyone is allowed to contribute, which **creates a high-trust environment**, reducing fear and blame. It builds a safe space. There is no finger-pointing. It is the team that owns the quality, not individuals. Again, this leads to better quality.

With trunk-based development, we naturally commit (and push) more frequently to mainline. If we commit repeatedly to a remote mainline, we produce more frequent builds. If we produce more frequent builds, we uncover more problems sooner, allowing us to fix them when they are still small and easy to fix. This enables us to **Build Quality Into the product** instead of testing quality later, hence leading to better quality.

As we are committing frequently, it encourages **working in small incremental steps**. We are never ripping apart the system. Every commit is valid and workable, keeping the system in an always working and releasable state. As such, **enabling on-demand production releases at any time**. Thereby, shortening lead time and time to market, as well as reducing cost of delay.

With that many commits to mainline, we **truly continuously integrate all code contributions**. Builds are continuously running against mainline. Compiling, executing unit tests, and running static code analysis. Versus Pull Requests and feature branches that only partially integrate by rebasing mainline on the branch.

With more frequent commits, the team introduces more code into the codebase that gets used by the whole team immediately, even before the user sees it. They **flush out the bugs** by using the code.

> There's an angle that folks don't consider.
>
> When we do trunk-based development, the WIP we commit gets used, before any actual user sees it, by our whole team.
>
> They flush out so many bugs by just using our WIP.
>
> They would never get to do that were we feature-branched.
>
> -- GeePaw Hill

More frequent commits mean smaller changesets. Smaller changesets bring **reduced risks**.

If we build more frequently, we create more frequent release candidates. Thus allowing for more frequent deployments. Consequently, it **reduces time to market** and boosts IT delivery throughput.

Because we deploy more frequently, we can run more experiments in production, allowing us to **uncover more unmet needs of our users**. Finding new ways to delight the user. Surely growing customer satisfaction exponentially. Creating an irrefutable competitive advantage.

Since we commit and deploy more frequently, it inevitably **accelerates feedback**. More feedback brings better quality.

As no branches are created, no Pull Requests, we now do not have piles of undelivered code lingering around on branches. Thus, no Work in Progress (WIP) is created. Because of [Little's Law](https://en.wikipedia.org/wiki/Little%27s_law), it once more **drives down the lead time**.

Alongside increased user satisfaction comes a second economic perspective to trunk-based development. WIP is inventory. Inventory is money. It is money stuck into the system. It is stuck because the organisation invested considerably in creating all this code on parallel branches. However, as long as this code is not merged into mainline, deployed in production and released to users, it does not generate any revenue. We have zero feedback. We do not know if the thing we have just implemented is the right thing. Therefore, it is money stuck in the system. But, because we have less WIP, we create less inventory. As such, we have **less invested money stuck in the system**.

Given we have less WIP, no branches, and no Pull Requests, we also have less context switching. In reality, there is no context switching at all as we never have to wait for someone to be available to finish work. So, we never have to start new work while waiting to feel productive. We can concentrate on one thing at a time and work on it from start to finish. As a result, we have **less cognitive load**.

Reduced WIP means more feedback and accelerated learning. This instils a more risk-accepting culture that encourages the adoption of more efficient engineering practices and trying out new things. Thus, in all likelihood, to **incentivise innovation**.

With more team members committing continuously to mainline, it certainly **fosters collective responsibility to [never break the build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build)**. If the build breaks, the whole team stops all work, owns the failure and fixes the build within ten minutes. The build becomes the entire team's responsibility.

With trunk-based development teams, managing technical debt becomes a non-issue. It just happens. There are no administrative barriers anymore in the form of Pull Requests that require waiting for someone to approve a change. As a result, whenever we notice something off, we fix it promptly, leading to **reduced technical debt**.

With no branches any more, merge conflicts become now a thing of the past.

Lastly, branch creation does not have to be mastered any more, **simplifying the workflow**. We pull the latest changes, [Run a Local Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build), add the local changes, [Commit Only on Green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green), push, and we are done. This is fairly simple. It reduces the number of version control commands engineers need to remember to perform their day-to-day work. Once more, it limits the cognitive load.

## Conclusion

The 2016 peer-reviewed academic paper [The Role of CD in IT and Organisational Performance](https://www.researchgate.net/publication/302567338_THE_ROLE_OF_CONTINUOUS_DELIVERY_IN_IT_AND_ORGANIZATIONAL_PERFORMANCE) by Dr. Nicole Forsgren and Jez Humble, as well as the book [Accelerate](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648) indicated that trunk-based development together with Continuous Integration predicts better quality and higher delivery throughput. They lead to shorter times to market and reduced cost of delay. Together with lean product management and a [generative culture](https://dora.dev/capabilities/generative-organizational-culture/), they predict higher organisational performance as well as limited stress, fatigue and burnout.

According to DORA, high-performing teams practice trunk-based development because of all the mentioned benefits:

* Integrates all code contributions continuously.
* Creates high-trust environments.
* Fosters collective responsibility to never break the build.
* And working in small incremental steps.
* Therefore, enabling on-demand production deployments at any given moment.
* Accelerates feedback.
* Therefore, uncovers more unmet needs earlier.
* Uncovers more problems earlier.
* Therefore, it flushes out bugs before users see them.
* And slashes technical debt.
* Reduces risks.
* Drives down lead times and times to market.
* Minimises invested money.
* Incentivise innovation.
* Simplifies the workflow.
* And, therefore, limits the cognitive load.

Undeniably, this brings quality to considerably higher levels.

## Acknowledgement

This article would not have been possible without the valuable input of the [SoCraTes 2025](https://www.socrates-conference.de/) open space participants to my session "*What are the Benefits of Trunk-based Development?*".

## Related Articles

* [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching%})
* [The Good and the Dysfunctional of Pull Requests]({% post_url 2024-02-22-the-good-and-the-dysfunctional-of-pull-requests %})
