---
layout: article
title: The Fallacy of the 100% Code Coverage
author: Thierry de Pauw
category: articles
tags: [Testing]
---

Is pursuing 100% code coverage a good or a bad thing? Code coverage is an interesting metric. However, 100% code coverage is a crappy target. It encourages gaming.

*Update Apr 21, 2022: Add [Micheal Feathers](https://twitter.com/mfeathers)' observation it is hard to go wrong when you use curiosity to drive your test writing.*

---

In 2019, at one of those exquisite dinners that define [SoCraTes France](https://socrates-fr.github.io/) I had the following conversation:

> X: Our next target is 100% code coverage
>
> Me: Have you heard of Goodhart's Law?
>
> X: Yes, I know that.
>
> X continuous on 100% code coverage with someone else at the table and does not pay attention to me anymore. I am afraid X does not see the relation.

## Definitions

Before we move on, let me first clarify what *Code Coverage* is and how it relates to *Test Coverage*. Many people, including myself, conflate both terms and use both interchangeably. Though, they mean different things.

**Test Coverage** gives the percentage of functional requirements covered by tests. It is a somewhat subjective measure. The measure only relates to the *known* functional requirements and does not include all of the *unknowns*. It is an attempt to measure the effectiveness of testing. Yet, the Testers' community also questions that. A better approach to measure the efficacy is using [Mutation Testing](https://en.wikipedia.org/wiki/Mutation_testing). We will come back to this further down the article.

**Code Coverage** measures the percentage of code lines covered by tests. In contrast to Test Coverage, it is an objective measure. But it does not tell us anything about how well tested the software truly is.

## Goodhart's Law

Some years before, during a digital transformation, I heard the following story:

> Team has a 30% code coverage. After running mutation tests, drops to 3% coverage.
>
> When a metric becomes a target you fool it. Goodhart's Law
>
> -- Me, [Jul 26, 2017](https://twitter.com/tdpauw/status/890112157450481664)

Having a 30% code coverage was a truly big achievement inside that organisation. Most teams had no or very little code coverage. You can imagine how proud the team was. Until someone had the clever idea to execute [Mutation Tests](https://en.wikipedia.org/wiki/Mutation_testing) against the codebase. All of a sudden the test coverage dropped to 3%.

What happened?

> I expect a high level of coverage. Sometimes managers require one. There's a subtle difference.
>
> -- Brian Marick, [How to Misuse Code Coverage](http://www.exampler.com/testing-com/writings/coverage.pdf)

The team's manager defined test coverage as a KPI for the team. When something becomes a target, people will try to achieve it, no matter how. That is also what happened with that team. The team optimised their performance according to how they were measured. They improved the code coverage using low-quality testing as it was the easiest way to satisfy the KPI.

This is a perfect example of [Goodhart's Law](https://en.wikipedia.org/wiki/Goodhart%27s_law).

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.
>
> -- Goodhart's Law, [Wikipedia](https://en.wikipedia.org/wiki/Goodhart%27s_law)

Or said differently: **Any metric loses its value whenever it becomes a target.**

To illustrate the madness of a 100% code coverage target, I have put together  [`the-100percent-code-coverage-fallacy` GitHub repo](https://github.com/thinkinglabs/the-100percent-code-coverage-fallacy). It showcases a system having 100% code coverage. But all tests are [Assertion Free Tests](https://martinfowler.com/bliki/AssertionFreeTesting.html). When executing [Mutation Testing](https://en.wikipedia.org/wiki/Mutation_testing), zero of the mutations are being killed. Which results in zero helpful tests. Although the system has 100% code coverage, it achieves an abysmally low testing quality.

> Even if you have achieved complete coverage [...], you have not done complete, or even adequate, testing.
>
> -- Cem Kaner, [Software Negligence and Testing Coverage](http://kaner.com/pdfs/negligence_and_testing_coverage.pdf)

Many bugs will not be detected when achieving complete code coverage. Typically the *faults of omission*, the kind of bugs fixed by adding additional code. Examples are the case of sending a data structure the system does not expect or a library that returns a status code not checked by the caller. These cases will not report relevant line coverage information as no lines are being executed.

Consequently, do not use code coverage to drive the design of tests. The return in terms of found bugs will be too low.

## What is good Code Coverage?

In the past, I had my fair share of discussions with teams about what is an acceptable code coverage percentage and should it be enforced. I have heard of places requiring 85% code coverage. [According to Brian Marrick, 85% is a usual number](http://www.exampler.com/testing-com/writings/coverage.pdf). Teams pick that number because other respectable teams or organisations use it. I also heard of a place requiring 100% code coverage and even breaking the build when not attained.

> If a part of your test suite is weak in a way that coverage can detect, it's likely also weak in a way coverage can't detect.
>
> -- Brian Marick, [How to Misuse Code Coverage](http://www.exampler.com/testing-com/writings/coverage.pdf)

Often, teams use code coverage because they want to have a feeling of whether they test enough. However, as we have seen, high coverage numbers do not mean much. Moreover, it [promotes ignorance for the unknowns](https://sriramnarayan.blogspot.com/2011/04/dashboards-promote-ignorance.html?m=0). Where here, the unknowns are the missing assertions. Therefore, **having a green metric has very little value**. It only tells us the coverage seems ok, but it requires subjectivity to assess whether the testing is in effect valuable or not. Too many teams rely solely on code coverage to gain confidence in their releases. Or worse, to pretend they do not need testers because their code is fully covered. Yet, it just shows teams do not know which feedback they are missing while having a false sense of safety.

In this way, coverage metrics do not tell us anything useful about the quality of our system or the quality of our testing, nor what has been tested.

But, what is good code coverage in the end?

> Don’t worry about coverage, just write some good tests.
>
> -- Alberto Savoia, [How much test coverage do you need? - The Testivus Answer](https://getpocket.com/read/154805457)

We should focus our test design on the high-risk code, i.e. the code that could cause severe damage, has many users or might have many mistakes whose costs add up. It might be we only achieve 30% coverage. In reality, this is ok if with this 30% we cover the core of our system or all high-risk code.

> [...] Only thing I'd add is that it is hard to go wrong when you use curiosity to guide your test writing. Tests are driven by the need to understand. The right things get covered.
>
> -- Michael Feathers ([@mfeathers](https://twitter.com/mfeathers)), [Mar 25, 2022](https://twitter.com/mfeathers/status/1507401657092501504)

**Curiosity helps to articulate questions as tests.** Which is not surprising, as an exploratory mindset helps to discover new and valuable information. As soon as we understand the problem better, we will find better ways to cover the right things with tests.

In the end, we could say we have enough (automated) tests when production bugs are rare and we are rarely afraid of breaking anything after a code change. Though as [Lisi Hocke](https://twitter.com/lisihocke) rightfully observes, the first is not only accomplished with automated tests. There is more at play to reduce the likelihood of production bugs, like manual exploratory testing and other kinds of tests. That said, enough automated tests will likely reduce both the obvious and the harmful production bugs because the automated tests introduce the required fast feedback to allow for quick fixes. Any other less obvious or less harmful issues, which in the end might be quite a lot, are maybe not hurting enough to justify being caught upfront. As long as we have the right practices in place, allowing for fast recovery.

## Conclusion

Nevertheless, code coverage is still a convenient tool to find untested parts of our system. It gives clues pointing to weaknesses in our test design which supplement our subjective thinking. To then ask the question: Are we worried those parts are not tested?

To conclude, 100% code coverage is a lousy target. More interesting is to understand why we want to achieve this. What outcome do we want to get? To then measure that outcome. That is a much more valuable target. Also, targets should not be fixed. As we reach targets, new valuable targets should arise. It is a continuum in constant evolution as we gain new insights resulting in continuous improvement.

## Acknowledgments

[Lisi Hocke](https://twitter.com/lisihocke) for reviewing multiple drafts of this article and providing constructive feedback and new insights.

## Bibliography

- [Goodhart's Law](https://en.wikipedia.org/wiki/Goodhart%27s_law) on Wikipedia
- [Code Coverage vs Test Coverage; Subjectivity and Usefulness](https://danashby.co.uk/2019/02/14/code-coverage-vs-test-coverage/), Dan Ashby
- [Software Negligence and Testing Coverage](http://kaner.com/pdfs/negligence_and_testing_coverage.pdf), Cem Kaner, 1995
- [How to Misuse Code Coverage](http://www.exampler.com/testing-com/writings/coverage.pdf), Brian Marick, 1997
- [Dashboards promote ignorance](https://sriramnarayan.blogspot.com/2011/04/dashboards-promote-ignorance.html?m=0), Sriram Narayan
- [How much test coverage do you need? - The Testivus Answer](https://developertesting.com/archives/month200705/20070504-000425.html), Alberto Savoia
- [Test Coverage](https://martinfowler.com/bliki/TestCoverage.html), Martin Fowler
