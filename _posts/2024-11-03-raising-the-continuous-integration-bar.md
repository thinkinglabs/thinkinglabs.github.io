---
layout: article
title: Raising the Continuous Integration Bar
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/advanced-continuous-integration/advanced-continuous-integration.jpg
redirect_from:
  - /raising-the-continuous-integration-bar
---

So we [implemented Continuous Integration]({% post_url 2024-11-01-continuous-integration-where-to-start %}). It gives us the confidence to deliver -- great! Though, we are in a suboptimal situation. We do not yet have all the benefits that Continuous Integration should provide. How can we get the most out of it? Which additional practices are we missing and should we acquire? How can we raise the bar?

---

*Update Dec 17, 2024: Reference TDD as enabler for Commit Frequently.*

*Update Dec 18, 2024: Reference the Unix philosophy and the Dependency Inversion principle as enabler of Decouple the Codebase.*

---

![Raising the Continuous Integration Bar](/images/raising-the-continuous-integration-bar/raising-the-continuous-integration-bar.jpg)

[*Push Every Day*]({% post_url 2024-09-16-the-practices-that-make-continuous-integration-push-every-day %}) is one of [the six foundational practices to get started with Continuous Integration]({% post_url 2024-11-01-continuous-integration-where-to-start %}). No matter how, if we want to leverage the benefits of Continuous Integration to the fullest, integrating once per day will not make it. That is pertinent but inadequate. To raise the bar to the next level, we have to [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-6-commit-frequently). After all, the central premise of Continuous Integration is *integrating early and often on* [*Mainline*](#mainline). It enables speed of delivery. As a result, it accelerates feedback, amplifies quality, and allows us to recover quicker from production instabilities.

I regularly get pointed out that this focus on speed of delivery puts pressure on teams. I can see that. But we are missing the point. We want teams to be at ease and comfortable, without stress and fear. Because of that, they will deliver at speed. However, to enable this, it requires teams to adopt *Decouple the Codebase*, *Hide Unfinished Functionality* and *Expand-Contract*.

To satisfy *Commit Frequently*, we have to commit at least once per hour, preferably multiple times per hour. It enables the real time communication of changes with the rest of the team. This is especially important when refactoring. Thoughtful engineers will commit and push after every little refactor. This avoids surprises for the rest of the team when one team member releases a series of refactorings in one big batch that results in a significant redesign. We want to avoid that. We should communicate early and often to allow the rest of the team to adapt to our changes.

![TDD cycle](/images/raising-the-continuous-integration-bar/tdd-cycle.jpg)

This is when [Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development) (TDD) comes in. We write a small failing test. We add just enough production code to get the test passing to green. When the tests are green, we commit and push into *Mainline*. Then we refactor. If the test fails, we revert. When the test is back to green, we commit and push again into *Mainline*.

Test Driven Development creates this commit cadence to enable *Commit Frequently* and that is required to attain a state of Continuous Integration.

When we *Commit Frequently* we reduce the size of our changes. Merge conflicts are unlikely and broken builds are infrequent.

It also reduces risks. If the build happens to break, it is fairly easy to find the root cause because the changeset is so small. Probably also, because we only introduced the failing change just minutes ago. We still have enough context to fix the build readily. [Getting the build back to green within ten minutes]({% post_url 2024-10-17-the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes %}) becomes attainable.

If we have to revert a failing commit, that too, will be effortless. Because the change is so small, we are not plagued by the [sunk cost fallacy](https://thedecisionlab.com/biases/the-sunk-cost-fallacy). Thus, deciding to revert will be straightforward.

Once we commit and push every so often into the remote *Mainline*, multiple times per hour, it becomes apparent that version control branches, and specifically [Feature Branches](https://martinfowler.com/bliki/FeatureBranch.html) with Pull Requests, becomes untenable. The cognitive overhead is way out of balance compared to the illusive benefits. Additionally, Pull Requests will bring all the benefits we built up with the practices that bring Continuous Integration to a blatant halt.

Naturally, *Commit Frequently* creates a gentle design pressure to work in [much more, many smaller steps]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding%}#practice-5-make-all-changes-in-small-increments), to [keep the code base even more decoupled]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-8-decouple-the-codebase), to further [speed up the build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build), and lastly to increasingly [hide unfinished functionality]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-10-hide-unfinished-functionality). This creates a virtuous circle resulting in committing all the more frequently.

To [*Make all Changes in Small Increments*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding%}#practice-5-make-all-changes-in-small-increments) it is vital to [*Decouple the Codebase*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-8-decouple-the-codebase). When a codebase is too coupled, it becomes tough to adopt incremental software engineering skills. Any change will rip apart the application and prevent the application from working all the time. We find ourselves not releasing anymore at any time, incurring delays in delivery and an increased opportunity cost.

Adopting [Ports and Adapters](https://alistair.cockburn.us/hexagonal-architecture/) together with [Simple Design](https://wiki.c2.com/?SimpleDesign), intentional code duplication (with *Expand-Contract*), the [Unix philosophy](https://dannorth.net/cupid-for-joyful-coding/#unix-philosophy) and [Dependency Inversion Principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle) helps to decouple the codebase. Interestingly, these patterns not only amplify quality and improve maintainability, they also optimise the required engineering time for new functionality. It becomes cheaper to introduce changes.

Inherently, when a code base is decoupled, we can *Commit More Frequently*.

Most often, a feature takes a fair amount of time to implement. It involves a series of commits. We grow the feature small step by small step, commit by commit. How can we ensure the unfinished functionality is not released to the end user?

The classic approach is to use Feature Branches. As long as the feature is not done, the branch is not merged into *Mainline*. Intrinsically, the feature is hidden using the version control system as a manual toggling mechanism. This has a downside. The feature is not integrated with all the other ongoing changes while the feature is being implemented. We are blind to whether the feature will cause any integration problems until the feature is finished and merged into *Mainline*. This delays feedback. Inevitably, it negatively impacts quality and necessarily increases the lead time to market.

Instead, we could plainly [*Hide Unfinished Functionality*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-10-hide-unfinished-functionality). This is likely the most uncomplicated practice to adopt. It is entirely acceptable to have unfinished functionality sitting in production as long as it is not discoverable and does not introduce any security risks. Commonly, we do not need elaborate [Feature Toggles](https://martinfowler.com/articles/feature-toggles.html) for that. For instance, when adding a new screen to an existing user interface we simply do not wire the screen into the navigation. We only do that at the end, once the screen is ready. The same is true for new API endpoints or backend services. As long as they are not ready, we do not document them or we do not use the backend service.

But, in all honesty, Feature Toggles will be necessary when changing existing screens or modifying the behaviour of existing backends. Managing toggles requires mindfulness and consciousness if we do not want to self-sabotage ourselves.

In some cases, we will have to perform a large refactoring that can rip apart the application for an extended period. Let us say, we want to replace a library or a framework with another or we need to break backwards compatibility on a certain service. Here too, the classic approach is to use Feature Branches. Again, the problem is we are not integrating. In the meantime, while the large refactoring is happening, new functionality is added. When the refactoring is finally ready, the integration will be tedious and time-consuming. Accordingly, delivery comes to a halt and delivery lead times go through the roof. On top of that, we have created a massive amount of inventory that we do not dare to integrate as we fear how complicated that will be.

How can we do this more smoothly, in a more effective way, without impacting the flow of delivery? [*Adopt Expand-Contract*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-9-adopt-expand-contract). This is the intentional code duplication we mentioned earlier. Once we understand Expand-Contract, it is gold!

Truthfully, Expand-Contract will introduce a certain level of complexity. We will have to think harder. We might move slower. But, it brings the tremendous advantage of delivering new functionality while a large-scale refactoring is happening that takes days, weeks or even months to complete. The application keeps working at all times, allowing us to perform on-demand releases anytime. At no single moment, we are blocked. The flow of delivery steadily continues.

To *Commit Frequently* into *Mainline*, we must [*Run the Local Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) repeatedly before each commit to satisfy [*Agree as a Team to Never Break the Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). Additionally, when engineers commit multiple times per hour, they execute the *Local Build* multiple times per hour. That means we ought to [*Have a Fast Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build). This is primordial! But also hard work. Lots of teams struggle with that. Often teams hide slow builds behind version control branches and remote Pull Request builds that in turn introduce a decent amount of context switching and fatigue.

When the build is too slow, two things can happen. Either teams do not tend to run the *Local Build* before committing. We then run the risk of introducing regressions, thus impacting delivery throughput. Or teams tend to execute the build less often. In that case, batch work is introduced. We know from [*Lean Manufacturing*](https://en.wikipedia.org/wiki/Lean_manufacturing) that it drives down quality and consequently inflates time to market.

But, what is fast? We focus on a *Local Build* (and thus also a [*Commit Build*](#commit-build)) of five minutes but no longer than ten minutes. If we can bring it to 30 seconds, it will avoid any hallway sword-fighting sessions.

![xkcd: Compiling](https://imgs.xkcd.com/comics/compiling.png)

To conclude, if we want to raise the bar, it is fundamental to *Have a Fast Build*. This is crucial as it allows us to commit all the more frequently, enabling us to work in increasingly smaller steps. But to *Commit Frequently*, also requires to *Have a Decoupled Code Base* and understanding we have to *Hide Unfinished Functionality*. Lastly, *Adopt Expand-Contract* helps us to refactor in small increments and to commit frequently when refactoring and delivering new functionality at the same time.

## Related Articles

- [Continuous Integration! Where to Start?]({% post_url 2024-11-01-continuous-integration-where-to-start %})
- [The Practices that Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %})

## References

- [The Talk: Continuous Integration! Raising the Bar]({% post_url 2024-11-20-continuous-integration-raising-the-bar %})

## Definitions

### Mainline

The Mainline is the line of development in Version Control which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The Commit Build is a build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at minimum compiling the sources, running a set of [*Commit Tests*](#commit-tests), and building a binary artefact for deployment.

### Commit Tests

The Commit Tests comprise all of the Unit Tests along with a small simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback.
