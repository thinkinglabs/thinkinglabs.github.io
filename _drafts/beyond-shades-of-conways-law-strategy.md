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

Before we can even apply the [Inverse Conway's Manoeuvre](#the-inverse-conways-manoeuvre-the-greenfield-assumption), we first need to understand the domain context. Using the Cynefin framework (Dave Snowden, 1999): Are we operating in a Clear, Complicated or Complex or Chaotic domain. Strategies change depending on the domain.

In greenfield or flexible, highly decoupled systems, cause and effect are related. We are in the *Complicated domain*. Cause and effect are somehow predictable, but not necessarily self evident. Here, we can draft an ideal system architecture and organise teams around it using the ([Inverse Conway's Manoeuvre](#the-inverse-conways-manoeuvre-the-greenfield-assumption)). At this stage, the organisation and the system are still malleable. The emerging system architecture influences the team structures. The organisation can still easily and quickly adapt to new system designs. The decision model here is *sense - analyse - respond*. Popular organisational pattern languages, such as [Team Topologies](https://teamtopologies.com/), thrive in this domain because team boundaries and software boundaries can be cleanly aligned by design.

However, when organisations mature, carry long-lived rigid systems, we enter the *Complex domain*. Here, the organisation and system are tightly coupled by decades of implicit decisions and historical baggage making the coupling mostly hidden, unnoticed for leadership. In that domain, we cannot simply execute an ordered top-down reorganisation — by moving boxes on an org-chart — and expect the system to magically redesign and decouple ("*We reorganised but the system did not get the memo*", Matthias Verraes, 2022).

Treating a Complex socio-technical system as if it were merely Complicated is a critical error. Cause and effect are only obvious in hindsight, producing unpredictable, emergent outcomes. The decision model in the Complex domain is *probe – sense – respond*. Rather than executing a big-bang reorganisation, that will naturally fail, anyway. We must run safe-to-fail experiments instead of fail-safe designs. This is hard, time-consuming work, where we might loose track of the objective. The [Improvement Kata](https://public.websites.umich.edu/~jmondisa/TK/The_Improvement_Kata.html) (Mike Rother, 2009) — a continuous improvement framework for introducing large-scale organisational changes — will help to incrementally redesign and decouple the system architecture while iteratively reshaping team interactions.

## Holistic Socio-Technical Alignment: Beyond Structural Tweaks

The failure of naive Inverse Conway Manoeuvres exposes a broader misunderstanding in management strategy: **organisational design is not merely shifting team boxes on an org-chart**.

In *Organization Design* (1977), Jay Galbraith formalised the **Star Model**, demonstrating that an organisation's effectiveness depends on the alignment of five distinct components:

1. **Strategy** — defines the direction and competitive advantage.
2. **Structure** — determines the location of decision-making power and team boundaries.
3. **Processes** — governs the flow of information and decision latency across structural boundaries.
4. **Rewards** — aligns individual and team incentives with organisational goals.
5. **People** — develops the competencies and leadership behaviors required to execute the strategy.

When leaders attempt an Inverse Conway Manoeuvre purely by changing team structures (moving people into "feature teams" or "stream-aligned teams"), they manipulate only one spoke of Galbraith's star. 

If the underlying **Processes** (budgeting cycles, governance gates, deployment pipelines) and **Information Flows** remain tied to legacy boundaries, the organisational information-processing capacity collapses. As Galbraith established in 1973, when task uncertainty overwhelms hierarchical channels, the organisation defaults to its path of least resistance. The *Homomorphic Force* of the legacy system reasserts itself, dragging the new team boundaries right back into alignment with the old software architecture.

To successfully reverse the Law, structural changes must be accompanied by changes in information channels, decision-making mandates, and technical architecture. Rearchitecting the system and rearchitecting the organisation are not two separate initiatives—they are two sides of the same socio-technical act.

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
- [Cynefin]({% post_url 2023-12-29-cynefin-framework-dave-snowden %}), Dave Snowden, 1999
- [Organisational patterns of agile software development](https://www.goodreads.com/book/show/756250.Organizational_Patterns_of_Agile_Software_Development), James Coplien & Neil Harrison, 2004
- [Release It!](https://app.thestorygraph.com/books/1bd756aa-7a60-4af1-a407-6311f9741421), Michael Nygard, 2007
- [Conway’s Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [The Improvement Kata](https://public.websites.umich.edu/~jmondisa/TK/The_Improvement_Kata.html), Mike Rother, 2009
- [Dealing with creaky legacy platforms](http://jonnyleroy.com/2011/02/03/dealing-with-creaky-legacy-platforms/), Jonny LeRoy and Matt Simons, 2010
- [Exploring the Duality between Product and Organizational Architecture: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf), Baldwin, MacCormack, Rusnak, 2012
- [Continuous Delivery and Conway’s Law]({% post_url 2021-05-13-continuous-delivery-and-conways-law-allan-kelly %}), Allan Kelly, 2014
- [Accelerate](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648), Nicole Forsgren, PhD et al., 2018
- [Conway's Law Doesn't Apply to Rigid Designs](https://verraes.net/2022/05/conways-law-vs-rigid-designs/), Mathias Verraes, 2022
