---
layout: article
title: "Beyond the Shades of Conway's Law - Mechanics: The Mathematical & Geometrical Shades"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/shades-of-conways-law/conways-law-consequence.jpg
---

Over the decades, several people paraphrased Conway's Law in diverse ways. Every rewording brings new insights about the consequences and implications of the Law. Sometimes, they give the impression of contradicting each other. Although in the end, they all come to the same conclusion, which, at times, can be particularly confusing.

---

## Mathematics: Isomorphism vs Homomorphism

In 1979, Yourdon and Constantine rephrased Conway's Law more firmly ...

**Systems are isomorphic to the Organisation.**

> The structure of any system designed by an organization is **isomorphic** to the structure of the organization.
>
> -- Edward Yourdon and Larry L. Constantine, [Structured Design](https://app.thestorygraph.com/books/764ff13c-a03a-4ed0-8b34-c538575c5b08), 1979, p. 363

> **isomorphic** adjective
>
> 1\. corresponding or similar in form and relations.
>
> source: Oxford Languages

Isomorphic: being the same or similar in structure (or shape or form).

It promotes the idea that any system design produced by an organisation will be shaped according to the organisation's structures. This means the organisation drives the system design.

![The Organisation drives the System design](/images/shades-of-conways-law/org-drives-the-system.jpg)

This has an interesting consequence: If two subsystems are designed by two different design teams who do not communicate with each other, by definition, the subsystems will not communicate with each other.

![Conway's Law's consequence](/images/shades-of-conways-law/conways-law-consequence.jpg)

But there is also a mathematical definition for isomorphism: a structure-preserving mapping between two structures.

> 2\. MATHEMATICS
>
> an isomorphism is a **structure-preserving mapping** between two structures of the same type that can be reversed by an inverse mapping.
>
> source: Wikipedia

Or, a one-to-one correspondence between two structures.

> 3\. MATHEMATICS
>
> an isomorphism is a **one-to-one** correspondence (mapping) between two sets that preserves binary relationships between elements of the sets.
>
> source: Britannica

This indicates that we cannot ever have an organisation where two or more components of a system correspond to a single team in the organisation, due to the one-to-one relation. This implies that **no single team could be responsible for more than one service**.

Now, this is a forceful expression of the Law, way stronger than Conway’s own formulation. Melvin Conway referenced homomorphism in his paper, which is a more relaxed version of isomorphism.

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

A homomorphism is a structure-preserving mapping between two structures. But it is **not a one-to-one mapping**.

This is what makes Conway’s Law. Underlying Conway’s Law is the **Homomorphic Force**: the power of one system, one structure to bring itself about in another system or structure. The force creates the same structure and preserves it over time.

This suggests that if we have four teams maintaining a compiler, we will end up with a four-pass compiler. Over time, we find that the four-pass compiler asserts itself back on the organisation. The organisation can no longer have a single team maintaining the compiler anymore; they need four teams.

That is why COBOL organisations find it very difficult to do anything approaching agile: their organisation is now in harmony with the software. The organisation designed the software, and now the software imposes its structure back on the organisation. If we try to change the organisation, the software will not let it happen.

Because this is not a one-to-one mapping, a homomorphism from an organisation to a system does not require that every part of the organisation be mapped onto a system component. This means, **a single team can be responsible for more than one service**.

## Geometry: Congruence & Architectural Views

In 1996, Eric Raymond, known from his essay [The Cathedral and the Bazaar](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/index.html) (1999), restated the law. In this essay, he argued what Baldwin (2012) confirmed: open source software is inherently more modular than commercial software.

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

This aligns with Cataldo's investigation (2006) on the consequences of congruence on the speed of change: "*Congruence between coordination requirements and coordination activities shortened development time*". It reinforces the idea of the *Homomorphic Force* — the structure-preserving mapping between the structure of the organisation and the structure of the system architecture.

When Raymond says that organisation and system, i.e. teams and software systems, are congruent, it triggers a geometrical question: *Which specific architecture view is the organisation design, with its communication channels, forcing, in the end, into existence?*. Which architectural view mirrors the organisation's architecture?

"System design" is not flat, not a single diagram. It is multidimensional. Philippe Kruchten (1995) established in his ["4+1" View Model](https://arxiv.org/pdf/2006.04975) that a system design covers multiple specific dimensions, i.e. different views on the system architecture:

- The *Logical View* — describes the object model.
- The *Process View* — captures the runtime behaviour, concurrency, the higher level processes and task execution, and non-functional requirements such as performance, and distribution.
- The *Physical View* — maps the system onto the hardware infrastructure, physical locations and network topology.
- The *Development View* — organises code into modules, packages, build artefacts and resulting team allocation.
- The *Scenarios (The "+1")* as a fifth view — depicts the primary functional requirements tying all four views together.

Consequently, the **Homomorphic Force does not hit every architectural view in the same way**.

The *Development View* (and to some extent the *Logical View*) is where the *Homomorphic Force* manifests most profoundly. These views touch code organisation, repository structures, modules and packages. Module ownership drives team allocation and work distribution, mirroring the formal org-chart.

By contrast, the *Process View* initially seems less involved because it deals with execution, concurrency, distribution and runtime communication. Therefore, it does not mirror the formal org-chart, but documents the operational communication channels. However, once processes are assigned to teams, it defines how teams interact "operationally". The *Process View* then becomes the informal, true on-the-ground team organisation and therefore the informal organisation chart. In that case, it is deeply impacted by the *Homomorphic Force*.

Similarly, the *Physical View* expresses organisational realities: shared infrastructure creates cross-team dependencies, while an isolated per-team cloud environment echoes autonomous teams. In that case, the *Physical View* directly reflects the org-chart.

Kruchten provides the geometrical lens for Conway's Law: the *Homomorphic Force* shapes code organisation (the *Development View*) and silently informs the operational interactions (the *Process View*).

Conway exemplified the *Homomorphic Force* in his paper using a COBOL and ALGOL compiler example. A contract research organisation consisting of eight people was asked to design a COBOL and an ALGOL compiler. After some initial estimates about difficulty and time, they assigned five people to the COBOL compiler and three people to the ALGOL compiler. The five-person team produced a five-phase COBOL compiler; the three-person team produced a three-phase ALGOL compiler.

Eric Raymond summarised the example as: "*If you have 4 groups working on a compiler, you’ll get a 4-pass compiler*". Tom Cheatham added his amendment: "*If a group of N persons implements a COBOL compiler, there will be N-1 passes. Someone in the group has to be the manager.*" (Raymond, 1996)

A more recent expression of this dynamic comes from Michael Feathers:

> In capsule form, Conway’s Law implies that if you have, say, three teams, chances are you will end up with three subsystems whether you intend to or not.
>
> When the cost of communication goes up we, often unconsciously, organize our work to minimize it.
>
> If it’s easier for me to share a vision and communicate within my local team, we end up producing something cohesive that is a bit detached from other teams’ work.
>
> -— Michael Feathers, [Twitter, Reddit and Conway's Law](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), 2017

## Mechanics of Scale: Uncertainty, Information Overload & Decision Latency

The larger an organisation becomes, the less malleable it remains. Consequently, the effects of the *Homomorphic Force* become far more pronounced due to the **Thousand Module Effect**.

Yourdon and Constantine share this observation ...

An engineer tasked with writing an application on a small 12-bit minicomputer. They estimated the work to be six months to complete, which was deemed unacceptable by their manager. When the manager assigned a second engineer to the project, in the hope of speeding things up, the original engineer responded: "*But, two engineers will not fit in there!*"

> an informal observation that if 1,000 programmers are assigned to develop a system before a structural design has been completed, then there will be at least 1,000 modules in the resulting system.
>
> -- Edward Yourdon and Larry L. Constantine, Structured Design, 1979, p.363

Because two engineers cannot fit in one module. In Kruchten's terms, when scaling derails, the *Homomorphic Force* causes an architectural explosion in the *Development View* caused by the Thousand Module Effect.

This observation is a variation on **Mealy’s Law**.

> There is an incremental person who, when added to a project, consumes more energy [...] than [they] make available. Thus, beyond a certain point, adding [people] slows progress in addition to increasing the cost.
>
> -- Edward Yourdon and Larry L. Constantine, Structured Design, 1979, p.363

While Mealy's Law is rarely cited today (googling it will return no results), it directly expresses **Brooks’ Law**: "*Adding people to a late project makes it more late*" from [The Mythical Man-Month](https://app.thestorygraph.com/books/8215ee95-e164-4036-8959-764cc42caaf8).

According to Jay Galbraith (1973), the greater the task uncertainty, the more information needs to be processed during task execution.

> **Uncertainty** is the difference between the amount of information required to perform a task and the amount of information already possessed by the organization. Thus, the amount of task uncertainty is a result of a combination of a specific task and a specific organization.
>
> -- Galbraith, [Designing Complex Organizations](https://app.thestorygraph.com/books/c746ca36-a5d7-4c2a-995c-6330c4d363bd), 1973, p.5

Task uncertainty dictates strategies for designing an organisation. When assigning 1.000 engineers to a task before a formal design, we are at absolute uncertainty.

To coordinate interdependent tasks, organisations default to rules and hierarchical authority to specify in advance the expected behaviour. The virtue of rules is to reduce the need to treat each situation as new, therefore cutting communication and decision-making.

When the organisation encounters a new situation it has not faced before, the problem is raised (as an exception) to the manager who (probably, maybe, hopefully) has the information to make the decision. We rely on the hierarchy of authority, the org-chart. However, the hierarchical communication channels only have a finite capacity to process information. As more exceptions are raised upwards, the hierarchy becomes overloaded, and severe bottlenecks emerge, resulting in significant delays.

The *Thousand Module Effect* occurs because the information can only be discovered incrementally during task execution, i.e. designing the system. Decisions have to be made and remade whenever new information emerges. The hierarchy cannot process the massive communication volume produced by 1.000 engineers designing the system. To survive, the organisation has to adopt information reduction strategies. It cuts communication lines and isolates engineers into individual, localised modules. Since "*two engineers cannot fit into one module*", the codebase fragments into 1.000 pieces. System architecture becomes a reflection of the organisational coping mechanisms.

Melvin Conway observed this exact dynamic five years before Galbraith and seven years before Brooks' The Mythical Man-Month, in the last paragraph of Conway’s paper.

> There is need for a philosophy of system design management which is **not based on the assumption that adding manpower simply adds to productivity**.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

Conway concluded his paper by emphasising that some basic questions regarding the value of people and communication must be answered before evolving system-building techniques with confidence.

> [This] promises to unearth basic questions about value of resources and techniques of communication which will need to be answered before our system-building technology can proceed with confidence.
>
> -- Melvin Conway, How Do Committees Invent?, 1968

Galbraith provides the organisational logic for Brooks' Law: "*Adding more people to a late project makes it more late*". Adding more people creates exponential growth in communication links. Unless the organisation adopts strategies to reduce information load (Slack Resources, Self-Contained Task) or increase information processing capacity (Vertical Information Systems, Lateral Relationships), the communication overhead grows faster than the ability to produce system designs. The incremental person consumes more communication and alignment energy than they produce technical energy to design systems.

Alexander Skvortcov (2024) provides modern empirical validation for Galbraith's overloaded hierarchy model. His research demonstrates that **organisation design directly impacts decision-making latency, which ensures IT project success**. He confirms Galbraith's finding that structural organisation choices — specifically self-contained tasks and lateral relation channels (i.e. horizontal communication channels such as Communities of Practice) — influence information flow and thus the decision-making speed.

Skvortcov identifies three critical factors affecting decision-making latency:

- *People and Culture* — appointing and empowering the right people to build trust and safety is more vital than any structured rigidity, together with leadership competence. This corresponds to Jim Collins' findings on what makes a great organisation in [Good to Great](https://app.thestorygraph.com/books/1771dbe4-16a3-4316-83a1-ed2b21984bc9) regarding "*Level 5 Leadership*" and "*First Who ... Then What*".
- *Correctness of Organisation* — clear alignment with and understanding of business goals allows teams to make localised decisions. This requires that the correct people are employed, again "*First Who ... Then What*". A lack of alignment creates friction and inflates decision latency.
- *Customer Focus* — decision-makers require a good understanding of customer needs. Therefore, the need for senior Product Managers with a clear product vision who can say "no" to random requests, sidestepping endless discussions and re-evaluations of direction.

Decision Latency Theory asserts "*The value of the interval is greater than the quality of the decision*" (Johnson, 2018). It is more important to make frequent wrong decisions than not to decide at all. High-frequency decision-making enables organisations to reverse bad choices quickly as new information emerges. Skvortcov's expert panel agreed that placing decision-making as close as possible to the people who are doing the work minimises latency. This underscores the importance of autonomy to cut decision latency. However, they cautioned that autonomy without alignment or understanding of customer needs degrades overall decision quality.

This aligns with the Standish Group's CHAOS Report, which attributes project success to *Good Sponsor*, *Good Team*, *Good Place*, and *Short Decision Latency* (more on this in [Validation: The Research & Reality Check]({% post_url 2026-06-20-beyond-shades-of-conways-law-validation%}#the-industry-reality-check-1995-2020)).

## Temporal Duality: Compatibility

In 2004, Coplien and Harrison reformulated Conway’s Law around compatibility:

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

This appears to contradict Yourdon and Constantine. While Yourdon and Constantine argue that the system is isomorphic to the organisation. So the organisation drives the system design. Where Coplien and Harrison claim the opposite, it is more likely that the system architecture drives the organisation. If they are not in harmony, the system will impose a structure on the organisation.

![The System imposes a structure on the Organisation](/images/shades-of-conways-law/system-drives-the-org.jpg)

Whereas Raymond holds the middle ground: organisation and system are congruent — in agreement, in harmony, identical in form, and shape and size.

This apparent contradiction — Yourdon and Constantine, organisation drives architecture vs Coplien and Harrison, architecture constrains organisation — resolves when we introduce **time**:

**Greenfield System**: At first, the organisation imposes its will on the system architecture (*Systems are isomorphic to the Organisation*, Yourdon and Constantine).

> If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

The organisation is a force that acts on the (initial) design of a system, i.e. the greenfield design. The organisation structure limits the possible system designs that are at our disposal. This is also what Conway says at the start of his paper.

> “the very act of organizing a design team means that certain design decisions have already been made”
>
> -- Melvin Conway, How Do Committees Invent?, 1968

**Mature Systems**: Once the system grows, the design matures, hardens into legacy code and becomes long-lived; gained expressions in couplings that constrain, causing the system design to act now as a force on the organisation (*The Organisation must be compatible with the System*, Coplien and Harrison).

This technical coupling closes the option space we have for designing the structure of our organisation.

This greenfield vs. mature system duality leads to the **Reverse Conway’s Law**, which we will cover in Part 4: *Strategy: Reversing the Law*.

## Acknowledgements

Special thanks to [Alexander Skvortcov](https://www.linkedin.com/in/askvortcov/) for promptly sharing his master's thesis, "*Impact of Organisation Design on Decision-Making Latency regarding IT projects*", and reviewing this third part of the series.

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
- [Good to Great](https://app.thestorygraph.com/books/1771dbe4-16a3-4316-83a1-ed2b21984bc9), Jim Collins, 2001
- [Organisational patterns of agile software development](https://www.goodreads.com/book/show/756250.Organizational_Patterns_of_Agile_Software_Development), James Coplien & Neil Harrison, 2004
- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo 2006
- [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [Exploring the Duality between Product and Organizational Architecture: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf), Baldwin, MacCormack, Rusnak, 2012
- [Twitter, Reddit and Conway's Law](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), Michael Feathers, 2017
- [Decision Latency Theory: It is All About the Interval](https://www.standishgroup.com/products/project-resolution-benchmark), Jim Johnson, The Standish Group, 2018
- [Isomorphism vs Homomorphism](https://hachyderm.io/@cornazano/111241418996567374), Michael McCliment, 2023
- [Chaos Report — why this study about IT project management is so unique](https://thestory.is/en/journal/chaos-report/) about the CHAOS Report 2020, Radek, The Story, 2024
- Impact of Organisation Design on Decision-Making Latency regarding IT projects, Alexander Skvortcov, 2024
