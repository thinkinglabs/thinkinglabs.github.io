---
layout: post
title: "What is Continuous Delivery ?"
categories:
tags: [ continuous-delivery ]
---

Continuous Delivery is a holistic approach to software delivery. It is a set of practices to reduce the time between committing a change to a system - be it a feature, a configuration change, a bug fix or an experiment - and getting that change into the hands of the users safely, quickly and sustainably.

## 6 Principles
Continuous Delivery consists of 6 principles:

* **Create a repeatable, reliable process for releasing software.** Releasing software should be easy because you have tested every single part of the release process over and over again.
The repeatability and reliability derive from one foundation: everything you need to build, deploy, test and release your application should be in version control; and one other principle: automate almost everything.
* **Build Quality In.** Don't test it in later. Inspection is too late. The quality, good or bad, is already in the product.
This is the 3th point of Edward Deming's fourteen points for management: "Cease dependence on inspection to achieve quality. Eliminate the need for inspection on a mass basis by building quality into the product in the first place."
With Continuous Delivery we invest in a culture supported by tools and people where we can detect any problem early and quickly, so they can be fixed immediately when they are cheap to find and resolve.
Relentlessly pursuing quality derives from two foundations: continuous integration and continuous testing.
* **Work in small batches.** By splitting work into much smaller chunks that deliver measurable value quickly, we get essential feedback on the work we are doing so that we can course correct. Continuous Delivery changes the economics of the software delivery process making the cost of pushing out small individual changes very low.
Working in small batches derives from three other principles: create a repeatable and reliable process for releasing software, build quality in and automate almost everything.
* **Automate almost everything.** Computers perform repetitive tasks; people solve problems. To reduce the cost of pushing out changes we should invest in simplifying and automating repetitive work that takes a long time, such as manual regression testing and manual release processes. This will free up people for higher-value problem-solving work.
However, you don't need to automate everything at once. We should first look at that part of the software delivery process that is currently the bottleneck.
* **Everyone is responsible for the Delivery Process.** To achieve the organisational goals - like turn-over, market share, productivity, quality of delivered goods, number of delivered goods, customer satisfaction - everyone in the organisation needs to be aligned with these goals.
All too often development focuses on throughput, testing on quality and operations on stability. In reality these are all system-level outcomes that help achieve organisational goals. And they can only be achieved by close collaboration between everyone involved in the software delivery process.
* **Relentlessly pursue Continuous Improvement.** Continuous Delivery requires the adoption of a set of technological and organisational changes in addition to a Deployment Pipeline.
Adopting Continuous Delivery is hard because it requires the application of these changes to the unique circumstances and constraints of your organisation. As a result implementing Continuous Delivery will not happen in one shot, but will be the result of continuously improving your software delivery process.
An organisation is a complex adaptive system in which behaviours emerge from unpredictable interactions, the cause and effect of an event can only be understood in retrospect, and every individual has limited information. Adopting Continuous Delivery means implementing changes in highly uncertain conditions.
Therefore it is advised to adopt Continuous Delivery using a continuous improvement framework like the Improvement Kata by Mike Rother from Toyota Kata. An improvement framework gives guidance on experimentation and problem solving in situations where there is uncertainty and incomplete information.
Since we are operating in conditions of uncertainty, we don't know how the results will be achieved, and progress will often be non-linear.
To resume, adopting Continuous Delivery is not a project with an end date. It is a continuous improvement exercise that will never be really finished.

## Foundations
In order to implement Continuous Delivery we must create the following foundations:

* **Keep everything under Version Control.** Everything you need to build, test, deploy, release and run your application should be kept in version control.
It should be possible to provision environments and build, test and run software in a fully automated fashion purely from information stored in version control. Any change to an environment and applications that run on them should be applied through an automated process from version control. This still leaves room for manual approvals. But once approved, changes are applied automatically.
As a result, every change set has a unique identifier - a build number or a version control change set number or a combination - and every application binary can be backtraced to a specific build triggered by a specific change set resulting in a specific version in version control.
As a side note, also your build infrastructure should be kept under version control.
* **Continuous Integration.** Without Continuous Integration, your software is broken until somebody proves it works. With Continuous Integration, your software is proven to work (assuming enough suitable comprehensive automated tests) with every new change, and you know the moment it breaks
Following the principles of working in small batches and building quality in, we keep branches short-lived (< 1 day) and integrate them into trunk/master frequently (at least daily). Each change triggers an automated build and unit test run. And when the build fails we fix it within 10 minutes.
Continuous Integration is a prerequisite to Continuous Delivery.
* **Continuous Testing.** Following the principle of building quality in, testing should be an integral part of development process. Therefore automated unit tests, acceptance tests, security tests and performance tests should run against every commit to version control, giving developers the necessary feedback on their changes. Developers should be able to run all automated tests on their workstation. And testers should execute exploratory testing continuously against the latest build from CI.
This means the adoption of a multifaceted testing strategy that turns a Test Ice Cream Cone into a Test Pyramid involving unit tests (100 - 1000+),  integration tests against filesystem, database, network, …, acceptance tests (10 - 100+) and contract tests (~20) all of them executed at each build; smoke tests aka end-to-end tests (~5) executed at each production deployment.

Implementing Continuous Delivery means creating multiple feedback loops to ensure high quality software gets delivered to users more frequently, more reliably and sustainably. The key pattern which connects these feedback loops is known as a Deployment Pipeline.
A Deployment Pipeline is the automated manifestation of your process for getting software from version control into the hands of your users. This process is also called the technology value stream and makes part of the value stream - the process of getting a feature from the mind of the customer or user into their hands.
A key difference between the technology value stream and the value stream is that builds pass through it multiple times on their way to a release resulting in exercising this release process over and over again.

