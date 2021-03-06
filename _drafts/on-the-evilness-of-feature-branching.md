---
layout: article
title: On the Evilness of Feature Branching
categories:
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

## A Tale of Two Teams

In 2012, I had the opportunity to start a technical coaching mission. The
purpose of the mission was to upscale the software engineering skills of a
rather novice team. Novice from an engineering perspective. The team had a
working-experience ranging from 5 to 20 years. They hadn't had the luxury to
attend conferences. Or to work with people that would show them different
ways of working.

Luckily, we were the two of us coaching that team. It is always reassuring to
pair-coach. Especially when you have to introduce lots of change with people
having lots of working-experience.

When starting, we discovered a situation we weren't expecting to still encounter
in 2012. No one in the team, except for one person, was using any version
control system. Code was shared amongst team members using ... shared drives.

In 2018 and 2020, I discovered more organisations still apply the no-version
control anti-pattern.

> Historically I meet 1 team a year on average who aren't using version/source
> code control. Common reasons:
>
> - very immature team
> - SQL
> - PickOS derivative or ERM/CRM system
>
> Last category may even lack tooling
>
> -- Allan Kelly, [Nov 8, 2020](https://twitter.com/allankellynet/status/1325491840146149377)

The first thing we obviously did was **introducing version control**. As the
team was a novice in using version control, I thought Git would be a bridge too
far. Too many concepts to learn. Therefore I suggested SubVersion. Very simple.
Only three concepts to grasp:

- You check out code,
- you modify it,
- and you check it back in. And you are done.

Because allegedly branching was rather painful with SubVersion - less
troublesome than with CVS but still more demanding than with Git - I also
suggested using no branches at all. **Everyone in the team was going to commit
directly into trunk**. To be honest, at the time, I did not understand much
about branching strategies. It all seemed too complicated to me.

That all worked pretty well. Because ... there was a second thing we introduced,
right from the start, **the practice of Continuous Integration** and
**team-commitment that any change had to be covered by automated tests**,
preferably unit tests.
This Continuous Integration later evolved into Continuous Delivery.

At the time, I did not realise this was a valid branching strategy. And that it
had an actual name. It is only years later I learned it was named
**Trunk-Based Development**.

Was trunk never broken? To be honest, yes. More often than good. Remember, this
was a novice team. But that wasn't really a problem. Because Continuous
Integration was in place, allowing us to discover any breaking change early
enough, allowing us to fix it immediately while it was still small and easy to
fix.

When the team gained maturity, we thought it was time to migrate to Git. The
main reasons for that decision were:

- there is more tooling available for managing Git repos;
- and we wanted to adopt the Pull-Request model for code reviews.

So we needed something that would allow us to create branches more easily.

But ... what works for the open source community, where a core team maintains
a system and accepts contributions from the outside, does not necessarily work
very well for a co-located team in a corporate environment.

> Like all powerful tools, there are many ways you can use them (DVCS), and not
> all of them are good.
>
> -- Jez Humble, On DVCS, continuous integration, and feature branches

Here Jez refers to the use of feature branching. And the fact that proponents of Distributed Version Control Systems (DVCS) rely on feature branching to sell
DVCSs. Together with all the tooling that exist around DVCSs, it makes everyone
blind to the problems related to the use of long-running branches.

> [@AgileSteveSmith](https://twitter.com/AgileSteveSmith)
> at CITCON Asia @PaulJulius had a session
> "Are Feature Branches Evil?" :)  I guess that makes us old school...
>
> -- Jeffrey Fredrick, [Mar 29, 2015](https://twitter.com/Jtf/status/582244493824536576)
>
> [@Jtf](https://twitter.com/Jtf)
> [@PaulJulius](https://twitter.com/PaulJulius)
> In the old days they were always evil, now they mostly evil
> but people are blinded by DVCS tooling
>
> -- Steve Smith, [Mar 29, 2015](https://twitter.com/SteveSmith_Tech/status/582245267216424961)

And we've hit those problems. Really, really hard. We tried to find solutions by
introducing ever more complex processes and ever more complex technology. But it
never really solved the underlying problem. It only added more complexity. In
the end, we sat together to discuss the matter and decided to let go on the use
of feature branches and to go back to what worked for us, i.e. trunk-based
development. We never looked back.

8 years later, in 2021, I discovered that team is still practising trunk-based
development. They cannot imagine another way of working.

After that mission, somewhere in 2016, I started a new mission in a totally
different organisation. Very agile, working with highly skilled engineers where
everyone was working in pair almost all the time. But ... they decided as an
organisation to use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/).
When arriving, I discovered branches living from 5 days to somewhere 30 days.
People had to rebase mainline frequently into their branches, with lots of
rework and causing people to spend much non-valuable time on fixing things.

With the experience I gained working with that previous novice team, I suggested
to run an experiment with trunk-based development. A new project was starting at
the time. Only two people would work on that project. You would wonder why
bother to use GitFlow with a 2-persons project. That wasn't going to be a very
riskful experience, isn't it?

> Convincing people about the immeasurable rewards of Trunk Based Development is
> not an overnight task.
>
> -- Iqbal Ahmed, [Nov 24, 2016](https://twitter.com/propattern/status/801803007461650433)

Whenever I suggest trunk-based development, especially in front of experienced,
skilled engineers, I always get that same reaction: People stare at me like I
am a retarded moron. "*Are you insane? Branching is a commonly accepted practice.
The whole industry uses some sort of branching strategy. And you are suggesting
to have the whole team committing immediately into mainline? It will be a mess
because of all the merge conflicts!*".

> The idea that developers should **work in small batches off master** or trunk
> rather than on long-lived feature branches **is still one of the most
> controversial ideas in the Agile canon**, despite the fact it is the norm in
> high-performing organizations such as Google.
>
> -- 2016 State of DevOps Report

Although trunk-based development is implied by Continuous Integration. Although
trunk-based development has been reported since 2015 by the [State of DevOps
report](https://services.google.com/fh/files/misc/state-of-devops-2015.pdf)
to predict high software delivery performance. And although trunk-based
development is practised by organisations like Facebook, Microsoft, Netflix
and Google at an immense large scale (in [2016](https://dl.acm.org/doi/pdf/10.1145/2854146)
we are speaking about 25.000 developers working on one trunk with 16.000 changes
per day), it is still one of the most controversial practices in the IT
industry.

But, I failed miserably in trying to convince them of the benefits of
trunk-based development and getting them to run a small experiment
with trunk-based development. I lacked the right arguments. I only had that one
experience working with that novice team. Although I used quite some branching
strategies in my past career, I never really paid attention to the problems
they introduce.

Here was the opportunity to observe what happens when a team adopts a
branching strategy like GitFlow, which resulted in this article.

## Some Definitions

To make sure we are all aligned on the meaning of some practices, I am going to
reintroduce some of them. I'm sure you know them. But some people in our
industry love to redefine practices to assure the practice is applied in their
organisation.

### Mainline

> **Mainline** is the line of development which is the reference from which the
> builds of your system are created that feed into your deployment pipeline.
>
> -- Jez Humble

For Git, this is the *master* branch or, preferably the *main* branch. For
Mercurial this is the default branch. For CVS and SubVersion, this is *trunk*.

### Feature Branching

> **Feature Branching** is a practice where people do not merge their code into
> mainline until the feature they are working on is "*done*"
> (but not yet “*done done*”).
>
> -- Jez Humble

**Done** means it is dev-complete. but there is still a lot of work to be done
before it gets into production:

- a new build has to be created;
- all the automated tests have to be executed;
- it has to be deployed in a staging environment;
- smoke tests have to be executed;
- then manual exploratory testing can start;
- eventually, in parallel, security and performance tests have to be executed;
- if everything was successful, it can be deployed into production;
- again smoke tests have to be executed;
- to finally being able to release to the end-user.

The implementation of a feature starts with the creation of a branch. The
feature grows on that branch. When the feature is finished it goes through a
gating process called a code review. After successfully going through that
gating process, it gets merged back into mainline.

To be clear, when we speak about *feature branching* we really mean long-running
branches that live for **longer than a day**.

## Continuous Integration

> Continuous Integration is a practice where members of a team integrate their
> work frequently - usually each person integrates at least daily - leading to
> multiple integrations per day. Each integration is verified by an automated
> build […].
>
> -- Martin Fowler

*It is a practice to ensure always working software and to get feedback within
a few minutes as to whether any given change broke the application or not.*,
Jez Humble

This involves that:

- Everyone in the team commits to mainline at least once a day.
- Every commit triggers an automated build and execution of all the automated
- tests.
- And if the build fails it is back to green within 10 minutes.

The easiest way to fix a broken build is to revert the last commit. This brings
you back to the last known good state.

Note! CI is really a practice! You do not need much tooling for this.

The only things you need for Continuous Integrations are :

- a version control system,
- an automated build,
- and eam commitment to never break the build

### The Goal of an Organisation

> The goal of an Organisation is
> to **sustainably minimise** the **lead time**
> to create positive **business impact**.

Where **Lead Time** is the clock wall time between *we as a team have an idea*
and that idea gets implemented, deployed in production, released to users and
used by real users.

**Business Impact** is anything that:

- Creates money this is your turnover.
- Saves money this your cost reductions.
- And protects money this is being ahead of your competition.

We want to reduce the lead time because we want to accelerate feedback. We want
to know as fast as possible if the thing we just implemented and deployed into
production is actually being used and how it is being used. Based on this
information we can make new decisions. We can run new experiments to find out
new unmet needs of our customers and new ways to delight our customers. Which is
a huge competitive advantage.

## Why Feature Branches?

Before I could ever suggest trunk-based development again, I had to understand
why teams are using feature branches. What problems are they trying to solve
with long-running branches.

I asked proponents of feature branching for their reasons. Here follows four of
them.

### It allows us to work in isolation, therefore we are more productive

This sounds fair. It seems rather obvious. But, when you think about it, it
feels it is a local optimisation.

We are optimising for individual developer productivity. But developing IT
systems is rarely an individual activity. Most of the time it is a team
activity.

>Developing in isolation can help an **individual** go faster. But it does not
> help a **team** go faster. Merge time and rework cannot be estimated and will
> vary wildly, and the team can only go as fast as the slowest merge.
>
> -- Steve Smith

Your team will only go as fast as the slowest merge.

As long as you have not merged back to mainline you simply do not know how much
work is still left to do. Potential merge conflicts will introduce  rework at
merge time. Integrating changes into mainline becomes a time-consuming and very
unpredictable activity. This makes the whole IT delivery process very
unpredictable and increases the lead time, and the time to market.

Remember, the goal of any organisation is to sustainably reduce this lead time
in order to create positive business impact. To get early feedback. To find new
ways to delight the customer. Here we are doing quite the opposite!

Therefore instead of optimising for developer productivity we should optimise
for team productivity and adopt a team-oriented branching strategy.

### If a refactoring goes nowhere, we can just delete it

Again fair enough. This looks very obvious.

However, what I think they are trying to say here is: "*We have this problem for
which we do not know the solution right away. So we are just trying something,
by committing code into a remote branch hoping that somewhere we will get to a
solution. If in the end we do not get to a solution, we can just delete that
work by deleting the remote branch.*"

If you don't know the solution right away, why do you not spike out some ideas?

> A spike solution is a very simple program to explore potential solutions.
> Build the spike to only address the problem under examination and ignore all
> other concerns. Most spikes are not good enough to keep, so expect to throw it
> away.
>
> -- Don Wells, extremeprogramming.org

The purpose of a **Spike** is to write some throwaway code to test out an idea.

The output of a spike is not production code. During a spike you should never
ever commit code to a version control system. From my humble experience, once
code lands in version control it somehow get seen as production code. It becomes
very hard to overcome the [sunk cost fallacy](https://en.wikipedia.org/wiki/Sunk_cost#Fallacy_effect)
to throw away that code.

The output of a spike is in fact knowledge, not code.

After a couple of hours you should know if your idea worked out or not.
If it did not work out, throw away that code and try another idea.
If it did work out, fantastic, you just found the solution to your problem.
Again throw away that code, and start over again. But this time implement the
solution in small incremental steps using the knowledge you have just created
during that spike.

### It allows us to control the quality of what goes into production

Only features that went successfully through a quality gating process, called a
code review, get merged into mainline. As such these features get deployed into
production.

I would think that quality control is the whole purpose of having Continuous
Integration and Continuous Delivery in place.

> The objective is to eliminate unfit release candidates as early in the process
> as we can ... You are effectively prevented from releasing into production
> builds that are not thoroughly tested and found to be fit for their intended
> purpose.
>
> -- Dave Farley and Jez Humble, Continuous Delivery: Reliable Software Releases
> through Build, Test, and Deployment Automation

The objective of Continuous Integration and by extension Continuous Delivery is
to eliminate bad quality release candidates as early as possible. Only changes
that successfully went through all stages of the deployment pipeline, and that
have been thoroughly tested, get into production.

In my humble opinion, this is the only effective way to control the quality of
what goes into production. Instead of trying to control quality through manual
merging.

<!-- needs to be elaborated: manual regression testing, risk of keeping the 
branch open for longer because of the manual regression testing -->

### It allows us to control which features get into production

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
