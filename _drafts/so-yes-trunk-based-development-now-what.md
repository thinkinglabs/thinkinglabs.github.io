---
layout: article
title: So, Yes, Trunk-based development! Now What?
author: Thierry de Pauw
category: articles
tags: [Continuous Integration]
---

We are sold to the idea of practising trunk-based development. But all the articles we read on the topic leaves us with tons of questions. This is an attempt to answer these questions. I guess this will be a continual work in progress as new unanswered questions will come around. Therefore, I kindly ask you that when you have an unanswered question, to please [open a ticket here](https://github.com/thinkinglabs/thinkinglabs.github.io/issues). I will try to tackle that.

---

<!-- no toc -->
- [How do we handle large-scale changes?](#how-do-we-handle-large-scale-changes)
- Does the code tree end up duplicating some of the feature concepts?
- How do you handle dev vs prod vs testing environments?
- Where do people do experiments that may or may not go into production?
- How do you handle interim commits that are more about saving work than about committing for the long term?
- How to deal with a codebase without any test?
- How to handle framework upgrades?

## How do we handle large-scale changes?

The point here is incremental sofware development. Breaking up large changes into a series of small incremental changes. Regardless how large a feature or a change is, it grows small commit by small commit on [*Mainline*](#mainline). Every small commit is [atomic](https://en.wikipedia.org/wiki/Atomic_commit). It keeps the codebase working.

This is hard work. It requires some upfront thinking on how to split the large change in a series of changes that build upon each other. Somehow, this is a form of mini-planning.

Let us say, the new feature involves a new screen in the UI that uses a new backend service. We will typically first implement the backend service. As the backend service is not used, we do not need any [*Feature Toggles*](https://martinfowler.com/articles/feature-toggles.html) to hide the backend service. It can just linger around unfinished as nobody cares. Once the backend service is ready, we can start implementing the new screen for the frontend. As long as the screen is not completed, we do not wire it into the frontend navigation. Again, we do not need any Feature Toggles to hide the screen. Only when the screen is finished, we wire it into the navigation.

Of course, frontend and backend could also be implemented in parallel by two pairs. In that case, the frontend will work with a mocked backend until the real backend is ready. Here also, the frontend screen is not wired into the navigation until the screen is completed.

## Acknowledgement

## Related Articles

- [On the Benefits of Trunk-based Development]({% post_url 2025-07-21-on-the-benefits-of-trunk-based-development%})
- [Continuous Integration! Where to Start?]({% post_url 2024-11-01-continuous-integration-where-to-start %})
- [Environment Branches harm Quality]({% post_url 2025-03-03-environment-branches-harm-quality %})

## Definitions

### Mainline

The Mainline is the line of development in Version Control, which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.
