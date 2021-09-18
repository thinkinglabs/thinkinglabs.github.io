---
layout: article
title: On the Evilness of Feature Branching - Why do Teams use Feature Branches
author: Thierry de Pauw
meta: 6 min read
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 1 of this series - a Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
I introduced two quite different teams.
One novice team practising trunk-based development,
the other experienced but being used by GitFlow.
Now I would like to explore what are the reasons teams are using feature
branches for.

---

Before I could ever suggest trunk-based development again, I had to understand
why teams are using feature branches. What problems are they trying to solve
with long-running branches? I asked proponents of feature branching for their
reasons.

But let me first introduce two definitions: *mainline* and *feature branching*.

> **Mainline** is the line of development which is the reference from which the
> builds of your system are created that feed into your deployment pipeline.
>
> -- Jez Humble

- For Git, this is the *main* branch (also known as master).
- For Mercurial this is the *default* branch.
- For CVS and SubVersion, this is *trunk*.

> **Feature Branching** is a practice where people do not merge their code into
> mainline until the feature they are working on is "*done*"
> (but not yet “*done done*”).
>
> -- Jez Humble

**Done** means it is dev-complete. But there is still a lot of work to be done
before the feature gets into production.

- all the developer tests have to be executed;
- a new release candidate has to be created;
- it has to be deployed into a staging environment;
- smoke tests have to be executed;
- all the automated acceptance tests have to be executed;
- then manual exploratory testing can start;
- eventually, in parallel, security and performance tests have to be executed;
- if all testing was successful, it can be deployed into production;
- again smoke tests have to be executed;
- and finally it can be released to the end-user.

The implementation of a feature starts with the creation of a branch. The
feature grows on that branch. When the feature is finished it goes through a
gating process called a *code review*. After successfully going through that
gating process, it gets merged back into mainline.

To be clear, when we speak about *feature branching* we really mean long-running
branches, i.e. branches that live for **longer than a day**.

## It allows us to work in isolation, therefore we are more productive

This sounds fair and rather obvious. But, when you think this through,
this feels like a local optimisation.

We are optimising for individual developer productivity. But designing IT
systems is rarely an individual activity. Most of the time it is a team
activity.

> Developing in isolation can help an **individual** go faster. But it does not
> help a **team** go faster. Merge time and rework cannot be estimated and will
> vary wildly, and the team can only go as fast as the slowest merge.
>
> -- Steve Smith

As long as you have not merged back to mainline you simply do not know how much
work is still left to do. Potential merge conflicts will introduce rework at
merge time. Integrating changes into mainline becomes a time-consuming and very
unpredictable activity. This makes the whole IT delivery process very
unpredictable and increases the lead time, and the time to market for your
product.

But, the goal of any organisation is to make money by sustainably minimising
the lead time to create positive business impact.

Lead Time is the clock wall time between we, as an organisation, have an idea and
that idea gets designed, implemented and gets in the hands of the users and gets
used by real users.

Business impact is anything that:

- creates money, this is turn-over;
- saves money, this is cost-savings;
- and protects money, this is being ahead of your competition.

We want to reduce the lead time because we want to accelerate feedback. We want
to know as fast as possible if the thing we have just implemented and deployed
into production is actually being used and how it is being used. Based on this
information we can make new decisions. We can run new experiments to find new
unmet needs of our customers and new ways to delight our customers. Which is
a huge competitive advantage.

With feature branching we are doing the exact opposite!

Therefore instead of optimising for developer productivity we should optimise
for team productivity and adopt a team-oriented branching strategy.

## If a refactoring goes nowhere, we can just delete it

Again fair enough. This looks very evident.

However, what I think they are trying to say here is: "*We have this problem for
which we do not know the solution right away. So we are just trying something,
by committing code into a remote branch hoping that somewhere we will get to a
solution. If in the end we do not get to a solution, we can just delete that
work by deleting the remote branch.*"

If we don't know the solution right away, why do we not spike out some ideas?

> A spike solution is a very simple program to explore potential solutions.
> Build the spike to only address the problem under examination and ignore all
> other concerns. Most spikes are not good enough to keep, so expect to throw it
> away.
>
> -- Don Wells, extremeprogramming.org

The purpose of a **Spike** is to write some throwaway code to test out an idea.

The output of a spike is not production code. During a spike you should never
ever commit code to a version control system. From my humble experience, once
code lands in version control it gets the label production code. It becomes
very hard to overcome the [sunk cost fallacy](https://en.wikipedia.org/wiki/Sunk_cost#Fallacy_effect)
and throw away that code.

The output of a spike is **knowledge, not code**.

After a couple of hours we should know if our idea worked out or not.
If it did not work out, no worries, we just throw away that code and try another
idea.
If it did work out, fantastic, we have just found the solution to our problem.
Again we throw away that code, and start over again. But this time we implement
the solution in small incremental steps using the knowledge we have just created
during that spike.

## It allows us to control the quality of what goes into production

Only features that went successfully through a quality gating process get merged
into mainline. As such these features get deployed into production.

I would think quality control is the exact reason why Continuous Delivery came
to the world.

> The objective is to eliminate unfit release candidates as early in the process
> as we can ... You are effectively prevented from releasing into production
> builds that are not thoroughly tested and found to be fit for their intended
> purpose.
>
> -- Dave Farley and Jez Humble, Continuous Delivery: Reliable Software Releases
> through Build, Test, and Deployment Automation

<!-- needs rephrasing, repeats the quote -->

We aim to eliminate bad quality release
candidates as early as possible. Only changes that successfully went through all
stages of the deployment pipeline, and that have been thoroughly tested, get into production.

In my humble opinion, this is the only effective way to control the quality of
what goes into production. Instead of trying to control quality through manual
merging.

<!-- needs to be elaborated: manual regression testing, risk of keeping the 
branch open for longer because of the manual regression testing -->

## It allows us to control which features get into production

Or more specifically, we can prevent that unfinished features get into
production. Because unfinished functionality sits on the feature branch. As long
as the branch has not been merged back into mainline, the feature cannot get
into production.

> Feature Branching is a poor man's modular architecture, instead of building
> systems with the ability to easy swap in and out features at
> runtime or deploy-time they couple themselves to the source control providing
> this mechanism through manual merging.
>
> -- Dan Bodart

What we are in fact doing here is using the Version Control System to turn
features off and on through manual merging. This is nothing else than a poor
man’s modular architecture.

Instead of using our Version Control System as a manual toggling mechanism we
should design our systems in such a way that we can turn features off and on at
deploy or runtime.

## Cargo Cult GitHub and Open Source

This is my favourite argument from individuals and teams: "*Yes, but GitHub!*".

Or said differently:

> Literally every GitHub repository that accepts pull requests uses short lived
> branches. It’s insane to say it “doesn’t work” when it’s the pre-eminent
> method of software collaboration today.
>
> James Nugent [@jen20](https://twitter.com/jen20) [Jul 13 2021](https://twitter.com/jen20/status/1415047268575727619?s=20)

Well, this sounds like Cargo Cult.

> A cargo cult is an indigenist millenarian belief system in which adherents
> perform rituals which they believe will cause a more technologically advanced
> society to deliver goods.
>
> -- [Wikipedia](https://en.wikipedia.org/wiki/Cargo_cult)

There is this belief that by copying the Open Source world, teams will achieve
a higher technological maturity, unseen quality levels and the ultimate
team coolness because they use all the features of GitHub.

Obviously, none of this is true. The "many eyes" in Open Source is a myth as we
have seen with the [many security incidents](https://twitter.com/tastapod/status/1415203858465312768?s=20)
in the past years from SSL to LDAP.

Let me repeat this ...

> What works for the open-source community, where a core team maintains
> a system and accepts contributions from the outside, does not necessarily work
> very well for a co-located team in a corporate environment.
>
> Thierry de Pauw, [On the Evilness of Feature Branching - A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})

## Stable Mainline

## Sense of Security

## Control (lack of trust)
