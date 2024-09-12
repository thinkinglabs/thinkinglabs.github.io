---
layout: article
title: The Practices That Make Continuous Integration
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration.jpg
redirect_from:
  - /the-practices-that-make-continuous-integration
  - /the-practices-that-make-ci

---

Honestly, it feels a bit awkward to still write about Continuous Integration. It has been over 20 years since [Kent Beck](https://twitter.com/KentBeck) introduced Continuous Integration in his book [Extreme Programming Explained](https://www.goodreads.com/book/show/67833.Extreme_Programming_Explained). But, when looking around me, I realise teams and organisations still struggle with adopting Continuous Integration.

*Update Sep 29, 2022: Add [Lisi Hocke](https://twitter.com/lisihocke)'s sketchnote and update acknowledgments.*

---

![The 14 practices that make continuous integration](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration.jpg)

> Continuous Integration is a practice to ensure always working software and to
> get feedback within a few minutes to whether any given change broke the
> application.
>
> -- [Jez Humble](https://twitter.com/jezhumble)

The purpose of Continuous Integration is to have always working software on mainline allowing the team to perform on-demand production releases from mainline at any given moment in time.

This is one of the most critical practices to adopt to enable the fast flow of work through the value stream and getting close to the single-piece flow similar to the manufacturing industry. As such, resulting in increased IT delivery throughput, better quality and shorter time to market.

We say a team is in a state of Continuous Integration when:

>- everyone in the team (or every pair) commits at least once a day to mainline, leading to multiple integrations per day for the whole team,
>- every commit to mainline triggers an automated build and execution of all automated tests
>- and whenever the build fails, the team is able to fix it within 10 mins.
>
>-- [Jez Humble](https://twitter.com/jezhumble)

[Continuous Integration is not a tooling problem]({% post_url 2020-03-23-continuous-integration-is-not-a-tooling-problem %}). It is a state a team can attain by adopting a series of practices.

Over the past six years, I had many discussions when [talking about the myriad of problems introduced by the practice of feature branching]({% post_url 2016-10-29-feature-branching-is-evil %}). Many questions were asked on how to achieve trunk-based development, which is nothing else than true Continuous Integration. During those discussions, I was baffled by how little the practices that enable Continuous Integration are known. Most teams do not get beyond having a centralised build, to then say they practice Continuous Integration.

Surprisingly, very little literature is available summing up all the practices that make Continuous Integration. Most information is scattered over many books and articles. It led me to write this article series to summarise all the practices that make Continuous Integration in one place.

To reach Continuous Integration a team has to adopt 14 practices that can be split into three categories:

1. [*Team working for Continuous Integration*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}): all the practices that enable the fast flow of work for the team, ensuring they are never blocked.
2. [*Coding for Continuous Integration*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}): all the coding practices that enable working in small increments.
3. [*Building for Continuous Integration*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}): all the practices required to effortlessly and efficiently integrate changes continuously into the codebase.

![SketchNote from Lisi Hocke at SoCraTes 2022](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-socrates-2022-lisi-hocke.png)
*SketchNote from [Lisi Hocke](https://twitter.com/lisihocke) at [SoCraTes](https://www.socrates-conference.de) 2022, published with consent*

## References

- [The Talk: The Practices That Make Continuous Integration]({% post_url 2022-08-26-the-practices-that-make-continuous-integration %})

## Acknowledgments

[Steve Smith](https://twitter.com/SteveSmith_Tech) for reviewing the very first draft of this article one year and a half ago to then suggest to splitting the article up into a series. Steve was the one who came up with the 3 categories: Team Work, Coding and Building.

[Lisi Hocke](https://twitter.com/lisihocke), [Seb Rose](https://twitter.com/sebrose) and [Steve Smith](https://twitter.com/SteveSmith_Tech) for having put a lot of effort in reviewing each individual article from the series.
