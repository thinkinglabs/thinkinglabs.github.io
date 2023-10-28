---
layout: article
title: On the Evilness of Feature Branching - What about Code Reviews
author: Thierry de Pauw
meta: 11 min read
category: articles
tags: [Version Control, Continuous Integration, Code Review]
---

Every time I suggest the adoption of trunk-based development, I always get that same question asked: What about Code Reviews? How do we do Code Reviews when we do not have branches anymore. This off course assumes code reviews can only be performed using Pull Requests.

---

Many teams think they are mature when they practice code reviews. Often, the inverse is true. There is no correlation between running code reviews and being mature as a team. Many times, the way teams execute code reviews add little or no value other than slowing down delivery.

Code reviews are optional. This is a choice a team makes. Nowadays, teams spent more time in pull requests to gate merges to mainline over delivering value. It inhibits Continuous Integration and increases time to market. If the team is mature enough, we might think they will do the right thing. Instead of thinking they are stupid and we need a process to fix for that. Our process should follow [Theory Y not Theory X](https://en.wikipedia.org/wiki/Theory_X_and_Theory_Y).

This has been confirmed by the book [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate) from [Dr. Nicole Forsgren](https://www.linkedin.com/in/nicolefv/) et al. where they found out that both teams that do not perform peer-reviews as well as teams performing peer reviews achieve higher IT delivery throughput.

If we still want to perform code reviews, we, the eXtreme Programming and Continuous Delivery community, are convinced that the most effective way to perform code reviews is through Pair Programming or Ensemble Programming. Code is being reviewed while is it being written before it gets committed into mainline. We have Continuous Code Review for free. [Dave Farley](https://www.linkedin.com/in/dave-farley-a67927/) reports that even in highly regulated industries like healthcare, finance and the gambling industry this is good enough as a code review.

Pair Programming and Ensemble Programming are more effective because the code reviews are part of the flow of work and not something that happens at the end when it is too late and when the cost of change becomes too high.

If, for some truly valuable reasons, the team cannot work in pairs or as an ensemble, we still have two options.

The first option is the most known and most used one, i.e. the Pull Request model but this time using short lived branches, meaning shorter than a day. Many people I respect have reported they had good experiences working like that. However, I have never seen this work. Most of the time the branch lives longer than expected. Because of the classic ping-pong that is happening between the reviewer and the reviewee. The reviewer is not immediately available ensuring the pull request is waiting and adds to the team's work in progress. Once the reviewer has finally reviewed the pull request, it is now the reviewee who is not available because they started new work while waiting for the review. This is a classic example of keeping people busy regardless if it is valuable. But my biggest concern is that the pull request blocks the flow of work. It is a gating process that blocks the delivery of functionality. Releasing the pull request depends on the review. This increases the time to market and introduces non negligible opportunity costs. Finally, it also disables timely feedback. It might happen we realise once the feature finally arrives in production after a lengthy review the feature as a matter of fact is not aligned with the user's needs.

## Acknowledgments

Glenkinchie and Redbreast for keeping me company while writing.

## Bibliography

- [Continuous Delivery and Code Reviews](https://groups.google.com/g/continuousdelivery/c/LIJ1nva9Oas/m/jv5Tt01IfZYJ) on Continuous Delivery Google Groups
- [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate), Dr. Nicole Forsgren, Jez Humble and Gene Kim

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. Why Do Teams Use Feature Branches?
3. [But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
4. [The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %})
5. [How To Avoid The Problems?]({% post_url 2022-06-14-on-the-evilness-of-feature-branching-how-to-avoid-the-problems %})
6. What about Code Reviews?
7. What Are The Benefits of Trunk-Based Development?
8. Where is the Evilness of Feature Branching?
