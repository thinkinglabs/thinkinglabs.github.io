---
layout: article
title: On the Evilness of Feature Branching - The Problems
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 2 of this series - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) - and [part 3 - But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) I dug into all the possible reasons teams mention for why they use feature branches. This time I want to go deeper into the problems introduced by the use of feature branches.

---

Again, before we move on, let us first clarify two definitions.

- What is *mainline*?
- What is *Continuous Delivery*?

> **Mainline** is the line of development which is the reference from which the
> builds of your system are created that feed into your deployment pipeline.
>
> -- [Jez Humble](https://twitter.com/jezhumble), [On DVCS, Continuous Integration and Feature Branches](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/)

> **Continuous Integration** is a  a software development practice where members of a team integrate their work frequently - usually each person integrates at least daily - leading to multiple integrations per day. Each integration is verified by an automated build […].
>
> -- [Martin Fowler](https://twitter.com/martinfowler), [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html)

Or said differently ...

> [It] is a practice designed to ensure that your software is always working, and that you get comprehensive feedback in a few minutes as to whether any given change to your system has broken it.
>
> -- [Jez Humble](https://twitter.com/jezhumble), [On DVCS, Continuous Integration and Feature Branches](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/)

This involves that:

- Everyone in the team commits to mainline at least once a day.
- Every commit triggers an automated build and execution of all the automated tests.
- And if the build fails it is back to green within 10 minutes.

The easiest way to fix a broken build is to revert the last commit that brings us back to the last known good state.

Note that [Continuous Integration is really a practice! It requires no particular tooling]({% post_url 2020-03-23-continuous-integration-is-not-a-tooling-problem%}).

The only tools we need for Continuous Integrations are :

- a version control system,
- an automated build,
- ...
- and team commitment to never break the build

## It delays feedback

As long as we have not merged our branch back to mainline, we simply do not
know if our changes broke the application or not. Continuous Integration is
only triggered the minute we are merging back to mainline.

![It delays feedback](/images/on-the-evilness-of-feature-branching-the-problems/it-delays-feedback.png)

This delay in feedback increases with the duration of the branch and with the
number of parallel branches.

If the branch lives for a couple of hours, feedback is delayed by a couple of
hours. If the branch lives for a couple of days, feedback is delayed by a couple
of days.

Remember, Continuous Integration is a practice to ensure always working software on mainline
and to get feedback within minutes whether a change broke the application or
not.

Lot’s of teams like to redefine Continuous Integration by saying: "*We have our Jenkins running against all of our branches*".

Having an automated build running against all of our branches is actually a
really, really good thing. But it is not Continuous Integration. We are not
integrating. The only feedback we get is whether the code that exists inside
our isolated branch still compiles and whether we have not introduced any
regressions against the tests that exist inside that isolated branch. We do not get any
feedback on whether our changes integrate well with the changes that live on
all the other existing parallel branches.

From this moment on CI does not stand for Continuous Integration but stands for
**[Continuous Isolation](https://continuousisolation.com)**. We are not integrating outside changes and the rest
of the team do not know how our changes integrate with their work.

## It hinders integration of features

If we are implementing multiple features at the same time in parallel,
integrating these features becomes exponentially harder with the number of
features that are being implemented in parallel, and the number of changes required to implement these features.

One way to avoid these integration problems is using what Martin Fowler calls
[Promiscuous Integration](https://dzone.com/articles/promiscuous-integration-vs).
Be aware, Martin does not advise the use of Promiscuous Integration. He just
named the pattern.

![It hinders the integration of features](/images/on-the-evilness-of-feature-branching-the-problems/it-hinders-integration-of-features.png)

In order to use changes from another branch, we cherry pick some commits from
that branch into our branch. We are actually communicating changes between
branches.

However, the biggest concern Martin Fowler has against Promiscuous Integration, apart
from introducing a lot of process complexity, is that with all that cherry
picking, we lose track of who has what on which branch.

Compare this complexity with the simplicity of having everyone in the team
commit its changes immediately to mainline. As such  they communicate their
changes immediately with the rest of the team. This helps in creating a
shared understanding of the code base and
[collective ownership](http://www.extremeprogramming.org/rules/collective.html).
Inevitably, this will result in a better quality of our product and
a higher throughput of our software delivery process. Thus reducing the lead time
and the time to market.

## It hides work for the rest of the team

As long as we have not yet merged our branch back to mainline, the rest of the team
simply do not know in which direction we are taking the code to implement the feature
we are working on.

![It hides work for the rest of the team](/images/on-the-evilness-of-feature-branching-the-problems/it-hides-work-for-the-rest-of-the-team.png)

This is fine as long as everyone on the team works on different parts of the
application. But, the minute two team members are working in the same codebase
area they are each blind to how their work affects the other person.

On the other hand, if we are committing more frequently into mainline, we
communicate to the rest of the team the direction we are taking with the code to
implement this feature. For example, we could add a conditional indicating the
start of the new code we are working on and have it disabled by default. From
then on the rest of the team can see the changes we are introducing. They can
immediately see how this affects their work and they can instantly adapt to
these changes.

We could argue that introducing this conditional, increases the complexity of
the codebase. Which is true. On the other hand by using a feature branch and not
introducing this conditional, the conditional is not gone. It is still there,
but it is not obvious and absolutely not visible. Because the conditional is now the
Version Control System branch. From this moment on, **our changes are invisible
for the rest of the team**. They have no idea how those changes will impact their work.

Remember, the purpose of a Version Control System is not only to version source
code. **A Version Control System is really a communication tool** to communicate
changes with the rest of the team. This will again help in gaining a shared
understanding of the system and achieve [collective ownership](http://www.extremeprogramming.org/rules/collective.html). Again, this will inevitably lead to better quality, higher IT delivery throughput, shorter lead times and time to market.

## It works against refactoring

Because feature branches hide work for the rest of the team, it also discourages
the adoption of refactoring.

When we are just adding new code, integrating that code is fairly straightforward.
But if we are refactoring our code, we are introducing new abstractions and new concepts.
Unfortunately, Version Control Systems are not aware of semantic changes which
makes merging very difficult.

If we have two team members working on a codebase, each working in parallel on
their feature branch.

![It works against refactoring](/images/on-the-evilness-of-feature-branching-the-problems/it-works-against-refactoring.png)

One team member refactors and merges back first. On the other hand, the other person has a
significant amount of changes on their branch. Merging back to mainline will be
far more painful for that second person. And probably, that will create the
necessary tension inside the team.

The longer the branch lives, the more refactoring has taken place, the harder
it becomes to merge back because of all the potential merge conflicts and all
the potential rework that will be required at merge time. Merging back becomes
a time consuming and very unpredictable activity. This will inevitably slow down
the team.

It is exactly this slow down of the team that discourages the adoption of refactoring
inside the team. We all know, not enough refactoring prevents paying back
technical debt. When not paying back technical debt, adding new functionality to
the code base becomes harder and harder and more time consuming. Again, this
slows down the team. To then end in this vicious circle where the team slows
down over time. Eventually coming to a halt and nobody really understanding why and how
this happened.

## It creates batch work and inventory

When using branches we are in fact introducing batch work. The longer the
branch lives, the more changes are accumulated on the branch, the bigger the
batch size becomes. Where the batch size is the number of commits that exist
on the branch since the creation of the branch.

The bigger the batch size, the more work we have in progress. Where work in progress is nothing else than inventory.
And **inventory is just money stuck into the system**.

![It creates batch work and inventory](/images/on-the-evilness-of-feature-branching-the-problems/it-creates-batch-work.png)

The money is stuck in the system because the organisation invested quite lot of money
to create this inventory that consists of all of the code that exists on all of
these parallel branches. But this investment does not generate any revenue for
the organisation. As long as we have not merged back into mainline, deployed
the code into production and released it to the end users, it does not create
any value. Only when this code gets into production it will generate feedback
on how it behaves in production and how it is being used by the users. Only then
we can come up with new ideas and take new decisions on how to satisfy the user.

To reduce this inventory, we know from lean manufacturing, we have to reduce the
work in progress.

This means, working in smaller batches. Reducing the lifetime of the branch. Committing more frequently to mainline.
Which means, integrating more often. As such, achieving a state of Continuous Integration. In the end, this brings us closer to a single-piece flow.

From lean manufacturing we know that a single-piece flow will increase
the throughput of our IT delivery and reduce the lead time and the time to market
for new functionality.

## It increases risks

Because long-running branches create batch-work, it also create bigger
changesets. Bigger changesets mean more risks.

![It increases risks](/images/on-the-evilness-of-feature-branching-the-problems/it-increases-risks.png)

If we commit more frequently to mainline, the Continuous Integration process
will have to process a smaller changeset. If the build breaks, finding the root cause
will be fairly easy because the changeset is so small and also because we
introduced the failing change just a couple of minutes ago. We will still have enough context
to fix that build. In the end, we will be able to fix the build within 10 minutes.

On the other hand, when using feature branches, merging back to mainline happens
less often. As a result the Continuous Integration process will have to process a bigger
changeset. If the build happens to break, finding the root cause will be far
more difficult because of the changeset is so big and probably also because we
introduced the failing change a couple of hours or, worse, a couple of days ago.
This time, we do not have enough context any more to fix this build easily. Fixing the
build will become difficult and time consuming. From now on, we run the risk of having a
broken build for a very long period of time. We now lost the monitoring of the
health of our application. So we lost the ability to perform on demand
production releases at any given moment in time. Which obviously will have a negative impact on lead time
and time to market.

## It creates cognitive overload

Lastly, it creates cognitive overhead for the team members.

- To start a feature development, we have to create a branch and push the branch to the remote repository.
- To reduce merge complexity, we have to rebase mainline onto our branch frequently.
- To communicate changes between features that are being designed in parallel, we have to cherry pick changes between branches.
- To switch work between features - which is never a good idea, but it happens - we have to switch between branches.
- When the feature is dev-complete and merged back into mainline, we may not forget to delete
the branch. Otherwise we end up with a repository having a truck load of branches no-one
dares to delete introducing another kind of technical debt.

To summarise, to implement a feature, team members have to perform lots of version control
operations on a day-to-day basis. They need to remember a large set of
version control commands. This creates cognitive overhead that could slow down the team.
Again, this will inevitably have a negative impact on the throughput of IT delivery, its lead time and
its time to market.

Compare this complexity with the simplicity of having everyone on the team
commit frequently into mainline. This reduces redundant effort and simplifies
the workflow. We pull the latest changes from the remote repository, we add our local
changes, we then commit and push. This is fairly easy, fairly simple. In the end team
members only have to remember a small set of version control commands to perform their
day-to-day work.

## Multi-repos, feature branching and the nervous breakdown

If you absolutely want to persevere with feature branching, please use a
mono-repo if you do not want your team members to have a nervous breakdown.

## You do not use feature branches. Feature Branches use you