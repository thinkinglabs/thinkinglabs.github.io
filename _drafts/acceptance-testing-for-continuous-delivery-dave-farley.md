---
layout: note
title: Acceptance Testing for Continuous Delivery
event:
  name: PipelineConf
  date: 2015-03-20
author:
  name: Dave Farley
  twitter: davefarley77
created_at: 2017-04-17
date: 2021-07-18
video: https://learn.pipelineconf.info/2015/03/20/dave-farley-acceptance-testing-for-continuous-delivery-pipeline-conference-2015/
slides: https://www.slideshare.net/AgileIndia2019/acceptance-testing-for-continuous-delivery-by-dave-farley-at-agileindia2019
meta: 9 min read
category: notes
tags: [ Continuous Delivery, Testing ]
---

Acceptance Tests are run in a production like environment.

## What's so hard?

* tests break when the SUT changes (particularly UI)
* tests are complex to develop
* this is a problem of design: the tests are too coupled to the SUT

## Who owns the tests ?

we want to have lots of these tests: if it is a significant system we will have 10s of 1000s of these tests

common pattern: story with acceptance criteria => min 1 acceptance test per acceptance criteria

=> build up coverage quite quickly

=> you will over-test (no problem)

Developers own the Acceptance Tests. They own the responsibility to keep them working.
Because developers will break the tests as they add code. Therefore it is their responsibility to fix the tests.

don't have a separate QA team write the tests, as developers add code, the tests break, and the QA team will not be able to catch up

=> ending in tests that are broken all the time

## Properties of Good Acceptance Tests

* focus on the "What" we want to assert not "How"
* Isolated from other tests: you want to run lots of them, you want to run them in parallel
* Repeatable: you want to run them over and over again
* Uses the language of the problem domain => ubiquitous language
* Tests ANY change
* Efficient: we want to run 1000s, 10s of 1000s of these tests

## What not How

How = typical record and play back style of UI testing

=> breaks whenever the SUT changes

to avoid this, introduce a "Driver" (a level of indirection, also called "test infrastructure") that talks to the system using the language of the problem domain: place order, create user, ...

=> tests are written against the Driver

=> the Driver talks the protocol of the system

=> if code changes, we only have to change the Driver

```plain
Test Case     Test Case      Test Case
    |             |              |
    --------------|---------------
                  |
      Test Infrastructure (Driver)
                  |
            Public Interface
                  |
            System under Test
```

## Separate Deployment from Testing

* traditionally it is fairly common to think that
  every test should control its start conditions and so should start and init the app

  => anti pattern, we don't want that because that is inefficient

  => we want to separate the deployment from the testing, so we need to isolate differently

* acceptance test deployment should be a rehearsal for production release

  => this is absolutely true: by the time we arrive in production, we want to have rehearsed the deployment over and over again

* this separation of concerns provides an opportunity for optimisation:

  we deploy it once, and then start running lots of tests against it, so we incur the deployment cost only once

  => parallel tests are run in a shared environment

  => lowers the test start up overhead

## Test Isolation

* any form of testing is about evaluating something in controlled circumstances

* isolation works on multiple levels:

  * isolating the SUT
  * isolating test cases from each other => allows for running in parallel
  * isolating test cases from themselves (temporal isolation) => allows for repeatable results when running a test case multiple times

* isolation is a vital part of your Test Strategy

### Isolating the SUT

typical picture in many enterprise systems:

```plain
System A -> System B -> System C
```

you are working on System B

System B is in a chain of dependencies

it is fairly common in large enterprises to have an integration test environment where you glue all these things together.

it is a requirement that you test it in these circumstances.

**this is problematic**: if your mode of testing System B is to put input into System A, you haven't really control over the input that goes into System B unless you really know what is going on in System A.

=> you don't have any idea of what kind of inputs you have to put in System A

=> this assumes that you have global knowledge of all the systems and an in depth understanding: this is not going to happen

**this is not in a predictable, deterministic state**: you cannot really know the state of the system, know if the test will pass or fail
=> anti pattern

what we really want is:

```plain
Test Cases -> SUT B -> Verifiable Output
```

we want control of that system, we want to interact with that system in realistic ways

interacting through the real communication channels of that system: the API, the UI

we don't want special access for the tests, but we do want closed access so we can exercise the system as it would be really exercised

#### Validating the Interfaces

The trouble is: the reason why people do these crazy things (like integration tests) is that they worry about changes in the interfaces between the systems

that is a valid concern

what you really want is something like this:

```plain
Test Cases -> SUT B -> Verifiable Output
Test Cases -> External System A -> Verifiable Output
Test Cases -> External System C -> Verifiable Output
```

you want to test their interfaces too, but the amount of tests to assert their interfaces is much, much smaller
(instead of extending your test scope using integration tests)

### Isolating Test Cases

* assuming multi-user systems ...

  if that is not the case, you can just spin off multiple instances of your application to obtain test isolation

* tests should be efficient - we want to run LOTS !
* what we really want is to deploy once, and run LOTS of tests
* so we must avoid ANY dependencies between tests ... in terms of shared state, persistent state

what we are looking for is a way to isolate these tests that will allow is to run many of these tests in parallel, against the same instance of an application

=> a great way of doing that is using **natural functional isolation**, e.g.
identify the boundaries in your problem domain that make sense and carve out your tests along these lines

if testing Amazon, create a new account and a new book/product for every test case

if testing eBay, create a new account and a new auction for every test case

if testing GitHub, create a new account and a new repository for every test case

=> you can set up these accounts, repositories, auctions, ... in the exactly the right state for your specific test case, use it inside the test case, and then get rid of it

=> this **has a weird side effect**: you tend to **make the creation** of accounts, ... **very efficient**

### Temporal Isolation

* we want repeatable results
* if I run my test case twice it should work both times

  you want predictable results

Example:

create a book "Continuous Delivery" in the database

the next time you run the test, the book already exists and it will fail

=> **Alias** your functional isolation entities

in your test case create account "Dave", in reality, in the test infrastructure, ask the application to create account "Dave123" and alias it to "Dave" in your test infrastructure

## Repeatable

### Test Doubles

imagine your system has to communicate with the outside world

```plain
            System
              |
Local Interface to External System
Communications to External System
              |
        External System
```

=> you have the opportunity to plugin another implementation for the communication

=> TestStub simulating the External System

=> using configuration we can switch between the real communication (for production) and the stub (for the test environment)

```plain
Test Case     Test Case      Test Case
    |             |              |
    --------------|---------------
                  |
      Test Infrastructure (Driver) --|
                  |                  |
            Public Interface         |
                  |                  |
            System under Test        |
                  |                  |
             Local Interface         |
            to External System       |
                  |                  |
               TestStub -------------|
```

TestStub is part of the Test Infrastructure,
there is a back channel communication

so I can collect results from the test stub and submit input via the test infrastructure

so I can express what I am expecting from external systems

## Uses the language of the problem domain

=> DSL

A simple DSL solves many of our problems:

* ease of TestCase creation
* readability
* ease of maintenance
* separation of "What" from "How"
* test isolation
* the chance to abstract complex set-up and scenario's
* ...

example: see the slides

The DSL is something you build over time, it is an evolutionary approach:

see how in the examples they've evolved from using specifically the tradingUI and the fixAPI to using a Channel annotation

## Tests ANY changes

### Testing with Time

* TestCases should be deterministic
* but Time is a problem for determinism

=> 2 options:

* ignore time: you don't validate the time values returned by the system
* control time: or you can deal with it

#### Ignore Time

Mechanism

* filter out time-based values in your test infrastructure so that they are ignored

Pros:

* simple!

Cons:

* can miss errors
* prevents any hope of testing complex time-based scenarios

#### Control Time

Mechanism

* treat time as if it was an external dependency, like any external system - and Fake it!

  (treat the supply of time information as an external system, and stub it, control it)

Pros:

* very flexible
* can simulate any time-base scenario, with time under the control of the test case

  (you can test day light saving scenario's, clearing examples where you clear 3 days later so you need to fast forward 3 days, ...)

Cons:

* slightly more complex test infrastructure

Again you have in your Test Infrastructure a back channel that allows you to control time.

### Test Environment Types

* some tests need special treatment

  we spoke a lot about sharing environments allowing you to run lots of tests in parallel

  for some kind of tests this is hard to do (example: time travelling, destructive tests, ...)

* tag tests with properties and allocate them dynamically

your Test Infrastructure can use these tags and determine where to run these test cases (in which environment)

for time travelling: each test case spins off a new instance of the application

for destructive tests: you want to kill some bits of the system to see if it is robust enough, ...

## Efficient

we want to run 1000 and 10 of 1000 of these tests

### Production-like Test Environment

you need to represent the stuff that are important in production

### Make TestCases internally synchronous

make sure each test is run efficiently

ideal cycle time:

imagine something really bad is happening in production, you are loosing money, I still want to go through my pipeline to fix that problem and be confident of my fix

=> you don't want that the tests takes days to run

=> **rule of thumb: order of 40 min, maybe 1 hour**

One problem are asynchronous systems

* look for a "Concluding Event" to listen for that in your DSL to report an async call as complete
* if you really have to implement a "poll-and-timeout" mechanism, do it in your test infrastructure, not in your test case

  looking for the concluding event is a much stronger strategy

* Never, Never, Never, put a "wait(xx)" and expect your tests to be (a) Reliable or (b) Efficient

## Scaling-Up

if you have done all the previous, this becomes much more easy

over the coarse of your project the duration of the test run will go over the 40 min

=> buy hardware, VMs, go to Amazon, ...

## Anti-Patterns in Acceptance Testing

* Don't use UI Record-and-playback Systems
  
  they are too brittle, too coupled to the system

* Don't Record-and-playback production data

  this has a role, but it is NOT Acceptance Testing
  
  you are not testing exception cases, because these are going to nail you

* Don't dump production data to your test systems, instead define the absolute minimum data that you need

  because you want to be scalable, you want to be flexible, ...

* Don' assume Nasty Automated Testing Products(tm) will do what you need.
  
  be very sceptical about them. start with YOUR strategy and evaluate tools against that.

* Don't have separate QA team. Quality is down to everyone.

  Developers own Acceptance Testing

  QA people are valuable, but don't have them write acceptance tests separate from developers

* Don't let every Test start and init the app.

  optimise for Cycle-Time, be efficient in your use of test environments.

* Don't include Systems outside of your control in your Acceptance Test Scope

* Don't but wait() instructions in your tests hoping it will solve intermittency

## Tricks for Success

* Do ensure that developers own the tests

* Do focus your tests on What not How

* Do think of your tests as "Executable Specifications"

* Do make Acceptance Testing part of your "Definition of Done"

* Do keep Tests isolated from one-another

* Do keep your Tests repeatable

* Do use the Language of the problem domain - Do try the DSL approach

* Do stub External Systems

* Do test in "Production-Like" environments

* Do make instructions appear Synchronous at the level of the Test Case

* Do test for ANY change

  you want to have a very good confidence the system is ok

  we can never write enough tests to proof that the system is good

  but we can write enough tests that one fails it tells us it is not good

* Do keep your Tests efficient

  easy to write, easy to maintain

## Questions

open source product: LMAX Simple DSL, it does the aliasing

* Cucumber ?

  not anti, it is just that if the developers own the tests, they use the tools they are familiar with

* Write the test first ? Yes

  once the test pass, you are done

* About parallelising tests and not starting and init-ing the app ?

  it is surely not always the right thing to do for all systems

  if your system starts in under a second, you can surely start it for every TestCase

* Resetting the database ?

  only after each deployment of the system, not in between TestCases

  I want to start from a known state and run all schema migrations: start from a known data set
