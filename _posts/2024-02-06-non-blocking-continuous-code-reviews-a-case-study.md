---
layout: talk
title: Non-Blocking Continuous Code Reviews - a Case Study
date: 2024-01-06
category: talks
tags: [ Code Review, Continuous Integration, Continuous Delivery, Case Study ]
speakerdeck:
  data_id: 11f7c8b11edc4fddb4dffde694e21400
  download_link: https://files.speakerdeck.com/presentations/11f7c8b11edc4fddb4dffde694e21400/Non-Blocking_Continuous_Code_Reviews.pdf
conferences:
  - name: CfgMgmtCamp
    date: 2024-01-06
---

The problem with the current most commonly accepted way of running code reviews using Pull Requests is that they have the nasty habit of blocking the flow of delivery. They introduce a cost of delay. Any delay reduces feedback. Consequently, it drives down quality.

The usual way to achieve fast efficient and effective Continuous Code Reviews without disrupting the flow of delivery is through Pair Programming or Team Programming. However, for various valid reasons, these are often a cultural stretch for many teams and organisations.

In 2012, a novice team practising trunk-based development put in place a fairly uncommon but efficient alternative to implementing continuous code reviews on mainline without ever blocking the flow of delivery.
This team went from a bunch of rag-tags to becoming a reference team in the organisation, with auditors falling on the floor because of the amount of quality the team delivered.

[TLDR;](https://www.linkedin.com/feed/update/urn%3Ali%3Aactivity%3A7160681409039228928/) by [Michael Lihs](https://www.linkedin.com/in/michael-lihs/) on LinkedIn

References:

- [Optimizing the Software development process for continuous integration and flow of work](https://itnext.io/optimizing-the-software-development-process-for-continuous-integration-and-flow-of-work-56cf614b3f59), Martin Mortensen
- The Article: [Non-Blocking Continuous Code Reviews, a Case Study]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}), Thierry de Pauw
- [Code Complete](https://www.goodreads.com/book/show/4845.Code_Complete), Steve McConnell
- [Facts and Fallacies of Software Engineering](https://www.goodreads.com/book/show/83792.Facts_and_Fallacies_of_Software_Engineering), Robert Glass
- [Joel on Software](https://www.joelonsoftware.com/), Joel Spolsky
- [What is the purpose of Code Reviews](https://www.linkedin.com/posts/tdpauw_im-working-on-a-new-presentation-one-of-activity-7155600839053594626-8Ax_), Thierry de Pauw, a discussion on LinkedIn
- [I’ve found something better than PRs](https://www.youtube.com/watch?v=WmVe1QrWxYU), the video from Dave Farley on the topic
- [From Async Code Reviews to Co-Creation Patterns](https://www.infoq.com/articles/co-creation-patterns-software-development/), Dragan Stepanović
- [I Hate Pull Requests](https://medium.com/@pia.fak.sunnanbo/i-hate-pull-requests-17836dd3cc38), Pia Fåk Sunnanbo
- [Problems with Pull Requests and How to Fix Them](https://gregoryszorc.com/blog/2020/01/07/problems-with-pull-requests-and-how-to-fix-them/), Gregory Szorc
- [On the Evilness of Feature Branching - But Compliance]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}), Thierry de Pauw
- [How to make sure tests are of quality](https://www.linkedin.com/posts/tdpauw_in-all-my-debunking-of-version-control-branches-activity-7142800577901592576-zhqS), Thierry de Pauw, a discussion on LinkedIn
