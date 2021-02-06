---
layout: post
title: The Practices That Make Continuous Integration
author: Thierry de Pauw
meta: 23 min read
categories:
tags: [ Continuous Integration ]
---

As already said, [Continuous Integration is not a tooling problem]({% post_url
2020-03-23-continuous-integration-is-not-a-tooling-problem %}),
it is really a practice. Or better a team's state. To achieve a state of
Continuous Integration, a team needs to adopt a series of
practices. In this article, I would like to highlight these practices.

To be honest, it feels a bit awkward to still write about Continuous
Integration. It has been over 20 years the practice has been introduced by the
XP community. But, if I look around me, I realise team's and organisations still
have a hard time to adopt Continuous Integration.

<br/>
The purpose of Continuous Integration is to have always working on mainline
allowing the team to perform on-demand production releases from mainline at any
given moment in time.

This is one of the most critical practices to adopt to enable the fast flow of
work through the value stream and getting close to the single piece flow similar
to the manufacturing industry.

> Continuous Integration is a practice to ensure always working software and to
> get feedback within a few minutes to whether any given change broke the
> application.
>
> -- Jez Humble

We say a team is in a state of Continuous Integration when:

- everyone in the team or every pair of the team commits at least once a day to
  mainline, leading to multiple integrations per day for the whole team,
- every commit to mainline triggers triggers an automated build and execution
  of all automated tests
- and whenever the build fails, the team is able to fix it within 10 mins.

To reach that state of Continuous Integration, a team has to adopt a set of
practices.

| Practices                            |                                       |
|--------------------------------------|---------------------------------------|
| Version Control Everything           | Have a Vast Amount of Automated Tests |
| Automate Your Build                  | Have a Fast Build                     |
| Make All Changes In Small Increments | Agree To Never Break The Build       |
| Run a Local Build                    | Don't Commit on a Broken Build        |
| Commit Frequently                    | When Broken, Revert                   |
| Only Commit On Green                 | Adopt Expand-Contract                 |
| Decouple Your Codebase               | Hide Unfinished Functionality         |

**Note:** Throughout this article when I say *commit* it really means
in the case of distributed version control systems *commit-and-push*.

## Version Control Everything

You would think this is obvious in 2021. It seems the inverse is still true
(rolling eyes).

> Historically I meet 1 team a year on average who aren't using version/source code control. Common reasons:
>
> - very immature team
> - SQL
> - PickOS derivative or ERM/CRM system
>
> Last category may even lack tooling
>
> -- Allan Kelly, [Nov 8, 2020](https://twitter.com/allankellynet/status/1325491840146149377)

Continuous Integration is a team sport. In order to work as
a team, you need something to coordinate production code, tests,
configuration, database schemas, infrastructure and many other things.

> Continuous Integration is a software development practise where members of a team integrate their work frequently, usually, each person integrates at least daily -- **leading to multiple integrations per day [for the team]**.
>
> -- Martin Fowler, [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html)

> Trunk Based Development is what individuals practice to **achieve
> Continuous Integration as a team**.
>
> -- Steve Smith

Without version control, you don't have a single source of truth. Releasing a
piece of software becomes a marathon of chasing pieces of code on developer's
machines, network drives and removable media.

Without version control, you may need a team of integrators to integrate the
code before releasing. Which will lead to far less integrations and thus impact
quality, throughput and time to market.

Without version control, it becomes damned hard to roll back a deployment that
went awry. Because, again, you don't have a single source of truth of what was
the previous known good state.

If you don't version every single artifact you need to create your
application you won't enjoy any of the benefits of Continuous Integration. All
of the practices that make Continuous Integration and that are a pre-requisite
to Continuous Delivery rely on having everything under Version Control. All of
these practices help to reduce delivery lead time and increase quality.

Now remember, Version Control is not only about versioning source code. It is
first and for most a communication tool to communicate changes amongst all team
members. This will help in building collective ownership and a shared
understanding of the codebase. Which in turn will allow for more integrations
and again lead to even better quality and higher throughput.

This is the first of only two tools you really need to achieve
Continuous Integration.

## Automate Your Build

Every new member to the team should be able to check out the code out of
Version Control and build the application and run all automated tests from the
command-line using a single build script.

The centralised build server should use that exact same build script.

The build script is treated the same way as your production code. It is
versioned, tested and constantly refactored. The same design principles apply to
the build script to keep it simple and easy to understand.

The build script will make sure you have a deterministic, repeatable, consistent
and reliable builds that you can execute over and over again without side
effects.

This build script needs to produce a single unambiguous result: SUCCESS or
FAILURE.

Finally, the build script is a prerequisite for Local Builds which is a required
practice to prevent broken builds and keep the software always working. In the
end it will increase productivity and team morale.

This is the second and last tool you need to achieve Continuous Integration.

## Make All Changes In Small Increments

Incremental software development.

Break large changes into a series of small incremental changes that keep tests
passing and do not break existing functionality.

In [Growing Object-Oriented Software Guided by Tests](https://www.goodreads.com/book/show/4268826-growing-object-oriented-software-guided-by-tests)
[Steve Freeman](https://twitter.com/sf105) and
[Nat Pryce](https://twitter.com/natpryce) make this analogy with surgery:

> Surgeons prefer keyhole surgery over opening a patient's body because it is
> less invasive and cheaper.
>
> -- [Steve Freeman](https://twitter.com/sf105) and
> [Nat Pryce](https://twitter.com/natpryce),
> Growing Object-Oriented Software Guided by Tests

For the same reasons we prefer to work in small, incremental steps because it
is less invasive. We are not ripping apart the application. Therefore it is
cheaper because we keep the application always working. At any given moment in
time we can perform an on-demand production release of the application. It is
cheaper because we don't create inventory and we don't create opportunity
costs.

I have to say, this is hard work. But you are continuously solving the hard
problem of keeping the application working as you go, instead of having to solve
this at the end when release time comes. It also means you can stop at any time, preventing the sunk cost involved in getting halfway through a big change and then having to abandon it.

This practice does not only apply to production code. It is applicable to all
code that make your software product: test code, database schema evolutions,
configuration and even infrastructure code.

*Make All Changes in Small Increments* together with *Agree to never break the Build* are **the most important and most valuable practices** to adopt. But,from my humble experience in helping teams to improve their software engineering skills, it seems this practice is the hardest to adopt.

## Run a Local Build

To be able to perform on-demand production releases at any given moment in time,
the team needs to prevent broken builds. To prevent a broken build everyone in
the team absolutely needs to run a local private build before committing and
pushing to the remote mainline in version control.

Before committing, every team member refreshes its local workspace by obtaining
the latest changes from the remote mainline in version control. Then they
initiate a local build. Only when this is successful, the team member is ready
to commit and push its local changes to the remote mainline.

The *Local Build* integrates the local work with the work all other
team members made available in the remote mainline. As such, it will detect any
conflicts between local changes and remote changes. Not doing so, will defer
this conflict detection to the Deployment Pipeline's Commit Stage and thus
introducing a broken build that inevitably will hamper the team, impact
the throughput of IT-delivery and time to market.

This *Local Build* is exactly the same as the Commit Stage of your
[Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/),
i.e. it should include the following actions:

- Compiling the code (if your programming language requires compilation),
- Running a set of commit tests, usually all your unit tests plus some
  integration tests you deem important to receive early feedback on,
- Perform static code analysis,
- Create the binary artifacts.

Finally, upon commit and push, the Commit Stage of the Deployment Pipeline will
get triggered where the code will again get compiled and commit tests get rerun.

The team member that triggers the Commit Stage, should monitor the builds
progress and not start any new task until the commit tests pass successfully.

Running *Local Builds* and monitoring the central build before moving on, are a
strong argument for *Fast Builds* in order to optimise team member's time.

## Commit Frequently

The central principle of Continuous Integration is *integrating early and
often*. This requires **frequent commits to mainline**.

When not committing frequently, integrating code will become time consuming,
very non-deterministic and vary wildly in duration. It will prevent the
communication of changes amongst team members and resulting in blocking team members to use the latest changes. Which will inevitably have an impact on
delivery throughput and quality.

As a corollary, to commit frequently you need to work in Small Increments, have
a Fast Build, a Decoupled Codebase and the ability to Hide Unfinished
Functionality.

It also works in the other direction.

Because you commit more frequently, changes will be smaller, and so you will
work in smaller increments. Merge conflicts and broken builds will also be less
likely.

If a broken build happens, reverting a small change is easier than reverting a
big chunk of changes. And will take less time, preventing the build to be broken
for a long time.

Because you commit more frequently, you will feel a gentle pressure to speed
your build, keep the codebase decoupled and look for ways to hide unfinished
functionality which in turn will again allow you to work in smaller increments.

## Only Commit on Green

To keep your application always working at any time, you may only commit on
green, i.e. your *Private Build* is successful and all executed tests executed
are green.

This is where [Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development)
(TDD) supports Continuous Integration. You start by writing a failing test. Then
you implement as little production code as required to get the test passing to
green. You then commit and push to the remote mainline.

Then you refactor the production code. If the test is red, you revert. If the
test is green, you commit and push again to the remote mainline.

TDD creates this commit cadence allowing you to achieve a state of Continuous
Integration.

## Decouple Your Code Base

In order to work in small increments, you need a decoupled codebase.

When a codebase is too coupled, it is very difficult to adopt incremental software engineering skills. Any change will ripple through the whole codebase, ripping
apart the application, making sure the application is not working all the time.
Again you incur a sunk cost because you can't release what you have already
implemented for a long period of time.

Adopting [Ports and Adapters](https://alistair.cockburn.us/hexagonal-architecture/)
(also commonly known as Hexagonal Architecture),
[Simple Design](https://wiki.c2.com/?SimpleDesign) together with some of the [SOLID-principles](https://en.wikipedia.org/wiki/SOLID)
will get you a decoupled codebase and
[simple code that fits in your head](https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong).
Regarding SOLID, in my humble opinion, if you only adopt
[Single Responsibility Principle](https://en.wikipedia.org/wiki/Single-responsibility_principle)
and [Dependency Injection Principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle)
you will already get a long way.

From my humble experience, having small classes, small methods, single-responsibility
and dependency injection (I mean using the `new` keyword, not a Dependency
Injection-framework) will bring you a long way.

Adopting these architecture and software design principles will not only have
a positive effect on quality which in turn optimises software engineering time
to introduce new changes. It will also drive down inventory and operational
expense while simultaneously increase throughput of IT-delivery and reduce your
time to market.

## Have A Vast Amount of Automated Tests

- Why tests? see CI-book Continuous Testing

If you don't have an automated test suite, the only information you get from
running the build is that the code compiles and a binary was created.

To gain confidence you are not breaking existing functionality while
committing very frequently to mainline, you need lots of automated tests.

There are 3 types of tests I am interested in: unit tests, integration tests
and automated acceptance tests. Unit tests should be the largest part of your
automated test suite. If you go the extra step to Continuous Delivery,
you also want to have smoke tests. But this requires a dedicated article.

<!-- TODO needs rework or be removed -->
... Preferably these automated tests are unit tests because unit tests are just
faster to execute. I'll go deeper into this when covering the *Fast Builds*
practice.

Without a vast amount of automated tests, *Only Commit on Green* looses all of
its benefits. With only one test, committing on green becomes quite easy and
does not give you any valuable feedback.

In addition, with too few automated tests, you will have to fall back on
time-consuming repetitive, boring manual regression testing. It is a waste of
time, energy and value of testers. The value of testers is better used in
designing acceptance criteria's for automated acceptance tests and exploratory
testing to find the unknowns that can in turn feed into more automated tests.

## Have a Fast Build

CD book p60

If everyone in the team wants to commit multiple times per day into mainline,
the build has to be very, very fast.

<!-- TODO move to Automate Your Build -->
**Note:** The *Build* consists at the minimum of compiling code (if the
programming language requires compilation) together with the execution of th
unit tests. It can include a small set of integration tests (max 10% of the
tests), static code analysis and the creation of a binary artifact.

When the build is slow, two things may happen:

- Either people tend to not execute the build before committing into mainline.

  From then on, they run the risk of introducing regressions and having a broken
  build for a long period of time. And thus preventing them to perform on-demand
  production releases which impacts their delivery throughput and time to market.

- Or people tend to execute the build less often.

  From then on, batch work is introduced. When you build less often you will
  commit less frequently into mainline as you are supposed to only commit after
  running a successful local build and having all tests green.
  
  This batch work will introduce bigger change sets. Bigger
  change sets introduce higher risks for having broken builds during a long
  period of time. Again they are unable to perform on-demand production
  releases, which impacts throughput and time to market.

  Batch work will also delay feedback. And delaying feedback, drives quality
  down. Bad quality will impact the use of software engineering time to introduce
  new changes. Again this impact throughput and time to market.

But, what is a fast build?

Twenty years ago Extreme Programming suggested the build should take no longer
than 10 minutes.

Dave Farley says in
[Optimising Continuous Delivery](https://www.youtube.com/watch?v=gDgAVqkFYWs)
the commit build should be kept under 5min.

To conclude, 10 minutes is the limit, everything under 5 minutes is better,
ninety seconds is nirvana. Take into account that every integration takes two
builds: one local and one central commit stage build. You should wait
for the central commit stage build to be successful before moving on because
you can never let the build break.

## Agree To Never Break The Build

Get everyone of the team to agree to the following:

> **From now on, our code in revision control will always build successfully and
> pass its tests.**
>
> -- James Shore, [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day)

This is, without any doubt, absolutely key to the success of achieving
Continuous Integration in the team. It will ensure you will have always
working software. The code you will get out of version control will just work
at any given moment in time.

This requires everyone in the team to first fetch the latest changes from the
remote mainline and *Run a Local Build* before committing into mainline.

This is non-negotiable. There is no single acceptable reason that would allow
breaking this agreement. Even if production is burning. Obviously, this requires
to *Have Automated Tests* and *Have a Fast Build*.

If you don't get everyone in the team to agree to this, Continuous Integration
will simply not work for your team. That's a fact!

## Don't Commit on a Broken Build

If the build happens to break, we
[Stop The Line](https://en.wikipedia.org/wiki/Andon_(manufacturing)) and fix
the build immediately.

During the time the build is broken, no new code as added. Adding new code will
aggravate the situation by adding more problems. Fixing the broken build will
become harder and harder resulting in a situation where the build stays broken
all the time. From then on you've lost:

- the health monitoring for your application,
- the ability to perform on-demand production releases any given moment in time
  which will impact your throughput and time to market.

**Note:** The fastest way to fix a broken build, is to revert the commit that
caused the broken build and go back to the last known good state.

## When Broken, Revert

A precondition to be in a state of Continuous Integration is
to fix a broken build within 10 mins. The easiest way to achieve this is to
revert the commit that caused the broken build. This will allow you to go back
to the last known good state of your application code base.

> If you do revert a broken deployment, why would you not revert a broken build.
>
> -- [Steve Smiths](https://twitter.com/stevesmith_tech) on a phone call

## Adopt Expand-Contract

Although, a strong enabler of Continuous Integration, giving you a lot of
flexibility, it is a little known pattern amongst IT engineers (be it software, database or infrastructure engineers).

If you have to perform a large scale refactoring that could rip apart your
application during a long period of time preventing you to perform on-demand
production releases.

For instance, let's say you want to change the signature of a
method that is used at 42 places in your code base. Changing the signature
together with all consumers all at once, will take quite some time during which
your application is ripped apart. It does not work. It cannot be released into production at any given moment in time.

To avoid breaking the build, many teams tend to use the classic *Branch by
Version Control*, i.e. create a branch in version control. One problem with this
approach is that this change is hidden for the rest of the team during the whole
refactoring. It only gets visible at the time the branch gets merged back into
mainline. During that time, all team members may have continued to add
additional consumers of the old method signature. At merge time this may create
the necessary merge conflicts and rework.

Instead of using Branch by Version Control, use [*Expand-Contract*](https://martinfowler.com/bliki/ParallelChange.html).

How does *Expand-Contract* work?

Instead of changing the method signature and breaking the code base, you
duplicate the method and apply the signature change on that second version of
the method.

Now you have two methods. The old one with the old signature called at 42 places
in the code base and the new one with the new signature not used at all. At this
point, you mark the old method as deprecated and you commit. This is the Expand
phase. We have expanded the code base by adding a new method with the new
method signature.

The rest of the team is now aware they should not use the old method
any more, but use that new method with the new signature. Note at this time
the software can be released into production.

Next we will gradually move consumers to use the new method signature. On each
consumer move, you can commit. Note again, during this whole phase, the software
still works and can be released into production.

Once all consumers use the new method signature and the old signature is not
used at all any more we are going to Contract the code base, i.e. we remove the
old signature. We can do this without breaking the code base because there are
no consumers any more.

Expand-Contract is heavily used in evolutionary database changes like renaming
columns, renaming tables, splitting columns into two columns, ...

API evolutions can be done in the same way.

Blue-Green Deployments are also a form of *Expand-Contract*. You expand by
adding a new version in production (blue) next to the old version (green), you
keep blue and green running until blue is deemed good. You contract by removing
green.

Lot's of infrastructure changes can be done in the same way.

Jez Humble has written how [GoCD went from using Velocity and JsTemplate
as UI to Ruby on Rails on the JVM incrementally](https://continuousdelivery.com/2011/05/make-large-scale-changes-incrementally-with-branch-by-abstraction/).

A special version of Expand-Contract is [*Branch by Abstraction*](https://www.branchbyabstraction.com/)
introduced by [Paul Hammant](https://twitter.com/paul_hammant) in [his original
article on the technique](https://paulhammant.com/blog/branch_by_abstraction.html).

The difference with *Expand-Contract* is that you introduce an abstraction
layer to chomp away the time consuming refactoring.

You would use this technique for instance to replace an algorithm by a more
performant algorithm. Or replace a library that is used everywhere in the code
base by a different library. For instance, you want to replace your Object
Relational Mapping (ORM) library by another one or, let's be crazy, by plain old
SQL.

How does *Branch by Abstractio* work?

We begin with a situation where various parts of the software are calling some
supplier code (the algorithm or the library we want to replace).

First we start by introducing an abstraction layer in front of the supplier code we want to replace. In most programming languages that would be an interface or an
abstract class.

Next we gradually move all client code to use that new abstraction layer.

In the meantime we can start a new implementation for that abstraction layer
that use the new supplier code (the new more performant algorithm or the new
library).

Lastly we can now gradually swap out the old supplier code until all client code
now uses the new supplier code.

To summarise, *Expand-Contract* and *Branch by Abstraction* allow you to perform
refactorings that take weeks or months while keeping the application always
working, allowing you to perform on-demand production releases at any given
moment in time and still being able to add new functionality while the
refactoring is on-going.

## Hide Unfinished Functionality

- What if it takes too long to implement a feature?

Often features takes a long time to implement. Most of the time it does
not make sense to release that feature incrementally. Therefore, many teams use
*Branch by Version Control* to hide the unfinished functionality. The downside
of this approach is the feature never gets integrated with the rest of the
code during implementation. Only when the feature is finished and the branch
gets merged back into mainline will the feature be integrated with the rest of
the code. So, during the time the feature is being implemented we are blind on
whether the feature causes any integration problems or not.

Instead of using *Branch by Version Control* we could just hide the feature as
long as it is not yet finished. This is the easiest practice to adopt.

It is perfectly acceptable to have unfinished functionality sitting in
production. It may even be behind a publicly accessible URL as long as it is not
discoverable by the users. Most of the time you don't need fancy feature
toggling for this.

For instance, if you are developing a new screen for your User Interface. As
long as that screen is not finished, don't add a menu entry to the navigation
menu. Only add this at the end when the screen is completely done.

The same is true for the backend. If you are adding new backend services, don't
add consumers as long as the backend is not yet finished.

Of course, this is not always possible. Sometimes you have to modify a widget
inside an existing screen or change behaviour of an existing backend service.
This is when *Feature Toggles* are required. They give great flexibility.
Toggles are an enabler of Operability and Resilience. So they are very powerful.

But be careful! With great power comes great responsibility. Feature Toggles
when done badly can be extremely dangerous.

It is very easy to shoot oneself in the foot and introduce lots of technical
debt with toggles.

Toggles need to be managed. Like with Work in Progress, we don't like to have
too many active toggles. Whenever a toggle is not needed any more, we delete it,
immediately. Otherwise you run the risk of having a codebase with lots and lots
of toggles and no-one knowing wherefore they are used. And no-one daring to
remove them.

Toggles should not depend on each other. Avoid the situation where to turn on a
feature, you have to turn toggle X on, toggle Y off and toggle Z on again.
This creates a situation that is extremely difficult to reason about. It also
introduces testing headaches (or should I say hangovers). Therefore, one
feature, one toggle.

Toggles introduce branching logic. Branching logic needs to be tested.
Therefore, you have to run your automated tests against your application with
both the feature on and off. On the other hand, manual exploratory testing
should only happen against the next situation that will happen in production.
If the toggle will be on in production, exploratory testing should happen with
the toggle on.

Branching logic means introducing code complexity and maintenance burden. There
are many ways one can implement a toggle and not all of them are good. [Pete
Hodgson](https://twitter.com/ph1) suggests different maintainable
[implementation techniques](https://martinfowler.com/articles/feature-toggles.html#ImplementationTechniques).

## Bibliography

- [Software Configuration Management Patterns](https://www.goodreads.com/book/show/367720.Software_Configuration_Management_Patterns), Steve Berczuk with Brad Appleton
- The [Continuous Integration](https://www.goodreads.com/book/show/1311542.Continuous_Integration) book, Paul Duval
- [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day), James Shore
- [The Art of Agile Development](http://www.jamesshore.com/v2/books/aoad1), James Shore and Shane Warden
- [Growing Object-Oriented Software Guided by Tests](https://www.goodreads.com/book/show/4268826-growing-object-oriented-software-guided-by-tests), Steve Freeman and Nat Pryce
- The [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, Jez Humble and Dave Farley
- [Make Large Scale Changes Incrementally with Branch by Abstraction](https://continuousdelivery.com/2011/05/make-large-scale-changes-incrementally-with-branch-by-abstraction/), Jez Humble
- [Parallel Change](https://martinfowler.com/bliki/ParallelChange.html), Danilo Sato
- [Feature Branching is Evil]({% link _talks/feature-branching-considered-evil.md %}), Thierry de Pauw
- [Feature Toggles](https://martinfowler.com/articles/feature-toggles.html), Pete Hodgson
- [Branch by Abstraction](https://www.branchbyabstraction.com/), Paul Hammant
