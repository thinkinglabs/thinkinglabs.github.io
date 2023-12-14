---
layout: article
title: On the Evilness of Feature Branching - What about Code Reviews
author: Thierry de Pauw
meta: 11 min read
category: articles
tags: [Version Control, Continuous Integration, Code Review]
---

Every time I suggest the adoption of trunk-based development, I always get that one, single, same question asked: What about Code Reviews? How do we do Code Reviews when we do not have branches anymore? Of course, this assumes code reviews can only happen with Pull Requests.

---

Many teams think they are mature when they practice code reviews. Often, the inverse is true. There is no correlation between performing code reviews and being mature as a team. Many times, the way teams execute code reviews adds little or no value other than slowing down delivery. Or even worse, it introduces dysfunctions in the team. Stories of one person solely deciding what comes in the codebase and what not because they are so-called senior, are not uncommon.

> With PRs we created a world where the amount of time we spend reviewing code has become disproportionate to the time spent creating value.
>
> -- Seb Rose ([@sebrose](https://twitter.com/sebrose)), [Aug 29, 2022](https://twitter.com/tdpauw/status/1564280563195953152)

Code reviews are optional. This is a choice a team makes. Nowadays, teams spend more time in pull requests to gate merges to mainline instead of delivering value. It inhibits Continuous Integration, reduces feedback, consequentially impacts quality, increases time to market and therefore incurs an opportunity cost. If the team is mature enough, we might think they will do the right thing. Instead of thinking they are stupid and we need a process to fix for that. Our processes should follow [Theory Y over Theory X](https://en.wikipedia.org/wiki/Theory_X_and_Theory_Y).

In my past career, I worked with a product team that only reviewed bugs, not new features. Back then, that team had one of the highest quality standards I've ever seen before. We had a myriad of automated tests running on all different platforms the product could run on. It worked because we trusted each other. And also because sufficient automated testing was in place. The quality would have been even better if we had exploratory testing in place and the team would have counted a quality engineer.

This idea that reviews are optional has been confirmed by the book [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate) from [Dr. Nicole Forsgren](https://www.linkedin.com/in/nicolefv/) et al. They found out that both teams that do not perform peer reviews as well as teams performing peer reviews achieve higher IT delivery throughput.

If we still want to perform code reviews, we, the eXtreme Programming and Continuous Delivery community, are convinced that the most effective way to run code reviews is through Pair Programming or Team Programming. In that case, we review the code while it is being written. Even before it gets committed into mainline. We have Continuous Code Review for free. [Dave Farley](https://www.linkedin.com/in/dave-farley-a67927/) repeatedly reports that even in highly regulated industries like healthcare, finance and the gambling industry this is good enough as a code review.

Pair Programming and Team Programming are more effective because the code reviews are part of the flow of work. Everyone has the context fresh in their head. It is then easy to spot and fix mistakes. Whereas, when reviews happen at the end it is in reality too late. The cost of change becomes too high.

If, for some truly valuable reasons, the team cannot work in pairs or as an ensemble. For many organisations and teams, this is still a big stretch. In that case, we still have two other options.

The first option is the most commonly practised one, i.e. the Pull Request model. But this time branches have a short lifetime, i.e. we merge back into mainline within a day, not longer. Many people I respect reported they had good experiences working this way. However, I have never seen this work. Most of the time the branch lives longer than anticipated. Because of the classic ping-pong happening between the reviewer and the reviewee. The reviewer is not immediately available. This causes the pull request to wait. Meanwhile, the reviewee starts new work to keep themselves busy. Once the reviewer has finally reviewed the pull request, it is now the reviewee who is not available. For sure, they started new work while waiting for the review. All of this adds to the team's work in progress. From Lean Manufacturing we know that high levels of work in progress induce lower quality. How keeping people busy impacts quality.

But my biggest concern regarding pull requests is they block the flow of work. It is a gating process that blocks the delivery of functionality. The code review becomes definitive to merging and releasing. This again increases the time to market and introduces a non-negligible opportunity cost. Finally, it disables timely feedback from production. It might happen we realise, once the feature finally arrives in production after a lengthy review, it is in truth no longer aligned with the user's needs.

The second option is a not-so-well-known technique. But we had a very good experience with that one while coaching that novice team from [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %}). It is now commonly known as [Non-Blocking, Continuous Code Review]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}). The team reviews the code on mainline after it has been committed.

We only had two rules in place. There was no hierarchy of who reviews who. Seniors review from seniors and juniors. Juniors review from seniors and juniors. It avoided creating any bottlenecks. Whenever someone finished work, or at the start of the day, before starting any new work, any team member would first look if there was new code requiring a code review.

Code reviews were not definitive to releasing any more. It happened that unreviewed code landed in production. We might argue we run the risk of having bad-quality code in production. Yes, that is true. And that has happened. But that was certainly not a problem. Bad quality is not a bug. Code reviews are not there to catch bugs. For that, we have our automated tests. If the code passed all stages of the deployment pipeline and has been thoroughly tested, the code is releasable. In our case, the purpose of the code review was to convey knowledge, a learning tool and increase code quality.

Non-blocking, code reviews have as main benefit of never blocking the delivery of functionality. Like with pair and team programming it enables the fast flow of work through the value stream. To be honest, this only works when there is team commitment that any change is covered by an automated test, every commit will be reviewed and whenever a code issue is raised, it is handled with the highest priority to allow us to remove the bad quality code out of production as soon as possible.

As a side note, one day the team had the internal auditors on the line. They asked questions about our process because we did not follow the "standard" process. That process involved lots of manual checkbox ticking. We were a bit considered by the rest of the organisation as unprofessional. One team member genuinely explained our process. The auditors fell off their chairs because of the amount of automated checks and audit trails we had in our process.

Having said all that, I still believe pair and team programming is a superior way of working. If for some reason, that is not possible, non-blocking code reviews are a valid alternative. But, in all sincerity, it might be difficult for regulated industries. In that event, pair and team programming are the only efficient option.

## Acknowledgments

Redbreast and Glenkinchie for the creative support.

## Bibliography

- [Continuous Delivery and Code Reviews](https://groups.google.com/g/continuousdelivery/c/LIJ1nva9Oas/m/jv5Tt01IfZYJ) on Continuous Delivery Google Groups
- [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate), Dr. Nicole Forsgren, Jez Humble and Gene Kim
- [Non-Blocking, Continuous Code Reviews - a case study]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %})

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. [But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
4. [The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %})
5. [How To Avoid The Problems?]({% post_url 2022-06-14-on-the-evilness-of-feature-branching-how-to-avoid-the-problems %})
6. What about Code Reviews?
7. What Are The Benefits of Trunk-Based Development?
8. Where is the Evilness of Feature Branching?
