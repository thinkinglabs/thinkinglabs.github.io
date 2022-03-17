---
layout: article
title: The Fallacy of the 100% Code Coverage
author: Thierry de Pauw
category: articles
tags: [Testing]
---

Is pursuing 100% code coverage a good or a bad thing? Code coverage is an interesting metric. However, 100% code coverage is a crappy target. It encourages gaming.

---

In 2019, at one of those exquisite dinners that define [SoCraTes France](https://socrates-fr.github.io/) I had the following conversation:

> X: Our next target is 100% code coverage
>
> Me: Have you heard of Goodhart's Law?
>
> X: Yes, I know that.
>
> X continuous on 100% code coverage with another person at the table and doesn't pay attention to me anymore. I'm afraid X doesn't see the relation.

## Definitions

Before we move on, let me first clarify what Code Coverage is and how it relates to Test Coverage? It seems, many people including myself, conflate both terms and use both terms interchangeably. Though, they mean different things.

**Test Coverage** gives the percentage of functional requirements covered by tests. It is a rather subjective measure. The percentage only relates to the *known* functional requirements. It is an attempt to measure the effectiveness of testing. Yet, that is also questioned by the Tester's community. A better approach to measure that effectiveness is using mutation testing. We will come back to this further down the article.

**Code Coverage** measures the percentage of code lines covered by tests. In contrast to Test Coverage, it is an objective measure. But it does not tell us anything about how well tested the software really is.

## Goodhart's Law

Some years before, during a digital transformation, I heard the following story:

> Team has a 30% code coverage. After running mutation tests, drops to 3% coverage.
>
> When a metric becomes a target you fool it. Goodhart's Law
>
> -- Me, [Jul 26, 2017](https://twitter.com/tdpauw/status/890112157450481664)

For that organisation, having a 30% code coverage was a truly big achievement. Most teams had no or very little code coverage. You can imagine how proud the team was. Until someone had the clever idea to execute [Mutation Tests](https://en.wikipedia.org/wiki/Mutation_testing) against the codebase. All of a sudden the test coverage dropped to 3%.

What happened?

> I expect a high level of coverage. Sometimes managers require one. There's a subtle difference.
>
> -- Brian Marick, [How to Misuse Code Coverage](http://www.exampler.com/testing-com/writings/coverage.pdf)

The manager of the team defined test coverage as a KPI. When something becomes a target, people will try to achieve it, no matter how. That is also what happened with that team. They improved the code coverage using low-quality testing.

This is a perfect example of [Goodhart's Law](https://en.wikipedia.org/wiki/Goodhart%27s_law).

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.
>
> -- Goodhart's Law, [Wikipedia](https://en.wikipedia.org/wiki/Goodhart%27s_law)

Or said differently:

> Any metric loses its value whenever it becomes a target.

To illustrate the madness of a 100% code coverage target, I have put in place  [`the-100percent-code-coverage-fallacy`
 GitHub repo](https://github.com/thinkinglabs/the-100percent-code-coverage-fallacy). It showcases a system having 100% code coverage, but having zero useful tests. All tests are [Assertion Free Tests](https://martinfowler.com/bliki/AssertionFreeTesting.html). When executing [Mutation Testing](https://en.wikipedia.org/wiki/Mutation_testing), zero of the mutations are being killed resulting in 0% useful tests. Though the system has 100% code coverage, it achieves an abysmally low quality of testing.

## What is good Code Coverage?

In the past, I had my fair share of discussions with teams on what is an acceptable code coverage percentage and should we enforce this. I've heard of places requiring 85% code coverage. I even heard of a place requiring 100% code coverage and even breaking the build if it was not attained.

> If a part of your test suite is weak in a way that coverage can detect, it's likely also weak in a way coverage can't detect.
>
> -- Brian Marick, [How to Misuse Code Coverage](http://www.exampler.com/testing-com/writings/coverage.pdf)

People measure code coverage because they want to have a feeling of whether they test enough. However, as we have seen, high coverage numbers do not mean much. Moreover, it [promotes ignorance for the unknowns](https://sriramnarayan.blogspot.com/2011/04/dashboards-promote-ignorance.html?m=0). Here, the unknowns are the missing assertions. Therefore, **having a green metric has very little value**. It only tells us the thing under measure seems ok but it requires subjectivity to assess what has been measured is actually valuable or not.

In general, coverage metrics do not tell us anything about the quality of our system or the quality of our testing, nor what has been tested.

But, what is good code coverage in the end? It depends on our context. It could be that a code coverage of 30% is ok if with this 30% the core of our system is covered. In other cases, it could be we require 40% or 50% code coverage.

We have enough tests when production bugs are rare and we are rarely afraid of breaking anything after a code change. Though as [Lisi Hocke](https://twitter.com/lisihocke) rightfully observed the first is not only attained with automated tests. There is more at play to reduce the likelihood of production bugs, like manual exploratory testing. That said, enough automated tests will likely reduce both the obvious and the harmful production bugs because the automated tests introduce the required fast feedback to allow for quick fixes. Any other less obvious or harmful issues, which could be quite a lot, are maybe not hurting enough to justify being caught upfront.

Having said all of that, code coverage is still a useful tool to find untested parts of our system. To then ask the question: Are we worried those parts are not tested?

To conclude, 100% code coverage is a lousy target. More interesting is to understand why we want to achieve this. What outcome do we want to get and measure that outcome? That is a much more valuable target. Also, targets should not be fixed. As we reach old targets, new valuable targets should arise. It is a continuum in constant evolution as we gain new insights.

## Acknowledgments

[Lisi Hocke](https://twitter.com/lisihocke) for reviewing multiple drafts of this article and providing constructive feedback.

## Bibliography

- [Goodhart's Law](https://en.wikipedia.org/wiki/Goodhart%27s_law) on Wikipedia
- [Code Coverage vs Test Coverage; Subjectivity and Usefulness](https://danashby.co.uk/2019/02/14/code-coverage-vs-test-coverage/), Dan Ashby
- [Test Coverage](https://martinfowler.com/bliki/TestCoverage.html), Martin Fowler
