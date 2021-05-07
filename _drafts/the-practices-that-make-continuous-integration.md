---
layout: article
title: The Practices That Make Continuous Integration
author: Thierry de Pauw
meta: 25 min read
categories:
tags: [ Continuous Integration ]
---

<!-- replace don't, isn't, haven't by do not, is not, have not -->

[Continuous Integration is not a tooling problem]({% post_url
2020-03-23-continuous-integration-is-not-a-tooling-problem %}). It is a state a
team can achieve by adopting a series of practices. In this article, I would
like to go deeper into the practices that together make Continuous Integration.

--

To be honest, it feels a bit awkward to still write about Continuous
Integration. It has been over 20 years Continuous Integration was introduced by
[Kent Beck](https://twitter.com/KentBeck) in
[Extreme Programming Explained](https://www.goodreads.com/book/show/67833.Extreme_Programming_Explained). But, when I look around me, I
realise team's and organisations are still struggling with the adoption of
Continuous Integration.

<br/>

> Continuous Integration is a practice to ensure always working software and to
> get feedback within a few minutes to whether any given change broke the
> application.
>
> -- [Jez Humble](https://twitter.com/jezhumble)

The purpose of Continuous Integration is to have always working software on
mainline allowing the team to perform on-demand production releases from
mainline at any given moment in time.

This is one of the most critical practices to adopt to enable the fast flow of
work through the value stream and getting close to the single-piece flow similar
to the manufacturing industry.

We say a team is in a state of Continuous Integration when:

>- everyone in the team (or every pair) commits at least once a day to
>  mainline, leading to multiple integrations per day for the whole team,
>- every commit to mainline triggers an automated build and execution
>  of all automated tests
>- and whenever the build fails, the team is able to fix it within 10 mins.
>
>-- [Jez Humble](https://twitter.com/jezhumble)

To reach that state of Continuous Integration, a team has to adopt a set of
practices.

| Practices                            |                                       |
|--------------------------------------|---------------------------------------|
| [Version Control Everything](#version-control-everything)                     | [Have a Vast Amount of Automated Tests](#have-a-vast-amount-of-automated-tests)       |
| [Automate Your Build](#automate-your-build)                                   | [Have a Fast Build](#have-a-fast-build)                                               |
| [Make All Changes In Small Increments](#make-all-changes-in-small-increments) | [Agree As a Team To Never Break The Build](#agree-as-a-team-to-never-break-the-build) |
| [Run a Local Build](#run-a-local-build)                                       | [Don't Commit on a Broken Build](#dont-commit-on-a-broken-build)|
| [Commit Frequently](#commit-frequently)                                       | [When Broken Revert](#when-broken-revert)                      |
| [Commit Only on Green](#commit-only-on-green)                                 | [Adopt Expand-Contract](#adopt-expand-contract)                 |
| [Decouple Your Codebase](#decouple-your-code-base)                            | [Hide Unfinished Functionality](#hide-unfinished-functionality) |

## Definitions

- **Commit**: In the context of a distributed version control system, I mean
  *commit-and-push*.
- **Mainline**: The line of development in Version Control which is the
  reference from which the builds of the system are created that feed into a
  deployment pipeline. For CVS and SubVersion this is *trunk*. For Git this is
  the remote *main* branch. For Mercurial this is the remote *default* branch.
- **Commit Build**: The build performed during the first stage of the
  [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline)
  or the central build server. It involves checking out the latest sources
  from mainline and at a minimum compiling the sources, running a set of commit
  tests, and building a binary artefact for deployment.
- **Commit Tests**: All of the Unit Tests together with a small simple smoke
  test suite. This smoke test suite includes a few simple Integration and
  Acceptance Tests deemed important enough to get early feedback on.

## Version Control Everything

You would think by 2021 this would be obvious. It seems the inverse is still
true (rolling eyes).

> Historically I meet 1 team a year on average who aren't using version/source
> code control. Common reasons:
>
> - very immature team
> - SQL
> - PickOS derivative or ERM/CRM system
>
> Last category may even lack tooling
>
> -- Allan Kelly, [Nov 8, 2020](https://twitter.com/allankellynet/status/1325491840146149377)

Continuous Integration is a state you achieve as a team, not as an individual.
Therefore, in order to work as a team, you need something to coordinate
production code, test code, configurations, database schemas evolutions,
infrastructure and many other things.

Without version control, we don't have a single source of truth. Releasing a
piece of software becomes a marathon of chasing pieces of code on engineer's
machines or network drives.

Without version control, you may need a team of integrators to integrate the
code before releasing. This will lead to far less integrations which will impact
quality, throughput of the IT-delivery process and time to market.

Without version control, it becomes damned hard to roll back a deployment that
went awry. Because, you don't have that single source of truth allowing us to
know  what was the previous known good state.

If you don't version every single artefact required to create the software
application you won't enjoy any of the benefits of Continuous Integration. All
of the practices that make Continuous Integration and that are a pre-requisite
to Continuous Delivery rely on having everything under Version Control. All of
these practices help to reduce the IT-delivery lead time and increase quality.

A Version Control System is not only about versioning source code. It is
first and for most a communication tool to communicate changes amongst all team
members. This will help in having a [Shared Understanding](https://en.wikipedia.org/wiki/Extreme_programming_practices#Shared_understanding)
and building a [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html)
of the codebase. In turn this will allow for more integrations which inevitably
leads to better quality and a higher throughput of the IT-delivery process.

This is the first of only two tools you really need to achieve
Continuous Integration.

## Automate Your Build

It should be possible for every new team member to check out the code from
Version Control, build the application and run all automated tests using a
single command, the build script, from the command-line.

The commit build on the centralised build server will use the exact same build
script.

The build script is treated the same way as the production code. It is
versioned, tested and constantly refactored. The same design principles () apply
to the build script to keep it simple and easy to understand.

The build script ensures a deterministic, repeatable, consistent and reliable
build that can be executed over and over again without any side effects.

This build script needs to produce a single unambiguous result: it is either
SUCCESS or FAILURE.

Finally, the build script is a prerequisite to *Run a Local Build*, a required
practice to prevent broken builds and keeping the software always working. In
the end increases productivity and thus throughput of the IT-delivery process
and time to market. It also increases team morale and drives down burnout.

This is the second and last tool you actually need to achieve Continuous
Integration.

## Make All Changes In Small Increments

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
cheaper because we keep the application always working.  We can perform an
on-demand production releases of the application at any given moment in time.
Because the application is always releasable, we do not create Inventory and we
drive down the cost of delay. Which in turn makes it again cheaper.

This is hard work. We are continuously solving the hard problem of
keeping the application working as we go, instead of having to solve
this at the end when it is time to release. But it pays off. We can stop at any
time, preventing the sunk cost involved in getting halfway through a big change
and then having to abandon it.

This practice applies to all code required for releasing a software system. It
applies to production code, as well as to test code, database schema evolutions,
configuration and even infrastructure code.

*Make All Changes in Small Increments* together with *Agree As a Team To Never
Break the Build* are **the most important and most valuable practices** to
adopt. But, from my humble experience, it seems to also be the hardest practice
to adopt.

## Run a Local Build

To perform on-demand production releases at any given moment in time, it
requires to have an always working software application. This
means the team needs to prevent broken builds. Meaning everyone
in the team has to run a local private build before committing into mainline.

Running a *Local Build* means:

- refreshing the local workspace by obtaining the latest changes from mainline,
- executing the build script,
- when the build script says SUCCESS, we are ready to commit into mainline.

The *Local Build* is exactly the same as the *Commit Build* performed by the
[Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline)
or the central build server.

The *Local Build* integrates the local work with the work all other
team members made available on mainline. It will detect any
conflicts between local changes and remote changes. Not doing so, will defer
this conflict detection to the *Commit Build*. As a result, this will
introduce a broken build. Inevitably, this will hamper the team, impacting
the throughput of IT-delivery and time to market.

Upon commit the *Commit Build* gets triggered where the code will again get
compiled and commit tests get rerun.

The team member that triggers the *Commit Build*, should monitor the build's
progress and not start any new task until the commit tests pass successfully.

*Run a Local Build* and monitor the *Commit Build* before moving on, are a
strong argument for *Have a Fast Build* to optimise engineering time.

## Commit Frequently

The central principle of Continuous Integration is *integrating early and
often on mainline*. This requires **frequent commits into mainline**.

When not committing frequently, integrating code will become time-consuming,
will be very non-deterministic and will vary wildly in duration. Obviously, this
will impact the IT-delivery throughput and time to market negatively.

When not committing frequently, it also prevents the communication of changes
inside the team, resulting in blocking team members to use the latest changes.
Again, this will inevitably have an impact on quality and IT-delivery
throughput.

As a corollary, to commit frequently you absolutely need to *Make All Changes in
Small Increments*, *Have a Fast Build*, *Have a Decoupled Codebase* and
*Hide Unfinished Functionality*. If you don't adopt all of these practices,
committing frequently will be damned hard if not impossible.

Because we commit more frequently, changes will now be smaller. We will
work in smaller increments. Merge conflicts and broken builds will become less
likely.

If a broken build happens, reverting a small change is also easier than
reverting a big chunk of changes. The revert will also take less time,
reducing the timespan of a broken build.

Because we commit more frequently, we will feel a gentle pressure to speed up
the build, keep the codebase decoupled and look for ways to hide unfinished
functionality which in turn will again allow us to work in smaller increments.
Leading to a virtuous circle of improvements.

## Commit Only on Green

To keep your application always working at any given time, we may only commit on
green. This means, we only commit when the *Local Build* says SUCCESS which
also means all tests are green.

---
Comment:

When committing on Red ...

With TDD we get Commit Only on Green for free. This is where TDD supports CI.

---

This is where [Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development)
(TDD) supports Continuous Integration. We start by writing a failing test. Then
we implement as little production code as required to get the test passing to
green. When the tests are green, we commit into mainline. Then we refactor. If
the test is red, we revert. If the test is green, we commit again into mainline.

TDD creates the commit cadence required to achieve a state of Continuous
Integration.

## Decouple Your codebase

To work in small increments, you absolutely need a decoupled codebase.

When a codebase is too coupled, it is very difficult to adopt incremental
software engineering skills. Any change will ripple through the whole codebase,
ripping apart the application, preventing the application from working all the
time. Again you incur a sunk cost because you can't release what you have
already implemented during a long period of time.

That is why it is so important to adopt [Ports and Adapters](https://alistair.cockburn.us/hexagonal-architecture/)
(aka Hexagonal Architecture),
[Simple Design](https://wiki.c2.com/?SimpleDesign) together with some of the
[SOLID-principles](https://en.wikipedia.org/wiki/SOLID). These design principles
will help you in getting a decoupled codebase. In turn this leads to a more
maintainable codebase and [simple code that fits in your head](https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong).

From my humble experience, having small classes, small methods, and
applying the [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single-responsibility_principle)
and [Dependency Injection Principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle)
(i.e. using the `new` keyword, and not a Dependency Injection-framework) will
already bring you a long way forward.

It is generally accepted that adopting these software design principles will
have a positive effect on quality. Interestingly, it also optimises the 
required engineering time to introduce new changes, reducing the amount of time
and effort spend. Which in turn reduces Operational Expense.

As a result it drives down the lead time for changes, reducing the time to
market and increasing the throughput of the IT-delivery process.

Because less time is spend on changes, we have a smaller Inventory of unfinished functionality. Together with the reduced Operational Expense it reduces the
money spend on changes.

*Having a Decoupled codebase* not only improves quality, it also improves
all three [Theory of Constraints](https://en.wikipedia.org/wiki/Theory_of_constraints)
metrics: we increase Throughput, while simultaneously we reduce Inventory and
we reduce Operational Expense. More money is generated for the organisation.

## Have A Vast Amount of Automated Tests

If we don't have an automated test suite, the only information we get from
running the build is whether the code compiles and whether a binary artefact for
deployment was created. We do not receive any feedback on whether a change
broke the application or not.

In that case, the only way of knowing if the application still works is by
relying on time-consuming, repetitive, boring manual regression testing. This is
a waste of time, energy and the value of test engineers.

Because of we now depend on time-consuming manual testing, we cannot *Commit
Frequently* any more into mainline. As a consequence, we are starting to batch up
work. From lean manufacturing, we know that big batches drive down throughput
and time to market.

To gain confidence we are not breaking any existing functionality while
committing very frequently into mainline, we thus need a vast amount of
automated tests. Test engineers will be of great value here. They can help
design the acceptance criteria for the automated tests.

In implementing automated tests, we should consider 3 types of tests:

- *Unit Tests*: These should be the largest part of the automated test suite. We
  are speaking 100s or 1000s of them. They should run in less than 30s.
- *Integration Tests*: They should test the *Adapters* (from *Ports and
  Adapters*). These may hit the database, file systems and other systems. They
  will take longer to run, so we want to limit these.
- *Automated Acceptance Tests*: They test the application in isolation with a
  database and a front-end as if it was a user using the application. We should
  have 100s of them. Their total execution time is less than 10min.

Going the extra mile towards Continuous Delivery, we would also have
*Smoke Tests*. These are a very limited set (1-5) of end-to-end tests that
execute your most important transactions to check everything works as expected
right after the deployment of a new release. They take less than 5min.

During the *Local Build* and *Commit Build* only Unit Tests are executed
together with a small simple smoke test suite. This smoke test suite performs
a few simple Integration and Acceptance Tests to make sure the most commonly
used features are not broken. To commit frequently into mainline, we need to
run these tests repeatedly. Therefore, they should be very fast. The rest of the
Integration Tests and the Automated Acceptance Tests will run in later
build stages of the Deployment Pipeline or the central build server.

## Have a Fast Build

If everyone in the team wants to commit multiple times per day into mainline,
the *Local Build* has to be very fast. Because to prevent breaking the build,
we need to execute this local build before committing into mainline.

When the build is slow, two things may happen:

- Either people tend to not execute the Local Build before committing into
  mainline.

  From then on, they run the risk of introducing regressions and having a broken
  build for an extended period of time. Preventing on-demand production releases
  which will impact their delivery throughput and time to
  market.

- Or people tend to execute the build less often.

  From then on, batch work is introduced. When you build less often, you will
  commit less frequently into mainline as you are supposed to only commit after
  running a successful local build and having all tests green.
  
  This batch work initiates larger changesets. Larger changesets introduce
  higher risks. Your build will have to process a large changeset. If the build
  happens to break, finding the root cause will take a far longer time. So they
  run the risk of having a broken build for long period of time. From then on,
  they have lost the monitoring of the health of their application impacting the
  quality of the software. From then on, they have again also lost the ability
  to perform on-demand production releases, which again impacts throughput and
  time to market.

  Batch work also delays feedback. Delaying feedback drives quality down. Bad
  quality will impact the use of software engineering time to introduce
  new changes. Again this impacts throughput and time to market.

But what is a fast build?

Twenty years ago Extreme Programming suggested the build should take no longer
than 10 minutes.

Dave Farley advises in
[Optimising Continuous Delivery](https://www.youtube.com/watch?v=gDgAVqkFYWs)
we keep the *Commit Build* under 5min.

To conclude, 10 minutes is the limit, everything under 5 minutes is better,
90 seconds is nirvana.

Take into account that every integration takes two builds: one local and
one central commit stage build. We should wait for the central *Commit Build* to
be successful before moving on because you can never let the build break. One
more reason to keep the build short.

*Have a Fast Build* seem to contradict with *Have a Vast Amount of Automated
Tests*. The first thing to consider is to make tests run faster. Second, at some
point we will need to split the tests in several stages. We first run the
fastest tests during the *Commit Build*. Longer running tests are ran later.

## Agree As a Team To Never Break The Build

Get everyone of the team to agree to the following:

> **From now on, our code in revision control will always build successfully and
> pass its tests.**
>
> -- James Shore, [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day)

I'm putting this in bold because, without any doubt, this is absolutely key to
the success of achieving Continuous Integration as a team. It will ensure we
will have always working software. The code we get out of version control
will just work at any given moment in time.

It requires everyone in the team to first fetch the latest changes from the
remote mainline and *Run a Local Build* before committing into mainline.

This practice is non-negotiable. There is no single acceptable reason that would
allow breaking this agreement. Even if production is burning. Again it
requires to *Have a Vast of Automated Tests* and *Have a Fast Build*.

If you don't get everyone in the team to agree to this, Continuous Integration
will simply not work for your team. That's a fact!

## Don't Commit on a Broken Build

If the build happens to break, we
[Stop The Line](https://en.wikipedia.org/wiki/Andon_(manufacturing)) and fix
the build immediately.

During the time the build is broken, no new code is added. Adding new code will
aggravate the situation by adding more problems. Fixing the broken build will
become harder and harder. Resulting in a situation where the build stays broken
all the time. Again, from then on we have lost:

- the health monitoring for your application which impacts quality,
- the ability to perform on-demand production releases any given moment in time
  which impacts throughput and time to market.

## When Broken Revert

A precondition of being in a state of Continuous Integration is
to fix a broken build within 10min.

The easiest and fastest way to fix a build within 10min is to revert the commit
that caused the broken build. Allowing you to go back to the last known good
state of your application codebase.

> If you do revert a broken deployment, why would you not revert a broken build?
>
> -- [Steve Smiths](https://twitter.com/stevesmith_tech) in a phone call

## Adopt Expand-Contract

*Expand-Contract* seems to be forgotten pattern in the IT industry. Although, it
is certainly a strong enabler of Continuous Integration.

If you have to perform a large scale refactoring that could rip apart your
application during a long period of time, preventing on-demand production
releases.

For instance, let's say we want to change the signature of a
method. The method is used at 42 places in your codebase. Changing that
signature together with all consumers in one go together can take long.
During that time our application is broken. It is ripped apart. It does not
work anymore. We cannot release the application into production any more at any
given moment in time.

To avoid breaking the build, many teams tend to use the classic approach of
*Branch by Version Control*, i.e. create a branch in version control. One
problem with this approach is it hides the change for the rest of the team. That
change only gets visible the minute the branch gets merged back into mainline
when the refactoring is finished. During that time, team members
may have continued to add additional consumers of the old method signature.
At merge time, this may create the necessary merge conflicts and rework.
Performing that refactoring then becomes a very time-consuming and a very
unpredictable activity. In addition, at merge time, it may also halt the
delivery of all ongoing new functionality. Because everyone in the team needs
to integrate that change that wasn't known before into all ongoing work.
All of this will again impact the lead time for the refactoring, throughput
and time to market negatively.

Instead of using Branch by Version Control, we should use
[*Expand-Contract*](https://martinfowler.com/bliki/ParallelChange.html).

*Expand-Contract* works as follows. Instead of changing the method signature
and breaking the codebase, we duplicate the method and apply that signature
change on the duplicated method.

Now we have two methods. The old one with the old signature called at 42 places
in the codebase and the new one with the new signature nowhere used in the
codebase. At this point, we mark the old method as deprecated and we commit.
This is called the Expand phase. We expanded the codebase with a new method
having the new method signature.

It is a good practice to also verbally communicate to the rest of the team a new
method exist and everyone should start using that new method. Now, the rest of
the team is aware they should use that new method. Moreover, than can actually
use that new method immediately. At this time, we can still release the software
into production.

Next, we will gradually move consumers to use the new method signature. On each
consumer move, we can commit and we can again release the software into
production.

Once all consumers call the new method signature and the old method with the old
signature is nowhere called any more, we can remove the old method. This is
called the Contract phase. We contracted the codebase by removing the old
method. Again, we did not break the codebase because there were no consumers
any more. Again, we can release into production at any given moment.

Evolutionary database changes use Expand-Contract excessively for renaming
columns, renaming tables, splitting columns into two columns, ...

When introducing a v2 API alongside a v1 with different URLs we also make use of
Expand-Contract.

Blue-Green Deployments is Expand-Contract for deployments. We expand by
adding a new version in production (blue) next to the old version (green). We
keep blue and green running until blue is deemed good. We contract by removing
green.

Many breaking infrastructure changes are done with zero downtime using
Expand-Contract.

In [Make large scale changes incrementally](https://continuousdelivery.com/2011/05/make-large-scale-changes-incrementally-with-branch-by-abstraction/)
Jez Humble reported how GoCD moved incrementally from using Velocity and
JsTemplate as UI technology to using Ruby on Rails on the JVM. Jez calls this
[*Branch by Abstraction*](https://www.branchbyabstraction.com/), a technique
introduced by [Paul Hammant](https://twitter.com/paul_hammant) in [his original
article on the technique](https://paulhammant.com/blog/branch_by_abstraction.html).
In my humble opinion what GoCD did was Expand-Contract.

I would say *Branch by Abstraction* is a special kind of *Expand-Contract*. The
difference lies in the use of an abstraction layer to cut away the
time-consuming refactoring.

We use this technique, for instance to replace an algorithm by a more
performant algorithm. Or to replace a library used everywhere in the
codebase by a different library. For instance, you want to replace your Object
Relational Mapping (ORM) library by another one or, let's be crazy, by plain old
SQL.

*Branch by Abstraction* works as follows. We begin with a situation where
various parts of the software are calling some supplier code (the algorithm or
the library we want to replace).

First, we start by introducing an abstraction layer in front of the supplier
code we want to replace. In most programming languages that would be an
interface or an abstract class.

Next, we gradually move all client code to use that new abstraction layer.

In the meantime, we start a new implementation for that abstraction layer
that use the new supplier code (the new more performant algorithm or the new
library).

Lastly, we now gradually swap out the old supplier code until all client code
uses the new supplier code.

To summarise, *Expand-Contract* and *Branch by Abstraction* allow us to perform
refactorings that take weeks or months to execute while keeping the application
always working. Allowing us to perform on-demand production releases at any given
moment in time and still being able to add new functionality while the
refactoring is on-going. We are never blocking the flow of work through the
value stream. We are never blocking the delivery of new functionality.

## Hide Unfinished Functionality

<!-- different kinds of toggles according to longevity and dynamism -->

What if a feature takes too long to implement?

Often features take a long time to implement. Most of the time it makes no sense
to release a feature incrementally. Therefore, many teams use
*Branch by Version Control* to hide the unfinished functionality. The downside
of this approach is we never integrate the feature with the rest of the
code during its implementation. The feature only gets integrated with the rest
of the codebase once we finish the feature and we merge the branch back into
mainline. During the time the feature is being implemented, we are blind on
whether the feature causes any integration problems or not.

Instead of using *Branch by Version Control* to keep unfinished functionality
out of a release, we should just hide the unfinished functionality from the
user.

*Hide Unfinished Functionality* is probably the most straightforward practice
to adopt. It is perfectly acceptable to have unfinished functionality sitting in
production. It may even be behind a publicly accessible URL as long as it is not
discoverable by the users. Most of the time we don't need fancy feature
toggling to hide unfinished functionality.

For instance, if you are developing a new screen for your User Interface. As
long as we haven't finished that screen, we don't add a menu entry to the
navigation menu. We only add this at the end, when the screen is completely
done.

The same is true for extending backends. If we are adding new backend services,
we don't add consumers as long as the backend is not yet finished.

Of course, this is not always possible. Sometimes we have to modify a widget
inside an existing screen. Or we have to change the behaviour of an existing
backend service. This is when *Feature Toggles* are required.

Feature Toggles give great flexibility. Toggles are an enabler for Operability
and Resilience. But ...

Be careful! With great power comes great responsibility. Feature Toggles
can be extremely dangerous when done badly. It is tremendously easy to shoot
oneself in the foot and introduce lots of technical debt with toggles.

We need to manage toggles. Like with Work in Progress, we don't like to have
too many active toggles. Whenever we do not need a toggle any more, we delete it,
immediately. Otherwise, we run the risk of having a codebase with lots and lots
of toggles and no-one knowing wherefore they are used. And no-one daring to
remove them.

Toggles should not depend on each other. Avoid the situation where to turn on a
feature we have to turn toggle X on, toggle Y off and toggle Z on again.
It is extremely difficult to reason about such a situation. It
introduces testing headaches (or should I say hangovers). Therefore, always one
feature, one toggle.

Toggles introduce branching logic. Branching logic needs to be tested.
Therefore, we have to run our automated tests against our application with
both the feature on and off. On the other hand, manual exploratory testing
should only happen against the next situation that will happen in production.
If the toggle will be on in production, exploratory testing should happen with
the toggle turned on.

Branching logic also means introducing code complexity. Code complexity means
maintenance burden. There are many ways we can implement a toggle. Not all of
them are good. [Pete Hodgson](https://twitter.com/ph1) suggests in his article
Feature Toggles different maintainable [implementation techniques](https://martinfowler.com/articles/feature-toggles.html#ImplementationTechniques).

## Conclusion

As you can see, Continuous Integration is really not a tooling problem. Many
practices are involved to achieve Continuous Integration as a team.

Each practice is valuable. Each practice is an enabler of Continuous
Integration. But no single practice exists on its own. They are all tangled.
Each practice amplifies the benefits of the others. Which makes it very hard
select which practice to adopt first, which practice to adopt next. This
depends on the unique context and circumstances of your team. Therefore, use the
[Improvement Kata](http://www-personal.umich.edu/~mrother/The_Improvement_Kata.html)
to kick-start a Continuous Integration program.

Because of all the benefits put forward on each and every practice,
Continuous Integration will improve quality and throughput of IT changes.

## Acknowledgment

Thanks to [Steve Smith](https://twitter.com/SteveSmithCD) for his feedback.

## Bibliography

- [Software Configuration Management Patterns](https://www.goodreads.com/book/show/367720.Software_Configuration_Management_Patterns), Steve Berczuk with Brad Appleton
- The [Continuous Integration](https://www.goodreads.com/book/show/1311542.Continuous_Integration) book, Paul Duval
- [Continuous Integration on a Dollar a Day](http://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day), James Shore
- [The Art of Agile Development](http://www.jamesshore.com/v2/books/aoad1), James Shore and Shane Warden
- [Growing Object-Oriented Software Guided by Tests](https://www.goodreads.com/book/show/4268826-growing-object-oriented-software-guided-by-tests), Steve Freeman and Nat Pryce
- The [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, Jez Humble and Dave Farley
- [Make Large Scale Changes Incrementally with Branch by Abstraction](https://continuousdelivery.com/2011/05/make-large-scale-changes-incrementally-with-branch-by-abstraction/), Jez Humble
- [Parallel Change](https://martinfowler.com/bliki/ParallelChange.html), Danilo Sato
- [Feature Branching is Evil]({% post_url 2016-10-29-feature-branching-considered-evil %}), Thierry de Pauw
- [Feature Toggles](https://martinfowler.com/articles/feature-toggles.html), Pete Hodgson
- [Branch by Abstraction](https://www.branchbyabstraction.com/), Paul Hammant
