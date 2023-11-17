---
layout: note
title: "Keynote: Reimagining Automation"
event:
  name: Agile Testing Days
  date: 2023-11-15
author:
  name: Andrew Knight
  linkedin: andrew-leland-knight
created_at: 2023-11-15
category: notes
tags: [ Testing, Agile Testing Days ]
---

Let’s face it: test automation is hard. Teams across the industry continue to struggle with the same old problems again and again: flaky tests, poor coverage, and never enough time to develop automation. While many teams have reached success, many others feel left behind.

It’s time to rethink how we approach testing and automation. Instead of building automated test suites that merely repeat hard-coded presuppositions, what if we built autonomous tools that could learn our products dynamically and point out changes during development? Any time we make a change to the code, we could run these tools to find out if the actual changes in behavior meet our expectations or cause bugs

---

What the future of automation would look like.

Automation? Most think of test automation

## The origins of testing

Meyer’s book: the art of software testing, 1979 (1970’s)

marked the separation between debugging (done by devs) and testing (done by testers)

all testing was manual, no coding skills required for testers

## The advent of unit testing, 1990’s

OO programming

Kent Beck, SUnit, later with Eric Gamma, JUnit

=> unit tests are automated

unit tests mainly done by devs

## Extension into black box automation, 2000’s

testers combined test frameworks with black box tools

coincided with the rise of web development

-> selenium webdriver, jmeter

A new role arose: test automation engineer

some testers feared loosing their job: that didn’t happen 💪

## Continuous testing, 2010’s

tests became part of CI

automated tests became more atomic and robust

New role: SDET”s (software development engineer test 🤷)

## Better testing experience, early 2020’s

tools focused on making testing easier

-> cypress, playwright

Developers started doing more testing using black box automation

## What happened after 2023?

### Autonomous tools

Generating tests with LLMs, mid-2020’s

ChatGPT and Copilot can generate tests and test plans.

Initially they were pretty bad, but they got better and fairly decent

Why stop at only generating the code?
When bots can just run the tests?
=> autonomous testing

Bots learn from

- system behaviours: the applications themselves, what is the behaviour, what could be tested
- observability data: that is what the users are actually doing with the systems, better insights in what should be tested
- development artifacts: all the requirements, examples, … feed that to the machine
- human feedback: very important, there have never be a time where the human was not required

### The great decoupling

of automation from assertion

coupled interaction with verification

at the start of automation assertions are hard coded into the automation

Humans need to verify and validate

### The rise of replay, late 2020’s

- dev makes a change
- automation loads then new version
- looks for differences and tries them -> explores and records what it finds
- devs review the recording and marks the changes as good or bad
-> still human who verified and decides

 How does the tester plays into this?

often devs try to bypass

### Closing the gap, 2033

Assertions become recommendation systems. They are becoming very accurate
-> less human guidance and intervention is required

To this point we focussed on Test Automation

We do not only need automation, we also need collaboration

Automation is not only for testing
…

### Agile went back to its roots, early 2030

working software over documentation

- Scrum is outdated and nearly dead 🤔
- Kanban is now the most popular process

it is simple and therefore efficient

Discovery -> Formulation -> Automation

## Current challenges with automation, 2033

- biggest challenge with automation is cost, it used to be skills
- training and tuning the tools can be tricky
- quality is still human-oriented, machines do not understand quality

We reimagined automation for testing and collaboration

Focus has shifted from writing tests to revealing behaviour
