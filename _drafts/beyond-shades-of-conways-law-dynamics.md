---
layout: article
title: "Beyond the Shades of Conway's Law - Dynamics: Conway's Time Component"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law, Open Systems Theory ]
---

Because of the past historical decisions and history of changes, software development efforts that lead to large, long-running, rigid legacy systems create a system structure that is not necessarily congruent, in harmony, with the organisation at present, now, today.

---

> the state of a system reflects [...] the organisational history and the flow of people through those organisations over the long term.
>
> -- Rob Smallshire, [Predictive Models of Development Teams and the Systems They Build](https://sixty-north.com/blog/predictive-models-of-development-teams-and-the-systems-they-build)), 2014

The reorganisation of people happens more frequently than the reorganisation or redesign of systems. Thus, the state of the system does not necessarily reflect the organisation. However, it does reflect the past historical decisions and the flow of people through the organisation.

To understand this, we have to explain **Software Engineer Half-Life** and its effect on turnover and codebases over time.

> ... the turnover of developers can be modelled as if developers have a half-life within organizations [or a codebase].
>
> — Rob Smallshire, Predictive Models of Development Teams and the Systems They Build, 2014

Software Engineer Half-Life is the residency time of an engineer on a code base, i.e. the amount of time they spend on a code base before moving on. It seems that the industry average is 3.2 years. On average, we spend 3.2 years on a codebase, and then we move on.

This means if we have a team of 10 engineers, half of the team will have left the team over the next 3.2 years. If we want to keep the team size constant, we need to replace them. But there is no guarantee that their replacement will have the same level of productivity.

It might be that a very low productive engineer is replaced with a higher productive engineer or that a high productive engineer is replaced with a lower productive engineer. For small teams this can significantly shift the overall productivity.

In the end, not all engineers are equally productive. Even, the same engineer will not have the same productivity on all codebases. This is related to codebase size. Adding 100 lines of code to a 1000 lines codebase is a different thing than to a million line system.

Generally speaking, a team productivity goes down as code base size increases.

To see the effect of this *Software Engineer Half-Life* on turnover and codebases we run a turn-over simulation on a team of seven engineers working on a code base during five years.

![7 engineers over 5 years](/images/shades-of-conways-law/7_devs_over_5_years.png)
<center><i>Source: <a href="https://sixty-north.com/blog/predictive-models-of-development-teams-and-the-systems-they-build">Predictive Models of Development Teams and the Systems They Build</a></i></center><br/>

In this simulation, productivity is measured using lines of code. I know that is an outrageous way of measuring productivity. Of course, value creation and return on investment are way better metrics. But here is the thing. It is difficult to tie back to individual engineers. Therefore, we will stay with lines of code, knowing that it is a bad thing and we should not do this in real life. Promised?!?

Every day, there is a fixed probability that an engineer leaves and is replaced by another whose productivity varies randomly.

On the picture time goes from left to right. On the left we start with a team of seven with zero code. From top to bottom we see different colours representing the code contributions of the different team members. The code base grows quickly at first, but soon slows down.

At about 180 days, the purple engineer leaves, indicated by a black vertical bar. Their contributions remain static and are shown in a lighter shade. Because, what they contributed stays in the codebase even when leaving the organisation.

A new engineer starts coloured pink, who replaces purple. As we can see, they are way more productive than their predecessor. But they only stay for 200 days.

At the end of the five year period, we find our team of seven has churned through ...

a grand total of 19 engineers!!

The **majority of the surviving code was written by people no longer with the organisation**; only 37% of the code was written by people still present at the end of the five years.

This brings a time component to Conway's Law. The structure of the software reflects the organisational structure integrated over time.

> A large organization similarly, stretches across time and space. Conway’s Law ties the two. How we organize defines how we think collectively, and thus what we make collectively.
>
> -- Pieter Hintjes, [Sex in Title, and other Stories](http://hintjens.com/blog:73), 2013

Large software systems as we see them today are the fossilised footprints of past engineers.

Any time we release our product, we ship our organisation, together with its structure, all its history, all of its past historical decisions and all the flow of people that went through the organisation.

> Your org structure isn’t solving your problem.
>
> It’s an artifact of how you’ve solved it before.
>
> -- Adam Jacob (we assume the one from Chef 🤷), cited by Dan Slimmon, [Conway’s Law: The DevOps Skeleton](https://www.slideshare.net/danslimmon/conways-law-the-skeleton-of-devops)

> you always ship your organization, so design your organization well
>
> -- Michael Feathers at CraftConf 2014

## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}) - How the worlds of organisation and product design observed the same thesis independently.
- [Validation: The Research & Reality Check]({% post_url 2026-06-20-beyond-shades-of-conways-law-validation %}) - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- [Mechanics: The Mathematical & Geometrical Shades]({% post_url 2026-08-31-beyond-shades-of-conways-law-mechanics %}) - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- **Strategy: Reversing the Law** - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: Conway's Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Bibliography

- [Sex in Title, and Other Stories](http://hintjens.com/blog:73), Pieter Hintjes, 2013
- [Conway’s Law: The DevOps Skeleton](https://www.slideshare.net/danslimmon/conways-law-the-skeleton-of-devops), Dan Slimmon, 2014
- [Predictive Models of Development Teams and the Systems They Build](https://sixty-north.com/blog/predictive-models-of-development-teams-and-the-systems-they-build)), Rob Smallshire, 2014
