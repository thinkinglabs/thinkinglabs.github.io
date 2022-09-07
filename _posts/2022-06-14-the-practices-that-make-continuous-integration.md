---
layout: article
title: The Practices That Make Continuous Integration
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration ]
---

Honestly, it feels a bit awkward to still write about Continuous Integration. It has been over 20 years since [Kent Beck](https://twitter.com/KentBeck) introduced Continuous Integration in his book [Extreme Programming Explained](https://www.goodreads.com/book/show/67833.Extreme_Programming_Explained). But, when looking around me, I realise teams and organisations still struggle with adopting Continuous Integration.

---

Over the past six years, I had many discussions when [talking about the myriad of problems introduced by the practice of feature branching]({% post_url 2016-10-29-feature-branching-considered-evil %}). Many questions were asked on how to achieve trunk-based development, which is nothing else than true Continuous Integration. During those discussions, I was baffled by how little the practices that enable Continuous Integration are known. Most teams do not get beyond having a centralised build, to then say they practice Continuous Integration.

Surprisingly, very little literature is available summing up all the practices that make Continuous Integration. Most information is scattered over many books and articles. It led me to write this article series to at last summarise all the practices that make Continuous Integration in one place.

I identified 14 practices that make Continuous Integration. We can distinguish the practices in three categories:

1. *Team working for Continuous Integration*: all the practices that enable the fast flow of work for the team, ensuring they are never blocked.
2. *Coding for Continuous Integration*: all the coding practices that enable working in small increments.
3. *Building for Continuous Integration*: all the practices required to effortlessly and efficiently integrate changes continuously into the codebase.

## Acknowledgments

[Steve Smith](https://twitter.com/SteveSmith_Tech) for reviewing the very first draft of this article one year and a half ago. To then suggest splitting it up into an article series.
