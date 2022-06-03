---
layout: article
title: The Practices That Make Continuous Integration
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration ]
---

To be honest, it feels a bit awkward to still write about Continuous Integration. It has been over 20 years Continuous Integration was introduced by [Kent Beck](https://twitter.com/KentBeck) in [Extreme Programming Explained](https://www.goodreads.com/book/show/67833.Extreme_Programming_Explained). But, when I look around me, I realise teams and organisations are still struggling with the adoption of Continuous Integration.

---

Over the past 6 years I had many discussions when [talking about the myriad of problems introduced by the practice of feature branching]({% post_url 2016-10-29-feature-branching-considered-evil %}). Many questions were asked on how to achieve trunk-based development which is nothing else than true Continuous Integration. During those discussions, I was baffled by how little the practices that enable Continuous Integration are known. Most teams do not get beyond having a centralised build, to then say they practice Continuous Integration.

Surprisingly, there is very little literature available that sums up all the practices that make Continuous Integration. Most information is scattered over many books and articles. This led me to write this article to finally summarise all the practices that make Continuous Integration in one place.

I have identified 14 practices that make Continuous Integration. They will be covered in the following article series.

1. Team working for Continuous Integration: all the practices that enable the fast flow of work for the team, making sure the team is never blocked.
2. Coding for Continuous Integration: all the coding practices that enable working in small increments.
3. Building for Continuous Integration: all the practices required to easily and efficiently integrate changes into the codebase continuously.

## Acknowledgments

[Steve Smith](https://twitter.com/SteveSmith_Tech) for reviewing the very first draft of this article one year and a half ago. To then suggest to split it up into an article series.
