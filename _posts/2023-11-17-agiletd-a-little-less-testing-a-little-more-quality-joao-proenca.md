---
layout: note
title: "A little less testing, a little more quality"
event:
  name: Agile Testing Days
  date: 2023-11-16
author:
  name: João Proença
  linkedin: joão-proença-ba864357
created_at: 2023-11-16
category: notes
tags: [ Testing, Agile Testing Days ]
---

I've done testing in various forms throughout my career. Automated, exploratory, scripted, you name it! Over the years though, I've been through situations where even with all the testing in the world we couldn't quite avoid serious quality problems with the software we were releasing. Have you ever been in such a situation as well? Or is it something you haven’t considered before?

If there's one thing I've learned, it's that software testing is an integral part of our pursuit for quality but is often not enough. I have several personal stories to tell! Like the time I realised that we needed shorter release cycles for faster feedback loops. Ultimately, that required a change in the architecture of the product.

There was also the time we changed our release strategy to progressively roll out new features to customers, so that we could increase our confidence on the software we were shipping. Or even the time I had to redirect my attention to the way developers were working and behaving, rather than just looking at how testing was being done.

With all of them, I learned how quality is a byproduct of various disciplines and not just necessarily of extensive testing. And in retrospect, this made me think of myself as more than an expert in testing, but as a quality engineer.

---

This is definitely not a talk about how to test.

To achieve quality we need more than testing!

It’s all about Risk. And how we can mitigate that risk

What are potential problems in production, how will they impact users, how can we manage them?

We can prevent the risk, accept the risk, transfer the risk,
or observing and reacting when the risk happens

being really good at reacting

=> unknown, unknowns

## The monolith, quarterly releases

I want more tests! Because we had an issue in production.

Didn’t want to invest in more testing

=> solve the problem differently: making sure we could release independently, faster

1 year journey

Requires:

- team buy-in, business buy-in: agree on value
- architectural changes, aligning with more teams (backwards compatibility): agree on how

> this component is now in a much healthier state than it was a year ago. Getting à it’s own releases clearly improved quality in multiple ways …

Owning the release changed the game. We now could patch at any time.

You cannot test yourself out of a broken release cycle!

=> controlled rollouts: controls the risks

Within all this, we need to see the whole picture

> What does quality mean? Usefulness + correctness + goodness
>
> — [how good is your product](https://lnkd.in/eTqqrjce), Dan Ashby

Is this actually useful?

Testing won’t fix a useless product!

## Quality

These are all different things that are not testing

[Continuous Testing in DevOps](https://danashby.co.uk/2016/10/19/continuous-testing-in-devops/), Dan Ashby

![Continuous Testing from Dan Ashby](https://danashby04.files.wordpress.com/2016/10/model-2.jpg)

=> therefore: Quality Engineer, not just tester

Allows to explore different domains to improve Quality
