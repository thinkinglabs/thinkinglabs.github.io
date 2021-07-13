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

## Why is using Feature Branches a Problem?

### It delays feedback

As long as we have not merged our branch back to mainline, we simply do not
know if our changes broke the application or not. Continuous Integration is
only triggered the minute we are merging back to mainline.

This delay in feedback increases with the duration of the branch and with the
number of parallel branches.

If the branch lives for a couple of hours, feedback is delayed by a couple of
hours. If the branch lives for a couple of days, feedback is delayed by a couple
of days.

Remember, Continuous Integration is a practice to ensure always working software
and to get feedback within minutes whether a change broke the application or
not.

Lot’s of teams like to redefine Continuous Integration.

> We have our Jenkins running against all of our branches.

Having an automated build running against all of your branches is actually a
really, really good thing. But it is not Continuous Integration. You are not
integrating. The only feedback you get is whether the code that exists inside
your isolated branch still compiles and whether you haven't introduced any
regressions against the tests that exist inside that branch. You do not get any
feedback on whether your changes integrate well with the changes that exist on
all the other existing parallel branches.

From this moment on CI does not stand for Continuous Integration but stands for
**Continuous Isolation**. You are not integrating outside changes and the rest
of the team do not know how your changes integrate with their work.

### It hinders integration of features

If we are implementing multiple features at the same time in parallel,
integrating these features becomes exponentially harder with the number of
features that are being implemented in parallel, and the number of changes that
are required to implement these features.

One way to avoid these integration problems is using what Martin Fowler calls
[Promiscuous Integration](https://dzone.com/articles/promiscuous-integration-vs).
Be aware, Martin does not advise the use of Promiscuous Integration. He just
named the pattern.

In order to use changes from another branch, we cherry pick some commits from
that branch into our branch. We are actually communicating changes between
branches.

The biggest concern Martin Fowler has against Promiscuous Integration, apart
from introducing a lot of process complexity, is that with all that cherry
picking, we lose track of who has what on which branch.

Compare this complexity with the simplicity of having everyone in the team
commit its changes immediately to mainline. As such  they communicate their
changes immediately with the rest of the team. This helps in creating a
shared understanding of the code base and
[collective ownership](http://www.extremeprogramming.org/rules/collective.html).
Inevitably, this will also result in a better quality of our product and
a higher throughput of our software delivery process. Thus reducing lead time
and time to market.

### It hides work for the rest of the team

As long as we have not merged our branch back to mainline, the rest of the team
simply do not know in which direction we take the code to implement the feature
we are working on.

This is fine if everyone on the team works on different parts of the
application. But, the minute two team members are working in the same codebase
area they are each blind to how their work affects the other person.

On the other hand, if we are committing more frequently to mainline, we
communicate to the rest of the team the direction we take with the code to
implement this feature. For example, we could add a conditional indicating the
start of the new code we are working on and have it disabled by default. From
then on the rest of the team can see the changes we are introducing. They can
immediately see how this affects their work and they can instantly adapt to
these changes.

You could argue that introducing this conditional, increases the complexity of
the codebase. Which is true. On the other hand by using a feature branch and not
introducing this conditional, the conditional is not gone. It is still there,
but it is not obvious and absolutely not visible. The conditional is now the
Version Control System branch. From that moment on, your changes are invisible
for the rest of the team. They have no idea how this will impact their work.

Remember, the purpose of a Version Control System is not only to version source
code. A Version Control System is in fact a communication tool to communicate
changes with the rest of the team. This will again help in gaining a shared
understanding of the system and collective ownership. Again, this will
inevitably lead to better quality and higher IT delivery throughput.

### It works against refactoring

Because feature branches hide work for the rest of the team, it also discourages
the adoption of refactoring.

When we are just adding new code, integrating that is fairly straightforward.
But if we are refactoring our code, we introduce new abstractions, new concepts.
Unfortunately, Version Control Systems are not aware of semantic changes which
makes merging very difficult.

If we have two team members working on a codebase, each working in parallel on
their feature branch.

One team member refactors and merges back first. The other person has a
significant amount of changes on his branch. Merging back to mainline will be
far more painful for that second person. And probably, it will create the
necessary tension inside the team.

The longer the branch lives, the more refactoring has taken place, the harder
it becomes to merge back because of all the potential merge conflicts and all
the potential rework that will be required at merge time. Merging back becomes
a time consuming and very unpredictable activity. This will inevitably slow down
the team.

It is this slow down of the team that discourages the adoption of refactoring
inside the team. We all know that not enough refactoring prevents paying back
technical debt. When not paying back technical debt, adding new functionality to
the code base becomes harder and harder and more time consuming. Again, this
slows down the team. So we end up in this vicious circle where the team slows
down over time. Eventually it comes to a halt and nobody understands why and how
this happened.

### It creates batch work and inventory

When using branches we are actually introducing batch work. The longer the
branch lives, the more changes are accumulated on the branch, the bigger the
batch size becomes. Where the batch size is the number of commits that exist 
on the branch since the creation of the branch.

The bigger the batch size, the more work we have in progress.

Work in progress is nothing else than inventory. 

Inventory is just money stuck into the system.

It is stuck in the system because the organisation invested a quite lot of money
to create this inventory that consists of all of the code that exists on all of
these parallel branches. But this investment does not generate any revenue for
the organisation. As long as we have not merged back into mainline, deployed
the code into production and released it to the end users, it does not create
any value. Only when this code gets into production it will generate feedback
on how it behaves in production and how it is being used by the users. Only then
we can come up with new ideas on how to satisfy the user.

To reduce this inventory, we know from lean manufacturing, we have to reduce the
work in progress.

This means, working in smaller batches.

Thus, reducing the lifetime of the branch.

Thus, committing more frequently to mainline.

Which means, integrating more often.

Thus, achieving a state of Continuous Integration.

This brings us closer to a single-piece flow.

From lean manufacturing we know that a single-piece flow will increase
the throughput of IT delivery and reduce the lead time and the time to market
for new functionality.

### It increases risks

Because long-running branches create batch-work, it also create bigger
changesets. Bigger changesets mean more risks.

If we commit more frequently to mainline, the Continuous Integration process
will process smaller changesets. If the build breaks, finding the root cause
will be fairly easy. Because of the changeset is so small and because we
introduced the failing change just 5 min ago. So we still have enough context
to fix that build. In the end, we will be able to fix the build within
10 minutes.

On the other hand, when using feature branches, merging back to mainline happens
less often. As a result the Continuous Integration process will process bigger
changesets. If the build happens to break, finding the root cause will be far
more difficult because of the changeset is so big. And probably also because we
introduced the failing change a couple of hours or, worse, a couple of days ago.
So we do not have enough context any more to fix that build easily. Fixing the
build will become time consuming. From now on, we run the risk of having a
broken build for a very long period of time. We just lost the monitoring of the
health of your application. And so we lost the ability to perform on demand
production releases at any given moment in time. This will impact our lead time
and our time to market negatively.

### It creates cognitive overload

Lastly, it creates cognitive overhead for the team members.

To start feature development, we have to create a branch and push the branch to
the remote repository.

To reduce merge complexity, we have to rebase mainline onto our branch
frequently.
To communicate changes between branches, we have to cherry pick changes between
branches.
To switch work between features (this is never a good idea, but it happens), we
have to switch between branches.

When the feature is dev-complete and merged back, we may not forget to delete
the branch. Otherwise we end up with a repository having tons of branches no-one
dares to delete introducing another kind of technical debt.

To summarise, to implement a feature, team members have to perform lots of
operations on a day-to-day basis. They need to remember a large set of
VCS-commands. This creates cognitive overhead that could slow down the team.
Again, this will inevitably have a negative impact on throughput, lead time and
time to market.

Compare this complexity with the simplicity of having everyone on the team
commit frequently into mainline. This reduces redundant effort and simplifies
the workflow. We pull the latest changes from the remote repo, add our local
changes, commit and push. This is fairly easy, fairly simple. In the end team
members only have to remember a small set of VCS-commands to perform their
day-to-day work.

### Multi-repos, feature branching and the nervous breakdown

If you absolutely want to persevere with feature branching, please use a
mono-repo if you don't want your team members to have a nervous breakdown.

### You don't use feature branches. Feature Branches use you


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

