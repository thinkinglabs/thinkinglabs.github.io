---
layout: article
title: On the Evilness of Feature Branching
author: Thierry de Pauw
meta: 1 min read
category: articles
tags: [Version Control, Continuous Integration]
redirect_from:
  - /2021/04/26/on-the-evilness-of-feature-branching.html
---

Branch creation became very easy with the advent of Distributed Version Control
Systems. However, it comes at an unquestionable cost. Long living branches break
the flow of the IT delivery process, impacting both stability and throughput.

---

In this article series, I will explore why teams use feature branches, what
problems do the use of feature branches introduce and what techniques exist to
avoid them altogether. Finally, I will explore what exactly is evil about
feature branches, which is not necessarily the problems they introduce - but
rather, the real reasons why teams are using them.

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. Why Do Teams Use Feature Branches?
3. Why Are Feature Branches a Problem?
4. How Can We Avoid Feature Branching Problems?
5. Questions I Regularly Get Asked about Trunk-Based Development
6. What Are The Benefits of Trunk-Based Development?
7. Where is the Evilness of Feature Branching?

## Acknowledgments

[Steve Smith](https://twitter.com/SteveSmith_Tech) for nudging me to write this
down, reviewing the result and suggesting to break the article up into an
article series.
