---
layout: note
title: "Beyond Agile: Product innovation at Google, Airbnb, Spotify, Vinted & Amazon"
event:
  name: FlowCon
  date: 2025-04-02
author:
  name: Rachel Dubois
  linkedin: duboisrachel
created_at: 2025-04-02
category: notes
tags: [ Agile, FlowCon ]
---

What truly distinguishes Google, Airbnb, Spotify, Vinted or Amazon as world-class product companies? This talk goes beyond the conventional "agile" framework to explore how these organizations create a seamless flow across discovery, delivery, and innovation, ensuring that impactful products are delivered consistently.

This session provides a behind-the-scenes look at how these companies create a continuous, harmonious flow between product discovery, delivery, and innovation. Whether you’re a product manager, engineer, designer, or anyone involved in product development, you'll leave with actionable insights to optimize your own processes and foster a smoother, more effective flow within your team and organization

---

learning pipeline != delivery pipeline

Product is not a list of tickets in Jira, it is not a roadmap to execute

## The Nervous System

- product and tech monitoring, a must
- algorithms detecting abnormal behaviours and triggering alerts, pushing it to the team
- Product Team = EPDA, owning E2E responsibility
- discovery + delivery = one flow, one team

if the nervous system deteriorate, we loose sight of the customer, and we die

## The Immune System

- innovation is risky, it can be letal
- industrialise testing, monitoring and rollback
- actively remove non-performing feature: no value, no keep

-> strong deployment pipeline, trunk-based development

Amazon actively removes features that have an impact on business KPI, if there is a drop, there is a kill

we do not want to keep something in the system that is not useful, they will rotten

> one refacto a day, keeps doctor at bay

Because innovation is not just about launching new things, it's about making sure what we have launched can survive

## The Circular System

- a living Product doesn't feed on Quarterly reporting
- connect dots and folks: free flow of data and intelligence
- data comes to us, we don't have to chase it
  - automate alerts, make sure they arrive in Slack
  - dashboards should be available for everyone
- delivery is not the end, but the beginning of real work
- accept silos but fight kingdoms
  - if there are human beings, there will be silos, but avoid kingdoms, people defending and deciding about one piece

## Control Room

kill switch = maturity

it's not fear of failure

it's how you fail well and move on

the goal is not to ship perfection

every team can shut down a feature without requiring VP approval

cold review

- what have we learned
- what did we measured that surprised us
- what beliefs turned out to be false
- how these learnings are going to affect our next experimentations

## 3 fatal illusions

### 1 we do discovery, we talked to users

that is good, but not sufficient

there is a slight difference between what users say and what they do

real behaviours trumps declarations every single time

test if people really use it by faking it, with a human behind

### 2 we are great at delivering, we ship a lot and fast

super good, but does it change anything for the humans that are paying your services and that you are counting on

if not, it does not make the difference

each delivery should be attached to a hypothesis and link that to a business KPI

velocity and productivity are useless if they do not impact the business curve

### 3 we have OKRs to guide us

well done, except if OKRs are based on output

Antidote: reprogram your Product Operating Model (POM)

it is not much about culture and leadership

it is the passion for product, they really understand tech

```
if your business relies heavily on tech
then tech == business
then this is the way to grow it and sustain it
Period.
```

## 5 actions to reboot your POM

- delivery = experimentation, not implementation
- each "feature" = an hypothesis clearly stated + target metrics + a test protocol
- product teams = minilabs gathering EPDAs + full access to data + clear vision of the problems to solve + ownership to solve them
- refuse to scale something without having clear positive signals
  - stop delivering stuff that do not have impact on business
- practice "Anti Roadmap" Quarterly Reviews to kill any low performing feature => no value, no stay

## and Bonus tip

- stop the nonsense with Discovery >< Delivery, Engineers are not here "just to code"

best teams have engineers thinking from day one about customer problems
engineers just coding is loosing money

What if you stopped delivering,
to finally start learning your business?
