---
layout: article
title: On the Evilness of Feature Branching
author: Thierry de Pauw
meta: 21 min read
category: articles
tags: [Version Control, Continuous Integration]
---

Branch creation became very easy with the advent of Distributed Version Control
Systems. However, it comes at an unquestionable cost. Long living branches break
the flow of the IT delivery process, impacting stability and throughput. In this
article, I will explore why teams use feature branches, what problems do the use
of feature branches introduce and what techniques exist to avoid them altogether.
Finally, I will explore what exactly is evil about feature branches, which is
not necessarily the problems they introduce - but rather, the real reasons why
teams are using them.

---

## How can we avoid all of this?

By adopting Continuous Integration as it was meant when introduced by the
Extreme Programming community in the late 90's. Ensuring always working software
on mainline. Allowing you to perform on-demand production releases from mainline
at any given moment in time.

This is one of the most critical practices to adopt to enable the fast flow of
work through the value stream and getting close to a single piece flow.

This implies the adoption of **trunk-based development**.

> Trunk Based Development is what individuals practice to achieve CI as a team.
>
> -- Steve Smith

It is a version control strategy in which everyone commits multiple times a day
to mainline. Either directly into mainline, or via very short lived branches.
As a result changes are small. Merge conflicts are very unlikely and the
codebase is always in a releasable state. Testing happens on mainline.
Production releases ideally happen from mainline. If a release needs to be
stabilised you can create a short lived release branch and release from that
release branch. Fixes are done on mainline and cherry picked into the release
branch. This has the advantage of being able to just delete the release branch
after the release without requiring to merge it back to mainline.

Trunk-based development is not a recent new hype as I sometimes read on Twitter.
In fact, it exists since the early 80's when
[RCS](https://en.wikipedia.org/wiki/Revision_Control_System) was introduced
as the one of the very first version control system. It supported branches, but
teams were very cautious and stuck to trunk.

How do you achieve Continuous Integration? How do you prevent it becomes a mess
when everyone in the team commits multiple times a day to mainline ? Something
lots of teams are most afraid of.

Well, we have several practices at our disposal to achieve a state of Continuous
Integration and I am going to introduce 4 of them.

<!--
What follows overlaps with The Practices that make Continuous Integration.
Should I mention them here or refer to that upcoming article?
Chronologically On the evilness of feature branching would come before
The practices that make Continuous Integration.
-->

### Break large changes into a set of small incremental changes

To be completed.

### Hide unfinished functionality

To be completed.

### Branch by Abstraction

To be completed.

### Feature Toggles

To be completed.

## Frequently asked questions

### How big should a User Story be?

### How to perform Story Validation?

### What about Code Reviews?

## Benefits

## Where is the evilness?

