---
layout: article
title: "Beyond the Shades of Conway's Law - Mechanics: The Mathematical & Geometrical Shades"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/shades-of-conways-law/conways-law-consequence.jpg
---

Why does our code feel like a mirror of our department meetings? Over the decades several people paraphrased Conway's Law in diverse ways. Every rewording comes with new insights regarding the consequences and implications of the Law. Sometimes, they give the impression to contradict each other. Although, in the end, they all come to the same conclusion. Which by times can be particularly confusing.

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

Isomorphic: being the same or similar in structure (or shape or form).

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

This indicates that we cannot ever have an organisation where two or more components of a system correspond to a single team in the organisation, because of the one-to-one relation.

This implies, that **no single team could be responsible for more than one service**.

Now, this is a forceful expression of the Law, way stronger than Conway’s own formulation. Because Melvin Conway refers in his paper to homomorphism, which is a more relaxed version of isomorphism.

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

Homomorphism is a structure preserving mapping between two structures. But it is **not a one-to-one mapping**.

This is what makes Conway’s Law. Underlying Conway’s Law is the **Homomorphic Force**.

It is the power of one system, one structure to bring itself about in another system or structure. The force creates the same structure. The force also preserves the structure.

This suggests that if we have 4 teams maintaining a compiler, we will end up with a 4-pass compiler. Over time we find that the 4-pass compiler asserts itself back on the organisation. The organisation cannot have a single team maintaining the compiler anymore. They need four teams.

That is why COBOL organisations find it very difficult to do anything approaching agile because their organisation is now in harmony with the software. The organisation designed the software. Now, the software imposes a structure on the organisation. If we try to change the organisation, the software will not let it happen.

Because this is not a one-to-one mapping, a homomorphism from an organisation to a system does not require that every part of the organization is mapped onto a system component.

This means, **a single team can be responsible for more than one service**.

In 1996, Eric Raymond, known from his essay [The Cathedral and the Bazaar](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/index.html) (1999). In this essay, he already argued what Baldwin (2012) confirmed: open source software is inherently more modular than commercial software.

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

Which aligns with Cataldo's investigation (2006) on the consequences of congruence on the speed of change: "*Congruence between coordination requirements and coordination activities shortened development time*".

This reinforces the idea of the Homomorphic force, the structure preserving mapping between the structure of the organisation and the structure of the system architecture.

When Raymond says that organisation and system, i.e. teams and software or IT systems, are congruent, it triggers the geometrical question: *Which specific architecture view is the organisation design with its communication channels forcing, in the end, into existence?*. Which architectural view mirrors the organisation's architecture?

"System design" is not flat, not a single diagram. It is multidimensional. Philippe Kruchten (1995) established in his ["4+1" View Model](https://arxiv.org/pdf/2006.04975), that a system design covers multiple specific dimensions — different views on the system architecture:

- The *Logical View* — describes the object model.
- The *Process View* — capture the runtime behaviour, the higher level processes and tasks, non-functional requirements such as performance, concurrency, distribution.
- The *Physical View* — maps the system onto the hardware infrastructure, the physical locations and network topology.
- The *Development View* — organises the code into modules, packages, build artefacts and resulting team allocation.
- The *Scenarios (The "+1")* as a fifth view — depicts the most important functional requirements tying all four views together.

Consequently, the **Homomorphic Force does not hit every architectural view in the same way**.

The *Development View*, and to some extent the *Logical View*, is where the Homomorphic Force manifests profoundly. These views touch on the organisation of code, repository structures, modules and packages. Module ownership drives team allocation and distribution of work. It impacts organisational design through team allocation. Therefore, it mirrors the organisation chart.

By contrast, the *Process View*, seems less involved. It does not mirror the formal organisation chart, as it deals with processes, execution, concurrency, distribution and runtime communication. It documents the operational communication channels. Then again, once processes are assigned to teams, it defines how teams interact "operationally". The *Process View* then becomes the informal, true on-the-ground team organisation and therefore the informal organisation chart. In that case, it will be deeply impacted by the Homomorphic Force.

Similarly, the *Physical View*, expresses organisational realities. Shared infrastructure creates team dependencies, while once hardware or cloud infrastructure is allocated to distinct processes with isolated cloud deployments, it echos autonomous teams and directly reflects the organisation chart.

Kruchten provides the geometrical lens for Conway's Law: the Homomorphic Force shapes the code organisation (the *Development View*) and silently informs the operational interactions (the *Process View*).

Conway exemplifies the homomorphic force in his paper using a COBOL and ALGOL compiler example.

A contract research organisation consisting of eight people was asked to design a COBOL and an ALGOL compiler. After some initial estimates about difficulty and time, they assigned five people to the COBOL compiler and three people to the ALGOL compiler. The five-person team produced a COBOL compiler that ran in five phases, and the three-person team produced a 3-phase ALGOL compiler.

Eric Raymond summarised the example as "*If you have 4 groups working on a compiler, you’ll get a 4-pass compiler*". Or, *Tom Cheatham's Amendment of Conway's Law*: "*If a group of N persons implements a COBOL compiler, there will be N-1 passes. Someone in the group has to be the manager.*" (source: The New Hacker's Dictionary, 3rd ed.)

Yet, a more recent expression of the ALGOL and COBOL compiler example goes as follows:

> In capsule form, Conway’s Law implies that if you have, say, three teams, chances are you will end up with three subsystems whether you intend to or not.
>
> When the cost of communication goes up we, often unconsciously, organize our work to minimize it.
>
> If it’s easier for me to share a vision and communicate within my local team, we end up producing something cohesive that is a bit detached from other teams’ work.
>
> -— Michael Feathers, [Twitter, Reddit and Conway's Law](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), 2017

The larger an organisation becomes, the less flexibility the organisation shows. Therefore, the more pronounced are the effects of the Homomorphic Force because of the **Thousand Module Effect**.

Yourdon and Constantine mention this story ...

An engineer tasked to write an application on a small 12-bit minicomputer. They estimated the work to be six months to complete, which was deemed unacceptable by their manager. When the manager assigned another engineer to the project, in the hope to speed things up, the original engineer responded: "*But, two engineers will not fit in there!*"

> an informal observation that if 1,000 programmers are assigned to develop a system before a structural design has been completed, then there will be at least 1,000 modules in the resulting system.
>
> -- Edward Yourdon and Larry L. Constantine, Structured Design, 1979, p363

Because two engineers will not fit in one module. Or, in Kruchten's terms, when scaling derails, the Homomorphic Force causes an explosion in the *Development View* — the Thousand Module Effect.

This is a variation on **Mealy’s Law**.

> There is an incremental person who, when added to a project, consumes more energy [...] than [they] make available. Thus, beyond a certain point, adding [people] slows progress in addition to increasing the cost.
>
> -- Edward Yourdon and Larry L. Constantine, Structured Design, 1979, p363

Note: Mealy's Law is not very well known. Googling for it will return no results. However, the law expresses **Brooks’ Law**: "*Adding people to a late project makes it more late*" from the [Mythical Man-Month](https://app.thestorygraph.com/books/8215ee95-e164-4036-8959-764cc42caaf8).

According to Galbraith (1973), the greater the uncertainty, the more information needs to be processed during task execution.

> **Uncertainty** is the difference between the amount of information required to perform a task and the amount of information already possessed by the organization. Thus the amount of task uncertainty is a result of a combination of a specific task and a specific organization.
>
> -- Galbraith, [Designing Complex Organizations](https://app.thestorygraph.com/books/c746ca36-a5d7-4c2a-995c-6330c4d363bd), 1973, p5 

As already hinted in [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}), task uncertainty defines the strategies to design the organisation structure. When assigning 1.000 engineers to a task before a formal design, we are at absolute uncertainty. The simplest way to coordinate interdependent tasks is to specify the expected behaviour in advance using rules. The virtue of rules is to reduce treating each situation as new, as such cutting communication and decision making. When the organisation encounters a new situation it has not faced before, the problem is raised (as an exception) to the manager who (probably) has the information to make the decision. We rely on the hierarchy of authority, the org-chart. However, the organisation's org-chart, the hierarchical communication channels, have only a finite capacity to process information. As more exceptions are raised upwards, the hierarchy becomes overloaded. Serious delays develop.

The *Thousand Module Effect* happens because the information can only be discovered during the system design. Decisions have to be made and remade whenever new information is discovered. The hierarchy cannot process the massive amount of information produced by 1.000 engineers designing the system. The organisation has to adopt strategies to reduce the information and must cut the number of communication lines. Hence, engineers are assigned to individual, localised modules. Since "*two engineers cannot fit into one module*" we end up splitting the codebase into 1.000 modules. The system architecture becomes a reflection of the organisation structure.

Interestingly, Melvin Conway already observed the same five years before Galbraith and seven years before the Mythical Man-Month. It is there, in the last paragraph of Conway’s paper.

> There is need for a philosophy of system design management which is **not based on the assumption that adding manpower simply adds to productivity**.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

To then conclude the paragraph ... with the observation that some basic question should be answered regarding the value of people and communication before evolving our system-building techniques with confidence.

> [This] promises to unearth basic questions about value of resources and techniques of communication which will need to be answered before our system-building technology can proceed with confidence.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

Look how everything is tied together. We evolved from the Homomorphic Force, over the Thousand Module Effect, which landed us with Mealy's Law, the Mythical-Man Month and Brooks' Law, back to Conway's paper.

Galbraith provides the organisational logic for why adding more people to a late project makes it more late. We are adding more communication links. If the organisation does not adopt strategies to reduce the amount of information (Slack Resources, Self-Contained Task) or increase the information handling capacity (Vertical Information Systems, Lateral Relationships), the communication overhead grows faster than the ability to produce system designs. The incremental person consumes more communication and alignment energy than they produce technical energy to design systems.

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

But wait, this whole contradiction between Yourdon and Constantine, on the one end (organisation drives architecture), and Coplien and Harrison, on the other end (architecture constrains organisation), can also be interpreted differently.

At the start, it is the organisation that imposes its will on the system architecture, Yourdon and Constantine's "*Systems are isomorphic to the Organisation*".

> If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

The organisation is a force that acts on the (initial) design of a system, i.e. the greenfield design. The organisation structure limits the possible system designs that are at our disposal. This is also what Conway says at the start of his paper.

> “the very act of organizing a design team means that certain design decisions have already been made”
>
> -- Melvin Conway, How Do Committees Invent?, 1968

But once the system grows, the design matures and the system becomes long-lived; gained expressions in couplings that constrain, it is now the system design that is a force on the organisation, Coplien and Harrison's "*The Organisation must be compatible with the System*".

This closes the option space we have for designing the structure of our organisation.

Finally, it brings us to the greenfield and mature systems duality, ultimately leading to the **Reverse Conway’s Law** which we will cover in part 4 *Strategy: Reversing the Law*.

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
- [Designing Complex Organizations](https://app.thestorygraph.com/books/c746ca36-a5d7-4c2a-995c-6330c4d363bd), Jay R. Galbraith, 1973
- [Structured Design](https://www.goodreads.com/book/show/946145.Structured_Design), Edward Yourdon and Larry L. Constantine, 1979
- [Architectural Blueprints — The "4+1" View Model of Software Architecture](https://arxiv.org/pdf/2006.04975), Philippe Kruchten, 1995
- [The New Hacker's Dictionary (3rd ed.)](https://www.gutenberg.org/files/3008/3008-h/3008-h.htm), Eric Raymond, 1996
- [Organisational patterns of agile software development](https://www.goodreads.com/book/show/756250.Organizational_Patterns_of_Agile_Software_Development), James Coplien & Neil Harrison, 2004
- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo 2006
- [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [Exploring the Duality between Product and Organizational Architecture: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf), Baldwin, MacCormack, Rusnak, 2012
- [Twitter, Reddit and Conway's Law](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), Michael Feathers, 2017
- [Isomorphism vs Homomorphism](https://hachyderm.io/@cornazano/111241418996567374), Michael McCliment
