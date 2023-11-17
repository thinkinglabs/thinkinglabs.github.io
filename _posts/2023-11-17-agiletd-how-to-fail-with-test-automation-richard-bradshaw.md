---
layout: note
title: "How to Fail with Test Automation"
event:
  name: Agile Testing Days
  date: 2023-11-14
author:
  name: Richard Bradshaw
  linkedin: friendlytester
created_at: 2023-11-17
category: notes
tags: [ Testing, Agile Testing Days ]
image: /images/agiletd-how-to-fail-with-test-automation-richard-bradshaw/how-to-fail-at-test-automation.jpg
---

Scanning content from the testing community, exploring conference programs I started to see a pattern with automation content, they are all framed about how to do automation successfully. You should do A, followed by B and magic will happen. Those talks are insightful, often contain great advice, but what if a talk switched the framing?

In this talk, I’m going to tell you how to fail with test automation. I’m going to share tips and tricks to ensure your automation efforts fail and provide very little value to your overall testing efforts. I’ll share joyful experiences from my own testing journey where I’ve rode the failure train, going from job to job injecting failure into their testing efforts.

---

I’m a bit nervous about this topic. Usually I talk about how to be successful. I thought can I reverse that?

This is tips and tricks on how to fail

I am not going to talk about how **not** to fail

## Calling it “Test Automation”

If you want to fail at test automation continue calling it test automation
solly focused on using software to test software will surely ensure you will fail

I was interviewed for a job: we want you to automate this list of use cases. How do long do you need? 6 months -> this is already failing.
you have no clue how the system works.
you have just automated.

## Pick your tooling first

it doesn’t matter what problem to solve, just start to pick the cool tool

Pick the tool right from the start and stick to it and ignore all other problems and solutions

## One framework to rule them all

Pick one massive framework to do everything and make sure everyone in the org uses it

Developing different frameworks, nice and lean, adapted to a specific team is too expensive

And if you do really well, open source it

## Have a testing strategy and an automation strategy

Like if these things are two different things

## Automate as late in the SDLC as you possibly can

If you automate early, you have more tests to maintain

## Automate around poor product testability

Don’t fix bad testability, just accept it and work around it, you’ll sure fail

## Remove all the humans, robots rule!

## Run all your tests on every single commit

if your build takes 9 hours, just run it on every commit

no one needs a 15 min tests, that is more work

also run those slower end to end test with every commit

run all tests no matter what later is involved

## Automate everything on the UI

there are tools that record and playback

it is easier to maintain

stick to UI -> you’ll 100% fail

## If a risk has been mitigated lower down the stack, also mitigate it on the UI, just in case!

## Don’t stop until you have 100% coverage

make sure it is on the test strategy on the first line: 100% test coverage

The only way to achieve 100% is when devs stop working and the org goes bankrupt

## Sprinkle in a bit of Gherkin at every opportunity

## Add some AI into the matrix, doesn’t matter where, AI makes it all better

## If there is a new shiny framework out, move to it immediately

You’re using a framework, when a new shiny tool comes along, move to it, don’t question it’s value

## Don’t test your tests, no one’s got time for that

don’t see if tests do why you expect them to do, don’t check if they are deterministic

## Never delete an automated test

why would you delete a test? It’s a waste

also we want more numbers, we want 100% coverage

if you have tests using the old framework, keep them

your CI says selenium, cypress, playwright, …

## Test causing too much trouble ignore it

we don’t delete tests

## Most common ones:

- ignoring
- not deleting

And people explaining why you should move to a new tool without mentioning the value

![How to fail at test automation](/images/agiletd-how-to-fail-with-test-automation-richard-bradshaw/how-to-fail-with-test-automation.jpg)