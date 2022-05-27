---
layout: article
title: On the Evilness of Feature Branching - The Problems
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 2 of this series - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) - and [part 3 - But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) I went into all the possible reasons teams mention themselves for why they use feature branches. This time I want to go deeper into the problems introduced by the use of feature branches.

---

Before we move on, let me first again clarify two definitions.

- What is *mainline*?
- What is *Continuous Integration*?

> **Mainline** is the line of development which is the reference from which the
> builds of your system are created that feed into your deployment pipeline.
>
> -- Jez Humble, [On DVCS, Continuous Integration and Feature Branches](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/)

> **Continuous Integration** is a  a software development practice where members of a team integrate their work frequently - usually each person integrates at least daily - leading to multiple integrations per day. Each integration is verified by an automated build […].
>
> -- Martin Fowler, [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html)

Or said differently ...

> [It] is a practice designed to ensure that your software is always working, and that you get comprehensive feedback in a few minutes as to whether any given change to your system has broken it.
>
> -- Jez Humble, [On DVCS, Continuous Integration and Feature Branches](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/)

This involves:

- Everyone in the team commits to mainline at least once a day.
- Every commit triggers an automated build and execution of all the automated tests.
- If the build fails it is back to green within 10 minutes.

The easiest way to fix a broken build is to revert the last commit that brings us back to the last known good state.

Note that [Continuous Integration is really a practice! It requires few particular tooling]({% post_url 2020-03-23-continuous-integration-is-not-a-tooling-problem%}).

The only tools we need for Continuous Integrations are :

- a version control system,
- an automated build,

and team commitment to never break the build.

Continuous Integration was defined this way in the late nineties by [Extreme Programming](http://www.extremeprogramming.org). The idea was to have only one branch for the whole team. They wanted to be alerted whenever code could not integrate at the earliest moment as possible. The practice could be performed by humans. No servers or daemons were required.

However, nowadays, many teams choose to work with feature branches for the various reasons mentioned in [part 2 - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) - and [part 3 - But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}). But this comes with a myriad of problems.

## The Problems

### It delays feedback

As long as we have not merged our branch back to mainline, we simply do not know if our changes broke the application or not. Continuous Integration is only triggered the minute we are merging back to mainline.

![It delays feedback](/images/on-the-evilness-of-feature-branching-the-problems/it-delays-feedback.png)

This delay in feedback increases with the duration of the branch and with the number of parallel branches.

If the branch lives for a couple of hours, feedback is delayed by a couple of hours. If the branch lives for a couple of days, feedback is delayed by a couple
of days.

Often the solution to delayed feedback is to start even more work, instead of finishing the work that is already in progress. Or, worse, throw even more people to the problem to then hit [Brooks's Law](https://en.wikipedia.org/wiki/Brooks%27s_law). Hence, again increasing the work in progress together with the number of parallel branches. To then have waiting times going through the roof. All of this, of course, to optimise for utilisation. And **here we are in hell**.

Remember, Continuous Integration is a practice to ensure always working software on mainline and to get feedback within minutes whether a change broke the application or not.

However, lot’s of teams like to redefine Continuous Integration by saying: "*We have our [preferred centralised build tool] running against all of our branches*".

Having an automated build running against all of our branches is actually a really, really good thing. But it is not Continuous Integration. We are not integrating. It is still a lie. The only feedback we get is whether the code that exists inside our isolated branch still compiles and whether we have not introduced any regressions against the tests that exist inside that isolated branch. We do not get any feedback whatsoever on whether our changes integrate well with the changes that exist on all the other existing parallel branches. Even when all tests pass on the branch, they still may fail when merging back into mainline. The real authoritative feedback only happens at merge time when integrating, once the feature is finished. Everything else is a guess.

From this moment on **CI stands for [Continuous Isolation](https://continuousisolation.com)** and not any more for *Continuous Integration*. We are not integrating outside changes and the rest of the team do not know how our changes integrate with their work.

The value of accelerating this feedback resides in failing fast. Problems are spotted really early, within minutes. We achieve this when committing frequently, multiple times a day, regardless of code complexity or team size. But it requires we work very hard to keep getting fast feedback. This means if the build is too slow, we need to speed up the build; if tests are too slow, we need to write better and more concise tests; if hardware is too slow, we need to buy faster hardware; if the codebase is too coupled, preventing us to write concise tests, we need to decouple the codebase.

### It hinders integration of features

If we are implementing multiple features at the same time in parallel,
integrating these features becomes exponentially harder with the number of
features that are being implemented in parallel, and the number of changes required to implement these features.

One way to avoid these integration problems is using what [Martin Fowler](https://twitter.com/martinfowler) calls
[Promiscuous Integration](https://dzone.com/articles/promiscuous-integration-vs).
Be aware, Martin does not advise the use of Promiscuous Integration. He just
named the pattern.

![It hinders the integration of features](/images/on-the-evilness-of-feature-branching-the-problems/it-hinders-integration-of-features.png)

In order to use changes from another feature that is currently being implemented, we cherry pick some commits from
that feature branch into our branch. We are now actually communicating changes between branches.

However, the biggest concern Martin Fowler has against Promiscuous Integration, apart
from introducing a lot of process complexity, is that with all that cherry
picking, **we lose track of who has what on which branch**. Also for testers it becomes a painful exercise to figure out where the risk resides, on which branch and what to focus feedback on.

Compare this complexity with the simplicity of having everyone in the team commit its changes immediately to mainline. They communicate their changes immediately with the rest of the team. Helping to create a shared understanding of the code base and a [collective ownership](http://www.extremeprogramming.org/rules/collective.html) of the code base. Inevitably, this leads into better quality and higher IT delivery throughput and reduces the lead time
and the time to market.

### It hides work for the rest of the team and therefore disables communication

As long as we have not yet merged our branch back to mainline, the rest of the team simply do not know in which direction we are taking the code to implement the feature we are working on.

![It hides work for the rest of the team](/images/on-the-evilness-of-feature-branching-the-problems/it-hides-work-for-the-rest-of-the-team.png)

This is fine as long as everyone on the team works on different parts of the application. But, the minute two team members are working on the same codebase
area they are each blind to how their work affects the other person. As a result, collaboration is sacrificed because everyone is focussed on the changes happening in their isolated branch.

On the other hand, if we are committing more frequently into mainline, we communicate to the rest of the team the direction we are taking with the code to
implement this feature. For example, we could add a conditional indicating the start of the new code we are working on and have it disabled by default. From then on the rest of the team sees the new changes we are introducing. They can immediately spot how this affects their work and thus can instantly adapt to these changes. As a result, tt eliminates the classic rework happening at merge time and enables the fast flow of work through the value stream.

This is precisely the purpose of Version Control Systems together with Continuous Integration. To publish our ideas to the rest of the team and see the impact on others within minutes. The rest of the team sees the direction of our thinking. Consequently, it enables communication inside the team and the fast flow of work, higher IT delivery throughput, reduced lead time and time to market.

We could argue that introducing this conditional, increases the complexity of the codebase. Which is true. On the other hand by using a feature branch and not
introducing this conditional, the conditional is not eliminated. It is still there. But it is not obvious and absolutely not visible. The conditional is now the Version Control System branch. From now on, **our changes are invisible for the rest of the team**. They have no idea how those changes will impact their work.

Remember, the purpose of a Version Control System is not just to version source code. **A Version Control System is really a communication tool** to communicate
changes with the rest of the team. This will again help in gaining a shared understanding of the system and achieve [collective ownership](http://www.extremeprogramming.org/rules/collective.html) over the code base. Again, this will inevitably lead to better quality, higher IT delivery throughput, shorter lead times and time to market.

**Working on mainline forces communication**.

### It discourages refactoring

Because feature branches hide work for the rest of the team, it also discourages the adoption of refactoring.

When we are just adding new code, integrating that code is fairly straightforward. But if we are refactoring our code, we are introducing new abstractions and new concepts. For instance we rename a method; extract code as a new method or a new class; or we reorder methods inside a class; move code between classes.

Unfortunately, Version Control Systems are not aware of semantic changes which makes merging very difficult. Either this introduces tons of conflicts at merge time or even worse [Semantic Bugs](https://martinfowler.com/bliki/SemanticConflict.html).

If we have two team members, each working in parallel on their feature branch.

![It works against refactoring](/images/on-the-evilness-of-feature-branching-the-problems/it-works-against-refactoring.png)

One team member refactors and merges back first. The other person has a
significant amount of changes on their branch. Merging back to mainline will be
far more painful for that second person. And probably, that will create the
necessary tension inside the team. Even in teams that work really well together, where they understand this can happen and therefore do not necessarily get upset, yet still one has to "give in" and compromise. Which is never a good feeling.

The longer the branch lives, the more refactoring has occurred, the harder
it becomes to merge back because of all the potential merge conflicts and all
the potential rework that will be required at merge time. Merging back becomes
a time consuming and very unpredictable activity. This will inevitably slow down
the team.

It is exactly this slow down of the team that discourages the adoption of refactoring inside the team. We all know, not enough refactoring prevents paying back
technical debt. When not paying back technical debt, adding new functionality to the code base becomes far more time consuming and difficult. Again, this
slows down the team. To then end in this vicious circle where the team slows down over time. Eventually coming to a halt and nobody really understanding why and how this happened.

In contrast, refactoring is pretty easy and down right fast when adopting [trunk-based development](https://trunkbaseddevelopment.com) together with [Baby Steps](http://www.slideshare.net/davidvoelkel/baby-steps-tdd-approaches), [Expand-Contract](https://martinfowler.com/bliki/ParallelChange.html) and [Branch by Abstraction](https://www.branchbyabstraction.com).

### It works against Collective Ownership

[Collective Owernership](http://www.extremeprogramming.org/rules/collective.html) is one of key practices of [Extreme Programming](https://en.wikipedia.org/wiki/Extreme_programming): *anyone who sees an opportunity to add value to any portion of the code is required to do so at any time*.

It has the benefits:

- Complex code does not live very long, because someone else will soon simplify it. As a consequence, adding new functionality will never be difficult.
- Anyone who finds a problem, will fix it immediately, leading to higher quality.
- Knowledge of the system is now shared between team members. Anyone is able to add functionality or apply changes to any part of the system removing bottlenecks and enabling the fast flow of work through the value stream.

However, with feature branches each team member is working on its own isolated branch hidden from the rest of the team, hence it works against collective ownership. Code is written by one individual. This introduces the strong tendency to see the code they wrote as "my code".

We loose the benefit of being a team as the team now dependents on individuals and is not resilient any more. We now rely on specific team members to change specific parts of the system. Inevitably this introduces bottlenecks for change, reducing throughput and increasing time to market.

Because it goes against collective ownership, code will tend to be more complex. Adding new functionality will be more difficult and more time consuming. Again reducing IT delivery throughput and increasing time to market.

Because knowledge of certain parts of the system is concentrated in specific individuals, it increases risk.

At last, because feature branching cancels collective ownership, nobody shares the responsibility for the quality of the IT systems.

### It introduces batch work and inventory

When using branches we are in fact introducing batch work. The longer the
branch lives, the more changes are accumulated on the branch, the bigger the
batch size becomes. Where the batch size is the number of commits that exist
on the branch since the creation of the branch.

The drawbacks of batching were discovered by [Taiichi Ohno](https://en.wikipedia.org/wiki/Taiichi_Ohno) at Toyota back in the 1950's.

> ... he made an unexpected discovery -- it actually costs less per part to make small batches of stampings than to run off enormous lots.
>
> ... Making small batches eliminated the carrying cost of the huge inventories ...
> Even more important, making only a few parts before assembling them [...] caused stamping mistakes to show up almost instantly.
>
> The consequences of this latter discovery were enormous. It made [workers] much more concerned about quality and it eliminated waste of large numbers of defective parts.
>
> ... But to make this system work at all [...] Ohno needed both extremely skilled and a highly motivated workforce.
>
> -- Womack, Jones and Roos, [The Machine That Changed The World](https://en.wikipedia.org/wiki/The_Machine_That_Changed_the_World_(book)), p52

Womack, Jones and Roos called this [*Lean Manufacturing*](https://en.wikipedia.org/wiki/Lean_manufacturing). Later it was proved by [Mary and Tom Poppendieck](http://www.poppendieck.com) [it also applies to software development](https://en.wikipedia.org/wiki/Lean_software_development). Donald Reinertsen discussed at great length the harm caused by batch work in chapter 5 "*Reducing Batch Size*" of his book [The Principles of Product Development Flow](https://www.goodreads.com/book/show/6278270-the-principles-of-product-development-flow).

The bigger the batch size, the more work we have in progress. The more work in progress the more inventory we have. **Inventory is just money stuck into the system**.

![It creates batch work and inventory](/images/on-the-evilness-of-feature-branching-the-problems/it-creates-batch-work.png)

It is stuck into the system because the organisation invested quite lot of money to create this inventory consisting of all the code that lies around on all those parallel branches. But this investment does not generate any revenue for the organisation. **As long as we have not merged back into mainline, deployed the code into production and released it to the end users, it does not create any value**. Only when this code gets into production in the hands of the users it will generate feedback on how it behaves in production and how it is being used by the users. Only then we can take new decisions and come with new ideas on how to find new ways to delight the user and solve their problems and needs. This will have an enormous impact on business growth and opportunities.

To reduce this inventory, we know from Lean Manufacturing, we have to reduce the work in progress.

This means, working in smaller batches. Reducing the lifetime of the branch. Committing more frequently to mainline.
Which means, integrating more often. As such, achieving a state of Continuous Integration and bringing us closer to a single-piece flow.

From Lean Manufacturing we know that a single-piece flow will increase the IT delivery throughput, increase quality and stability and reduce the lead time for changes, and the time to market for new functionality.

### It increases risks

Because long-running branches create batch-work, it also create bigger
changesets. Bigger changesets mean more risks.

![It increases risks](/images/on-the-evilness-of-feature-branching-the-problems/it-increases-risks.png)

If we commit more frequently to mainline, the Continuous Integration process has to process a smaller changeset. If the build happens to break, finding the root cause will be fairly easy because the changeset is so small. Also because we introduced the failing change just a couple of minutes ago. We still have enough context to easily fix that build. In the end, we can fix the build within 10 minutes and still achieve a state of Continuous Integration.

On the other hand, when using feature branches, merging back to mainline happens less often. As a result the Continuous Integration process has to process a bigger changeset. If the build happens to break, finding the root cause will be far more difficult because the changeset is so big. Probably, also because we
introduced the failing change a couple of hours or, worse, a couple of days ago. This time, we do not have enough context any more to quickly fix that build. Fixing the build becomes difficult and time consuming. From now on, we run the risk of having a broken build for a very long period of time. **We just lost the monitoring of the health of the application**. We also lost the ability to perform on demand production releases at any given moment in time. Obviously, this has a negative impact on lead time and time to market.

When having huge changesets, [Lisi Hocke](https://twitter.com/lisihocke) remarks, any kind of feedback activity will find less improvements than when you have a small change set. A small change set that fits in our head allows us to create a good mental model about it. We can think about the implications and risks. We probably will find lots of small improvements. However, huge changesets on the other hand take already long to just ... read through. Not even talking about understanding or even picture what the impact might be from a risk perspective. Regardless the effort put in by the author, the bigger the change set, the more people just want to get done with this as fast as possible. The willingness to make improvements decreases. Anything we find, we often be postponed. Finally, it is also difficult to give feedback. People have spend so much time creating this they are more reluctant to hear the bad news or to change direction. Because of the [Sunk Cost Fallacy](https://en.wikipedia.org/wiki/Sunk_cost).

> 10 lines of code = 10 issues.
>
> 500 lines of code = "looks fine."
>
> Code reviews.
>
> -- I Am Devloper ([@iamdevloper](https://twitter.com/iamdevloper)), [Nov 5, 2013](https://twitter.com/iamdevloper/status/397664295875805184)

As we see, increasing the size of changes increases risk. It’s essentially the same as deploying our code less frequently. The amount of change is larger and the risk is greater.

This brings us back to feedback. The longer we defer feedback, the greater the risk something unexpected, unusual and usually very bad will happen. We have zero-visibility on what is happening on the other parallel branches. Our work may eventually not merge. We could loose days or weeks of work. Which comes with a non-negligible cost.

As opposed, earlier feedback results in smaller change sets and in better code. Increasing the commit frequency into mainline forces us to work in small incremental steps that preserve existing functionality. We take smaller steps, which generally breaks less and keeps the application always working. We are able to perform production releases at any given moment in time, as such reducing risks. When we do break something, we can find it sooner and fix it faster, instead of waiting days or weeks to discover it. Also, we have more context about how to fix broken things then when we commit infrequently into mainline and having to wait for days or weeks for feedback.

Here lies **an important engineering skill: the ability to break up large changes into small increments**. A feature grows over multiple commits on mainline versus designing and implementing the feature in isolation on a branch.

### It impairs testing

> Oh and to be clear: I'm agreeing regarding the feedback from integration to mainline and automated tests, and at the same time I'm also thinking of any form of valuable feedback - like from testing or product or design and even code review (I know I know, yet still it's found very commonly in nature).

As long as we have not merged back into mainline, we have no feedback on the quality of our work. Alright, some will say, but we can test the feature in isolation. We can even spin up a dedicated environment just for the branch within minutes. I have to say, this shows off and looks clever ... but such a waste of time, energy and money. As you should not need this.

If we only have one test environment to deploy the feature branch to for testing, testers cannot test other features at the same time that require specific data. Testers end up switching back and forth between deploying different branches to test different features. That takes quite some time and introduces quite some context switching. In the worst case, different features have different database schemas and require different database migrations resulting in having to rebuild the database to switch testing between features. Even more time consuming.

Testing in isolation is good. It gives us some information. But it does not tell the whole story. It does not tell us anything about whether the feature integrates with all the other features being implemented in parallel on their own isolated branch.

The only definitive point is the testing happening at merge time. Our change works with everyone else's changes. Before that, it is just a guess. We do not know. We can only hope nobody did something horrid that breaks our work.

It is only when the feature is finished and it gets integrated with all the other features that we know it works or not. That is too late!

Also, it requires to test twice. Once on the branch and once on mainline once the branch has been merged back. That is rework, not efficient, wasted time and spoiled money.

A better approach is to test continuously while the feature grows on mainline. Every day we know where we stand. Because we have fast feedback, if some new development breaks we can fix it easily because we have enough fresh context. When the feature is finished we know it works. It can be released at any given moment in time. Which again reduces lead time and time to market.

We are never in a situation of surprise discovering something does not work after days or weeks of development. We do not have horrible rework or having to throw away and start over again. Therefore it is also more cost effective.

### It introduces rework and therefore makes releases unpredictable

As long as we have not merged back into mainline we cannot know how much work is still left to do. Potential merge conflicts could arise at merge time caused by incompatibilities introduced by different branches. Introducing potential additional rework usually requiring attention in a rush. The review and approval process usually varies wildly in lead time and is often too slow. Lastly, we are never sure how the different new features will influence each other at merge time and how they might require additional unplanned retesting.

Integrating features into mainline become a time-consuming and unpredictable activity making the whole IT delivery process very unpredictable increasing the lead time, and the time to market for our product.

Compare this with growing a feature on mainline. The feature can be released the minute we think it is good enough. This is possible because our codebase is always in a releasable state, always working.

Remember, our goal is to sustainably minimise our lead time to create positive business impact!

>To increase developer productivity, some teams have developers work isolated from each other on their own branches, both to keep mainline stable, and to prevent them treading on each other’s toes.

>However, over time these branches diverge from each other. While merging a single one of these branches into mainline is not usually troublesome, the work required to integrate multiple long-lived branches into mainline is usually painful, requiring significant amounts of re-work as conflicting assumptions of developers are revealed and must be resolved.

>Teams using long-lived branches often require code freezes, or even integration and stabilization phases, as they work to integrate these branches prior to a release. Despite modern tooling, this process is still expensive and unpredictable. On teams larger than a few developers, the integration of multiple branches requires multiple rounds of regression testing and bug fixing to validate that the system will work as expected following these merges. This problem becomes exponentially more severe as team sizes grow, and as branches become more long-lived.

>The practice of continuous integration was invented to address these problems. CI (continuous integration) follows the XP (extreme programming) principle that if something is painful, we should do it more often, and bring the pain forward. Thus in CI developers integrate all their work into trunk (also known as mainline or master) on a regular basis (at least daily). A set of automated tests is run both before and after the merge to validate that no regressions are introduced. If these automated tests fail, the team stops what they are doing and someone fixes the problem immediately.

=> ensure always working software, enabling on demand production releases.

### It is expensive and therefore less efficient

Branch creation is cheap and easy. But keeping the branch up-to-date and integrating the latest changes from mainline as well as from all other parallel branches is far more expensive.

The longer we keep our code changes in isolation and do not integrate them with the code changes from other team members the higher the risk the changes will conflict leading to the well known *Merge Hell*.

This is totally unrelated to the quality of merge tools. Current distributed version control systems have actually very decent merge tools. Most of the time merges are quite simple and automatic, except when they are not. No merge tool can predict if two features being implemented in parallel, each on their isolated branch, will work together. This can only be discovered at merge time. Again, we have delayed feedback.

The minute we need to manually intervene in a merge conflict, there is a cost. How big that cost will be is totally unknown until merge time. This results in building up **Merge Debt**, i.e. the increasing cost from working in isolation on a branch without integrating outside changes.

- Rework due to merge conflicts or regressions introduced by [Semantic Bugs](https://martinfowler.com/bliki/SemanticConflict.html), i.e. syntactically correct changes that are functionally incorrect usually happening as the result of a successful, automatic, silent merge,
- Wasted time due to fixing merge conflicts and rework efforts,
- A high risk for lost changes that vanish entirely either during automatic, silent merges or when manually resolving merge conflicts,
- Or worse finding out the differences are so big we are unable to integrate the changes and we have to throw away days or weeks of work and start over again.

> If it hurts, do it more often. Bring the pain forward.
>
> -- [Dave Farley](https://twitter.com/davefarley77), Continuous Delivery: Reliable Software Releases Through Build, Test and Deployment Automation

The longer we wait to integrate changes into mainline, the more likely the merge pain will get worse rather than better. It is better to take the pain of a merge now so we know where we are.

This is precisely why Continuous Integration was introduced. When we merge our code more frequently to mainline, the pain of integrating new changes happens at the beginning instead of at the end of our work. We can now find issues faster. Fixing those issues is easier and happens at the earliest possible moment, saving us a lot of pain and time, and avoiding Merge Debt.

Apart from Merge Debt, there are other non-negligible costs introduced by feature branching.

- Automated tests need to be executed twice: once the branch and one more time on mainline at merge time after integrating the branch.
- Also manual exploratory testing happens twice.
- Branches introduce batch-work, which in turn introduce inventory and as we have seen before inventory is money stuck into the system.
- Branches introduce higher risks due to deferred feedback and bigger changesets. The longer we defer, the greater the risk that something bad will happen.

### It creates cognitive overload

Lastly, it creates cognitive overhead for the team members.

- To start a feature development, we have to create a branch and push the branch to the remote repository.
- To reduce merge complexity, we have to rebase mainline onto our branch frequently.
- To communicate changes between features that are being designed in parallel, we have to cherry pick changes between branches.
- To switch work between features - which is never a good idea, but it happens - we have to switch between branches.
- When the feature is dev-complete and merged back into mainline, we may not forget to delete the branch. Otherwise we end up with a repository having a truck load of branches no-one dares to delete. Which in turn introduces another kind of technical debt.

Now imagine the insane context and branch switching for a tester inside a team using feature branches. It is not just the three branches a software engineer switches back and forth between. It is three branches per software engineer. In a team of 5 engineers, it means a tester juggles between 15 branches. Each branch is a different topic. Each branch has different dependencies requiring to reinstall these on each branch switch. If you were wondering why your tester is exhausted at the end of the day, here is the story.

To summarise, to implement a feature, team members have to perform lots of version control operations on a day-to-day basis. Therefore, they need to remember a large set of version control commands. This creates cognitive overhead that could slow down the team. Again, this will inevitably have a negative impact on IT delivery throughput, lead time and time to market.

Compare this complexity with the simplicity of having everyone on the team
commit frequently into mainline, reducing redundant effort and simplifying
the workflow. We pull the latest changes from the remote repository, we add our local
changes, to then commit and push. This is fairly easy, fairly simple. In the end team
members only have to remember a small set of version control commands to perform their
day-to-day work.

## Conclusion

Continuous Integration is really about exposing changes as quickly as possible to increase feedback.

Any form of branches is about isolating changes. By design it hides changes for the rest of the team. Although, branches with a very short lifetime (less than a day) can achieve Continuous Integration.

> Teams that did well had fewer than three active branches at any time, their branches had very short lifetimes (less than a day) before being merged into trunk and never had "code freeze" or stabilization periods. It is worth re-emphasising that these results are independent of team size, organisation size or industry.
>
> -- [Accelerate](https://itrevolution.com/accelerate-book/), p55, Dr. Nicole Forsgren et al.

But ... if less than a day, why bother with the overhead of branches?

> [A branch] is antithetical to CI, the clue is in the name “CONTINUOUS INTEGRATION”!
>
> -- Dave Farley, [Continuous Integration and Feature Branching](http://www.davefarley.net/?p=247)

Continuous Integration was exactly introduced to obtain faster feedback to have better, greater insights into the effects of changes. Faster feedback requires more frequent commits into mainline. Forcing us to work in smaller increments, resulting in better, more maintainable code. More frequent commits means smaller changesets and less risks. In the end, achieving a single-piece flow which in turn increases quality and IT delivery throughput together with reducing lead time for change and time to market. Inevitable, this all comes with reduced costs.

This means: **Don't use branches!**

Over the past decade, branching became a standard for most teams. But it does not bring any benefits to the bottom line: deliver quality software in production at speed. In fact, they essentially slow us down and impact quality! When they can be avoided, a team's productivity and confidence will drastically increase.

## Acknowledgments

As always, thank you to [Lisi Hocke](https://twitter.com/lisihocke) and [Steve Smith](https://twitter.com/SteveSmith_Tech) for taking the time and energy to review this article.

## Bibliography

- [Continuous Integration (original version)](https://www.martinfowler.com/articles/originalContinuousIntegration.html), Martin Fowler
- [Continuous Integration](https://continuousdelivery.com/foundations/continuous-integration/), Jez Humble
- [ContinuousIntegrationCertification](https://martinfowler.com/bliki/ContinuousIntegrationCertification.html)
- [On DVCS, Continuous Integration and Feature Branching](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/), Jez Humble
- [Continuous Integration on a dollar a day](http://www.jamesshore.com/Blog/Continuous-Integration-on-a-Dollar-a-Day.html), James Shore
- [Don't Feature Branch](http://www.davefarley.net/?p=160), Dave Farley
- [Continuous Integration and Feature Branching](http://www.davefarley.net/?p=247), Dave Farley
- [Continuous Isolation](https://paulhammant.com/2017/02/14/fake-news-via-continuous-isolation/), Paul Hammant
- [Fake News Via Continuous Isolation](https://paulhammant.com/2017/02/14/fake-news-via-continuous-isolation/), Paul Hammant
- [continuousisolation.com](https://continuousisolation.com), Paul Hammant
- [Promiscuous Integration vs. Continuous Integration](https://dzone.com/articles/promiscuous-integration-vs), Martin Fowler
- [Long-Running Branches Considered Harmfull](https://newrelic.com/blog/best-practices/long-running-branches-considered-harmful), Jade Rubick
- [Accelerate](https://itrevolution.com/accelerate-book/), ch 4 Technical Practices, Dr. Nicole Forsgren, Jez Humbe and Gene Kim
- [Git Branching Strategies vs. Trunk-Based Development](https://launchdarkly.com/blog/git-branching-strategies-vs-trunk-based-development/), LaunchDarkly
- [If you still insist on feature branching, you are hurting your business and our profession](https://mrdevops.io/if-you-still-insist-on-feature-branching-you-are-hurting-your-business-and-our-profession-32e1109d4594#.cmqfxsbir), Jon Arild Tørresdal
- [Extreme Programming Explained](https://www.goodreads.com/book/show/67833.Extreme_Programming_Explained), p59, p67, p99-100,  Kent Beck
- [The Art of Agile Development](https://www.goodreads.com/book/show/1654215.The_Art_of_Agile_Development?ac=1&from_search=true&qid=CrLqXaqSQW&rank=1), p192, James Shore and Shane Warden
- [trunkbaseddevelopment.com](https://trunkbaseddevelopment.com), Paul Hammant
- [Trunk Based Development](https://mrdevops.io/trunk-based-development-8376fe577c11), Jon Arild Tørresdal
- [The Machine That Changed The World](https://en.wikipedia.org/wiki/The_Machine_That_Changed_the_World_(book)), p52, Womack, Jones and Roos
- [Branching Strategies](http://www.chrisoldwood.com/articles/branching-strategies.html), Chris Oldwood
- [From GitFlow to Trunk Based Development](http://team-coder.com/from-git-flow-to-trunk-based-development/), Robert Mißbach
- [GitHub Workflow vs Mainline Development](http://www.multunus.com/blog/2013/06/github-workflow-vs-mainline-development/?__s=sxqabdsbwdzoo1apdvkd), Leena S N
- [You Are What You Eat]({%post_url 2022-05-07-pipeline-you-are-what-you-eat-how-branching-affects-team-culture-dave-hounslow%}), Dave Hounslow
- [Why you should not use (long-lived) feature branches](https://www.freecodecamp.org/news/why-you-should-not-use-feature-branches-a86950126124/), Jean-Paul Delimat
- [Why I don't like feature branches](https://www.pgrs.net/2011/08/29/why-i-dont-like-feature-branches/), Paul Gross

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. [But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
4. The Problems
5. How Can We Avoid Feature Branching Problems?
6. Questions I Regularly Get Asked about Trunk-Based Development
7. What Are The Benefits of Trunk-Based Development?
8. Where is the Evilness of Feature Branching?
