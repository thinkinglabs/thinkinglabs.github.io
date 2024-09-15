---
layout: article
title: The Practices That Make Continuous Integration - Make the Build Self-Testing
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-make-the-build-self-testing.jpg
---

To accomplish [Agree as a Team to Never Break the Build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build) we have to [Run a Local Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) and [Commit Only on Green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green). To know we can *[Commit](#commit) on Green* after *Running the Local Build*, we must *Make the Build Self-Testing*. *Agree as a Team to Never Break the Build* is a cornerstone of Continuous Integration. As a consequence, *Making the Build Self-Testing* is a necessary condition to realise Continuous Integration.

---

![Make the Build Self-Testing](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-make-the-build-self-testing.jpg)

At a minimum a *Build* means compiling the code, eventually [linking](https://www.cprogramming.com/compilingandlinking.html) and producing a binary build artefact. That binary artefact is then promoted from stage to stage inside the Deployment Pipeline. If we only compile and build a binary artefact, that will not be enough. Functional regressions will slip through. If we want to [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-6-commit-frequently) to integrate more often, as is required by Continuous Integration, we cannot rely on manual regression testing any more on a rapidly changing code base. Manual regression testing will slow us down. Therefore, it is imperative to have a Self-Testing  Build.

What does it mean to Make a Build Self-Testing? That means we should augment the build with additional testing tasks on top of the compilation.

With statically typed languages, the compiler is already a simple test suite for free. It will catch the most common type of errors. In the case of dynamically typed languages, engineers will have to implement type-checking tests themselves. Again, this will not be enough.

Additionally, the build should be extended with [Linters](https://en.wikipedia.org/wiki/Lint_(software)) to satisfy code formatting and team coding standards, and check for syntax errors in the case of interpreted languages; [Static Code Analysis](https://en.wikipedia.org/wiki/Static_program_analysis) to detect common programming errors and code smells, and [Static Application Security Testing (SAST)](https://en.wikipedia.org/wiki/Static_application_security_testing) to catch common security problems.

Still, this will not prevent us from regressions. To gain confidence we are not breaking any existing functionality while committing with an abundant frequency into [*Mainline*](#mainline) we need to [Have a Vast Amount of High-Quality Automated Tests]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-have-a-vast-amount-of-high-quality-automated-tests) incorporated into our *Build*. This will prevent us from pushing regressions into production without relying on time-consuming, expensive manual regression testing. This is what allows us to deploy to production daily.

The goal of Continuous Integration is to guarantee always working software and to receive feedback within minutes on whether a change broke the application or not. On top of that, it enables on-demand production releases at any given moment in time.

Note, that I say those automated tests prevent regressions, not bugs. **Tests do not prove the absence of bugs**. In the end, those automated tests are only checks. They check the things we know about our IT systems. They do not tell us anything about the things we do not know. The **bugs lie in the unknowns**. We can try to find them with Exploratory Testing in a staging environment or better in production with features turned off for users. Even so, some bugs will again escape, because some user behaviour might still be overlooked or not envisioned at all. In the end, many of those unknowns, and thus many of those bugs will only be found once the system is live and used by real users. It will uncover surprising, unexpected facts about real users' system use. This is to say that despite all the testing, nasty things will happen in production, for sure. That is a fact. We are better prepared for this and have a process that allows us to fix things quickly in production.

Having said that the *Build* should include all of the above:

- typing checks whether by the compiler or unit tests
- linting
- static code analysis
- static application security testing
- unit test execution

When [Running the Local Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) before committing as an engineer, if any of these fail, it fails the local build and turns the build red. This means, because [Commit Only on Green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green), the engineer is not allowed to commit to the remote *Mainline* to meet [Agree as a Team to Never Break the Build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build).

Optionally, but required for regulated industries, we can complement the build with Acceptable License Checks and Vulnerability Checks on the code dependencies. The Acceptable License Check verifies whether the licenses of code dependencies are compatible with commercial use. But, we verify the license when introducing a new dependency. That is a good thing. But maintainers sometimes change licenses during version bumps. We want to be aware of that before deploying to production. The Vulnerability Checks inspects dependencies for known vulnerabilities recorded in a [CVE](https://www.cve.org/) database. But, we already have [GitHub dependabot](https://docs.github.com/en/code-security/getting-started/dependabot-quickstart-guide). That too is something good. However, the notification often comes too late. We want to receive the vulnerability alerts before deploying to production. This should be part of the checks on the path to production. There might be no fix available for that vulnerability at that time. At least, this being the case, we consciously decide about accepting the risk or delaying the release.

Ideally, all of that is executed during the *Local Build* and the [*Commit Build*](#commit-build) together with building a binary build artefact. It could be challenging to run all of that and yet match up with [Have a Fast Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build) that recommends that builds take no longer than five to ten minutes.

A first optimisation would be to keep the License and Vulnerability Checks out of the *Commit Build*. Here we have two options. Either run them in parallel with the *Commit Build* or run them in a subsequent stage after the *Commit Build*.

![Optimisation 1](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-make-the-build-self-testing-optimisation-1.jpg)

A second possible optimisation would be to limit the *Commit Build* to compilation and unit test execution to provide immediate initial feedback. Then have a subsequent *Build* stage that re-executes the unit tests to generate code coverage reports, runs the various static code analyses and builds the binary build artefact. In that case, the *Build* stage might include in addition the License and Vulnerability Checks.

![Optimisation 2](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-make-the-build-self-testing-optimisation-2.jpg)

Assuredly, *Make the Build Self-Testing* is essential to *Run a Local Build* so as to fulfil *Agree as a Team to Never Break the Build* and thus align with the goal of Continuous Integration to have always working software.

## Bibliography

- [Compiling and Linking](https://www.cprogramming.com/compilingandlinking.html)
- [The differences between static analysis and linting](https://www.imperfectdev.com/static-analysis-vs-linting/)
- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
- [Continuous Delivery: Huge Benefits, but Challenges Too](https://www.researchgate.net/publication/271635510_Continuous_Delivery_Huge_Benefits_but_Challenges_Too), Lianping Chen

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. [Team working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %})
2. [Coding for Continuous Integration]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %})
3. [Building for Continuous Integration]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %})
4. Make the Build Self-Testing

## Definitions

### Commit

In the context of Distributed Version Control Systems (DVCS), when I say commit I honestly mean *commit-and-push*.

### Mainline

The line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at a minimum compiling the sources, running a set of *Commit Tests*, and building a binary artefact for deployment.
