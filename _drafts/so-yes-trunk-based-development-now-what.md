---
layout: article
title: So, Yes, Trunk-based Development! Now What?
author: Thierry de Pauw
category: articles
tags: [Continuous Integration]
---

We are sold to the idea of practising trunk-based development. But all the articles we read on the topic leaves us with tons of questions. This is an attempt to answer these questions. See it as a kind of **Trunk-based Development FAQ**. I guess this will be a continual work in progress as new unanswered questions will come around. If you have an unanswered question, feel free to [open a ticket here](https://github.com/thinkinglabs/thinkinglabs.github.io/issues).

---

<!-- no toc -->
- [How do we handle large-scale changes?](#how-do-we-handle-large-scale-changes)
- [How do we handle large-scale refactoring?](#how-do-we-handle-large-scale-refactoring)
- [Does the code tree end up duplicating some of the feature concepts?](#does-the-code-tree-end-up-duplicating-some-of-the-feature-concepts)
- [How do we handle development vs production vs testing environments?](#how-do-we-handle-development-vs-production-vs-testing-environments)
- [Where do people do experiments that may or may not go into production?](#where-do-people-do-experiments-that-may-or-may-not-go-into-production)
- [How do we handle interim commits that are more about saving work than about committing for the long term?](#how-do-we-handle-interim-commits-that-are-more-about-saving-work-than-about-committing-for-the-long-term)
- [How to combine the version control system as a personal tool with the team tool?](#how-to-combine-the-version-control-system-as-a-personal-tool-with-the-team-tool)
- How to deal with a codebase without any test?
- How to handle framework upgrades?

## How do we handle large-scale changes?

The point here is incremental software development. Breaking up large changes into a series of small incremental changes. Regardless how large a feature or a change is, it grows small commit by small commit on [*Mainline*](#mainline). Every small commit is [atomic](https://en.wikipedia.org/wiki/Atomic_commit). It keeps the codebase working.

This is hard work. It requires some upfront thinking on how to split the large change in a series of changes that build upon each other. Somehow, this is a form of mini-planning.

Let us say, the new feature involves a new screen in the UI that uses a new backend service. We will typically first implement the backend service. As the backend service is not used, we do not need any [*Feature Toggles*](https://martinfowler.com/articles/feature-toggles.html) to hide the backend service. It can just linger around unfinished as nobody cares. Once the backend service is ready, we can start implementing the new screen for the frontend. As long as the screen is not completed, we do not wire it into the frontend navigation. Again, we do not need any Feature Toggles to hide the screen. Only when the screen is finished, we wire it into the navigation.

Of course, frontend and backend could also be implemented in parallel by two pairs. In that case, the frontend will work with a mocked backend until the real backend is ready. Here also, the frontend screen is not wired into the navigation until the screen is completed.

## How do we handle large-scale refactoring?

The large-scale changes naturally raises the question about large refactorings that can take days, or weeks or sometimes even months to complete. Months is not unlikely in infrastructure evolutions.

Let us say, silly, simplistic example, we have a method that is used at 42 places in the code base. For some valid reason, we have to change the method signature.
If we change the signature and all consumers in one go, this will take a fair amount of time during which no integrations happen and thus no feedback.

The classic way of solving that, is to use Branch by Version Control. The team creates a version control branch and then performs all the required modifications. However, we run the risk that in the meantime someone else introduces a new consumer for the old signature.

A better approach is to [*Adopt Expand-Contract*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-9-adopt-expand-contract), also known as Expand-Migrate-Contract or [Parallel Changes](https://martinfowler.com/bliki/ParallelChange.html).

When replacing an algorithm by a better, more performant version but that still needs testing in production, or when replacing a library, [*Branch-by-Abstraction*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-9-adopt-expand-contract) would be the preferred option.

## Does the code tree end up duplicating some of the feature concepts?

> When modifying a large chunk of code, do you sometimes end up with “old version” and “new version” in the code base, so you can slowly improve the new version, and only flip it on when ready?
>
> The alternative would seem to be, make the single version always able to act like the old and new version, but that seems both hard and brittle. But… lots of code dupes in the tree seem not great, too. You’re basically making branches, but in-tree.

Yes! We do sometimes have both "old version" and "new version" alongside each other. It is not that unusual as it is the only way to evolve a codebase incrementally without breaking. This happens even more often with infrastructure code. Just renaming a resource already requires duplication.

In reality, it is a documented pattern known as "Expand-Contract" (or expand-migrate-contract) (as explained in the previous question [*How do we handle large-scale refactoring?*](#how-do-we-handle-large-scale-refactoring)).

Indeed, we do introduce a code branch instead of a version control branch. But with the benefit that it is visible to the team. The team sees the impact on their code and can adapt. This is not possible with a version control branch. In that case, code is hidden for the team.

## How do we handle development vs production vs testing environments?

Environments are not handled by the version control system.

In the early 2000s, [ClearCase](https://en.wikipedia.org/wiki/IBM_DevOps_Code_ClearCase) advocated for version control environment branches. To deploy in an environment, code had to be promoted into the respective environment branch which triggered a deployment in the said environment. [This way of working has severe downsides]({% post_url 2025-03-03-environment-branches-harm-quality %}) ans should not be followed any more.

Deployments in the different environments should be handled by the Continuous Delivery [*Deployment Pipeline*](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline).

![Deployment Pipeline](/images/environment-branches-harm-quality/deployment-pipeline.jpg)

The *Deployment Pipeline* consists of several sequential stages. Some stages could be executed in parallel. For instance load testing, and security testing could all happen in parallel with the [*Automated Acceptance Testing*]({% post_url 2021-07-22-acceptance-testing-for-continuous-delivery-dave-farley %}). 

The first stage of the pipeline is always the [*Commit Build*](#commit-build) (or *Commit Stage*). It is triggered by any commit on *Mainline*. The outcome of the *Commit Build* is a binary build artefact, i.e. a Jar file, a Python PyPi package, a Docker Image, ...

Once we have the build artefact, the next stage can deploy it in a testing or QA environment. The following stage can now start executing the *Automated Acceptance Tests* on the testing environment.

Once all of that is successful, we can decide to deploy to production which happens in the final stage of the *Deployment Pipeline*.

Essentially, the *Deployment Pipeline* builds the build artefact only once and then promotes it from one environment to the other.

This means that all environments receive the same version of the codebase. Variations between environments are handled by configuration, exceptionally by code branches. We say exceptionally, because environment code branches are difficult to test, so we want to avoid that.

## Where do people do experiments that may or may not go into production?

If experiments should go into production, in all evidence they should land on [*Mainline*](#mainline), likely behind a *Feature Toggle* to allow turning the experiment on and off.

If the experiment should not go into production, I guess we are more speaking about a [*Spike*](http://www.extremeprogramming.org/rules/spike.html), writing throw away code to test an idea. Such experiments should be sharp and short. At all times, we avoid committing into version control. The minute code lands in version control, it becomes production code. Because of the [sunk cost fallacy](https://en.wikipedia.org/wiki/Sunk_cost#Fallacy_effect), it gets particularly hard to throw away the code. This only works for experiments under 24 hours. That is not always possible. Sometimes experiments require more investigation, more collaboration. To save us from landing spike code into production code, we should commit into a "spikes" branch that is automatically deleted after 72 hours.

## How do we handle interim commits that are more about saving work than about committing for the long term?

> I never want to walk away from my desk with code that has not been committed and pushed, so I am never at risk of data loss. But I don’t have the luxury of always guaranteeing I end the day at a good stopping point, which means committing and pushing WIP code.

I guess, in this case, a temporary branch would be acceptable, like for the [experiments](#where-do-people-do-experiments-that-may-or-may-not-go-into-production), just to store the end-of-day work that will be picked up the next day. To avoid that this temporary branch becomes a *Feature Branch*, the work on that branch should be integrated at the start of the next day with [*Mainline*](#mainline) and the temporary branch destroyed.

Having said that, a better approach is to have atomic commits at all times that leave the codebase in a releasable state. That eliminates the need for a temporary branch as then we can just push to the remote [*Mainline*](#mainline) at the end of the day.

## How to combine the version control system as a personal tool with the team tool?

> I am very used to using version control as a personal tool, not just a group tool — I commit individual, incremental chunks that are easy to understand and test in isolation. I regularly look at a diff to see what I’ve changed and check myself. I can’t keep track of huge commits, so I use version control to keep the WIP manageable.
>
> If I’m working against main, it seems like I lose the “personal tool” bits, and only have the group tool — everything is for everyone.
>
> How do you replace the utility version control has for me, before I am ready to share, before work is ready to push?
>
>I know the high level answer is “make smaller commits that always result in green builds”, but… how?

To be honest, it is the first time this aspect has been raised.

But, a version control system is first and foremost a communication tool for the team to communicate changes. In the end, it is a team that delivers working software, not individuals. Hence, the reason for Continuous Integration, to have working software all the time which enables on-demand production deployments and thus shortens time to market and reduces cost of delay.

Yet, by times it happens that at the end of the day we do not have working software but we still want to store [interim commits](#how-do-we-handle-interim-commits-that-are-more-about-saving-work-than-about-committing-for-the-long-term). It is not ideal, but human, as long as we are mindful to the exception.

## Acknowledgement

[Luke Kanies](https://hachyderm.io/@lkanies) for [raising the idea for a kind of Trunk-based Development FAQ](https://hachyderm.io/@lkanies/114892939490913521).

## Related Articles

- [On the Benefits of Trunk-based Development]({% post_url 2025-07-21-on-the-benefits-of-trunk-based-development%})
- [Continuous Integration! Where to Start?]({% post_url 2024-11-01-continuous-integration-where-to-start %})
- [Environment Branches harm Quality]({% post_url 2025-03-03-environment-branches-harm-quality %})

## Definitions

### Mainline

The Mainline is the line of development in Version Control, which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The Commit Build is a build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at minimum compiling the sources, running a set of [*Commit Tests*](#commit-tests), and building a binary artefact for deployment.

### Commit Tests

The Commit Tests comprise all of the Unit Tests along with a small simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback.
