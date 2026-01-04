---
layout: article
title: "What is Continuous Delivery?"
author: Thierry de Pauw
meta:
category: articles
tags: [ Continuous Delivery ]
image: /images/what-is-continuous-delivery/continuous-delivery.jpg
---

Any time an organisation tells me with great confidence that they *do Continuous Delivery*, I am suspicious. The same is true with Agile. When I probe for clarification and start asking specific questions, my suspicion gets confirmed. Tooling is in place, but without the mindset or understanding of the principles behind Continuous Delivery, lacking the foundations, the central pattern, and any of the practices.

---

With this article, we [once more go back to basics]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}). As it often happens in our industry, people like to redefine practices to ensure they fit their way of working.

Continuous Delivery is a holistic approach to IT delivery. It is a set of principles, foundations, and one pattern, backed by practices, that reduce the time between committing a change to a Version Control system - be it code for a feature, a bug fix, a configuration change, an infrastructure change or even just an experiment - and getting that change into the hands of the users in production safely, reliably, sustainably (as in lack of stress) with confidence, and quickly.

Nothing here is new. This has all been described at length in the 2006 paper [The Deployment Production Line](https://dannorth.net/profile/deployment_production_line.pdf) and later in the 2011 book [Continuous Delivery: Reliable Software Releases Through Build, Test, and Deployment Automation](https://app.thestorygraph.com/books/77eb0975-4194-42e7-9db3-005d4250940f). But, it seems, [engineers do not read books](https://blog.codinghorror.com/programmers-dont-read-books-but-you-should/) (... and probably leaders do neither).

![Continuous Delivery](/images/what-is-continuous-delivery/continuous-delivery.jpg)

<!-- no toc -->
- [Nine Principles](#nine-principles)
  - [Accountable as a Team for the Delivery Process](#accountable-as-a-team-for-the-delivery-process)
  - [Done Means Released](#done-means-released)
  - [Create a Repeatable, Reliable, Deterministic, and Efficient Process for Releasing Software](#create-a-repeatable-reliable-deterministic-and-efficient-process-for-releasing-software)
  - [Build Quality In](#build-quality-in)
  - [Build on Foundations Known to be Sound](#build-on-foundations-known-to-be-sound)
  - [Work in Small Batches](#work-in-small-batches)
  - [Do It More Often When It Hurts](#do-it-more-often-when-it-hurts)
  - [Automate the Right Things](#automate-the-right-things)
  - [Pursue Continuous Improvement relentlessly](#pursue-continuous-improvement-relentlessly)
  - [Trust, but Verify](#trust-but-verify)
- [Three Foundations](#three-foundations)
  - [Version Control Everything](#version-control-everything)
  - [Continuous Integration](#continuous-integration)
  - [Continuous Testing](#continuous-testing)
- [One Pattern](#one-pattern)
  - [Deployment Pipeline](#deployment-pipeline)
- [Three Practices](#three-practices)
  - [Build Only Once](#build-only-once)
  - [Deploy the Same Way to Every Environment](#deploy-the-same-way-to-every-environment)
  - [If any Part of the Deployment Pipeline Fails, Stop the Line](#if-any-part-of-the-deployment-pipeline-fails-stop-the-line)
- [Closing](#closing)

## Nine Principles

An effective IT delivery builds on nine principles. Not understanding these jeopardises any chances to obtain quality and efficient delivery.

### Accountable as a Team for the Delivery Process

To achieve organisational goals - such as turnover, market share, productivity, quality of delivered goods, number of delivered goods, customer satisfaction - everyone in the organisation needs to be aligned with these goals.

All too often, development focuses on throughput, testing on quality and operations on stability. In reality, these are all system-level outcomes that help achieve organisational goals. They can only be achieved by close collaboration between everyone involved in the IT delivery process. Ultimately, releasing IT systems is a team activity, not an individual activity. The whole team succeeds or fails as a team, together. Hence, the team is accountable for the delivery.

For this to work, it is crucial to implement the [*Deployment Pipeline*](#deployment-pipeline) pattern so that everyone in the team can see, at a glance, the status of the system, its health, the various builds, the results of the tests, and the state of the environments where the system can be deployed. This creates empowerment for the team.

### Done Means Released

A feature is only done when it delivers value to a user. Inevitably, done means deployed into production and released to users.

There are cases where this is not particularly achievable. Think of mobile apps that need to go through a vetting process before landing in the app store. In these situations, we dial back to the next best option. It is done when it can be used and showcased in a production-like environment.

There is no such thing as 80% done. It is either done or not. It is very binary. There is no in-between.

This has an important corollary. One person from the team does not have the power to get something done. It is a team effort. It requires team members to collaborate to get it done. Therefore, we have to be [*Accountable as a Team for the Delivery Process*](#accountable-as-a-team-for-the-delivery-process). It is the whole team's responsibility.

### Create a Repeatable, Reliable, Deterministic, and Efficient Process for Releasing Software

Releasing software should be easy and happen with confidence. This reduces risks and, more importantly, stress for the team.

It is reliable, because with every run of the [*Deployment Pipeline*](#deployment-pipeline) we test every single part of the release process, again and again. That is why we should [*Do It More Often When It Hurts*](#do-it-more-often-when-it-hurts).

We demand efficiency to shorten the time to market, accelerate feedback to gain more information and run more experiments, to eventually reduce the [cost of delay](https://blackswanfarming.com/cost-of-delay/). We want to know as quickly as possible if the thing we have just implemented, deployed into production and released to users is actually being used and how it is used. Based on this information, we can take new decisions and run new experiments to find new unmet needs of our users. As such, finding new ways to delight our users, which is a massive competitive advantage.

The repeatability, reliability and determinism derive from two foundations: [*Everything we need to build, deploy, test and release our system should be under Version Control*](#version-control-everything) and [*Continuous Testing*](#continuous-testing); and one other principle: [*Automate the Right Things*](#automate-the-right-things).

### Build Quality In

> Cease dependence on mass inspection to achieve quality. Eliminate the need for inspection on a mass basis by building quality into the product in the first place.
>
> -- Edwards Deming, Out of the Crisis, point 3 from the [14 Points for Management](https://deming.org/explore/fourteen-points/)

We cannot buy quality. We can also not test quality in later. Routine 100% inspection to "improve" quality is equivalent to planning for defects. We essentially acknowledge that the process lacks the capabilities to deliver quality.

Inspection to improve quality is too late. It does not improve quality, nor does it guarantee quality. The quality, good or bad, is already in the product. Mass inspection is unreliable, costly, and ineffective. Also, divided responsibility means nobody is responsible.

Quality comes from [*relentless continuous improvement*](#pursue-continuous-improvement-relentlessly) of the delivery process.

With Continuous Delivery, we invest in a testing culture supported by people and tools where we detect any problems early and quickly, to fix them immediately when they are easy and cheap to find and resolve. Quality is the whole team's responsibility. Software Engineers implement automated tests with support and coaching from Quality Engineers. Quality Engineers coach the team into a quality mindset and use risks as a heuristic to guide the testing.

Fiercely pursuing quality derives from two principles: [*Build on Foundations Known to be Sound*](#build-on-foundations-known-to-be-sound) and [*Build Quality In*](#build-quality-in); two foundations: [*Continuous Integration*](#continuous-integration), and [*Continuous Testing*](#continuous-testing); and one pattern: the [*Deployment Pipeline*](#deployment-pipeline).

### Build on Foundations Known to be Sound

Every stage of the delivery process builds on the previous stage. Every stage adds more quality information to the Release Candidate. It passes the Unit Tests. It passes the Security Tests, the Acceptance Tests, and finally the manual Exploratory Tests. We can now decide confidently whether to deploy the Release Candidate into production.

Building on foundations known to be sound, follows one practice: [*Build Only Once*](#build-only-once). The Release Candidate that gets deployed into production is the same one that went through all the previous testing stages.

### Work in Small Batches

According to Reinertsen, reducing batch sizes represents a compelling opportunity. Following [Little's Law](https://en.wikipedia.org/wiki/Little%27s_law), it reduces lead time and thus time to market, and the cost of delay. Consequently, as lead time is shortened, feedback is accelerated. Because we now have smaller batch sizes, we are less exposed to changes, and as such, we reduce risks because the consequences of an error are much smaller. Smaller batch sizes reduce overhead. With Continuous Delivery, we can reduce the cost of repetitive transactions caused by many small batches. Finally, because feedback is accelerated, we improve efficiencies.

Large batches inherently lower motivation and urgency. It demotivates people by delaying feedback. Large batches dilute responsibility. Ultimately, it leads to risk avoidance and accordingly disables innovation. Finally, large batches attract even larger batches.

By splitting work into much smaller chunks that deliver measurable value quickly, we receive essential feedback on the work we are doing so that we can course-correct. Continuous Delivery changes the economics of the IT delivery process, making the cost of pushing out small individual changes very low, by reducing the transaction cost, allowing to make many smaller, more frequent changes. Obviously, this demands to [*Make All Changes In Small Increments*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-5-make-all-changes-in-small-increments).

Working in small batches derives from two other principles: [*Create a Repeatable, Reliable, Deterministic, and Efficient Process for Releasing Software*](#create-a-repeatable-reliable-deterministic-and-efficient-process-for-releasing-software), and [*Automate the Right Things*](#automate-the-right-things).

### Do It More Often When It Hurts

This is more of a heuristic than a principle. Bring the pain forward.

When integrating software is hard, do it on every commit, requiring the [*Continuous Integration*](#continuous-integration) foundation.

When testing is painful, that only occurs before a release. Do not test at the end. But [*Build Quality In*](#build-quality-in) by adopting the [*Continuous Testing*](#continuous-testing) foundation, from the start.

When releasing is laborious and distressing, move from releasing once a year to biannually, to quarterly, to monthly, weekly, and eventually daily or even multiple times per day. This builds on the principle to [*Automate the Right Things*](#automate-the-right-things), and the practice of [*Deploying the Same Way to Every Environment*](#deploy-the-same-way-to-every-environment).

When writing documentation is tedious, do it immediately when implementing the feature or the architectural change. Make the documentation, [runbooks](https://www.pagerduty.com/resources/automation/learn/what-is-a-runbook/), and [decision records](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html) part of the [Definition of Done](https://www.scrum.org/resources/what-definition-done).

Admittedly, depending on our situation, this may require considerable effort and investment. But it is certainly an investment. It is not a cost. It has a return. In the end, it induces a more reliable, consistent, and efficient delivery process, reducing stress and burnout. Hence, we have to [*Pursue Continuous Improvement relentlessly*](#pursue-continuous-improvement-relentlessly).

### Automate the Right Things

Computers perform repetitive tasks; people solve problems. To reduce the cost of pushing out changes, we should invest in simplifying and automating repetitive work that takes time, such as manual regression testing and manual release processes. This frees up teams for higher-value problem-solving activities, innovation and value creation. Automation accelerates feedback, therefore multiplying learning and discovery. It supports faster, more reliable releases. Most importantly, it vastly reduces risks.

Note that this principle is nuanced. It does not say "Automate all the things". In that case, there is a risk of overinvesting. In consequence, we only automate bottlenecks, repetitive tasks, or tasks that involve high risks. For that, we ought to map the technology value stream from Version Control to the user, and identify bottlenecks, risks and repetition. This technology value stream map now forms the basis for the [*Deployment Pipeline*](#deployment-pipeline). By automating the identified steps, we start iteratively building the Deployment Pipeline.

> Spending time optimising anything other than the bottleneck is an illusion.
>
> Eliyahu Goldratt, The Goal

### Pursue Continuous Improvement relentlessly

> Improve constantly and forever the system of production and service.
>
> There must be continual improvement in test methods, and even better understanding of customers' needs and of the way [they] use and misuse a product.
>
> -- Edwards Deming, Out of the Crisis, point 5 from the [14 Points for Management](https://deming.org/explore/fourteen-points/)

Continuous Delivery requires the adoption of a set of technological and organisational changes in addition to a [*Deployment Pipeline*](#deployment-pipeline).

![Technological Changes](/images/what-is-continuous-delivery/continuous-delivery-technological-changes.jpg)

![Organisational Changes](/images/what-is-continuous-delivery/continuous-delivery-organisational-changes.jpg)

Adopting Continuous Delivery is hard work. It requires applying all of these changes to the unique circumstances and constraints of the organisation. As a result, implementing Continuous Delivery will not happen overnight, as already mentioned in [*Automate the Right Things*](#automate-the-right-things). It will be the result of continuously improving the IT delivery process.

An organisation is a complex adaptive system in which behaviours emerge from unpredictable interactions. The cause and effect of an event can only be understood in retrospect. Additionally, everyone only has limited information. No one has a complete overview of the whole delivery process. Consequently, adopting Continuous Delivery means implementing changes in highly uncertain conditions.

To move forward, we need something to guide us. We need a continuous improvement framework such as the [Improvement Kata](http://www-personal.umich.edu/~mrother/The_Improvement_Kata.html). It helps us to execute and measure organisational change to reach goals in uncertain conditions. Due to the uncertainty, we do not know how the results will be achieved. Progress is non-linear. Accordingly, the framework guides experimentation and problem-solving.

Ultimately, adopting Continuous Delivery is not a project with an end date. It is a continuous improvement exercise that will never be really finished.

Again, it is significant that everyone from the team is involved and as such [*Accountable as a Team for the Delivery Process*](#accountable-as-a-team-for-the-delivery-process).

### Trust, but Verify

This is the tenth principle, but it is not mentioned in the book. However, I find it particularly imperative as it constitutes the essence for enabling safety and courage, and [Accountability as a Team](#accountable-as-a-team-for-the-delivery-process), which inevitably leads to [Build Quality In](#build-quality-in) and innovation.

It is the lack of trust that has initiated all sorts of unnecessary, wasteful activities to the process of getting code from Version Control into the hands of the users, which reduce feedback, impact quality, create fatigue, burnout and disengagement, slow down delivery, and finally bring organisations to a halt without them noticing it. Only to create some sort of sense of control. Not true control, just a sense.

> But, but ... people will dump rubbish.

If that were the case, it would be a system problem. According to Deming, system problems are created by management. It is management's responsibility to remove barriers and constantly improve the system.

> So the natural thought is just clogged up, totally clogged up.
>
> So we need to unplug these dams and make the natural flow
>
> -- Gorillaz, Stop the Dams

Instead of thinking people are stupid and so we need a process to fix for that, we should trust that the people will do the right thing. This is applying [Management Theory Y over X](https://en.wikipedia.org/wiki/Theory_X_and_Theory_Y). Then, to verify that the trust is not abused, to ensure accountability, and to balance belief with due diligence to prevent errors or deceptions through monitoring, regular reviews, and audits.

> Adopt and institute leadership.
>
> The job of management is not supervision, but leadership. Management must work on sources of improvement.
>
> -- Edwards Deming, Out of the Crisis, point 7 from the [14 Points for Management](https://deming.org/explore/fourteen-points/)

## Three Foundations

Implementing Continuous Delivery calls for indispensable foundations.

### Version Control Everything

Everything we need to build, test, deploy, release and run our application must be kept under Version Control. This means we version production code, obviously, but also all of our tests, application and system configurations, database schema migrations, all the infrastructure required to run the system, but also documentation, [decision records](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html) and [runbooks](https://www.pagerduty.com/resources/automation/learn/what-is-a-runbook/) to maintain and keep the application available.

This is a [foundational practice to succeed with Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-1-version-control-everything).

[*Continuous Integration*](#continuous-integration) is a state we accomplish as a team, not as an individual. Subsequently, to work as a team, we need a way to coordinate production code, test code, build and deploy scripts, and many other aspects.

Without version control, we miss a single source of truth. Releasing a piece of software becomes a marathon of chasing bits and pieces of code on engineers' machines or shared network drives. It also becomes quite challenging to roll back to a previous version known to be good, due to a lack of a single source of truth.

Know that the Version Control System is more than just versioning. It is a communication tool to share changes with team members. It supports gaining a [Shared Understanding](https://en.wikipedia.org/wiki/Extreme_programming_practices#Shared_understanding) of the system and building a [Collective Ownership](http://www.extremeprogramming.org/rules/collective.html) over the codebase. In turn, it allows for increased integration frequency. As a consequence, it enables communication and collaboration within the team. All the good ingredients for [*Building Quality In*](#build-quality-in) and higher delivery throughput.

### Continuous Integration

[Continuous Integration is a Team Practice]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}). We realise it as a team, not as individuals. Most of the time, practices are defined for individuals. When most team members apply them, the team does well. However, with Continuous Integration, most team members have to implement other practices before the team can declare they practice Continuous Integration.

Without Continuous Integration, our software is broken until somebody proves it works. With Continuous Integration, our software is proven to work with every new change - assuming we [have a decent set of comprehensive automated tests]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-13-have-a-vast-amount-of-high-quality-automated-tests) -, and we know the moment the software is broken.

Following the principles of [*Work in Small Batches*](#work-in-small-batches) and [*Building Quality In*](#build-quality-in), we push at least once a day into [*Mainline*](#mainline) (more is better). Every commit triggers an automated build and execution of the automated tests. When the build fails, it gets fixed within ten minutes.

If we fail to implement any of these three criteria (push once a day, triggers a build, and fixed within ten minutes), we clearly do not practice Continuous Integration. Achieving [Continuous Integration entails adopting 20 practices]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}). As with [accelerating releases](#do-it-more-often-when-it-hurts), this is a journey. So, [where do we start]({% post_url 2024-11-01-continuous-integration-where-to-start %})?

Continuous Integration is a prerequisite to Continuous Delivery. Although [we have seen organisations reach Continuous Delivery without Continuous Integration]({% post_url 2019-09-06-from-bi-annual-to-fortnightly-releases-in-4-months-for-15-teams-and-a-single-monolith %}). But that is not sustainable in the long term. Teams will be operating at higher levels of risk for delayed delivery or production failures than people can actually tolerate. This will create a higher risk for stress, fatigue and burnout. Which inevitably impacts organisational performance.

### Continuous Testing

Following the principle of [*Building Quality In*](#build-quality-in), testing has to be an integral part of the delivery process. We test at all stages of the value stream. This requires a multifaceted testing strategy, automated as well as manual.

![Continuous Testing](/images/what-is-continuous-delivery/continuous-testing.jpg)

All features or improvements start from an idea. Testing the idea is critical. Does the idea make sense? Are users waiting for it? Does it solve a problem? We investigate the idea to uncover more information, enhance and crystallise it. User research and user interviews are an elementary part of testing the idea.

We test the design. It is exploratory in nature and risk-based. We use risks as a heuristic to focus our investigation. While asking questions, we uncover more information that helps to refactor the design to make it better.

We can investigate the code. Check it against expectations discussed during planning. Code reviews are exploratory testing to scrutinise wrong assumptions. When writing Unit Tests, we can pair with a QA Engineer who can share test ideas about different risks, interactions, and perspectives.

We test the push, i.e. the merge of the local [*Mainline*](#mainline) with the remote *Mainline*, using [*Continuous Integration*](#continuous-integration).

We can certainly test the build.

We conduct Exploratory Testing of the product in a test environment.

When releasing, we can test the release and the deployment with Smoke Tests. Do more Exploratory Testing in production.

Finally, there is monitoring. Monitoring is also testing and exploratory. We explore usage patterns. It tells us how the system is being used by users. But monitoring also requires testing. Does it provide the expected information?

Continuous Testing is evidently more than only automated tests. Though when implementing Continuous Delivery, we have to [*Have A Vast Amount of High-Quality Automated Tests*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-13-have-a-vast-amount-of-high-quality-automated-tests). This ensures we create multiple feedback loops to deliver high-quality software to users more frequently, reliably and sustainably. The key pattern which connects these feedback loops is the [*Deployment Pipeline*](#deployment-pipeline).

## One Pattern

### Deployment Pipeline

One of the rare occasions in IT where the factory metaphor applies is the technology value stream. The Deployment Pipeline is sort of an assembly line, a conveyor belt. It is the automated manifestation, consisting of several stages, to get software from Version Control, test the software, package the software, run additional tests and ultimately bring it into the hands of the users in production.

![Deployment Pipeline](/images/what-is-continuous-delivery/deployment-pipeline.jpg)

For your information, the pattern is called a **Deployment Pipeline**! Not a CICD-pipeline, not certainly not a DevOps pipeline (whatever that may be).

The Deployment Pipeline is the implementation of the technology value stream that is part of the overall value stream to take an idea about a feature out of the mind of users, Product Manager or team, into the hands of the users. Hence, it only covers the downstream part of the value stream from Version Control until production and releasing.

![Value Stream](/images/what-is-continuous-delivery/value-stream.png)

The objective of the Deployment Pipeline is to eliminate bad quality Release Candidates as early as possible. Whenever a stage is red, the Release Candidate is discarded. As such, only changes that successfully went through all stages of the deployment pipeline and that have been thoroughly tested get into production.

The Deployment Pipeline comprises several stages. Some are automated, others are manual. It is perfectly okay to have manual steps in the Deployment Pipeline. Often, the implementation of a Deployment Pipeline starts from the technology value stream map from Version Control to production. It might be that at the start, all those steps are manual. Then, following the [*Pursue Continuous Improvement relentlessly*](#pursue-continuous-improvement-relentlessly) and [*Automate the Right Things*](#automate-the-right-things) principles, we automate the steps that form a bottleneck or are risky or repetitive.

Some stages will have automatic thresholds. For instance, when an automated test fails or a vulnerability is found, the stage will turn red. Other stages require human intervention to evaluate the results, such as for load or performance testing, where it is difficult to define a distinct baseline.

The stages at the start of the Deployment Pipeline are fast. As we progress in the Deployment Pipeline, the stages become slower. We prioritise the fast stages first to accelerate feedback. That is the reason we execute the fast Unit Tests in the first [Commit Build](#commit-build) stage and only execute the slower Acceptance Tests in a later stage.

Because the first stages are fast, they are also environment-neutral. Where Automated Acceptance Tests, Exploratory Testing, and Load Testing need to happen in a production-like environment.

Stages at the start are also showstoppers. Meaning, if these fail, they discard the Release Candidate. Further down the Deployment Pipeline, they are not necessarily showstoppers. Some, like the Automated Acceptance Tests, will be; others not. As Exploratory Testing is not regression testing, it does not necessarily eliminate the Release Candidate. That is a reason for the Exploratory Testing not to be on the path to production. It could be limited to production.

The Deployment Pipeline has three purposes:

1. Make every part of the process of releasing software visible to everyone.
2. Improve feedback to identify problems early when they are still small and easy to fix, and therefore to resolve them quickly.
3. Empower teams to deploy any version of the system to any environment as they please, limiting the wait time and improving lead times.

All three purposes are important, though point one - make every part of the process visible - is especially paramount. It calls to maintain only one, single Deployment Pipeline per binary artefact.

With the rise of GitOps, we now see implementations consisting of two pipelines. The so-called "CI-pipeline", usually including only one single stage, the [Commit Build](#commit-build), which produces the binary artefact. The "deploy pipeline" implemented using a different tool that promotes and deploys the binary artefact in the subsequent environments. This antipattern infringes on the visibility purpose. I advise against it as it becomes difficult to identify which commit landed in which environment. [Measuring Continuous Delivery](https://app.thestorygraph.com/books/75cc77f7-43e9-4cdc-9640-cfafdc593e51) becomes difficult. Automating the execution of the Automated Acceptance Tests might be tricky and certainly not straightforward, which generates complexity. Lastly, it enlarges the technology landscape and thus the cognitive load for the team. To summarise, with GitOps, it is decidedly challenging to attain Continuous Delivery.

The Deployment Pipeline is the logical extension of [*Continuous Integration*](#continuous-integration), where every commit creates a potential Release Candidate, following the [*Build Only Once*](#build-only-once) practice, after which the Release Candidate is promoted from stage to stage to at last arrive in production.

## Three Practices

### Build Only Once

Delivery systems based on recompiling code and rebuilding binary artefacts for each environment are flawed. Every time we rebuild, we run the risk of introducing some differences. The compiler version could be different, or its configuration. We could pick up different versions of 3rd party libraries.

This rebuilding antipattern violates two principles: [*Create a Repeatable, Reliable, Deterministic, and Efficient Process for Releasing Software*](#create-a-repeatable-reliable-deterministic-and-efficient-process-for-releasing-software) and [*Build on Foundations Known to be Sound*](#build-on-foundations-known-to-be-sound).

Rebuilding violates *Create a Repeatable, Reliable, Deterministic, and Efficient Process for Releasing Software*, as rebuilding takes time. Also, every rebuild requires retesting. This quickly becomes a lengthy process, with long lead times that come along with a cost of delay. Not retesting defies determinism and reliability.

It disregards the *Build on Foundations Known to be Sound*, as it enables the risk that some changes have been introduced between the creation and subsequent testing and the release of the binary artefact. Therefore, binary artefacts should be built once to ensure that the binary which gets deployed into production is exactly the same as the one that went through the Automated Acceptance Testing stage, the Exploratory Testing stage, and any other testing stage that might be present.

This is the precise motive for [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/) to be incompatible with Continuous Delivery. It forces a rebuild to deploy in production and release. With GitFlow, it is decisively impossible to reach Continuous Delivery.

### Deploy the Same Way to Every Environment

It is key to use the same process to deploy to every environment, whether into testing environments or production, to ensure the build and deployment process has been tested effectively. We will deploy frequently to the test environment, but less to production. The frequency of deployment is inversely related to the risk associated with each environment. We deploy less frequently to production than to test environments. Before deploying to production, we will have tested the deployment many times in the upstream environments to discard the deployment script as a source of error.

This means we must use the same script to deploy to each environment. Of course, environments differ from each other. For sure, they will have different IP addresses, but also different database connections and other external services. We keep these configurations outside of the deploy script in configuration files [under Version Control](#version-control-everything).

As for build scripts to [*Automate the Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-11-automate-the-build), the deploy script is treated the same way as code. It is versioned, tested, and evolves continuously through refactoring. We apply similar design principles as for code, such as abstractions, small files, [Cohesion and Coupling](https://wiki.c2.com/?CouplingAndCohesion), [Simple Design](https://wiki.c2.com/?SimpleDesign), and [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single-responsibility_principle).

Deploying the same way to each environment guarantees [repeatability, consistency and determinism](#create-a-repeatable-reliable-deterministic-and-efficient-process-for-releasing-software). The deploy script has to be idempotent. Deploying the same version of the system over and over again in an environment results in the same outcomes without any side effects.

### If any Part of the Deployment Pipeline Fails, Stop the Line

To establish a [rapid, repeatable, reliable](#create-a-repeatable-reliable-deterministic-and-efficient-process-for-releasing-software) releases, we have to accept as a team that every change, every commit into Version Control, will successfully build, pass every test and deploy. In that case, [*Agree as a Team to Never Break the Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build) extends to the whole [*Deployment Pipeline*](#deployment-pipeline). This implies that if any part of the delivery process fails, the team owns the failure, [Stops The Line](https://en.wikipedia.org/wiki/Andon_(manufacturing)), and fixes it immediately before moving on with any ongoing work. This is vital to [*Build Quality In*](#build-quality-in).

## Closing

As one can see, Continuous Delivery is once more not a tooling problem, as is [the case for Continuous Integration]({% post_url 2020-03-23-continuous-integration-is-not-a-tooling-problem %}). To be successful with Continuous Delivery, and henceforth have a performant, reliable, deterministic IT release process, calls for an understanding of the principles, the foundations, the one pattern and the practices.

Once we fathom all of that, the rest will follow, naturally. It becomes a virtuous cycle where quality leads to higher throughput, and throughput leads to even better quality.

> Je n’ai fait cette lettre-ci plus longue que parce que je n’ai pas eu le loisir de la faire plus courte.
>
> -- Blaise Pascal, Les Provinciales, Seizième lettre (1656)

## Acknowledgement

[Lisi Hocke](https://www.lisihocke.com/), [Gitte Klitgaard](https://linkedin.com/in/gitteklitgaard/), my colleagues [Eduardo da Silva](https://linkedin.com/in/emgsilva/) and [João Rosa](https://linkedin.com/in/joaoasrosa/), and my best friend [Martin Van Aken](https://linkedin.com/in/martinvanaken/) for their feedback.

## Related Articles

- [The Practices that make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %})

## References

- [The Deployment Production Line](https://dannorth.net/profile/deployment_production_line.pdf), Jez Humble, Daniel North, Chris Read
- [Continuous Delivery: Reliable Software Releases Through Build, Test, and Deployment Automation](https://app.thestorygraph.com/books/77eb0975-4194-42e7-9db3-005d4250940f), Dave Farley, Jez Humble
- [Out of the Crisis](https://app.thestorygraph.com/books/b79ebdec-b267-4585-9af4-b5b68b30f5e5), Edwards Deming
- [The Principles of Product Development Flow](https://app.thestorygraph.com/books/63ab42fd-34e7-40e3-b86e-5be510f5c119), Donald Reinertsen
- [Continuous Testing in DevOps](https://danashby.co.uk/2016/10/19/continuous-testing-in-devops/), Dan Ashby

## Definitions

### Mainline

The Mainline is the line of development in Version Control, which is the reference from which system builds are created that feed into a [*Deployment Pipeline*](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline).

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The Commit Build is a build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and, at a minimum, compiling the sources, running a set of [*Commit Tests*](#commit-tests), and building a binary artefact for deployment.

### Commit Tests

The Commit Tests comprise all of the Unit Tests along with a small, simple smoke test suite executed during the *Commit Build*. This smoke test suite includes a few simple Integration and Acceptance Tests deemed important enough to get early feedback.
