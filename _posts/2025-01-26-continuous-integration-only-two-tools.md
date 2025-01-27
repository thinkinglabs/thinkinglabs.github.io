---
layout: article
title: Continuous Integration, Only Two Tools!
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/continuous-integration-only-two-tools/continuous-integration-only-two-tools.jpg
---

Despite what everyone believes, Continuous Integration requires only two tools. That is right. To achieve Continuous Integration, we only have to implement two tools. All the rest are practices. The predominant reason teams struggle to adopt true Continuous Integration. Tooling is easy. Practices require deliberate practice.

---

![Only Two Tools](/images/continuous-integration-only-two-tools/continuous-integration-only-two-tools.jpg)

Continuous Integration involves [six foundational practices]({% post_url 2024-11-01-continuous-integration-where-to-start %}) to start with. From these practices, only [*Version Control Everything*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-1-version-control-everything) and [*Automate the Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-11-automate-the-build) require tooling. So, it is true that to start with Continuous Integration, we need some tooling, but not as much as many believe.

Evidently, to *Version Control Everything* a **Version Control System** becomes indispensable. The *Version Control System* provides the team with a single source of truth for deploying and releasing software. Without this source of truth, packaging and releasing software becomes burdensome and time consuming. The *Version Control System* also enables the team to return to the last known good state when a failure happens.

However, the role of a *Version Control System* is broader than only versioning code. It is primarily a communication tool. It enables the team to work together effectively on a software product. It is a core part of the communication mechanisms, i.e. communicating changes amongst team members. The team is continuously aware of the latest changes and their impact on their work. That means they can adapt all the time. As a result, it assists in attaining a [Shared Understanding](https://en.wikipedia.org/wiki/Extreme_programming_practices#Shared_understanding) of the software product as well as establishing a [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html) about the code. Two central [eXtreme Programming](https://app.thestorygraph.com/books/d3b46782-9b71-46a1-bf56-9682b101f6ba) practices to facilitate communication and collaboration amongst the team. That is vital to build quality into the product. As a side effect, it shortens lead time to market and accelerates feedback. Inevitably, faster feedback means even more quality!

*Automate the Build* is not about having a central build server. I have to admit, it is convenient but not essential. Having GitLab CI or GitHub Actions implemented is not a guarantee for reaching Continuous Integration. Far too often, teams claim they apply Continuous Integration because these tools are in place. Yet, on many occasions, they are not even close to having Continuous Integration. Most of the time, they are a bunch of individuals working in isolation, assuming that, eventually, their code gets integrated.

*Automate the Build* refers to the **Build Script**. It should be possible for every team member to check out the code, any time, from Version Control, build the application, run all automated tests and checks and produce a binary artefact using a single command, the *Build Script*. It ought to produce a single binary result: SUCCESS or FAILURE. SUCCESS is the prerequisite to [*Commit Only on Green*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green). The script ensures for a repeatable, reliable, consistent and deterministic build. We can execute the script repeatedly without a single side effect. Therefore, it is [idempotent](https://en.wikipedia.org/wiki/Idempotence).

That script is both used by the [*Local Build*](#local-build) and the [*Commit Build*](#commit-build).

The *Build Script* is code. Therefore, we treat it the same way as any production code. It is versioned. We refactor it whenever necessary. We apply the same design principles and abstraction levels for readability.

That is all. These are the only tools we demand to implement Continuous Integration:

- a *Version Control System*
- and a *Build Script*

The remainder are practices. In all truth, that is the challenging part!

## Related Articles

- [Continuous Integrations! Where to Start?]({% post_url 2024-11-01-continuous-integration-where-to-start %})

## References

- [Continuous Integration on a Dollar a Day](https://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day), James Shore
- [Software Configuration Management Patterns](https://app.thestorygraph.com/books/529f1299-6482-4364-b701-11e2a889acd6), Stephen Berczuk with Brad Appleton

## Definitions

### Mainline

The Mainline is the line of development in Version Control which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Local Build

The Local Build is the build executed by engineers on their local machine as part of [*Run a Local Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build). It is similar to the [*Commit Build*](#commit-build) except for checking out the source code.

### Commit Build

The Commit Build is a build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from [*Mainline*](#mainline) and at minimum compiling the sources, running a set of [*Commit Tests*](#commit-tests), and building a binary artefact for deployment.

### Commit Tests

The Commit Tests comprise all of the Unit Tests along with a small simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback.
