---
layout: article
title: "Beyond the Shades of Conway's Law - Strategy: Reversing the Law"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
---

At the outset of a greenfield system, the organisation drives the initial design. The very act of organising teams implicitly means that some system architecture decisions have been made. Once the system grows, the design matures in couplings that constrain, it reverses this pressure. The system now begins to impose itself back on the organisation, narrowing our strategic options to structure the organisation.

---

## The Reverse Conway's Law: The Legacy Reality

> Organisations with long-lived systems will adopt a structure modelled on the system.
>
> -- Allan Kelly's Reverse Conway's Law, [Continuous Delivery and Conway’s Law](https://thinkinglabs.io/notes/2021/05/13/continuous-delivery-and-conways-law-allan-kelly.html), 2014

For long-lived organisations with long-lived systems, it is the system that imposes itself on the organisation ("*The Organisation must be compatible with the System*", Coplien and Harrison's, 2004).

This is exactly what happens with COBOL organisations.

If we have a 3-tier system - frontend, backend and database - chances are, we will find a frontend team, a backend team and a database team inside the organisation. The system mirrors itself back on the organisation.

We see this with long lived software in long lived organisations. It might be a bit expensive. It might not be the most efficient way of working. But, hey, it works and that is fine as long as it allows us to continue.

Where all problems start is when management decides to reorganise things. They send one of those layers to another country, or they decide we do not need a database team - the database is done, isn't it? -, or management decides to reorganise the organisation in such a way that it is not compatible anymore with the architecture. However, the software will not allow that. It will reassert itself on the organisation.

> We reorganised,
>
> but the system didn’t get the memo 🤷
>
> -- a CTO, from [Conway's Law Doesn't Apply to Rigid Designs](https://verraes.net/2022/05/conways-law-vs-rigid-designs/), Mathias Verraes, 2022

With long-lived, rigid systems, we cannot just re-organise. Because of the *Homomorphic Force*. This structure preserving mapping. The force creates a structure. But the force also preserves the structure. Over time, the system will try to reassert itself on the organisation. Both sides are going push on each other.

This is where the *Inverse Conway’s Manoeuvre* falls short or more precisely, where people have the wrong expectations about the Inverse Conway’s Manoeuvre. We only have to reorganise and all of our problems will be solved. That is simply not true. This will clearly not happen. Especially not with rigid, long-lived systems because of exactly that *Reverse Conway’s Law*.

That is exactly the reality of mature organisations with legacy, long-lived systems. Yet, for leaders not aware of this physical reality, who assume they can "just" re-organise teams without rearchitecting the systems, it becomes a fatal trap.

## The Inverse Conway's Manoeuvre: The Greenfield Assumption

> ... organizations should evolve their team and organizational structure to achieve the desired architecture.
>
> – Nicole Forsgren, PhD et al., [Accelerate](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648), 2018

The Inverse Conway's Manoeuvre … is still an interesting concept, though. Introduced in 2010 by the folks from ThoughtWorks, Johnny LeRoy and Matt Simons.

> Dysfunctional organizations tend to create dysfunctional applications. [...] In what could be termed an “inverse Conway maneuver”, you may want to begin by breaking down silos that constrain the team’s ability to collaborate effectively.
>
> – Jonny LeRoy and Matt Simons, [Dealing with creaky legacy platforms](http://jonnyleroy.com/2011/02/03/dealing-with-creaky-legacy-platforms/), 2010

Before organising teams and defining the structure of the organisation, we should have a clear understanding of which software architecture we would like to achieve. It all starts from the system architecture ("*The Organisation must be compatible with the System*", Coplien and Harrison, 2004). The system architecture drives the organisation to ensure the organisation stays aligned with the system.

This works for greenfield or flexible systems. Because the organisational structure defines the possible system designs at our disposal.

However, this cannot work for long-lived, rigid systems in mature organisations because of the [*Reverse Conway’s Law*](#the-reverse-conways-law-the-legacy-reality). We cannot simply reorganise. Once the system design matured, the system becomes long-lived and gained expressions in couplings that constrain, the system design imposes itself on the organisational design. Now it is the system that is a force on our organisation. This closes the option space for designing our organisation.

Here is the nuance. The Inverse Conway's Manoeuvre is often sold as a universal silver bullet ("just re-org into feature teams or product teams"), when in truth it only works for greenfield or highly decoupled software products. In long-lived, legacy systems, applying this naively leads straight into the wall. This "*Greenfield Assumption*" warns of the danger, the delusion, of applying a greenfield technique as a blanket solution without doing the hard work of redesigning systems.

Having said that, in the case of greenfield, or flexible, highly decoupled systems, we should ...

Architect the organisation to architect the system ("*The System is isomorphic to the Organisation*", Yourdon and Constantine, 1979). The organisation creates the software design.

> Organisational design is system design!
>
> – Allan Kelly’s Corollary, [Continuous Delivery and Conway’s Law]({% post_url 2021-05-13-continuous-delivery-and-conways-law-allan-kelly %}), 2014

> the very act of organizing a design team means that certain design decisions have already been made, explicitly or otherwise.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

> Team assignments are the first draft of the architecture.
>
> – Michael Nygard, [Release It!](https://app.thestorygraph.com/books/1bd756aa-7a60-4af1-a407-6311f9741421), 2007

This means two things:

- first, if we want separate modules, we need separate teams.

  If we have two distinct pieces of functionality, we should separate them into two distinct teams that produce two separate modules. Each team can optimise around its own module. Which reconfirms Parnas' Information Hiding (1972): separate teams can work independently on different modules.

  Conversely, if we ram two teams together, we find the modules and the functionalities become intertwined. Which reconfirms Baldwin et al (2012). when comparing open source with closed source.

- second, collective code ownership leads to more integrated teams and code.

  This might be a good thing, or this might be a bad thing.

  If we want the code to be more separated, because we have two distinct pieces of functionality, we separate the teams.

  Although, if we have lots and lots of layers, lots and lots of superfluous objects, we might be better off to bring the code together, and bring the people together. This will reflect in the software design.

But the inverse is also true!

Drafting a system architecture is already designing the structure of the organisation ("*The Organisation must be compatible with the System*", Coplien and Harrison, 2004). This is exactly what the *Inverse Conway Manoeuvre* is all about.

> Conway’s Law also kicks in if we take an initial guess at the system decomposition, allocate subsystems to teams, and sally forth–the team boundaries will tend to become boundaries within the system.
>
> -- Ruth Malan, [Conway’s Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

## The Complexity Boundary: Viewing the Law Through the Lens of Cynefin

Before we can even apply the [Inverse Conway's Manoeuvre](#the-inverse-conways-manoeuvre-the-greenfield-assumption), we first need to understand in which domain we are. Are we a Simple, Complicated or Complex or Chaotic domain. Strategies change according to the domain.

With greenfield systems, there is a relation between cause and effect. We are in the Simple or Complicated domain. It is somehow predictable, but not necessarily self evident. We can draft an ideal system design and organise teams accordingly around it ([Inverse Conway's Manoeuvre](#the-inverse-conways-manoeuvre-the-greenfield-assumption)). If our initial design was not right, at first, because the organisation is young, it should be somehow flexible, therefore malleable, and team organisation should easily adapt to the new system design. The decision model is *sense - analyse - respond*.

When organisations matured, have long-lived rigid systems, we are in the Complex domain. Organisation and system have hidden couplings, and historical team baggage. We cannot simply apply an ordered top-down reorganisation and expect the system to magically redesign and decouple ("*We reorganised but the system did not get the memo*", Matthias Verraes, 2022). This is hard, time-consuming work. Cause and effect are only obvious in hindsight, with unpredictable, emergent outcomes. Here, the decision model is *probe - sense - respond* rather than executing a big-bang re-org, that will naturally fail. We conduct safe-to-fail experiments instead of fail-safe designs. This naturally fits with the [Improvement Kata](https://public.websites.umich.edu/~jmondisa/TK/The_Improvement_Kata.html), a continuous improvement framework for introducing large-scale organisational changes.

## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}) - How the worlds of organisation and product design observed the same thesis independently.
- [Validation: The Research & Reality Check]({% post_url 2026-06-20-beyond-shades-of-conways-law-validation %}) - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- **Mechanics: The Mathematical & Geometrical Shades** - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- **Strategy: Reversing the Law** - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: Conway's Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Bibliography

- [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968
- [On the Criteria To Be Used in Decomposing Systems into Modules](https://www.win.tue.nl/~wstomv/edu/2ip30/references/criteria_for_modularization.pdf), Parnas, 1972
- [Structured Design](https://www.goodreads.com/book/show/946145.Structured_Design), Edward Yourdon and Larry L. Constantine, 1979
- [Organisational patterns of agile software development](https://www.goodreads.com/book/show/756250.Organizational_Patterns_of_Agile_Software_Development), James Coplien & Neil Harrison, 2004
- [Release It!](https://app.thestorygraph.com/books/1bd756aa-7a60-4af1-a407-6311f9741421), Michael Nygard, 2007
- [Conway’s Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [Dealing with creaky legacy platforms](http://jonnyleroy.com/2011/02/03/dealing-with-creaky-legacy-platforms/), Jonny LeRoy and Matt Simons, 2010
- [Exploring the Duality between Product and Organizational Architecture: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf), Baldwin, MacCormack, Rusnak, 2012
- [Continuous Delivery and Conway’s Law]({% post_url 2021-05-13-continuous-delivery-and-conways-law-allan-kelly %}), Allan Kelly, 2014
- [Accelerate](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648), Nicole Forsgren, PhD et al., 2018
- [Conway's Law Doesn't Apply to Rigid Designs](https://verraes.net/2022/05/conways-law-vs-rigid-designs/), Mathias Verraes, 2022
- [Cynefin]({% post_url 2023-12-29-cynefin-framework-dave-snowden %}), Dave Snowden
- [The Improvement Kata](https://public.websites.umich.edu/~jmondisa/TK/The_Improvement_Kata.html), Mike Rother

