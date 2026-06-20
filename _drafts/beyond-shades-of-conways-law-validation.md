---
layout: article
title: "Beyond the Shades of Conway's Law - Validation: The Research & Reality Check"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/shades-of-conways-law/sketchplanations-conways-law.jpg
---

Moving beyond hunch and silencing the sceptics. Over the years, Conway's Law has resurfaced as a guiding principle to organise teams. Yet, many people still hesitate to accept the idea. Ultimately, it remains a hypothesis. Melvin Conway did not provide any proof when publishing the thesis. However, in the meantime, decades later, a good deal of academic research supports the thesis. Ultimately, Harvard and MIT researchers provided robust empirical validation for the hypothesis across the software industry, further confirmed by the CHAOS Report from the Standish Group, reinforcing *The Mirroring Principle* as an undeniable organisational reality.

---

Henderson and Clark observed in 1990 that established firms are unable to adopt architectural innovation because the architectural knowledge is embedded in the communication structures of the organisation, preventing them from adopting new designs.

> We show that architectural innovations destroy the usefulness of the architectural knowledge of established firms, and that since architectural knowledge tends to become embedded in the structure and information-processing procedures of established organizations, this destruction is difficult for firms to recognize and hard to correct. Architectural innovation therefore presents established organizations with subtle challenges that may have significant competitive implications.
>
> -- [Architectural Innovation: The Reconfiguration of Existing Product Technologies and the Failure of Established Firms](http://www.iot.ntnu.no/innovation/norsi-pims-courses/tushman/Handerson%20&%20Clark%20(1990).pdf), Henderson and Clark, 1990

"*Architectural innovation*" is defined as innovations that change the way product components are linked together, while leaving the core design concepts — and thus the basic knowledge underlying the components — untouched. That does not mean that components remain untouched. Often, architectural innovation is triggered by a change in a component that triggers new interactions and connections with other components.

The outcome is based on the analysis of 20 years of data (1962-1986) from the photolithographic alignment equipment industry, where four organisations subsequently took over market leadership thanks to an architectural innovation that the previous leader was unable to detect due to its organisational structure.

There has been growing evidence of numerous technical innovations that involved apparent modest changes to existing technology, but that had dramatic competitive consequences. In the mid-1950s, RCA developed a prototype for a portable radio receiver. It utilised technology that RCA mastered well. Yet, they did not pursue the idea. Until Sony, a small, relatively new company, entered the US market with portable radio receivers. RCA remained a follower. The case of Xerox, in the mid-1970s, although the inventor of the plain-paper copier, was, during eight years of missteps, unable to compete with competitors offering smaller, more reliable copiers. Xerox lost half of the market. For a more recent example, we look at the German car industry, which had trouble marketing electric cars until Tesla took over the market. Meanwhile, Audi closes its Belgian factory that produces the expensive electric SUV because of a market mismatch.

This inability to adopt architectural innovation happens because an organisation organises itself around its product's key components that make up the design. This results in communication channels between the design teams that reflect the organisation's knowledge about the critical interactions between these components. Thus, an organisation's communication channels embody the organisation's architectural knowledge that is critical to effective design.

The architectural knowledge is a mirror of the communication structures organised around the product being designed. Somehow, this is the knowledge parallel of Conway's thesis "*[Any] organisation which designs systems is constrained to produce designs which are copies of the communication structures of the organisation*". If communication structures dictate design (Conway), they also dictate what an organisation is capable of knowing (Henderson and Clark).

Henderson and Clark establish that, given how knowledge is organised in firms, learning about changes in the product architecture is unlikely to happen. It requires explicit management, or even a different organisation. To counter this, the authors suggest cross-functional teams as a possible response to the danger of architectural knowledge becoming embedded within tacit communication lines.

Because the communication channels are "frozen" around the old product architecture, the knowledge is also frozen; the organisation cannot distinguish or adjust to a possible new architecture reality, or even conceive a new design reality. This is Conway's Law working back over time (more on this in *Dynamics: Conway's Time Component*).

Recently, I was front-seat observing an organisation unable to run only a simple experiment, which would let them eventually discover a potential innovation, merely because of the structures in place.

## The Aircraft Engines/Automotive Validations (2004, 2007)

In 2004, Sosa et al. published a study that investigated the design process of a commercial aircraft jet engine, the PW4098, at Pratt & Whitney. They studied how design interfaces in the product architecture map onto communication patterns within the development organisation. More specifically, they explored whether organisational problems exist at the boundaries of the components inside the jet engine, i.e. whether a misalignment exists between the design team boundaries and system component interfaces.

According to Henderson and Clarke, architectural knowledge is embedded in the communication structures of organisations; therefore, organisations need to understand how they manage embedded knowledge. This is especially relevant when designing new products. In this context, system design interfaces are the primary sources of team interdependence, or at least, they should be. Meaning, when "*team i designs component i*" with a design interface between component i and j, there should be a corresponding technical interaction between team i and j. These are the expected cases. On the other hand, unmatched design interfaces and unmatched team interactions are unexpected. As it seems, these cases were largely ignored in previous research.

> However, we believe that considering these cases is important because their existence would indicate that not all known product-related interdependences are addressed by direct technical communication, and that technical communication (where not expected) may uncover undocumented product-related interdependences.
>
> -- [The Misalignment of Product Architecture and Organizational Structure in Complex Product Development](http://users.ece.utexas.edu/~perry/education/382v-s08/papers/sosa.pdf), Sosa et al, 2004

Eventually, the study concludes that ...

> ... we provide empirical evidence that product ambiguity exists, and it is more likely to be present across organizational and system boundaries
>
> -- [The Misalignment of Product Architecture and Organizational Structure in Complex Product Development](http://users.ece.utexas.edu/~perry/education/382v-s08/papers/sosa.pdf), Sosa et al, 2004

Meaning, that there is a great likelihood that some of the system component interfaces are not covered by team interactions, which can lead to major setbacks involving significant rework that can be extremely costly. The paper refers to two such major setbacks during the design of that specific jet engine.

What they are essentially saying here is: **If there is a misalignment between the organisation and the product architecture, there will be problems**.

In 2007, Gokpinar et al. conducted a study examining the design of cars in the automotive industry.

> [...] a key challenge for product development organizations is matching the organization to the product being developed. This involves two fundamental problems: (1) How to assign people to the parts and subsystems that make up the product, and (2) How to ensure that people communicate/collaborate effectively in the performance of design tasks.
>
> -- [The Impact of Misalignment of Organization Structure and Product Architecture on Quality in Complex Product Development](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=5553ae01b690837f755cd2c91fa6a4b7fdec6345), Gokpinar et al, 2007

The research defined a new metric *coordination deficit*, which quantifies mismatches between product architecture and organisation structure, and investigated the effect of coordination deficit on product quality.

They concluded that mismatches between product architecture and organisational structure are positively associated with quality problems.

> Our results suggest that misalignment of the design organization with the product architecture negatively affects product quality”
>
> -- [The Impact of Misalignment of Organization Structure and Product Architecture on Quality in Complex Product Development](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=5553ae01b690837f755cd2c91fa6a4b7fdec6345), Gokpinar et al, 2007

Once more, **if there is a misalignment between organisation and product architecture, there will be problems**.

## The Micro Software Validation (2006)

In 2006, Cataldo et al. investigated the consequences of congruence on the speed and efficiency of software development work inside a single software project. They investigated the impact of misalignment.

> This is particularly important in product development organizations which organize themselves around their products’ architectures because the main components of their products define the organization’s key sub-tasks.
>
> -- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo et al, 2006

This is important because, as architectural knowledge is embedded in the communication structures of organisations (Henderson and Clark, 1990), any minor changes to the product architecture can disrupt the organisation's ability to coordinate effectively.

Ultimately, Cataldo et al. found that tasks were completed more rapidly when the patterns of communication between team members were congruent with the patterns of interdependency between components.

> **Congruence** between coordination requirements and coordination activities shortened development time.
>
> -- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo et al, 2006

Fundamentally, the research indicates, **if teams are aligned with the components they work on, teams are more efficient**.

## The Macro Software Validation (2012)

In 2012, we had the first empirical evidence for the software industry provided by the research paper [Exploring the Duality between Product and Organizational Architectures: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf) from Baldwin et al.

One of their findings was: software products tend to mirror the structure of the organisation in which they are developed.

> We find strong evidence to support the hypothesis that a product’s architecture tends to mirror the structure of the organization in which it is developed.
>
> -- Exploring the Duality between Product and Organizational Architectures: A Test of the “Mirroring” Hypothesis, Baldwin, MacCormack and Rusnak, 2012

![Conway's Law Sketchplanations](/images/shades-of-conways-law/sketchplanations-conways-law.jpg)
<center><i>Source: Sketchplanations <a href="https://sketchplanations.com/conways-law">https://sketchplanations.com/conways-law</a></i></center><br/>

To validate this hypothesis, they compared open-source with closed-source software. Based on the idea that the open-source communities are loosely coupled organisations by design because contributors have diverse goals, belong to different organisations, work in different geographical locations and time zones, and have no formal authority to guide development activities. Whereas closed-source organisations are more tightly-coupled, as they consist of smaller, co-located teams that share common goals, and are dedicated full-time to projects and have formal decision-making authority to guide development.

The study's approach focused on comparing the architectures of open-source and closed-source software products that have similar functions and are of a similar size. They identified five software categories: financial management, word processing, spreadsheets, operating systems and databases. For each category, they selected an open-source and a closed-source software product.

Because commercial firms are somehow reluctant to share their code base, especially for research comparing with “free” equivalents, researchers did not always have a closed-source codebase at their disposal. When commercial options were unavailable, they turned to formerly closed-source products that had been open-sourced. In those instances, they analysed the first open-source version.

So they ended up comparing:

- For financial management: GnuCash vs MyBooks
- For word processing: Abiword vs StarWriter
- For spreadsheets: Gnumeric vs StarCalc
- For operating systems: Linux vs Solaris
- For databases: MySQL vs Berkeley DB

The paper primarily explores whether organisations with distinctly different forms develop products with distinctly different architectures.

The outcome of the study was that **loosely-coupled organisations, such as open-source, tend to develop products with a more modular architecture** than tightly-coupled organisations such as commercial firms. This confirms Parnas' information hiding concept, which allows individual, isolated contributors to work independently. It also reaffirms Henderson and Clark's observation. Loosely coupled, open-source organisations prevent architectural knowledge from becoming a central, stagnant trap. They adopt cross-functional, loosely coupled teams to democratise knowledge. Tightly-coupled organisations, on the other hand, stumble when faced with innovations, because knowledge is tightly frozen in the structures of the organisation.

## The Industry Reality Check (1995-2020)

> We know why projects fail, we know how to prevent their failure – so why do they still fail?
>
> -- Cobb's Paradox, Martin Cobb, CIO for the Secretariat of Treasury Board of Canada, CHAOS University, 1995, published in [Unfinished Voyages I](https://www.inf.ufpr.br/urban/2019-1_205_e_220/205e220_Ler_ver_para_complementar/StandishGroup__UnfinishedVoyages-I.pdf), Standish Group, 1995

When organisations keep treating software products as mere, rigid projects, the resulting architecture and outcomes for users will be notably poor, leading to surprising failures.

From 1994 until 2020, the Standish Group published the CHAOS Report, a study on the success, failure, and challenge rates of IT projects.

| Year | Success | Challenged | Cancelled |
| - | - | - | - |
| 1994 | 16% | 53% | 31% |
| 2000 | 28% | 49% | 23% |
| 2002 | 34% | 51% | 15% |
| 2004 | 29% | 53% | 18% |
| 2006 | 35% | 46% | 19% |
| 2008 | 32% | 44% | 24% |
| 2011 | 39% | 39% | 22% |
| 2012 | 37% | 46% | 17% |
| 2013 | 41% | 40% | 19% |
| 2014 | 36% | 47% | 17% |
| 2015 | 36% | 45% | 19% |
| 2020 | 31% | 50% | 19% |

*-- source: CHAOS Reports 1995, 2009, 2015, 2020, Standish Group.*

Although this may look baffling at first, this stagnation blindsides no experienced practitioners. The numbers reveal a flatline trend. Despite agile and DevOps, the success rate is capped at approximately 30%.

Till 2015, the Standish Group focused mainly on classic project management requirements to measure success, such as well-defined upfront requirements, proper planning, skilled project managers, as well as user involvement and project sponsor. Success was defined in classic PMI terms, the Iron Triangle, i.e. on time, on budget, with all features as initially specified. Then, in 2015, a first significant shift happened. The success resolution definition changed. It was still on time and on budget, however, with satisfactory results. All requirements no longer have to be implemented, since data shows some projects meeting the Iron Triangle yet do not return value. In the end, satisfaction and value are greater when fewer features are delivered, but meeting obvious user needs. This is aligned with lean principles, as well as another Standish Group study revealing [that 64% of delivered features are rarely used](https://www.mountaingoatsoftware.com/blog/are-64-of-features-really-rarely-or-never-used). Later confirmed by the 2019 [Pendo Feature Adoption Study](https://www.pendo.io/resources/the-2019-feature-adoption-report/), revealing 80% of features see low to zero adoption.

By 2020, the Standish Group had pivoted and reported an astonishing outcome that contradicts their early recommendations. Stop treating software products as a project because, by definition, projects have a start and an end, but products do *not*. They explicitly stated that [project managers harm software products](https://medium.com/leadership-and-agility/project-managers-fail-to-help-software-projects-standish-group-chaos-2020-e65d803e99f2) and increase the failure rate. Again, not surprising for experienced practitioners, as this was already established long before, but became more public since 2017 with the [#NoProjects movement](https://www.allankelly.net/archives/4796/what-ever-happened-to-noprojects-post-projects/).

The Standish Group concluded that project success is defined by *Good Sponsor*, *Good Team*, *Good Place*, and *Short Decision Latency*. To some extent, this aligns with the 2001 findings from [Good to Great](https://app.thestorygraph.com/books/1771dbe4-16a3-4316-83a1-ed2b21984bc9). Organisations become great when they have *Level 5 Leadership* (Good Sponsor) — builds enduring greatness through a paradoxical blend of personal humility and professional will —, they focus on *First Who ... Then What* (Good Team) — we first have the right people before figuring out where to drive it, before vision, before strategy, before tactics, before organisational structure, before technology —, lastly, they *Confront the Brutal Facts of Reality* (Good Place) — a climate where the truth is heard. These crucial prerequisites enable Short Decision Latency, allowing information to circulate rapidly. However, Short Decision Latency is entirely dependent on communication paths. Since Conway's Law dictates that systems reflect the organisation's communication structures, high-latency organisations stuck in silos are unable to produce high-velocity, decoupled system designs, which in turn hamper communication and impede success.

Ultimately, the CHAOS Report recommends moving away from "projects" and adopting Infinite Flow, which Lean has been promoting since the 1980's. Somehow, this is the business world finally accepting what Baldwin et al. proved in 2012: tightly coupled organisations produce tightly coupled system architectures that work against flow, while loosely-coupled organisations thrive because they produce loosely coupled system architectures that enable flow, short time to markets, and consequently accelerated feedback to meet user expectations better. The 2020 CHAOS Report *Good Place* — where truth is heard to reduce Decision Latency — is exactly the type of environment needed to break the "frozen," tacit communication lines Henderson and Clark blamed for corporate blindness.

## Conclusion

To conclude, the tech industry spent decades trying to fix management processes, only to realise they were fighting a losing battle against the structural gravity of Conway's Law and its implications on innovation and market leadership. Mediocrity is the default. Success is optional. Just saying ...

## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}) - How the worlds of organisation and product design observed the same thesis independently.
- **Validation: The Research & Reality Check** - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- **Mechanics: The Mathematical & Geometrical Shades** - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- **Strategy: Reversing the Law** - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: Conway's Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Bibliography

- [Architectural Innovation: The Reconfiguration of Existing Product Technologies and the Failure of Established Firms](http://www.iot.ntnu.no/innovation/norsi-pims-courses/tushman/Handerson%20&%20Clark%20(1990).pdf), Henderson and Clark, 1990
- [CHAOS Report 1995](https://personal.utdallas.edu/~chung/SYSM6309/chaos_report.pdf), Standish Group, 1995
- [Unfinished Voyages I](https://www.inf.ufpr.br/urban/2019-1_205_e_220/205e220_Ler_ver_para_complementar/StandishGroup__UnfinishedVoyages-I.pdf), Standish Group, 1995
- [Good to Great](https://app.thestorygraph.com/books/1771dbe4-16a3-4316-83a1-ed2b21984bc9), Jim Collins, 2001
- [The Misalignment of Product Architecture and Organizational Structure in Complex Product Development](http://users.ece.utexas.edu/~perry/education/382v-s08/papers/sosa.pdf), Sosa et al, 2004
- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo 2006
- [The Impact of Misalignment of Organization Structure and Product Architecture on Quality in Complex Product Development](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=5553ae01b690837f755cd2c91fa6a4b7fdec6345), Gokpinar et al, 2007
- [CHAOS Report 2009](https://www.classes.cs.uchicago.edu/archive/2014/fall/51210-1/required.reading/Standish.Group.Chaos.2009.pdf), Standish Group, 2009
- [Exploring the Duality between Product and Organizational Architecture: A Test of the “Mirroring” Hypothesis](https://www.hbs.edu/ris/Publication%20Files/08-039_1861e507-1dc1-4602-85b8-90d71559d85b.pdf), Baldwin, MacCormack, Rusnak, 2012
- [CHAOS Report 2015](https://cdn1-public.infotech.com/agile/CHAOSReport2015-Final.pdf), Standish Group, 2015
- [Standish Group 2015 Chaos Report - Q&A with Jennifer Lynch](https://www.infoq.com/articles/standish-chaos-2015/), InnoQ, 2015
- [Are 64% of Features Really Rarely or Never Used?](https://www.mountaingoatsoftware.com/blog/are-64-of-features-really-rarely-or-never-used), Mike Cohn, 2016
- [Chaos Report — why this study about IT project management is so unique](https://thestory.is/en/journal/chaos-report/) about the CHAOS Report 2020, Radek, The Story, 2024
