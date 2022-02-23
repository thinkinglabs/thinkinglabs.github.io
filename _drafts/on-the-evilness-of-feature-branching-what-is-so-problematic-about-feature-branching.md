---
layout: article
title: On the Evilness of Feature Branching - What is so Problematic about Feature Branching
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 2 of this series - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) - and [part 3 - But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) I dug into all the possible reasons teams mention for why they use feature branches. This time I want to go deeper into the problems introduced by the use of feature branches.

---

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

## It delays feedback

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

## It hinders integration of features

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

## It hides work for the rest of the team

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

## It works against refactoring

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

## It creates batch work and inventory

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

## It increases risks

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

## It creates cognitive overload

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

## Multi-repos, feature branching and the nervous breakdown

If you absolutely want to persevere with feature branching, please use a
mono-repo if you don't want your team members to have a nervous breakdown.

## You don't use feature branches. Feature Branches use you
