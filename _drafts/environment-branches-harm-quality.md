---
layout: article
title: Environment Branches Harm Quality
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/environment-branches-harm-quality/environment-branches.jpg
---

Environment feature branches were popularised in the 1990s and 2000s by centralised Version Control Systems like [ClearCase](https://en.wikipedia.org/wiki/IBM_DevOps_Code_ClearCase). Since the 2000s, this practice has become increasingly rare because of the awareness of its costs and more importantly its risks. Though, recently I was confronted with an organisation still relying on Environment Branches as a means to promote changes into production.

---

![Environment Branches](/images/environment-branches-harm-quality/environment-branches.jpg)

With Environment Branches, the Version Control System promotes changes between environments instead of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/). Engineers merge their Feature Branch into the branch that targets the environment they want their changes to be deployed too. Upon merge, a "Deployment Pipeline" is triggered that compiles the code, executes unit tests, builds a binary artefact and deploys into the target environment. Depending on the target environment automated acceptance tests get executed.

This way of working involves a couple of obstacles and risks that disable a consistent, reliable, deterministic and repeatable process for releasing a software product.

First, it violates two core Continuous Delivery principles: *Always build on foundations known to be sound* and *Keep the build and test process short*. To satisfy these principles, it requires to adopt the practice of **Build Only Once**.

On each feature branch merge into a subsequent environment branch, a new build is triggered that produces a brand new binary artefact. This means, every environment receives a newly build binary artefact. As a result, what gets tested in development is not the same as what gets tested in QA, is not the same as what gets deployed into production. With every build we run the risk of introducing subtle differences: different compiler version, different library versions, different compiler configurations, changes in toolchain, etc. In a sense, we have no confidence at all whether the thing that gets deployed into production actually works. That is a first risk. This violates the Continuous Delivery principle to **Always build on foundations known to be sound**. The binary that gets deployed into production should be exactly the same as the one that went in prior test environments. Some deployment pipelines validate this by storing hashes of the binary when created and verify the binary is identical at every following stage in the delivery process.

Because we are rebuilding binary artefacts for every environment we transgress a second Continuous Delivery principle to **Keep the build and test process short** to provide the team with feedback as soon as possible. Recompiling, re-executing unit tests and recreating binary artefacts takes time. The more environments, the more time adds up. This lengths the release process and increases the delivery lead time. What is more, from an audit perspective, it is essential to ensure that no changes are introduced, either malicious or by mistake, between creating and releasing the binaries.

But, there is a bigger problem to this. The delivery process is not hampered on a failing test. As the diagram shows, the automated acceptance tests fail in QA, but the team is not blocked to still release into production despite failing tests. This infringe the practice to **Stop the Line** when any part of the delivery process fails. When the line fails, the team owns that failure, drops everything, stops all work and fixes the problem immediately. The team picks up work again only on restoration of the delivery process. Without this practice, there is no incentive to fix failing tests. Failing tests will be left unbothered. Even worse, test failures will stack up over time turning the test suite to become useless. That is also what happened with that organisation. This is a second risk.

Because we can deploy straight to production with failing tests nothing prevents us to merge a feature branch right into mainline and deploy to production without prior testing in test environments. This is a third risk.

At any time, anyone can introduce changes in any environment branch resulting in the long running branches to diverge. Meaning that binary artefacts will diverge even more between environments. Many times it happened that an environment branch had to be recreated from main. That is a fourth risk.

Lastly, as one can see, the delivery process becomes quickly fairly complex. The build pipeline supporting this contained loads of exceptions and special cases to cope with the differences and vagaries of the various environments. Such build systems make unnecessarily complex what should be trivial. This forces us into fragile, expensive release processes of which the qualitative outcome is questionable.

Naturally, the question raises **Is quality important for our organisation?**. According to me, **undeniably no**. If it was, different practices would have been set in place.

The crucial practice to adopt to build quality into the product is the **Deployment Pipeline**. It is a linear process, fairly simple to reason about. The commit build produces a binary artefact that gets promoted from one environment to another until it finally arrives into production.

![Deployment Pipeline](/images/environment-branches-harm-quality/deployment-pipeline.jpg)

When I suggested this, I received some backfire.

"*I can see this working for teams of three, but this cannot work for teams of ten engineers. Team members will be blocked by other team members, preventing them to deliver.*" Of course, if we have a team of individuals each working in isolation on their allocated feature, this makes things harder. But that is not a team. It is merely a bunge of individuals assigned to a software product where everyone is incentivised to deliver the thing they are working on. This is not a team focused on delivering outcomes. This is a team focused on output.

The embedded [HP LaserJet FutureSmart Firmware](https://app.thestorygraph.com/books/c6e126e5-1ffe-4736-9bcb-f1b80cb412c9) shows this easily scales to 400-person distributed across three continents, integrating 100-150 changes per day into *Mainline* and producing every day 10-15 good builds of the firmware. If this works for embedded software with 400 engineers, this might work for a ten engineers big team. Without even mentioning [Google](https://research.google/pubs/why-google-stores-billions-of-lines-of-code-in-a-single-repository/).

## References

- [Organisation antipattern: Release Feature Branching](https://www.stevesmith.tech/blog/organisation-antipattern-release-feature-branching/), Steve Smith

- [Continuous Delivery](https://app.thestorygraph.com/books/77eb0975-4194-42e7-9db3-005d4250940f), Dave Farley and Jez Humble
