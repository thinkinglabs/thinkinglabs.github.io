---
layout: article
title: "Beyond the Shades of Conway's Law - Mechanics: The Mathematical & Geometrical Shades"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
---

Over the decades several people paraphrased Conway's Law in diverse ways. Every rewording comes with new insights regarding the consequences and implications of the Law. Sometimes, they give the impression to contradict each other. Although, in the end, they all come to the same conclusion. Which by times can be particularly confusing.

---

In 1979, Yourdon and Constantine rephrased Conway's Law more firmly ...

**Systems are isomorphic to the Organisation.**

> The structure of any system designed by an organization is **isomorphic** to the structure of the organization.
>
> -- Edward Yourdon and Larry L. Constantine, [Structured Design](https://app.thestorygraph.com/books/764ff13c-a03a-4ed0-8b34-c538575c5b08), 1979, p363

> **isomorphic** adjective
>
> 1\. corresponding or similar in form and relations.
>
> source: Oxford Languages

Isomorphic: being the same or similar in structure (or shape or form)

It pushes the idea that any system design produced by an organisation will be shaped according to the organisation structures. This means the organisation drives the system design.

![The Organisation drives the System design](/images/shades-of-conways-law/org-drives-the-system.jpg)

This has an interesting consequence: If two subsystems are designed by two different design teams who do not communicate with each other. By definition, the subsystems will not communicate with each other.

![Conway's Law's consequence](/images/shades-of-conways-law/conways-law-consequence.jpg)

But there is also a mathematical definition for isomorphism.

It is a structure-preserving mapping between two structures.

> 2\. MATHEMATICS
>
> an isomorphism is a **structure-preserving mapping** between two structures of the same type that can be reversed by an inverse mapping.
>
> source: Wikipedia

Or, it is a one-to-one correspondence between two structures.

> 3\. MATHEMATICS
>
> an isomorphism is a **one-to-one** correspondence (mapping) between two sets that preserves binary relationships between elements of the sets.
>
> source: Britannica

This indicates that we can not ever have an organisation where two or more components of a system correspond to a single team in the organisation, because of the one-to-one relation.

This implies, that **no single team could be responsible for more than one service**.

Now, this is a forceful expression of the Law, way stronger than Conway’s own formulation Because, in his paper, Melvin Conway refers to homomorphism, which is a more relaxed version of isomorphism.

> Speaking as a mathematician might, we would say that there is a homomorphism from the linear graph of a system to the linear graph of its design organization.
>
> -- Melvin Conway, [How do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

> **homomorphism** noun
>
> MATHEMATICS
>
> a structure-preserving map between two structures.
>
> source: Wikipedia

A structure preserving mapping between two structures. But it is **not a one-to-one mapping**.

This is what makes Conway’s Law. Underlying Conway’s Law is the **Homomorphic Force**.

It is the power of one system, one structure to bring itself about in another system or structure. The force creates the same structure. The force also preserves the structure.

This means if we have 4 teams maintaining a compiler, we will end up with a 4-pass compiler. Over time we find that the 4-pass compiler asserts itself back on the organisation. The organisation cannot have a single team maintaining the compiler anymore. They need four teams.

That is why COBOL organisations find it very difficult to do anything approaching agile because their organisation is now in harmony with the software. The organisation designed the software. Now, the software imposes a structure on the organisation. If we try to change the organisation, the software will not let it happen.

Because this is not a one-to-one mapping, a homomorphism from an organisation to a system does not require that every part of the organization is mapped onto a system component.

This means, **a single team can be responsible for more than one service**.

In 1996, Eric Raymond, known from his essay [The Cathedral and the Bazaar](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/index.html), 1999. In this essay, he already argued what Baldwin confirmed: open source software is inherently more modular than commercial software.

Anyway, in 1996, Raymond restated the law as follows ...

**Organisation and Systems are congruent**.

> The organization of the software and the organization of the software team will be congruent.
>
> -- Eric Raymond, [The New Hacker's Dictionary, 3rd ed.](https://www.gutenberg.org/files/3008/3008-h/3008-h.htm), 1996, p124

> **congruent** adjective
>
> 1\. in agreement or harmony.
>
> 2\. GEOMETRY
>
> identical in form; coinciding exactly when superimposed
>
> source: Oxford Languages

This reinforces the idea of the Homomorphic force, the structure preserving mapping between the structure of the organisation and the structure of the system architecture.

Conway exemplifies the homomorphic force in his paper using a COBOL and ALGOL compiler example.

A contract research organisation consisting of eight people was asked to design a COBOL and an ALGOL compiler. After some initial estimates about difficulty and time, they assigned five people to the COBOL compiler and three people to the ALGOL compiler. The five-person team produced a COBOL compiler that ran in five phases, and the three-person team produced a 3-phase ALGOL compiler.

Eric Raymond summarised the example as "*If you have 4 groups working on a compiler, you’ll get a 4-pass compiler*". Or, there is also *Tom Cheatham's Amendment of Conway's Law*: "*If a group of N persons implements a COBOL compiler, there will be N-1 passes. Someone in the group has to be the manager.*" (source: The New Hacker's Dictionary, 3rd ed.)

Yet, a more recent expression of the ALGOL and COBOL compiler example goes as follows:

> In capsule form, Conway’s Law implies that if you have, say, three teams, chances are you will end up with three subsystems whether you intend to or not.
>
> When the cost of communication goes up we, often unconsciously, organize our work to minimize it.
>
> If it’s easier for me to share a vision and communicate within my local team, we end up producing something cohesive that is a bit detached from other teams’ work.
>
> -— Michael Feathers, [Twitter, Reddit and Conway's Law](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), 2017

Having said that, the larger an organisation becomes, the less flexibility the organisation shows, therefore the more pronounced are the effects of the homomorphic force. However, these effects of the homomorphic force can also be expressed differently ... with the **Thousand Module Effect**.

Yourdon and Constantine mention this story ...

An engineer tasked to write an application on a small 12-bit minicomputer. They estimated the work to be six months to complete, which was deemed unacceptable by their manager. When the manager assigned another engineer to the project, in the hope of speeding things up, the original engineer responded: but two engineers will not fit in there!

> an informal observation that if 1,000 programmers are assigned to develop a system before a structural design has been completed, then there will be at least 1,000 modules in the resulting system.
>
> -- Edward Yourdon and Larry L. Constantine, Structured Design, 1979, p363

If we assign 1000 engineers to the design of a system before a formal design happened, chances are we will end up with 1000 modules in the resulting system because two engineers will not fit in one module.

This is a variation of **Mealy’s Law**.

> There is an incremental person who, when added to a project, consumes more energy [...] than [they] make available. Thus, beyond a certain point, adding [people] slows progress in addition to increasing the cost.
>
> -- Edward Yourdon and Larry L. Constantine, Structured Design, 1979, p363

Now, Mealy's Law is totally new to me. I never heard about it before. When we google for it, we will not find anything.

Mealy’s Law is just an example of the [Mythical Man-Month](https://app.thestorygraph.com/books/8215ee95-e164-4036-8959-764cc42caaf8) or **Brooke’s Law**: "*Adding people to a late project makes it more late*".

But look, what is even more interesting, is that Melvin Conway already made the exact same observation seven years before the Mythical Man-Month. It is there, in the last paragraph of Conway’s paper.

> There is need for a philosophy of system design management which is **not based on the assumption that adding manpower simply adds to productivity**.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

There is need for a philosophy of system design management which is not based on the assumption that adding manpower simply adds to productivity.

But wait, there is more. Melvin Conway concludes the paragraph ... with the observation that some basic question should be answered regarding the value of people and communication before evolving our system-building techniques with confidence.

> [This] promises to unearth basic questions about value of resources and techniques of communication which will need to be answered before our system-building technology can proceed with confidence.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

Look how everything is tied together. We evolved from the Homomorphic Force, over the Thousand Module Effect, which landed us with Mealy's Law, the Mythical-Man Month and Brooke's Law, back to Conway's paper.

In 2004, Coplien and Harrison reformulated Conway’s Law by stating ...

**The Organisation must be compatible with the System**.

> If the parts of an organization (e.g., teams, departments, or subdivisions) do not closely reflect the essential parts of the product, or if the relationships between organizations do not reflect the relationships between product parts, then the project will be in trouble ...
>
> Therefore: Make sure the organization is **compatible** with the product architecture.
>
> -- James Coplien & Neil Harrison, [Organisational patterns of agile software development](https://app.thestorygraph.com/books/cf9f2d89-0c44-43e6-923a-6625808bcc71), 2004, p246

> **compatible** adjective
>
> (of two things) able to exist or occur together without problems or conflict.
>
> source: Oxford Languages

This is interesting because Yourdon and Constantine said the system is isomorphic to the organisation, so the organisation drives the system design. Where here Coplien and Harrison conclude the opposite: It is more likely that the system architecture drives the organisation. If they are not in harmony, the system will impose a structure on the organisation.

![The System imposes a structure on the Organisation](/images/shades-of-conways-law/system-drives-the-org.jpg)

Whereas Raymond stays in the middle: organisation and system are congruent, in agreement or in harmony, identical in form and shape and size.

But wait, this whole contradiction between Yourdon and Constantine, on the one end, and Coplien and Harrisson, on the other end, can also be interpreted differently.

At the start, it is the organisation that imposes its will on the system architecture, Yourdon and Constantine's "*Systems are isomorphic to the Organisation*".

> If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

The organisation is a force that acts on the (initial) design of a system, i.e. the greenfield design. The organisation structure limits the possible system designs that are at our disposal. This is also what Conway says at the start of his paper. The very act of organising means that certain design decisions have already been made.

> “the very act of organizing a design team means that certain design decisions have already been made”
>
> -- Melvin Conway, How Do Committees Invent?, 1968

But once the system grows, the design matures and the system becomes long-lived; gained expressions in couplings that constrain, it is now the system design that is a force on the organisation, Coplien and Harrison's "*The Organisation must be compatible with the System*".

This closes the option space we have for designing the structure of our organisation.

This brings us to the Reverse Conway’s Law

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
- [Structured Design](https://www.goodreads.com/book/show/946145.Structured_Design), Edward Yourdon and Larry L. Constantine, 1979
- [The New Hacker's Dictionary (3rd ed.)](https://www.gutenberg.org/files/3008/3008-h/3008-h.htm), Eric Raymond, 1996
- [Organisational patterns of agile software development](https://www.goodreads.com/book/show/756250.Organizational_Patterns_of_Agile_Software_Development), James Coplien & Neil Harrison, 2004
- [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [Twitter, Reddit and Conway's Law](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), Michael Feathers, 2017
- [Isomorphism vs Homomorphism](https://hachyderm.io/@cornazano/111241418996567374), Michael McCliment
