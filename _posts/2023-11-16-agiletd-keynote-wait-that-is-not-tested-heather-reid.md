---

layout: note
title: Wait! That's Not Tested
event:
  name: Agile Testing Days
  date: 2023-11-16
author:
  name: Heather Reid
  twitter: heather_reiduff
created_at: 2023-11-16
category: notes
tags: [ Testing, Agile Testing Days ]
image: /images/agiletd-keynote-wait-that-is-not-tested-heather-reid/shippable-vs-viable.jpg
---

I’ve often heard people say “But how do you know you’ve tested everything?” and the answer is “I know I haven’t”. We must walk a fine line when working in high-speed delivery environments. There is a delicate balance between efficiency and thoroughness, between delivering something to the customer and delivering something of value to the customer.

---

We can not afford failures here!

## Slicing - what is this?

deliver the smallest part of something that is valuable to someone

Who is someone?

- could be engineers
- could be customers
- …

How much costs the minimal slice?
10.000 EUR/week
estimated costs including product manager, UX, engineers, …

How to mitigate the risk of spending 10k without value in return?

## Feature One: Appointments

Before: book a personal trainer with only 1 pre-defined time slot

After: book a type of appointment with a different duration

300k loss of revenue not having the feature

It took us 5 month to deliver the first version of the feature

14 months for the complete feature

8 days before customers started exploring

10 slices during 14 months

38 bugs

Cost: 700k to deliver the feature

=> 4 years to make profit!!

## Feature Two: Spot booking

Before: book into a class in your gym, try to pick your preferred spot

After: reserve preferred spot with booking a class in gym

75k loss

2,5 weeks first slice

3 months for full rollout

1 day before customers started using it

9 slices

0 bugs

Cost: 160k

=> 3 years to make profit

## Who cares?

Customers: they want to feel heard, it takes years, how values are they going to feel

- Management
- Investors
- Your team
- HR when it comes to review season

But you as a test engineers too. You don’t want to feel to be a bottleneck. You want recognition.

You don’t want you or your team to fail

What is a tester’s job?

To facilitate continuous search/exploration for information about the product to help the team make informed decisions about risk, quality and success

Success metrics are a proxy of quality. It is the expression of positive outcomes and the absence of negative impressions.

Where to find that information?

- Customers: who want to close accounts, …
- Activities: discussions, exploratory testing, …

We need to think in bets

- We bet on investments
- We bet on having a huge return on 300k
- We bet on risks

- where do we need to focus and where not

> Not testing sets up to fail

Where can we apply a testing mindset on how we ship the product?

Minimal viable product: lost all meaning over time

-> Minimum shippable risk!!

Provides value to someone

- what is the smallest thing that we can ship that provides value
- what are success metrics
- how to assess risk

What problem are we trying to solve here?

When we do not understand the problem then the line between viable and shippable becomes to blur.
We set ourselves up to fail.

## Shippable vs Valuable

![Shippable vs Viable](/images/agiletd-keynote-wait-that-is-not-tested-heather-reid/shippable-vs-viable.jpg)

Value

- clear success metrics
- lower risk
- No “in test” column because we discussed the risk so much
=> shorter release cycle

Questions answered via data

- will people actually use this
- …

What is important here: our assumptions about users will always be wrong!!!

Your aim as a tester should focus on the outcome

> Bet -> ship -> measure -> learn -> persevere or pivot

But wait, that’s not tested!!

Testing is not the goal of software management. Managing risk is the goal.

### Success?
How do we measure success?

### Monitoring?
Without monitoring we set ourselves for failure. We are removing discovering.

### Error handling?
It is never a good thing to display the entire stacktrace to the user

### Pairing?
Ask to pair as a test engineers, you do not need to be able to code, ask questions

### Risk assessments?
Where do you need to place your bets without risks
Where are we going to spend our time?

### Usage?
How do we think they are going to use it?

### Viable vs Shippable
What is the smallest slice we can deliver that can deliver value to someone?

### Technical Debt???
How old is the code base we’re about to jump on?

### Time vs Money?

How much is this feature worth?

How long before we can make profit?

### Should we ship?
Test engineers are not gate keepers

### Feedback loops?
How are we going to receive and evaluate feedback

## Reflect and learn

Use all of this to reflect and learn!!

Ultimate goal is learning!!!

Retros should focus on

- what have we learned
- success: did we achieve our success metrics, learn from your successes
- monitoring: did it pick up anything unexpected
- risk assessments: did we place our bets on the right places
- usage: how many people are actually using this? Is it what we expected?

It’s okay to fail!!!
Leverage failure to learn
