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

Back in 1968, Melvin Conway formulated the following hypothesis:

> Organisations which design systems are constrained to produce designs which are copies of the communication structures of these organisations.
>
> -- [How do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968

![Conway's Law, Credit Tomasz Tunguz — Venture Capitalist at RedPoint](/images/shades-of-conways-law/conways_law_cornet.png)
<center><i>Source: <a href="https://empathy.guru/2018/10/14/im-not-the-only-person-interested-in-conways-law/">I’m Not the Only Person Interested in Conway’s Law</a>, Chuck Pezeshki</i></center><br/>

Essentially, this means, the organisation and the system keep each other in balance. Modifying the organisation will have an impact on the system. Modifying the system will have consequences for the organisation. Not considering that will cause friction in the organisation or the system. That may have dramatic consequences from a design point of view.

To be competitive as an organisation in the market, and to effectively design the right thing our customers expect us to deliver, we'd better understand and take advantage of this.

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
> – Organizations in Action, Thompson, 1967, p12

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
> -- Organization Design: An Information Processing View, Galbraith, 1974

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
> -- Notes on the Synthesis of Form, Alexander, 1964, p41

Notes on the Synthesis of Form is all about how to optimise the process of design, i.e. the process of inventing physical things. In a way, we try to reduce the gap between the designer’s small capacity and the great size of their task.

According to Alexandre, every design problem starts with an effort to achieve fitness between the form and its context. The *form* is the solution to the design problem. The *context* defines the design problem. Fitness means, we try to adapt the form, the solution, to its context, the problem definition.

No complex adaptive system will succeed in adapting, in a reasonable amount of time, unless the adaption happens subsystem by subsystem, where each subsystem is relatively independent from each other.

Therefore, we may picture the process of form-making, i.e. designing, as the action of a series of subsystems. Now, that works because the cycles of correction and recorrection, which occur during adaptation, are restricted to one subsystem at a time.

In the end, **it is easier to cope with complexity when it is decomposed into a series of linked sub-problems**.

Parnas comes to a similar conclusion.

> ... separate groups would work on each module with little need for communication ...
>
> -- On the criteria to be used in Decomposing Systems into Modules, Parnas, 1972

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
> The Architecture of Complex Systems, Simon, 1962

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

In 1979, Yourdon and Constantine rephrased Conway's Law more firmly.

**Systems are isomorphic to the organisation.**

> The structure of any system designed by an organization is isomorphic to the structure of the organization.
>
> -- [Structured Design](https://www.goodreads.com/book/show/946145.Structured_Design), Edward Yourdon and Larry L. Constantine, 1979, p363

> **isomorphic** adjective
>
> 1\. corresponding or similar in form and relations.
>
> source: Oxford Languages

Isomorphic: being the same or similar in structure (or shape or form)

It pushes the idea that any system design produced by an organisation will be shaped according to the organisation structures. This means the organisation drives the system design.

![The organisation drives the system design](/images/shades-of-conways-law/org-drives-the-system.jpg)

This has an interesting consequence: If two subsystems are designed by two different design teams who do not communicate with each other. By definition, the subsystems will not communicate with each other.

![Conway's Law's consequence](/images/shades-of-conways-law/conways-law-consequence.jpg)

But there is also a mathematical definition for isomorphism.

> 2\. MATHEMATICS
>
> an isomorphism is a structure-preserving mapping between two structures of the same type that can be reversed by an inverse mapping.
>
> source: Wikipedia

It is a structure-preserving mapping between two structures.

> 3\. MATHEMATICS
>
> an isomorphism is a one-to-one correspondence (mapping) between two sets that preserves binary relationships between elements of the sets.
>
> source: Britannica

Or, it is a one-to-one correspondence between two structures.

This indicates that we can not ever have an organization where two or more components of a system correspond to a single team in the organization, because of the one-to-one relation.

This implies, that **no single team could be responsible for more than one service**.

Now, this is a forceful expression of the Law, way stronger than Conway’s own formulation Because, in his paper, Melvin Conway refers to homomorphism, which is a more relaxed version of isomorphism.

> Speaking as a mathematician might, we would say that there is a homomorphism from the linear graph of a system to the linear graph of its design organization.
>
> -- [How do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968

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

This means, **a single team can be responsible for more than one services**.
