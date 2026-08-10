---
layout: article
title: "Beyond the Shades of Conway's Law - Strategy: Reversing the Law"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
---

At the outset of a greenfield system, the organisation drives the initial design. The very act of organising teams implicitly means that some system architecture decisions have been made. Once the system grows, the design matures in couplings that constrain, it reverses this pressure. The system now begins to impose itself back on the organisation, narrowing our strategic options to structure the organisation.

---

## Reverse Conway's Law

> Organisations with long-lived systems will adopt a structure modelled on the system.
>
> -- Allan Kelly's Reverse Conway's Law, [Continuous Delivery and Conway’s Law](https://thinkinglabs.io/notes/2021/05/13/continuous-delivery-and-conways-law-allan-kelly.html), 2014

For long-lived organisations with long-lived systems, it is the system that imposes itself on the organisation ("*The Organisation must be compatible with the System*", Coplien and Harrison's).

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

## Inverse Conway's Manoeuvre

> ... organizations should evolve their team and organizational structure to achieve the desired architecture.
>
> – Nicole Forsgren, PhD et al., [Accelerate](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648), 2018

The Inverse Conway's Manoeuvre … is still an interesting concept, though. Introduced in 2010 by the folks from ThoughtWorks, Johnny LeRoy and Matt Simons.

> Dysfunctional organizations tend to create dysfunctional applications. [...] In what could be termed an “inverse Conway maneuver”, you may want to begin by breaking down silos that constrain the team’s ability to collaborate effectively.
>
> – Jonny LeRoy and Matt Simons, [Dealing with creaky legacy platforms](http://jonnyleroy.com/2011/02/03/dealing-with-creaky-legacy-platforms/), 2010

Before organising teams and defining the structure of the organisation, we should have a clear understanding of which software architecture we would like to achieve. It all starts from the system architecture ("*The Organisation must be compatible with the System*", Coplien and Harrison). The system architecture drives the organisation to ensure the organisation stays aligned with the system.

This works for greenfield or flexible systems. Because the organisational structure defines the possible system designs at our disposal.

However, it cannot work for long-lived, rigid systems because of the [*Reverse Conway’s Law*](#reverse-conways-law). We cannot simply reorganise. Once the system design matured, the system becomes long-lived and gained expressions in couplings that constrain, the system design imposes itself on the organisational design. Now it is the system that is a force on our organisation. This closes the option space for designing our organisation.

Having said that, in the case of greenfield, or flexible systems we should ...

Architect the organisation to architect the system ("*The System is isomorphic to the Organisation*", Yourdon and Constantine). The organisation creates the software design.

> Organisational design is system design!
>
> – Allan Kelly’s Corollary, [Continuous Delivery and Conway’s Law](https://thinkinglabs.io/notes/2021/05/13/continuous-delivery-and-conways-law-allan-kelly.html), 2014

> the very act of organizing a design team means that certain design decisions have already been made, explicitly or otherwise.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

> Team assignments are the first draft of the architecture.
>
> – Michael Nygard, [Release It!](https://app.thestorygraph.com/books/1bd756aa-7a60-4af1-a407-6311f9741421), 2007

This means two things:

- first, if we want separate modules, we need separate teams.

  If we have two distinct pieces of functionality, we should separate them into two distinct teams that produce two separate modules. Each team can optimise around its own module. Which reconfirms Parnas' Information Hiding: separate teams can work independently on different modules.

  Conversely, if we ram two teams together, we find the modules and the functionalities become intertwined. Which reconfirms Baldwin et al. when comparing open source with closed source.

- second, collective code ownership leads to more integrated teams and code.

  This might be a good thing, or this might be a bad thing.

  If we want the code to be more separated, because we have two distinct pieces of functionality, we separate the teams.

  Although, if we have lots and lots of layers, lots and lots of superfluous objects, we might be better off to bring the code together, and bring the people together. This will reflect in the software design.

But the inverse is also true!

Drafting a system architecture is already designing the structure of the organisation ("*The Organisation must be compatible with the System*", Coplien and Harrison). This is exactly what the *Inverse Conway Manoeuvre* is all about.

> Conway’s Law also kicks in if we take an initial guess at the system decomposition, allocate subsystems to teams, and sally forth–the team boundaries will tend to become boundaries within the system.
>
> -- Ruth Malan, [Conway’s Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008
