---
layout: article
title: The Practices That Make Continuous Integration - Push Every Day
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-make-the-build-push-every-day.jpg
---

As long as we have not pushed our local commits to the remote [*Mainline*](#mainline), the integration did not happen. We do not know whether our changes broke the application or not. No communication regarding our local changes happened with the rest of the team. Admittedly, the rest of the team is blind to our local changes. We are not working as a team but in isolation. Consequently, it is critical to push our local commits at least once a day into the remote *Mainline* to achieve Continuous Integration.

---

![Push Every Day](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-push-every-day.jpg)

If we push our local commits to a remote branch, we effectively hide work from the rest of the team. The team does not know in which direction we are taking the code to implement the feature we are working on. This is fine as long as everyone in the team works on different parts of the system. But, the minute two team members work on the same codebase area, they are each blind to how their work affects the other.

The longer we keep pushing local changes to a remote branch, the more we work in isolation and not as a team any more. From that moment on, CI does not stand for Continuous Integration anymore but stands for [Continuous Isolation](https://continuousisolation.com/). We are not integrating outside changes and the rest of the team does not know how our changes integrate with their work.

Additionally, it delays feedback for the whole team. As long as we have not pushed to the remote *Mainline*, the Continuous Integration process is not triggered. We do not know if our changes broke the application or not.

![It delays feedback](/images/on-the-evilness-of-feature-branching-the-problems/it-delays-feedback.png)

Some will argue: *But, we have our CI tool running against our remote branches*. Having an automated build running against our branches is a positive thing. But it is not Continuous Integration. We receive no feedback at all on whether our changes integrate well with all the changes that exist on all the other parallel branches. The only feedback we obtain is whether the code inside the isolated branch still compiles and no regressions have been introduced against the automated tests inside that branch.

*But, we regularly pull changes from Mainline*. That too is favourable. Again, it is not Continuous Integration. It is only a *Semi-Integration*. It is just one-half of the integration. The other half is the engineer pushing their local changes to the remote *Mainline*. As such, integrating their changes with all the other existing changes on *Mainline*. If they do not do that, other team members cannot see their work and thus cannot adapt. Besides, this semi-integration does not prevent branches from diverging and all the pesky problems from low-frequency integration.

> No code sits unintegrated for more than a couple of hours.
>
> -- Kent Beck, eXtreme Programming explained, 1st edition, p97

Continuous Integration requires full mainline integration. No code sits longer than a day on a remote branch without being merged into *Mainline*.

If we push frequently to a remote *Mainline*, we communicate to the rest of the team the direction we take with the code to implement the feature we are working on. For example, we could add a conditional indicating where the new code starts and have it disabled by default. From then on, the rest of the team can see our changes, how this affects their work and how they can promptly adapt.

Accordingly, everyone in the team pushes its local commits at least once a day to the remote *Mainline*.

Continuous Integration together with the Version Control System is about communicating changes with the rest of the team. Together, they will reveal the impact of our local changes on the rest of the team.

That helps in obtaining a [Shared Understanding](https://en.wikipedia.org/wiki/Extreme_programming_practices#Shared_understanding) of the codebase, as well as a [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html).

Hence, it enables communication and collaboration within the team which in turn provides better quality and increased IT delivery throughput.

We say a team is in a state of Continuous Integration when:

>- **Everyone in the team (or every pair) commits at least once a day to mainline, leading to multiple integrations per day for the whole team.**
>- Every commit to mainline triggers an automated build and execution of all automated tests.
>- Whenever the build fails, the team can fix it within 10 mins.
>
>-- [Jez Humble](https://bsky.app/profile/jezhumble.net)

If the integration takes a couple of hours, even an hour, this cannot work. Therefore, it is imperative to [Have a Fast Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build), a [Self-Testing Build]({% post_url 2024-09-15-the-practices-that-make-continuous-integration-make-the-build-self-testing %}) and to [Have a Vast Amount of High-Quality Automated Tests]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-have-a-vast-amount-of-high-quality-automated-tests) to detect the more problematic are the [Semantic Conflicts](https://martinfowler.com/bliki/SemanticConflict.html).

Pushing at least once a day is, at best, a starting point. Experienced teams will [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-6-commit-frequently). That introduces a gentle pressure to [*Make All Changes in Small Increments*](#practice-5-make-all-changes-in-small-increments) which helps in tracking progress, having a feeling of moving forward and accomplishing things. But also to [*Have a Fast Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build), [*Have a Decoupled Codebase*](#practice-8-decouple-the-codebase) and[*Hide Unfinished Functionality*](#practice-10-hide-unfinished-functionality). If we do not adopt all of these practices, committing frequently will be difficult, if not impossible.

## Bibliograpy

- [eXtreme Programming explained, Embrace Change](https://www.goodreads.com/book/show/67833.Extreme_Programming_Explained), p97-98, Kent Beck
- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
- [Continuous Integration Certification](https://martinfowler.com/bliki/ContinuousIntegrationCertification.html), Martin Fowler

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. [Team working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %})
2. [Coding for Continuous Integration]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %})
3. [Building for Continuous Integration]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %})
4. [Make the Build Self-Testing]({% post_url 2024-09-15-the-practices-that-make-continuous-integration-make-the-build-self-testing %})
5. Push Every Day
6. [Trigger the Build on Every Push]({% post_url 2024-10-15-the-practices-that-make-continuous-integration-trigger-the-build-on-every-push %})

## Definitions

### Mainline

The line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.