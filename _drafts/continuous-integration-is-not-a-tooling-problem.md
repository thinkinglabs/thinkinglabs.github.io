---
layout: post
title: Continuous Integration is Not a Tooling Problem
author: Thierry de Pauw
meta: 4 min read
categories:
tags: [ Continuous Integration ]
---

There is this commonly accepted, hard-grained belief in the software industry. By dropping a build server in a team, they get Continuous Integration magically for free. This belief is further incentivised by the marketing of build server vendors.

Back in August 2019, [Nat Friedman](https://twitter.com/natfriedman), CEO of GitHub, announced ...

> So excited to announce that GitHub now includes built-in CI/CD!
>
> -- [@natfriedman](https://twitter.com/natfriedman), [Twitter](https://twitter.com/natfriedman/status/1159511728704483329)

My friend [Steve Smith](https://twitter.com/SteveSmithCD) debunked that immediately. I didn't expect less from Steve.

> No. A tool cannot "include built-in CI and CD"
>
> - #ContinuousIntegration is a practice
> - #ContinuousDelivery is a set of principles and practices
>
> A tool can do build and deployment actions well, but it can't do more than that. You'd hope the GitHub CEO would know better #ohdear
>
> -- [@SteveSmithCD](https://twitter.com/SteveSmithCD), [Twitter](https://twitter.com/SteveSmithCD/status/1192526800125136902)

Despite the efforts of the XP community, people still believe a tool can build Continuous Integration into a team.

> This seems a niche hill on which to battle, but I'll bite. :-)
>
> Disagree. CI and CD are practices codified, automated, and automatic. Else they are not continuous, nor integrative, nor do they deploy reliably in any way.
>
> Lacking tooling, CI/CD are academic at best, yea?
>
> -- [@Strofcon](https://twitter.com/Strofcon), [Twitter](https://twitter.com/Strofcon/status/1192836997364121600)

## What is Continuous Integration

> Continuous Integration is a software development practise where members of a team integrate their work frequently, usually, each person integrates at least daily -- leading to multiple integrations per day. Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible.
>
> -- Martin Fowler, [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html)

> [It] is a practice designed to ensure that your software is always working, and that you get comprehensive feedback in a few minutes as to whether any given change to your system has broken it.
>
> -- Jez Humble, [On DVCS, continuous integration, and feature branches](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/)

## What does this mean

[Jez Humble](https://twitter.com/jezhumble), co-author of the [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, has a [simple test to determine if a team practices Continuous Integration](https://continuousdelivery.com/foundations/continuous-integration/#faq):

1. Does everyone in the team push their code into a shared mainline (not branches) on a daily basis?
2. Does every commit trigger an automated build and execution of all unit tests?
3. When the build is broken, is it typically fixed within 10 minutes?

![Continuous Integration Test](/assets/ci_test.png "Jez Humble's Continuous Integration Test")

Only if you answer yes to all three questions, you are practising Continuous Integration.

This involves adopting the following practices:

- All engineers run a private build on their own workstation before committing and pushing their code to a shared mainline. This to ensure their changes don't break the integration build.
- The build is automated. Any new team member must be able to check out the code from version control. And execute one command to build the codebase and run all tests.
- All engineers push their code at least once a day (preferably multiple times a day) to a shared mainline.
- Integration builds occur several times a day on a separate build server.
- 100% of the tests must pass for every build.
- A product (i.e. a release candidate binary) is generated that can be deployed in a test environment to undergo acceptance tests.
- Fixing broken builds is the highest priority.
- Keep the builds (including running unit tests) fast to provide rapid feedback. The XP guideline is less than 10 min. [Dave Farley](https://twitter.com/davefarley77), co-author of the [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, and myself aim for less than 5 min.

## Can a tool build this in

Will a tool ensure everyone in the team runs the build locally before pushing?

Will a tool ensure everyone in the team pushes at least once a day?

Will a tool ensure 100% of the tests are green?

Will a tool ensure a product is created that can be deployed at the end of the integration?

Will a tool ensure a broken build gets fixed within 10 min?

Will a tool ensure the build is fast to provide fast feedback?

Obviously, the answer is no to all these questions.

Does it mean you don't need tooling to practice Continuous Integration?

Well, to be fair, you do need some basic tooling:

- first of all, a centralised version control system;
- and something that enables you to run a build and execute all unit tests locally using one command-line command, like `make`, `rake`, `npm`, `ant`, `buildr`, `gradle` (`maven` if you absolutely want to), `lein`, ... and many others.

And that is it. Nothing more, nothing less.

## Conclusion

A team needs to adopt all of the above-mentioned practices to pass Jez’s Continuous Integration test and get into a state of Continuous Integration. A tool won’t enable this.

It is perfectly possible to practice Continuous Integration without using a build server (aka "CI-tool"). Conversely, using a build server is no guarantee to practise Continuous Integration.

## Acknowledgement

Thanks to [Steve Smith](https://twitter.com/SteveSmithCD) for reviewing this article.

## Bibliography

- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
- [Continuous Integration](https://continuousdelivery.com/foundations/continuous-integration), Jez Humble
- [On DVCS, Continuous Integration and Feature Branches](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/), Jez Humble
- The [Continuous Integration](https://www.goodreads.com/book/show/1311542.Continuous_Integration) book, Paul Duval
