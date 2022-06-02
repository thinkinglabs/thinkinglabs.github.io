---
layout: article
title: On the Evilness of Feature Branching - How Can We Avoid The Problems?
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 4 of this series - The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %}) I
dived deep into the problems introduced by feature branching. Now, what can we do about this? How can we avoid these problems all together?

---

By adopting Continuous Integration as it was meant when introduced by the Extreme Programming community in the late 1990s.Ensuring always working software on mainline. Allowing us to perform on-demand production releases from mainline at any given moment in time.

This is one of the most critical practices to adopt to enable the fast flow of work through the value stream and getting close to a single piece flow.

This implies the adoption of **trunk-based development**.

> Trunk Based Development is what individuals practice to achieve Continuous Integration as a team.
>
> -- Steve Smith

It is a version control strategy in which everyone commits multiple times a day to mainline. Either directly into mainline, or using very short lived branches. As a result changes are small. Merge conflicts are very unlikely. The codebase is always in a releasable state. Testing happens on mainline. Production releases ideally happen from mainline. If a release needs to be
stabilised you can create a short lived release branch and release from that release branch. Fixes are done on mainline and cherry picked into the release branch. This has the advantage we can just delete the release branch after the release without having to merge the release branch back to mainline.

Trunk-based development is not a recent new hype as I sometimes read on Twitter. In fact, it exists since the early 1980s when
[RCS](https://en.wikipedia.org/wiki/Revision_Control_System) was introduced as the one of the very first version control systems. It supported branches, but teams were very cautious and stuck to trunk.

How do you achieve Continuous Integration? How do you prevent it becomes a mess when everyone in the team commits multiple times a day to mainline ? Something many teams are most afraid of.

We have several practices at our disposal to achieve a state of Continuous Integration. In fact, I recently identified 14 of them that are covered in [The Practices That Make Continuous Integration]().

## Bibliography

- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery), p. 382 Chapter 14: Advanced Version Control, Dave Farley and Jez Humble
- [trunkbaseddevelopment.com - Continuous Integration](https://trunkbaseddevelopment.com/continuous-integration/), Paul Hammant

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. [But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
4. [The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %})
5. How Can We Avoid The Problems?
6. Questions I Regularly Get Asked about Trunk-Based Development
7. What Are The Benefits of Trunk-Based Development?
8. Where is the Evilness of Feature Branching?
