---
layout: article
title: On the Evilness of Feature Branching
author: Thierry de Pauw
meta: 1 min read
category: articles
tags: [Version Control, Continuous Integration]
redirect_from:
  - /on-the-evilness-of-feature-branching

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
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. [But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
4. [The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %})
5. [How To Avoid The Problems?]({% post_url 2022-06-14-on-the-evilness-of-feature-branching-how-to-avoid-the-problems %})
6. [What about Code Reviews?]({% post_url 2023-12-14-on-the-evilness-of-feature-branching-what-about-code-reviews%})
7. [Where is the Evilness?]({% post_url 2024-01-06-on-the-evilness-of-feature-branching-where-is-the-evilness %})

## Acknowledgments

[Steve Smith](https://twitter.com/SteveSmith_Tech) for nudging me to write this
down, reviewing the result and suggesting to break the article up into an
article series.

## References

- The Talk: [Feature Branching is Evil]({% post_url 2016-10-29-feature-branching-is-evil %})

## Related Articles

- [On the Benefits of Trunk-based Development]({% post_url 2025-07-21-on-the-benefits-of-trunk-based-development%})
