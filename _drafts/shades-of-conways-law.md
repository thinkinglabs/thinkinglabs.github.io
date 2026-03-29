---
layout: article
title: Shades of Conway's Law
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/shades-of-conways-law/conways_law_cornet.png
---

Over the years, numerous people paraphrased [Conway's Law](https://www.melconway.com/Home/Committees_Paper.html) in varying different ways. Every paraphrase brings new insights about the consequences and implications. Sometimes they give the impression they contradict each other. However, in the end, they all come to the same conclusion. By times, this can be particularly confusing in interpreting Conway's Law and its significance. In this article, we will go deeper in the numerous declinations and their implications.

---

This is a revised version of the original [Shades of Conway's Law article from 2021]({% post_url 2021-05-07-shades-of-conways-law %}).

---

Back in 1968, Melvin Conway formulated the following hypothesis:

> Organisations which design systems are constrained to produce designs which are copies of the communication structures of these organisations.
>
> -- Melvin Conway, [How do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

![Conway's Law, Credit Tomasz Tunguz — Venture Capitalist at RedPoint](/images/shades-of-conways-law/conways_law_cornet.png)
<center><i>Source: <a href="https://empathy.guru/2018/10/14/im-not-the-only-person-interested-in-conways-law/">I’m Not the Only Person Interested in Conway’s Law</a>, Chuck Pezeshki</i></center><br/>

Essentially, this means, the organisation and the system keep each other in balance. Modifying the organisation will have an impact on the system. Modifying the system will have consequences for the organisation. Not considering that will cause friction in the organisation or the system. That may have dramatic consequences from a design point of view.

To be competitive as an organisation in the market, and to effectively design the right thing our customers expect us to deliver, we better understand and take advantage of this.

Note that when Melvin Conway mentions a system he really means this in the brought sense. This is not limited to only software or IT systems. This can be buildings, planes, machinery, vehicles, but also engines or public transportation systems, communication systems, …, anything.

## The Mirroring Principle

Interestingly, around the same time various people from different communities made a similar observation as Melvin Conway did. Later, this became known as the **Mirroring Principle**.

It is, however, not clear whether all these people were aware of each other and knew they made observations alike.

This was mainly concentrated around two communities:

- Organisation Design: the people around organisation design and organisations as complex systems, with a focus on designing organisations for efficient task completion.
- Product Design: the people from product design and products as complex systems, with the cornerstone on designing products to execute tasks efficiently.

### Organisation Design

In Organisation Design we have:

- 1967: James D. Thompson with [Organizations in Action](https://app.thestorygraph.com/books/25918476-f7e4-40de-b00b-7566a26632c4)
- 1974: Jay R. Galbraith with [Organization Design: An Information Processing View](http://strategy.sjsu.edu/www.stable/pdf/Galbraith,%20J%20R,%201974,%20Interfaces.%204%20pp%2028-36.pdf)

> ... differences in technical functions, or technologies, cause significant differences among organisations ...
>
> -- Thompson, Organizations in Action, 1967, p12

When reading Thompson I realised that Thompson was foundational for organisation design. Before Thompson there were two lines of thoughts:

*Organisations as closed systems*. Which assumes all elements and processes of interest are internal to the organisation. The idea here is to limit uncertainty as much as possible and thus to eliminate the influence of its environment. Think Taylorism, looking for the one best way to organise a task. This is standard factory production line systems.

*Organisations as open systems*. We cannot think of the organisation alone without its surrounding environment. The organisation structure and behaviour are affected by environmental influences. The organisation must be an adaptive system that tries to survive its environment.

According to Thompson **an organisation is not either closed or open, it is both**. The internal technical core, the production component of the organisation is closed. We want to shield this off from the influence of the environment. But at the boundaries, the organisation must attend and adapt to changes in the environment. Therefore, it has to be open to environmental signals. As such, at its boundaries, it is an open system.

> ... the greater the task uncertainty, the greater the amount of information that must be processed among decision makers during task execution ...
>
> This is the problem of organisation design ...
>
> As the amount of uncertainty increases [...] the organisation must adopt integrating mechanisms ...
>
> -- Galbraith, Organization Design: An Information Processing View, 1974

Galbraith introduces the following proposition:

The greater the uncertainty of the task, the more information decision makers need to process during the task execution, to achieve a given level of performance.

If the task is well understood prior to performing it, much of the activity can be preplanned. However, if it is not understood, then much more knowledge need to be acquired during the task execution.

This sounds like the simple and complex domain first identified by Emery and Trist, [The Causal Texture of Organizational Environments](http://www.moderntimesworkplace.com/archives/ericsess/sessvol3/GEMTRCAUp53.pdf) in 1965, and later popularised by Dave Snowden with the [Cynefin framework](https://en.wikipedia.org/wiki/Cynefin_framework) in 1999.

The effect of uncertainty is that it limits our ability to preplan. Therefore, **the variations in organisational forms are variations in the strategies to increase our ability to preplan**, and so **increase our ability to manage uncertainty**. Executing a task, thus, becomes an organisation design problem.

To solve this problem, Galbraith suggests four strategies:

- Creation of Slack Resources
- Creation of Self-Contained Tasks
- Investment in Vertical Information Systems
- Creation of Lateral Relationships

### Product Design

In Product Design we have:

- 1964: Christopher Alexander with [Notes on the Synthesis of Form](https://app.thestorygraph.com/books/3bec9938-fb40-4616-b2c6-ab2d4de650ea)
- 1972: D.L. Parnas with [On the criteria to be used in Decomposing Systems into Modules](https://www.win.tue.nl/~wstomv/edu/2ip30/references/criteria_for_modularization.pdf)

> We may therefore picture the process of form-making as the action of a series of subsystems, all interlinked, yet sufficiently free of one another to adjust independently in a feasible amount of time.
>
> -- Alexander, Notes on the Synthesis of Form, 1964, p41

Notes on the Synthesis of Form is all about how to optimise the process of design, i.e. the process of inventing physical things. In a way, we try to reduce the gap between the designer’s small capacity and the great size of their task.

According to Alexandre, every design problem starts with an effort to achieve fitness between the form and its context. The *form* is the solution to the design problem. The *context* defines the design problem. Fitness means, we try to adapt the form, the solution, to its context, the problem definition.

No complex adaptive system will succeed in adapting, in a reasonable amount of time, unless the adaption happens subsystem by subsystem, where each subsystem is relatively independent from each other.

Therefore, we may picture the process of form-making, i.e. designing, as the action of a series of subsystems. Now, that works because the cycles of correction and recorrection, which occur during adaptation, are restricted to one subsystem at a time.

In the end, **it is easier to cope with complexity when it is decomposed into a series of linked sub-problems**.

Parnas comes to a similar conclusion.

> ... separate groups would work on each module with little need for communication ...
>
> -- Parnas, On the criteria to be used in Decomposing Systems into Modules, 1972

Parnas is interesting as *On the criteria to be used in Decomposing Systems into Modules* is the number one paper from a list of top-10 papers everyone in the software industry should read.

```plain
Software Industry Top-10 papers

 1. On the criteria to be used in decomposing systems into modules
 2. A note on distributed computing
 3. The next 700 Programming Languages
 4. Can programming be liberated from the von Neumann style
 5. Reflections on trusting trust
 6. Lisp, Good news bad news how to win big
 7. An experimental evaluation of the assumption of independence in multi-version programming
 8. Arguments and results
 9. A Laboratory For Teaching object-oriented thinking
10. Programming as an experience, the inspiration for self
```

Parnas introduces the concept of information hiding as a means for controlling complexity. Each module in a technical system is informationally isolated from the other modules. Therefore, allowing separate teams to work independently from each other on different modules.

**Information hiding is a fundamental principle underlying the mirroring principle**.

Both communities, Organisation Design and Product Design, take their inspiration from Herbert A. Simon, [The Architecture of Complex Systems](https://www2.econ.iastate.edu/tesfatsi/ArchitectureOfComplexity.HSimon1962.pdf) in 1962.

> My thesis has been that one path to the construction of a non-trivial theory of complex systems is by way of a theory of hierarchy.
> ...
> In their dynamics, hierarchies have a property, near-decomposability, … [It] simplifies the description of a complex system, and makes it easier to understand ...
>
> Simon, The Architecture of Complex Systems, 1962

Simon introduces the idea of partitioning a complex problem, complex systems in a series of linked sub-problems to contain complexity. Very much alike Thompson's organisation is both closed and open, Galbraith's organisation strategies to manage uncertainty, Alexander's decomposition of the process of form-making, i.e. designing, in sub-problems and Parnas' concept of information hiding.

### The Mirroring Hypothesis

This means we can express the *Mirroring Principle* in terms of a structural correspondence between two networks, one technical and one organisational. There will be, therefore a mapping from technical modules to design teams.

All of the above was summarised in the 2016 paper [The Mirroring Hypothesis](https://www.hbs.edu/ris/Publication%20Files/Colfer%20Baldwin%20Mirroring%20Hypothesis%20Ind%20Corp%20Change-2016_8aa320ff-6aa6-42ef-b259-d139012faaf6.pdf) from Baldwin and Colfer.

They concluded that **the organisational ties in firms will correspond to the technical dependencies in the work being performed**.

> The mirroring hypothesis predicts that organizational ties within a project, firm, or group of firms (e.g., communication, collocation, employment) will correspond to the technical dependencies in the work being performed.
>
> The Mirroring Hypothesis, Baldwin and Colfer, 2016

In recent years, this idea of the *Mirroring Principle* and *Conway’s Law* has resurfaced as a kind of guiding principle on how to organise teams. However, there is still a good deal of people that are fairly sceptical about this because it is just a hypothesis. In the end, Melvin Conway did not provide a proof for the law.

There is a little story behind Melvin Conway's paper that he explains on his website. Conway send the paper to the Harvard Business Review. They rejected it on the grounds that there was no proof for the thesis. He then submitted it to Datamation, a major IT magazine at that time, which published it in April 1968.

## The Research

However, in the meantime there has been some academic research done that support Melvin Conway's thesis.

In 2004, Sosa et al. published a study that looked at the design process of a commercial aircraft jet engine, the PW4098, at Pratt & Whitney.

They looked at organisational problems that exist at the boundaries of the components inside the jet engine, i.e. whether there is a misalignment between the design team boundaries and system component interfaces.

There conclusion was ...

> ... we provide empirical evidence that product ambiguity exists, and it is more likely to be present across organizational and system boundaries
>
> -- [The Misalignment of Product Architecture and Organizational Structure in Complex Product Development](http://users.ece.utexas.edu/~perry/education/382v-s08/papers/sosa.pdf), Sosa et al, 2004

Meaning, there is great likelihood that some of the system component interfaces are not covered by team interactions, which can lead to major setbacks involving significant rework that can be extremely costly. In the paper they refer to two such major setbacks during the design of that specific jet engine.

What they are essentially saying is: **If there is a misalignment between the organisation and the product architecture there will be problems**.

In 2006, Cataldo et al. explored the consequences of congruence on the speed and efficiency of software development work inside a single software project. They investigated the impact of misalignment.

They found out that tasks were completed more rapidly when the patterns of communication between team members were congruent with the patterns of interdependency between components.

> **Congruence** between coordination requirements and coordination activities shortened development time.
>
> -- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo et al, 2006

Basically the research says, **if teams are aligned with the components they work on, teams are more efficient**.

In 2007, Gokpinar et al. conducted a study that looked at the design of cars in the automotive industry

They concluded that mismatches between product architecture and organisational structure are positively associated with quality problems.

> Our results suggest that misalignment of the design organization with the product architecture negatively affects product quality”
>
> -- [The Impact of Misalignment of Organization Structure and Product Architecture on Quality in Complex Product Development](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=5553ae01b690837f755cd2c91fa6a4b7fdec6345), Gokpinar et al, 2007

Once more, **if there is a misalignment between organisation and product architecture, there will be problems**.

In 2012, we have the first empirical evidence for the software industry provided by the research paper [Exploring the Duality between Product and Organizational Architectures: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf) from again Baldwin et al.

One of their findings was: software products tend to mirror the structure of the organisation in which they are developed.

> We find strong evidence to support the hypothesis that a product’s architecture tends to mirror the structure of the organization in which it is developed.
>
> -- Exploring the Duality between Product and Organizational Architectures: A Test of the “Mirroring” Hypothesis, Baldwin, MacCormack and Rusnak, 2012

![Conway's Law Sketchplanations](/images/shades-of-conways-law/sketchplanations-conways-law.jpg)
<center><i>Source: Sketchplanations <a href="https://sketchplanations.com/conways-law">https://sketchplanations.com/conways-law</a></i></center><br/>

To proof this hypothesis, they compared open source with closed source software. Based on the idea that the open source communities are loosely coupled organisations by design because contributors have diverse goals, belong to different organisations, work in different geographical locations and time zones, and have no formal authority to guide development activities. Whereas, closed source organisations are more tightly-coupled, because they consist of smaller, co-located teams that share common goals, that are dedicated full-time to projects and have formal decision-making authority to guide development.

The approach of the study was based on comparing the architectures of open source and closed source software products that have similar functions and are of a similar size. They identified five software categories: financial management, word processing, spreadsheet, operating system and database. For each category they selected an open source and a closed source software product.

Because commercial firms are a bit reluctant to share their code base, especially for research comparing with “free” equivalents, the researches did not always have a closed source codebase at their disposal. So when a commercial product was not available, they had to fall back on products that began their life as closed source and later were open sourced. In that case, they looked at the first release of the open source version.

So they ended up comparing:

- For financial management: GnuCash vs MyBooks
- For word processing: Abiword vs StarWriter
- For spreadsheets: Gnumeric vs StarCalc
- For operating systems: Linux vs Solaris
- For databases: MySQL vs Berkeley DB

The paper primarily explores whether organisations with distinctly different forms develop products with distinctly different architectures.

The outcome of the study was that a loosely-coupled organisation, like open source, will tend to develop products with a more modular architecture than tightly-coupled organisations like commercial firms. Which confirms the information hiding concept from Parnas, which allows individual isolated contributors to work independently.

## Shades of Conway's Law

Over the decades several people paraphrased Conway's Law in diverse ways. Every rewording comes with new insights regarding the consequences and implications of the Law.

But, sometimes they give the impression to contradict each other. Although, in the end, they all come to the same conclusion. Which be times can be particularly confusing.

In 1979, Yourdon and Constantine rephrased Conway's Law more firmly ...

**Systems are isomorphic to the Organisation.**

> The structure of any system designed by an organization is **isomorphic** to the structure of the organization.
>
> -- Edward Yourdon and Larry L. Constantine, [Structured Design](https://www.goodreads.com/book/show/946145.Structured_Design), 1979, p363

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

> 2\. MATHEMATICS
>
> an isomorphism is a **structure-preserving mapping** between two structures of the same type that can be reversed by an inverse mapping.
>
> source: Wikipedia

It is a structure-preserving mapping between two structures.

> 3\. MATHEMATICS
>
> an isomorphism is a **one-to-one** correspondence (mapping) between two sets that preserves binary relationships between elements of the sets.
>
> source: Britannica

Or, it is a one-to-one correspondence between two structures.

This indicates that we can not ever have an organization where two or more components of a system correspond to a single team in the organization, because of the one-to-one relation.

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
> -- Eric Raymond, [The New Hacker's Dictionary (3rd ed.)](https://www.gutenberg.org/files/3008/3008-h/3008-h.htm), 1996, p124

> **congruent** adjective
>
> 1\.  in agreement or harmony.
>
> 2\. GEOMETRY
>
> identical in form; coinciding exactly when superimposed
>
> source: Oxford Languages

This reinforces the idea of the Homomorphic force, the structure preserving mapping between the structure of the organisation and the structure of the system architecture.

Conway exemplifies the homomorphic force in his paper using a COBOL and ALGOL compiler example.

A contract research organization consisting of eight people was asked to design a COBOL and an ALGOL compiler. After some initial estimates about difficulty and time, they assigned five people to the COBOL compiler and three people to the ALGOL compiler. The resulting COBOL compiler ran in five phases, the ALG0L compiler ran in three.

This example is better known as Eric Raymond's "*If you have 4 groups working on a compiler, you’ll get a 4-pass compiler*".

That said, the larger an organization becomes, the less flexibility the organisation shows, therefore the more pronounced are the effects of the homomorphic force. However, these effects of the homomorphic force can also be expressed differently ... with the **Thousand Module Effect**.

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
> -- James Coplien & Neil Harrison, [Organisational patterns of agile software development](https://www.goodreads.com/book/show/756250.Organizational_Patterns_of_Agile_Software_Development), 2004, p246

> **compatible** adjective
>
> (of two things) able to exist or occur together without problems or conflict.
>
> source: Oxford Languages

This is interesting because Yourdon and Constantine said the system is isomorphic to the organisation, so the organisation drives the system design. Where here Coplien and Harrison conclude the opposite: It is more likely that the system architecture drives the organisation. If they are not in harmony, the system will impose a structure on the organisation.

![The System imposes a structure on the Organisation](/images/shades-of-conways-law/system-drives-the-org.jpg)

Whereas Raymond stays in the middle: organisation and system are congruent, in agreement or in harmony, identical in form and shape and size.

But wait, this whole contradiction between Yourdon and Constantine, on the one end, and Coplien and Harrisson, on the other end, can also be interpreted differently.

At the start, it is the organisation that imposes its will on the system architecture, Yourdon and Constantine.

> If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

The organisation is a force that acts on the (initial) design of a system, i.e. the greenfield design. The organisation structure limits the possible system designs that are at our disposal. This is also what Conway says at the start of his paper. The very act of organising means that certain design decisions have already been made.

> “the very act of organizing a design team means that certain design decisions have already been made”
>
> -- Melvin Conway, How Do Committees Invent?, 1968

But once the system grows, the design matures and the system becomes long-lived; gained expressions in couplings that constrain,it is now the system design that is a force on the organisation, Coplien and Harrison.

This closes the option space we have for designing the structure of our organisation.

This brings us to the Reverse Conway’s Law

## Reverse Conway's Law

> Organisations with long-lived systems will adopt a structure modelled on the system.
>
> -- Allan Kelly, [Continuous Delivery and Conway’s Law](https://thinkinglabs.io/notes/2021/05/13/continuous-delivery-and-conways-law-allan-kelly.html), 2014
