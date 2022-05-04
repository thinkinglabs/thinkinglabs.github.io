---
layout: article
title: On the Evilness of Feature Branching - The Problems
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 2 of this series - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) - and [part 3 - But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) I went into all the possible reasons teams mention themselves for why they use feature branches. This time I want to go deeper into the problems introduced by the use of feature branches.

---

Before we move on, let me again first clarify two definitions.

- What is *mainline*?
- What is *Continuous Delivery*?

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

This involves that:

- Everyone in the team commits to mainline at least once a day.
- Every commit triggers an automated build and execution of all the automated tests.
- And if the build fails it is back to green within 10 minutes.

The easiest way to fix a broken build is to revert the last commit that brings us back to the last known good state.

Note that [Continuous Integration is really a practice! It requires few particular tooling]({% post_url 2020-03-23-continuous-integration-is-not-a-tooling-problem%}).

The only tools we need for Continuous Integrations are :

- a version control system,
- an automated build,

and team commitment to never break the build.

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

Lot’s of teams, however, like to redefine Continuous Integration by saying: "*We have our [fill in your preferred centralised build tool] running against all of our branches*".

Having an automated build running against all of our branches is actually a really, really good thing. But it is not Continuous Integration. We are not integrating. It is still a lie. The only feedback we get is whether the code that exists inside our isolated branch still compiles and whether we have not introduced any regressions against the tests that exist inside that isolated branch. We do not get any feedback whatsoever on whether our changes integrate well with the changes that exist on all the other prevailing parallel branches. Even when all tests pass on the branch, they still may fail when merging back into mainline. It is also slow as we have to execute the automated tests twice: once on the branch and once when integrating on mainline. The real authoritative feedback only happens at merge time when integrating, once the feature is finished. Everything else is a guess.

Therefore, from this moment on **CI stands for [Continuous Isolation](https://continuousisolation.com)** and not any more for *Continuous Integration*. We are not integrating outside changes and the rest of the team do not know how our changes integrate with their work.

The value of accelerating this feedback resides in failing fast. Problems are spotted really early, within minutes. We achieve this when committing frequently, multiple times a day, regardless of code complexity or team size. But it requires we work very hard to keep getting fast feedback. This means if the build is too slow, we need to speed up the build; if tests are too slow, we need to write better and more concise tests; if hardware is too slow, we need to buy faster hardware; if the codebase is too coupled, disabling us to write concise tests, we need to decouple the codebase.

## It hinders integration of features

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
picking, **we lose track of who has what on which branch**.

Compare this complexity with the simplicity of having everyone in the team
commit its changes immediately to mainline. As such  they communicate their
changes immediately with the rest of the team. This helps in creating a
shared understanding of the code base and [collective ownership](http://www.extremeprogramming.org/rules/collective.html).
Inevitably, this results in better quality and higher IT delivery throughput. Thus reducing the lead time
and the time to market.

## It hides work for the rest of the team and disables communication

As long as we have not yet merged our branch back to mainline, the rest of the team
simply do not know in which direction we are taking the code to implement the feature
we are working on.

![It hides work for the rest of the team](/images/on-the-evilness-of-feature-branching-the-problems/it-hides-work-for-the-rest-of-the-team.png)

This is fine as long as everyone on the team works on different parts of the
application. But, the minute two team members are working in the same codebase
area they are each blind to how their work affects the other person.

On the other hand, if we are committing more frequently into mainline, we
communicate to the rest of the team the direction we are taking with the code to
implement this feature. For example, we could add a conditional indicating the start of the new code we are working on and have it disabled by default. From then on the rest of the team sees the new changes we are introducing. They immediately spot how this affects their work and therefore can instantly adapt to these changes. It eliminates the classic rework happening at merge time and enables flow.

This is precisely the purpose of Version Control Systems and Continuous Integration. To publish our ideas to the rest of the team and see the impact on others within minutes. The rest of the team sees the direction of our thinking. It enables communication inside the team and therefore the fast flow of work, higher IT delivery throughput, reduced lead time and time to market.

We could argue that introducing this conditional, increases the complexity of
the codebase. Which is true. On the other hand by using a feature branch and not
introducing this conditional, the conditional is not eradicated. It is still there.
But it is not obvious and absolutely not visible. Because the conditional is now the
Version Control System branch. From now on, **our changes are invisible
for the rest of the team**. They have no idea how those changes will impact their work.

Remember, the purpose of a Version Control System is not just to version source
code. **A Version Control System is really a communication tool** to communicate
changes with the rest of the team. This will again help in gaining a shared
understanding of the system and achieve [collective ownership](http://www.extremeprogramming.org/rules/collective.html). Again, this will inevitably lead to better quality, higher IT delivery throughput, shorter lead times and time to market.

## It works against refactoring

Because feature branches hide work for the rest of the team, it also discourages
the adoption of refactoring.

When we are just adding new code, integrating that code is fairly straightforward.
But if we are refactoring our code, we are introducing new abstractions and new concepts.
Unfortunately, Version Control Systems are not aware of semantic changes which
makes merging very difficult. In contrast, refactoring is pretty easy when adopting [trunk-based development](https://trunkbaseddevelopment.com) together with [Baby Steps](http://www.slideshare.net/davidvoelkel/baby-steps-tdd-approaches), [Expand-Contract](https://martinfowler.com/bliki/ParallelChange.html) and [Branch by Abstraction](https://www.branchbyabstraction.com).

If we have two team members working on a codebase, each working in parallel on
their feature branch.

![It works against refactoring](/images/on-the-evilness-of-feature-branching-the-problems/it-works-against-refactoring.png)

One team member refactors and merges back first. The other person has a
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
the code base becomes more difficult and far more time consuming. Again, this
slows down the team. To then end in this vicious circle where the team slows
down over time. Eventually coming to a halt and nobody really understanding why and how
this happened.

## It introduces batch work and inventory

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
> -- [The Machine That Changed The World](https://en.wikipedia.org/wiki/The_Machine_That_Changed_the_World_(book)), p52, Womack, Jones and Roos

This is what Womack, Jones and Roos call Lean Manufacturing. Later it was proved by [Mary and Tom Poppendieck](http://www.poppendieck.com) [it also applies to software development](https://en.wikipedia.org/wiki/Lean_software_development). Donald Reinertsen discussed at great length the harm caused by batch work in chapter 5 "*Reducing Batch Size*" of his book [The Principles of Product Development Flow](https://www.goodreads.com/book/show/6278270-the-principles-of-product-development-flow).

The bigger the batch size, the more work we have in progress. The more work in progress the more inventory we have. **Inventory is just money stuck into the system**.

![It creates batch work and inventory](/images/on-the-evilness-of-feature-branching-the-problems/it-creates-batch-work.png)

It is stuck into the system because the organisation invested quite lot of money to create this inventory consisting of all the code that lies around on all those parallel branches. But this investment does not generate any revenue for the organisation. **As long as we have not merged back into mainline, deployed the code into production and released it to the end users, it does not create any value**. Only when this code gets into production in the hands of the users it will generate feedback on how it behaves in production and how it is being used by the users. Only then we can take new decisions and come with new ideas on how to satisfy the user.

To reduce this inventory, we know from Lean Manufacturing, we have to reduce the work in progress.

This means, working in smaller batches. Reducing the lifetime of the branch. Committing more frequently to mainline.
Which means, integrating more often. As such, achieving a state of Continuous Integration. In the end, this brings us closer to a single-piece flow.

From Lean Manufacturing we know that a single-piece flow will increase the IT delivery throughput, increase quality and stability and reduce the lead time, and the time to market for new functionality.

## It increases risks

Because long-running branches create batch-work, it also create bigger
changesets. Bigger changesets mean more risks.

![It increases risks](/images/on-the-evilness-of-feature-branching-the-problems/it-increases-risks.png)

If we commit more frequently to mainline, the Continuous Integration process has to process a smaller changeset. If the build happens to break, finding the root cause will be fairly easy because the changeset is so small. Also because we
introduced the failing change just a couple of minutes ago. We still have enough context to fix that build. In the end, we will be able to fix the build within 10 minutes and still achieve a state of Continuous Integration.

On the other hand, when using feature branches, merging back to mainline happens
less often. As a result the Continuous Integration process has to process a bigger changeset. If the build happens to break, finding the root cause will be far
more difficult because of the changeset is so big. Probably, also because we
introduced the failing change a couple of hours or, worse, a couple of days ago.
This time, we do not have enough context any more to fix that build easily. Fixing the
build will become difficult and time consuming. From now on, we run the risk of having a broken build for a very long period of time. **We just lost the monitoring of the health of the application**. So we lost the ability to perform on demand
production releases at any given moment in time. Obviously, this has a negative impact on lead time and time to market.

As we see, increasing the size of changes increases risk. It’s essentially the same as deploying our code less frequently. The amount of change is larger and the risk is greater.

This brings us back to feedback. The longer we defer feedback, the greater the risk something unexpected, unusual and usually very bad will happen. We have zero-visibility on what is happening on the other parallel branches. Our work may eventually not merge. We could loose days or weeks of work. Which comes with a non-negligible cost.

As opposed, earlier feedback results in smaller change sets and in better code. Increasing the commit frequency into mainline forces us to work in small incremental steps that preserve existing functionality. We take smaller steps, which generally breaks less and keeps the application always working. We are able to perform production releases at any given moment in time, as such reducing risks. When we do break something, we can find it sooner and fix it faster, instead of waiting days or weeks to discover it. Also, we have more context about how to fix broken things then when we commit infrequently into mainline and having to wait for days or weeks for feedback.

Herein is an important engineering skill: the ability to break up large changes into small increments. A feature grows over multiple commits on mainline versus designing and implementing the feature in isolation on a branch.

## It disables testing

As long as we have not merged back into mainline, we have no feedback on the quality of our work. Alright, some will say, but we can test the feature in isolation. We can even spin up dedicated environments within minutes just for the branch. I have to say, this shows off and looks clever ... but such a waste of time, energy and money. As you should not need this.

Testing in isolation is good. It gives us some information. But it does not tell the whole story. It does not tell us anything about whether the feature integrates with all the other features being implemented in parallel on their own isolated branch.

The only definitive point is the testing happening at merge time. Our change works with everyone else's changes. Before that, it is just a guess. We do not know. We can only hope nobody did something horrid that breaks our work.

It is only when the feature is finished and it gets integrated with all the other features that we know it works or not. That is too late!

Also, it requires to test twice. Once on the branch and once on mainline once the branch has been merged back. That is rework, not efficient, wasted time and spoiled money.

A better approach is to test continuously while the feature grows on mainline. Every day we know where we stand. Because we have fast feedback, if some new development breaks we can fix it easily because we have enough fresh context. When the feature is finished we know it works. It can be released at any given moment in time. Which again reduces lead time and time to market.

We are never in a situation of surprise discovering something does not work after days or weeks of development. We do not have horrible rework or having to throw away and start over again. Therefore it is also more cost effective.

## It makes releases unpredictable

As long as we have not merged back into mainline we cannot know how much work is still left to do. Because of potential merge conflicts, and because of potential rework caused by merge conflicts at merge time. Because of the review and approval process of which the duration can vary wildly and is often too slow. And also, because we do not know how the different new features will influence each other at merge time requiring additional testing.

Integrating features into mainline therefore becomes a time-consuming and unpredictable activity making the whole IT delivery process very unpredictable which increases the lead time, and the time to market for our product.

Compare this with growing a feature on mainline where we can release the feature the minute we think it is good enough because our codebase is always working and in a releasable state.

Remember, our goal is to sustainably minimise our lead time to create positive business impact!

## It is expensive and therefore less efficient

Branch creation is cheap and easy. But keeping the branch up-to-date and integrating the latest changes from mainline as well as from all other parallel branches is far more expensive.

The longer we keep our code changes in isolation and do not integrate them with the code changes from other team members the higher the risk the changes will conflict leading to the well known *Merge Hell*.

This is totally unrelated to the quality of merge tools. Current distributed version control systems have actually very decent merge tools. Most of the time merges are quite simple and automatic, except when they are not. No merge tool can predict if two features being implemented in parallel, each on their isolated branch, will work together. This can only be discovered at merge time. Again, we have delayed feedback.

The minute we need to manually intervene in a merge conflict, there is a cost. How big that cost will be is totally unknown until merge time. This results in building up **Merge Debt**, i.e. the increasing cost from working in isolation on a branch without integrating outside changes.

- Rework due to merge conflicts or regressions introduced by [semantic bugs](https://martinfowler.com/bliki/SemanticConflict.html), i.e. syntactically correct changes that are functionally incorrect usually happening as the result of a successful, automatic, silent merge,
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

## It creates cognitive overload

Lastly, it creates cognitive overhead for the team members.

- To start a feature development, we have to create a branch and push the branch to the remote repository.
- To reduce merge complexity, we have to rebase mainline onto our branch frequently.
- To communicate changes between features that are being designed in parallel, we have to cherry pick changes between branches.
- To switch work between features - which is never a good idea, but it happens - we have to switch between branches.
- When the feature is dev-complete and merged back into mainline, we may not forget to delete the branch. Otherwise we end up with a repository having a truck load of branches no-one dares to delete. Which in turn introduces another kind of technical debt.

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

Continuous Integration was exactly introduced to obtain faster feedback to have better, greater insights into the effects of changes. Faster feedback requires more frequent commits into mainline. This forces us to work in smaller increments, resulting in better, more maintainable code. More frequent commits result in smaller changesets, less risks. In the end, achieving single-piece flow which in turn increases quality and IT delivery throughput together with reducing lead time for change and time to market. Inevitable, it also reduces costs.

To obtain all of this, it means no branches!

## Acknowledgments

## Bibliography

- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
- [On DVCS, Continuous Integration and Feature Branching](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/), Jez Humble
- [Continuous Integration on a dollar a day](http://www.jamesshore.com/Blog/Continuous-Integration-on-a-Dollar-a-Day.html), James Shore
- [Don't Feature Branch](http://www.davefarley.net/?p=160), Dave Farley
- [Continuous Integration and Feature Branching](http://www.davefarley.net/?p=247), Dave Farley
- [Continuous Isolation](https://paulhammant.com/2017/02/14/fake-news-via-continuous-isolation/), Paul Hammant
- [Promiscuous Integration vs. Continuous Integration](https://dzone.com/articles/promiscuous-integration-vs), Martin Fowler
- [Long-Running Branches Considered Harmfull](https://newrelic.com/blog/best-practices/long-running-branches-considered-harmful), Jade Rubick
- [Accelerate](https://itrevolution.com/accelerate-book/), ch 4 Technical Practices, Dr. Nicole Forsgren, Jez Humbe and Gene Kim
- [Git Branching Strategies vs. Trunk-Based Development](https://launchdarkly.com/blog/git-branching-strategies-vs-trunk-based-development/), LaunchDarkly
- [If you still insist on feature branching, you are hurting your business and our profession](https://mrdevops.io/if-you-still-insist-on-feature-branching-you-are-hurting-your-business-and-our-profession-32e1109d4594#.cmqfxsbir), Jon Arild Tørresdal
- [The Machine That Changed The World](https://en.wikipedia.org/wiki/The_Machine_That_Changed_the_World_(book)), p52, Womack, Jones and Roos
- [Branching Strategies](http://www.chrisoldwood.com/articles/branching-strategies.html), Chris Oldwood
- [From GitFlow to Trunk Based Development](http://team-coder.com/from-git-flow-to-trunk-based-development/), Robert Mißbach
- [GitHub Workflow vs Mainline Development](http://www.multunus.com/blog/2013/06/github-workflow-vs-mainline-development/?__s=sxqabdsbwdzoo1apdvkd), Leena S N

...

- [Feature Branch](https://martinfowler.com/bliki/FeatureBranch.html), Martin Fowler
- [More Feature Branches means less Continuous Integration](https://www.infoq.com/news/2015/10/branching-continuous-integration), InfoQ interview with Steve Smith
- [The Death of Continuous Integration](https://speakerdeck.com/stevesmithcd/the-death-of-continuous-integration), Steve Smith
- [What is Trunk Based Development?](http://paulhammant.com/2013/04/05/what-is-trunk-based-development/), Paul Hammant
- [Trunk Based Development](https://mrdevops.io/trunk-based-development-8376fe577c11), Jon Arild Tørresdal
- [You Are What You Eat](https://vimeo.com/162625187), Dave Hounslow
- [Google's Scaled Trunk Based Development](http://paulhammant.com/2013/05/06/googles-scaled-trunk-based-development/), Paul Hammant
- [Legacy App Rejuvenation](http://paulhammant.com/2013/03/11/legacy-app-rejuvenation/), Paul Hammant
- [Why Google Stores Billions of Lines of Code in a Single Repository?](http://m.cacm.acm.org/magazines/2016/7/204032-why-google-stores-billions-of-lines-of-code-in-a-single-repository/fulltext), Google
- [4 Simple Tricks to avoid Merge Conflicts](http://team-coder.com/avoid-merge-conflicts/), Robert Mißbach
- [Short-lived branches](http://articles.coreyhaines.com/posts/short-lived-branches/), Corey Haines

## The Series

