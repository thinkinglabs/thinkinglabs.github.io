---
layout: article
title: "Beyond the Shades of Conway's Law - Validation: The Research & Reality Check"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/shades-of-conways-law/sketchplanations-conways-law.jpg
---

Over the years, Conway's Law has resurfaced as a guiding principle to organise teams. Yet, many people still hesitate to accept the idea. It is only a hypothesis. Melvin Conway did not provide any proof when publishing the thesis. However, in the meantime, a good deal of academic research was performed to turn the thesis into a law.

---

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

## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- **Foundations: The Origin & The Mirroring Principle** - How the worlds of organisation and product design observed the same thesis independently.
- **Validation: The Research & Reality Check** - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- **Mechanics: The Mathematical & Geometrical Shades** - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- **Strategy: Reversing the Law** - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: The Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Bibliography

- [The Misalignment of Product Architecture and Organizational Structure in Complex Product Development](http://users.ece.utexas.edu/~perry/education/382v-s08/papers/sosa.pdf), Sosa et al, 2004
- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo 2006
- [The Impact of Misalignment of Organization Structure and Product Architecture on Quality in Complex Product Development](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=5553ae01b690837f755cd2c91fa6a4b7fdec6345), Gokpinar et al, 2007
- [Exploring the Duality between Product and Organizational Architecture: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf), Baldwin, MacCormack, Rusnak, 2012
