---
layout: article
title: But Agree As a Team to Never Break the Build is Like Agreeing to Never Produce a Bug
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

Months ago, I made the observation that [engineers seem to enjoy administrative tasks](https://www.linkedin.com/posts/tdpauw_against-all-common-beliefs-i-start-to-think-activity-7049411800001339394-t2F-) seeing how much affection they show for the Pull Request. Malik reacted to this with "*Show me a different process that guarantees a green mainline*". Manifestly, the answer to that is: [Agree as a Team to Never Break the Build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). To this, Malik replied: "*['agreeing to never break the build' is like agreeing to never produce a bug... It's nonsensical, why not prevent the issue in the first place instead of playing a blame game where the developer is bound to fail at some point?](https://www.linkedin.com/feed/update/urn:li:activity:7049411800001339394?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7049411800001339394%2C7049436590376394753%29&replyUrn=urn%3Ali%3Acomment%3A%28activity%3A7049411800001339394%2C7050175525402615809%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287049436590376394753%2Curn%3Ali%3Aactivity%3A7049411800001339394%29&dashReplyUrn=urn%3Ali%3Afsd_comment%3A%287050175525402615809%2Curn%3Ali%3Aactivity%3A7049411800001339394%29)*". In all honesty, I appreciate Malik. We do not often agree online. But we are somehow aligned on the outcomes, i.e. have a green mainline. We just use different techniques to get there. Having said that, I decidedly disagree with Malik.

---

Agreeing to never break the build and agreeing to never produce a bug are assuredly two completely different things. We *can* consistently accomplish to never break the build. The same cannot be said about never producing bugs.

Before pushing changes to mainline, it requires everyone in the team to pull the latest changes, integrate them with their local changes, [execute a local build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) and to [commit and push only on green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green). When the build is red, it is by all means prohibited to push code. If the build is green, we can however push. When we say, execute a local build, it means compiling the code and running all unit tests. Despite that, we do not need to execute integration and acceptance tests as part of the local build. These can be deferred to the central build. Undeniably, this assumes [having a vast amount of high-quality automated tests]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-13-have-a-vast-amount-of-high-quality-automated-tests). We certainly need a decent amount of unit tests that cover the core functionality to give us enough confidence that when unit tests pass, integration and acceptance tests will pass with high probability. If that is not the case, if an acceptance test fails, we should try to reproduce this with a unit test. This will grow the set of unit tests and increase that confidence.

This practice of not breaking the build is non-negotiable. No single acceptable reason allows us to break with this agreement. If we do not follow this agreement, [Continuous Integration](https://martinfowler.com/articles/originalContinuousIntegration.html) falls flat. Without Continuous Integration, our software is broken until someone else proves it works. Commonly, through expensive manual testing. Inevitably, this introduces a cost of delay.

This is one of the two most important practices to adopt to succeed with Continuous Integration as a team. The other practice is to [make all changes in small increments]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-5-make-all-changes-in-small-increments).

Typically, when I share this, I receive the common reaction: "*But, this is impossible. We cannot do this. Our build takes an outrageous amount of time to complete.*". Surely, it will not work with a +20-minute build. When builds take too long, two things can happen. Either people do not execute a local build before committing and pushing. This might violate the agreement of never breaking the build. In that case, we are back to having no Continuous Integration. Or people tend to run the local build less often. Under these circumstances, they start to batch up work. Lean manufacturing taught us that batch work reduces feedback. Consequently, it also drives down quality and increases time to market. Therefore, to succeed with Continuous Integration it is imperative to [have a fast build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build).

Like [Daniel Sandberg](https://www.youtube.com/channel/UCtk6SnXE64MiIWy0HlFsHIw) brilliantly nailed it in a reaction to the [ACCU Conference's video of The Practices That Make Continuous Integration](https://www.youtube.com/watch?v=G3PZo70KcSA):

1. If the build is slow then something needs to change (design, tools, frameworks, technology).
2. If it's hard to run the tests locally something is wrong too.
3. If software engineers need to follow a wiki page and install/configure 17 different things manually to get the build/tests to work locally, something is undoubtedly wrong.
4. If we have to commit, push and wait for a build server instead of running it locally many times per minute, we cannot take many many small steps and we will go slower.
5. If people push broken code that has not been run locally and breaks mainline, the culture needs to change.

I would add to this list, the fire-and-forget mode of building that involves pushing and waiting for a build server instigates lots of work in progress and context switching which devastates productivity.

Often, this reality is painful for teams to admit. To avoid this harsh confrontation, they adopt feature branches and pull requests to treat the symptoms, but not the cause. As a result, teams are mostly not aware of the symptoms, do not even see they could go faster and as such do not improve anymore. The hardest part of change is accepting the reality, letting go of the habitual beliefs and the commonly accepted practices and being open to other, oftentimes uncommon but so much more effective practices.

> If it is hard, do it more often. Bring the pain forward.
>
> -- Dave Farley, Continuous Delivery book

To conclude, we can consistently meet the agreement to never break the build. But it requires to follow a series of practices. Especially, to have a fast build. Team discipline is vital for this to work.

On the other hand, promising to never produce a bug is, as opposed to not breaking the build, truly unpredictable. Zero defects cannot steadily be secured. Even if all automated tests pass, enough eyeballs have scrutinised the code, all requirements have been fulfilled, we yet do not know whether we have zero bugs. Unquestionably, bugs there will be. That is certain. But, [Absence of Errors Fallacy](https://nurhayatkoklu.medium.com/the-absence-of-errors-fallacy-embracing-comprehensive-software-testing-with-a-smile-176e331c386d) learns us that it is only in the heat of the battle, in front of the user, in front of many much more users, that we will eventually know how nasty and how painful those bugs are.

Automated tests only cover what we know. They do not cover the many different unforeseen ways users will use our IT systems. Often, we engineers, are pretty naive on the possible uses of our systems. That is ok. As long as we can recover fast as we learn from production.

Code reviews, even with many eyes, are yet limited in spotting errors. Research has found that the amount of additional bugs found does not scale linearly with the number of reviewers. There is a small maximum of useful reviewers, between two and four. Any additional reviewers above this number uncover bugs at a much lower rate. The [Heartbleed SSL security bug](https://en.wikipedia.org/wiki/Heartbleed) invalidated [Linus's Law](https://en.wikipedia.org/wiki/Linus%27s_law) - given enough eyeballs, bugs are shallow - as the bug went unnoticed for two years. It allowed hackers to view the affected website's traffic unencrypted for two years.

Of course, we can try to predict user behaviour. But there are limitations in how much effort we put into trying to predict. No question, we will nonetheless miss ways on how our systems can be used. Exploratory testing will without question help in uncovering the unknowns. Again, production will still be the only genuine test. As IT systems are complex systems, our response should be [probe-sense-respond]({% post_url 2023-12-29-cynefin-framework-dave-snowden %}#complex). We conduct safe-to-fail experiments. We do not do fail-safe design. If an experiment succeeds, we amplify it. If the experiment starts to fail we dampen it. We get an emergent order. That is the only way to solve unknown problems. But, it requires to work [obliquely, not directly]({% post_url 2023-12-29-obliquity-john-kay %}).

Lastly, why not prevent the issue in the first place instead of playing a blame game where the developer is bound to fail at some point? If the developer is bound to fail, it is a system and team failure. The team did not set things up to avoid human failure. Amongst others, these are the points Daniel mentioned. If this leads to a blame game, there is a way bigger problem that requires immediate attention. There is a lack of [psychological safety](https://en.wikipedia.org/wiki/Psychological_safety). At this point, a broken build is the least of the team's concerns. [Research has shown that psychological safety is the one factor that predicts high-performing teams](https://www.nytimes.com/2016/02/28/magazine/what-google-learned-from-its-quest-to-build-the-perfect-team.html). Not skills, not green mainlines, but being able to make mistakes and learn from it.

## Conclusion

Agreeing to never break the build is a different thing from agreeing to never produce a bug. The first can be persistently accomplished given discipline and the right practices. The second is in the realm of complexity, uncertainty and hazard. Any promise in that area will be false.

The real reason teams turn to pull requests is a lack of skills, practices and most likely not being aware of more effective approaches. Regrettably, the practice of pull requests slows teams further down. Surprisingly, teams will paradoxically not notice the underperformance.

## Acknowledgments

Redbreast, Black Bottle Island Smoke, Tamdhu, The Balvenie for their inspiration.

## Bibliography

- [The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}), Thierry de Pauw
- [Absence of Errors Fallacy](https://nurhayatkoklu.medium.com/the-absence-of-errors-fallacy-embracing-comprehensive-software-testing-with-a-smile-176e331c386d), Nurhayat Koklu
- [Linus's Law](https://en.wikipedia.org/wiki/Linus%27s_law), Wikipedia
- [Facts and Fallacies about Software Engineering](https://www.goodreads.com/book/show/83792.Facts_and_Fallacies_of_Software_Engineering), Robert Glass
- [Given Enough Money, All Bugs Are Shallow](https://blog.codinghorror.com/given-enough-money-all-bugs-are-shallow/), Coding Horror
- [Notes about the Cynefin framework]({% post_url 2023-12-29-cynefin-framework-dave-snowden %})
- [Notes about Inclinations & Dispositions]({% post_url 2023-12-29-inclinations-and-dispositions-dave-snowden %})
- [What Google Learned From Its Quest to Build the Perfect Team](https://www.nytimes.com/2016/02/28/magazine/what-google-learned-from-its-quest-to-build-the-perfect-team.html)
