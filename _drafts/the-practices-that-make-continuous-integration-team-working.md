---
layout: article
title: The Practices That Make Continuous Integration - Team Working for Continuous Integration
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

In this first part of this series, I would first like to investigate what are the practices that enable team work that in turn enable Continuous Integration. Continuous Integration is a practice one achieve as a team and not as a set of individuals.

---

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
> -- Allan Kelly ([allankellynet](https://twitter.com/allankellynet)), [Nov 8, 2020](https://twitter.com/allankellynet/status/1325491840146149377)

Continuous Integration is a state you achieve as a team, not as an individual. Therefore, in order to work as a team, you need something to coordinate production code, test code, application and system configurations, database schema evolutions, infrastructure code and many other things.

Without version control, we do not have a single source of truth. Releasing a piece of software becomes a marathon of chasing pieces of code on engineer's machines or shared network drives.

Without version control, we may need a team of integrators to integrate the code before releasing. This will lead to far less integrations per day which will impact quality and throughput of the IT-delivery process together with the lead time for delivery and time to market.

Without version control, it becomes damned hard to roll back a deployment that went awry. Because, we do not have that single source of truth allowing us to go back to the last known good state.

If we do not version every single artefact required to create the software application we will not enjoy any of the benefits of Continuous Integration. All of the practices that make Continuous Integration and that are a pre-requisite to Continuous Delivery rely on having everything under Version Control. All of these practices help to reduce the IT-delivery lead time and increase quality.

Be aware, a Version Control System is not only about versioning source code. It is first and for most a communication tool to communicate changes amongst all team
members. This will help us in creating a [Shared Understanding](https://en.wikipedia.org/wiki/Extreme_programming_practices#Shared_understanding) and building a [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html) of the codebase. In turn this will allow increased integration frequency which inevitably leads to better quality and a higher throughput of the IT-delivery process and thus for a shorter time to market.

This is the first of only two tools you really need to achieve Continuous Integration.

> In the past I have gone to extraordinary lengths to version intractable software, I recall our team reverse-engineering the RDBMS storage that backed an ESB system, and inventing a DSL that we could script the ESB config with so that we could store it in VCS 🙄
>
> -- Dave Farley ([@davefarley77](https://twitter.com/davefarley77)), [Nov 8, 2020](https://twitter.com/davefarley77/status/1325501341758877697)

## Agree As a Team To Never Break The Build

Get everyone of the team to agree to the following:

> **From now on, our code in revision control will always build successfully and
> pass its tests.**
>
> -- James Shore, [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day)

I am putting this in bold because, without any doubt, this is absolutely key to the success of achieving Continuous Integration as a team. It will ensure we will have always working software. It will guarantee the code we get out of version control will just work at any given moment in time.

However, tt requires everyone in the team to first fetch the latest changes from the remote mainline and **Run a Local Build** before committing into mainline.

This practice is non-negotiable. There is no single acceptable reason that would allow breaking this agreement. Even if production is burning. Nonetheless, it requires to **Have a Vast of Automated Tests** and **Have a Fast Build**.

If we do not get everyone in the team to agree to this, Continuous Integration will simply not work for our team. That is a fact!

## Do not Commit on a Broken Build

If the build happens to break, we [Stop The Line](https://en.wikipedia.org/wiki/Andon_(manufacturing)) and fix the build immediately.

During the time the build is broken, no new code is added. Adding new code will only aggravate the situation by adding more problems. Fixing the broken build will become harder and harder. Resulting in a situation where the build stays broken all the time. From then on we have lost:

- the health monitoring for our application which will inevitably impact the quality of our IT systems,
- the ability to perform on-demand production releases at any given moment in time which will reduce throughput and increase our time to market.

## When Broken Revert

A precondition of being in a state of Continuous Integration is to fix a broken build within 10 mins.

The easiest and fastest way to fix a build within 10 mins is to revert the commit that caused the broken build. Allowing us to go back to the last known good state of our application codebase.

> If you do revert a broken deployment, why would you not revert a broken build?
>
> -- [Steve Smiths](https://twitter.com/stevesmith_tech) during a phone call

## Acknowledgments



## Bibliography

- [Software Configuration Management Patterns](https://www.goodreads.com/book/show/367720.Software_Configuration_Management_Patterns), Steve Berczuk with Brad Appleton
- [Continuous Integration](https://www.goodreads.com/book/show/1311542.Continuous_Integration), Paul Duval
- [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day), James Shore
- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery), Dave Farley and Jez Humble

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. Team working for Continuous Integration
2. Coding for Continuous Integration
3. Building for Continuous Integration
