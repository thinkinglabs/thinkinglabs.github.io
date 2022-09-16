---
layout: article
title: The Practices That Make Continuous Integration - Team Working for Continuous Integration
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

In this first part of this series, I would first like to investigate what are the practices that enable team work that in turn enable Continuous Integration. Continuous Integration is a practice one achieve as a team and not as a set of individuals.

---

> The difference between a tool and a practice is that a practice only exists when you are doing it.
>
> -- Steve Chapman, [Tools versus Practices - Lessons learned from DIY](https://www.canscorpionssmoke.com/2017/11/08/tools-versus-practices-lessons-diy/)

Tools are very appealing to many engineers because often it is thought that by adopting a tool they get the practice for free. Though, that is often not true.

Whereas a practice is *the actual application or use of an idea, belief, or method*. It is a codified way of working that might involve some tooling to achieve the practice, but most often, no tooling is required at all.

## Version Control Everything

We would think by 2022 this would be obvious. It seems the inverse is still true (rolling eyes).

> Historically I meet 1 team a year on average who aren't using version/source
> code control. Common reasons:
>
> - very immature team
> - SQL
> - PickOS derivative or ERM/CRM system
>
> Last category may even lack tooling
>
> -- Allan Kelly ([@allankellynet](https://twitter.com/allankellynet)), [Nov 8, 2020](https://twitter.com/allankellynet/status/1325491840146149377)

Continuous Integration is a state you achieve as a team, not as an individual. Therefore, in order to work as a team, you need something to coordinate production code, test code, application and system configurations, database schema evolutions, infrastructure code and many other things.

Without version control, we do not have a single source of truth. Releasing a piece of software becomes a marathon of chasing pieces of code on engineer's machines or shared network drives.

Without version control, we may need a team of integrators to integrate the code before releasing. This will lead to far less integrations per day which will impact quality and throughput of the IT-delivery process together with the lead time for delivery and time to market.

Without version control, it becomes damned hard to roll back a deployment that went awry. Because, we do not have that single source of truth allowing us to go back to the last known good state.

If we do not version every single artefact required to create the software application we will not enjoy any of the benefits of Continuous Integration. All of the practices that make Continuous Integration and that are a pre-requisite to Continuous Delivery rely on having everything under Version Control. All of these practices help to reduce the IT-delivery lead time and increase quality.

Be aware, a Version Control System is not only about versioning source code. It is first and for most a communication tool to communicate changes amongst all team
members. Together with Continuous Integration, it reveals the impact on others within minutes. This helps in gaining a [Shared Understanding](https://en.wikipedia.org/wiki/Extreme_programming_practices#Shared_understanding) of the system and building a [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html) over the codebase. In turn this will allow for increased integration frequency. Consequently, this enables communication and collaboration inside the team. In turn, it enables the fast flow of work through the value stream. Inevitably, this results in better quality and a higher throughput for the IT-delivery process and thus for a shorter time to market.

> In the past I have gone to extraordinary lengths to version intractable software, I recall our team reverse-engineering the RDBMS storage that backed an ESB system, and inventing a DSL that we could script the ESB config with so that we could store it in VCS 🙄
>
> -- Dave Farley ([@davefarley77](https://twitter.com/davefarley77)), [Nov 8, 2020](https://twitter.com/davefarley77/status/1325501341758877697)

This is the first of two practices that actually need a tool to implement the practice, i.e. you need a Version Control System. The other practice is **Automate the Build**. All other 12 practices to not need any tooling at all. In the end, to achieve Continuous Integration, you only need two tools. But you will need to implement 14 practices.

## Agree As a Team To Never Break The Build

Get everyone of the team to agree to the following:

> **From now on, our code in revision control will always build successfully and pass its tests.**
>
> -- James Shore, [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day)

I am putting this in bold because, without any doubt, this is absolutely key to the success of achieving Continuous Integration as a team. It ensures we have always working software. It guarantees the code we get out of version control just works at any given moment in time assuming we have a sufficiently comprehensive set of automated tests.

But, to be honest, it only reveals the known knowns. At this point, we do not know if the system is valuable for users and how it behaves in front of the users. This is where manual exploratory testing will add more information. However, not breaking the build ensures that manual exploratory testing can actually happen and that we can deliver a working system to users so we can, in effect, learn how it behaves in front of the user.

That said, this practice is non-negotiable. There is no single acceptable reason that would allow breaking this agreement. Even if production is burning. Nonetheless, it requires to **Have a Vast Amount of Automated Tests** and **Have a Fast Build**.

If we do not get everyone in the team to agree to this, Continuous Integration will simply not work for our team. That is a fact! When the build is broken we do not have Continuous Integration. Without Continuous Integration our software is broken until someone else proves it works.

After all, the reason for integrating code is to gain confidence about the quality of the code in the version control system. When the build breaks, the scope of possible root causes is wide. We are not so sure where to look for. Therefore, reducing the scope of potential root causes is essential to developing quickly and as such increase IT delivery throughput. If we know our code worked five minutes ago, we only need to take our actions from the past five minutes into account when investigating a broken build. This reduces the scope for finding the root causes. Often, we just need to look at the error message to understand what is wrong. No debugging is required.

Therefore, agree as a team to never break the build.

To guarantee this, it requires everyone in the team to first fetch the latest changes from the remote mainline and **Run a Local Build** before [committing](#commit) into [Mainline](#mainline). When the local build was successful, push to the remote mainline and wait till the [Commit Build](#commit-build) passes to green before starting new work.

## Do not Commit on a Broken Build

If the build happens to break, we [Stop The Line](https://en.wikipedia.org/wiki/Andon_(manufacturing)) and fix the build immediately.

During the time the build is broken, no new code is added. Adding new code only aggravates the situation by adding more problems and triggering new broken builds making the failure even worse. Fixing the broken build then becomes harder and harder. People get used to seeing a broken build and quickly this results in a situation where the build stays broken all the time. From then on we have lost the health monitoring for our application which inevitably impacts the quality of the software. Accordingly, we also lost the ability to perform on-demand production releases at any given moment in time which in turn reduces IT delivery throughput and increases our time to market.

The most important step in achieving Continuous Integration as a team is to accept as a team that each time code is committed, it builds successfully and passes each and every test. If the build fails, the whole team owns the failure. Hence, **Agree As a Team To Never Break The Build**. Therefore, when the build fails, the whole team stops and fixes the build before moving on with anything else.

## When Broken Revert

One of the preconditions of being in a state of Continuous Integration is to fix a broken build within 10 mins. The longer it takes to fix the build, the longer we block a whole team. Given the salaries for IT engineers, that is quite a lot of money hold in standstill. What is more, it disables on-demand production releases. Consequently, it reduces IT delivery throughput and increases time to market.

The easiest and fastest way to fix a broken build within 10 mins, and ensure time-to-market is not impacted, is to revert the commit that caused the broken build. Allowing us to go back to the last known good state of our application codebase.

> If you do revert a broken deployment, why would you not revert a broken build?
>
> -- [Steve Smith](https://twitter.com/stevesmith_tech) during a phone call

## Conclusion

Investing in these practices is very valuable. Each on their own enable the fast flow of work for the team and enables more integrations. The more integrations happen, the closer the team gets to a state of Continuous Integration. However, these are difficult practices to adopt as it involves people. But implementing these practices is a good investment not a bad cost as it unlocks faster IT delivery throughput and higher quality.

## Acknowledgments

[Lisi Hocke](https://twitter.com/lisihocke) for reviewing, genuinely questioning what I wrote from a tester's perspective and all the cheering.

As always, my dear friend [Steve Smith](https://twitter.com/SteveSmith_Tech) for his discerning, to the point feedback.

[Seb Rose](https://twitter.com/sebrose) who was so extremely kind to offer at SoCraTes his precious time to review this article.

## Bibliography

- [Tools versus Practices – lessons from DIY](https://www.canscorpionssmoke.com/2017/11/08/tools-versus-practices-lessons-diy/)
- [Software Configuration Management Patterns](https://www.goodreads.com/book/show/367720.Software_Configuration_Management_Patterns), Steve Berczuk with Brad Appleton
- [Continuous Integration](https://www.goodreads.com/book/show/1311542.Continuous_Integration), Paul Duval
- [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day), James Shore
- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery), Dave Farley and Jez Humble
- [The Art of Agile Development](https://www.goodreads.com/book/show/1654215.The_Art_of_Agile_Development), James Shore

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. Team working for Continuous Integration
2. Coding for Continuous Integration
3. Building for Continuous Integration

## Definitions

### Commit

In the context of a distributed version control systems, when I say commit I really mean *commit-and-push*.

### Mainline

The line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion this is *trunk*. For Git this is the remote *main* branch. For Mercurial this is the remote *default* branch.

### Commit Build

The build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from mainline and at a minimum compiling the sources, running a set of commit tests, and building a binary artefact for deployment.

### Commit Tests

All of the Unit Tests together with a small simple smoke test suite. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback on.
