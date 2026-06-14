---
layout: article
title: "Beyond the Shades of Conway's Law - Validation: The Research & Reality Check"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/shades-of-conways-law/sketchplanations-conways-law.jpg
---

Moving beyond hunch and silencing the sceptics. Over the years, Conway's Law has resurfaced as a guiding principle to organise teams. Yet, many people still hesitate to accept the idea. In the end, it is only a hypothesis. Melvin Conway did not provide any proof when publishing the thesis. However, in the meantime, decades later, a good deal of academic research supports the thesis. Ultimately, Harvard and MIT researchers provided robust empirical validation for the hypothesis across the software industry, further confirmed by the CHAOS Report from the Standish Group, reinforcing *The Mirroring Principle* as an undeniable organisational reality.

---

Henderson and Clark already noted in 1990 that architectural/technical interdependence is associated with organisational communication.

In 2004, Sosa et al. published a study that looked at the design process of a commercial aircraft jet engine, the PW4098, at Pratt & Whitney. They studied how design interfaces in the product architecture map onto communication patterns within the development organisation. More specifically, they explored if organisational problems exist at the boundaries of the components inside the jet engine, i.e. whether a misalignment exists between the design team boundaries and system component interfaces.

The studies starting point is that ...

> ... architectural knowledge tends to become embedded in the structure and information-processing procedures of established organizations ...
>
> -- [Architectural Innovation: The Reconfiguration of Existing Product Technologies and the Failure of Established Firms](http://www.iot.ntnu.no/innovation/norsi-pims-courses/tushman/Handerson%20&%20Clark%20(1990).pdf), Henderson and Clark, 1990

Hence, it is important for organisations to understand how they manage the embedded knowledge. This is especially relevant when designing new products. In this context, system design interfaces are the primary sources of team interdependence, or, at least, it should be. Meaning, when "*team i designs component i*" with a design interface between component i and j there should be a corresponding technical interaction between team i and j. These are the expected cases. On the other hand, unmatched design interfaces as well as unmatched team interactions are unexpected. As it seems, these cases were largely ignored in previous research.

> However, we believe that considering these cases is important because their existence would indicate that not all known product-related interdependences are addressed by direct technical communication, and that technical communication (where not expected) may uncover undocumented product-related interdependences.
>
> -- [The Misalignment of Product Architecture and Organizational Structure in Complex Product Development](http://users.ece.utexas.edu/~perry/education/382v-s08/papers/sosa.pdf), Sosa et al, 2004

Eventually, the study concludes that ...

> ... we provide empirical evidence that product ambiguity exists, and it is more likely to be present across organizational and system boundaries
>
> -- [The Misalignment of Product Architecture and Organizational Structure in Complex Product Development](http://users.ece.utexas.edu/~perry/education/382v-s08/papers/sosa.pdf), Sosa et al, 2004

Meaning, that there is great likelihood that some of the system component interfaces are not covered by team interactions, which can lead to major setbacks involving significant rework that can be extremely costly. In the paper they refer to two such major setbacks during the design of that specific jet engine.

What they are essentially saying is: **If there is a misalignment between the organisation and the product architecture there will be problems**.

In 2006, Cataldo et al. explored the consequences of congruence on the speed and efficiency of software development work inside a single software project. They investigated the impact of misalignment.

> This is particularly important in product development organizations which organize themselves around their products’ architectures because the main components of their products define the organization’s key sub-tasks.
>
> -- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo et al, 2006

This is important, because as architectural knowledge is embedded in the communication structures of organisations (Henderson and Clark, 1990), any minor changes to the product architecture can disrupt the organisation's ability to coordinate effectively.

Ultimately, Cataldo et al. found out that tasks were completed more rapidly when the patterns of communication between team members were congruent with the patterns of interdependency between components.

> **Congruence** between coordination requirements and coordination activities shortened development time.
>
> -- [Identification of Coordination Requirements: Implications for the Design of Collaboration and Awareness Tools](https://www.cs.drexel.edu/~yfcai/CS680/Readings/Week8/Identification%20of%20Coordination%20Requirements.pdf), Cataldo et al, 2006

Basically the research says, **if teams are aligned with the components they work on, teams are more efficient**.

In 2007, Gokpinar et al. conducted a study that looked at the design of cars in the automotive industry.

> a key challenge for product development organizations is matching the organization to the product being developed. This involves two fundamental problems: (1) How to assign people to the parts and subsystems that make up the product, and (2) How to ensure that people communicate/collaborate effectively in the performance of design tasks.
>
> -- [The Impact of Misalignment of Organization Structure and Product Architecture on Quality in Complex Product Development](https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=5553ae01b690837f755cd2c91fa6a4b7fdec6345), Gokpinar et al, 2007

The research defined a new metric *coordination deficit* — which quantifies mismatches between product architecture and organisation structure — and investigated the effect of coordination deficit on product quality.

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

To prove this hypothesis, they compared open source with closed source software. Based on the idea that the open source communities are loosely coupled organisations by design because contributors have diverse goals, belong to different organisations, work in different geographical locations and time zones, and have no formal authority to guide development activities. Whereas, closed source organisations are more tightly-coupled, because they consist of smaller, co-located teams that share common goals, that are dedicated full-time to projects and have formal decision-making authority to guide development.

The approach of the study was based on comparing the architectures of open source and closed source software products that have similar functions and are of a similar size. They identified five software categories: financial management, word processing, spreadsheet, operating system and database. For each category they selected an open source and a closed source software product.

Because commercial firms are a bit reluctant to share their code base, especially for research comparing with “free” equivalents, the researchers did not always have a closed source codebase at their disposal. So when a commercial product was not available, they had to fall back on products that began their life as closed source and later were open sourced. In that case, they looked at the first release of the open source version.

So they ended up comparing:

- For financial management: GnuCash vs MyBooks
- For word processing: Abiword vs StarWriter
- For spreadsheets: Gnumeric vs StarCalc
- For operating systems: Linux vs Solaris
- For databases: MySQL vs Berkeley DB

The paper primarily explores whether organisations with distinctly different forms develop products with distinctly different architectures.

The outcome of the study was that *loosely-coupled organisations, like open source, tend to develop products with a more modular architecture* than tightly-coupled organisations such as commercial firms. This confirms the information hiding concept from Parnas, which allows individual, isolated contributors to work independently.

> We know why projects fail, we know how to prevent their failure – so why do they still fail?
>
> -- Cobb's Paradox, Martin Cobb, CIO for the Secretariat of Treasury Board of Canada, CHAOS University, 1995, published in [Unfinished Voyages I](https://www.inf.ufpr.br/urban/2019-1_205_e_220/205e220_Ler_ver_para_complementar/StandishGroup__UnfinishedVoyages-I.pdf), Standish Group, 1995

When organisations keep treating software products as mere, rigid projects, the resulting architecture and outcomes for users will be outstandingly poor, and leading to surprising failures.

Since 1994, until 2020, the Standish Group published the CHAOS Report, a study on the success, failure, and challenge rates of IT projects.

| Year | Success | Challenged | Cancelled |
|-|-|-|-|
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

As baffling as it may be, although not so surprising, at all, for experienced practitioners, the numbers are fairly stagnant. Despite agile and DevOps, the success rate cap at approximately 30%.

Up until 2015, the Standish Group focussed primarily on classic project management requirements to achieve success, such as well-defined upfront requirements, proper planning, skilled project managers, but also user involvement and project sponsor. Success was also defined in classic PMI terms, i.e. on time, on budget, with all features as initially specified. Then in 2015, a first significant shift happened. The success resolution definition changed. It was still on time and on budget, however, with a satisfactory result. Not any more all requirements have to be implemented — which was the classic PMI iron triangle —, because it happened that projects met the triangle, yet, did not return value. In the end, satisfaction and value are greater when fewer features are delivered but that meet obvious user needs. This is aligned with lean principles, as well as another Standish Group study revealing [that 64% of delivered features are rarely used](https://www.mountaingoatsoftware.com/blog/are-64-of-features-really-rarely-or-never-used). Later confirmed by the 2019 [Pendo Feature Adoption Study](https://www.pendo.io/resources/the-2019-feature-adoption-report/) revealing 80% of features see low to zero adoption.

By 2020, the Standish Group completely flipped and reached an astonishing outcome that contradicts their early recommendations. Stop treating software products as a project because, by definition, projects have a start and an end, but products do *not*. They explicitly stated that [project managers harm software products](https://medium.com/leadership-and-agility/project-managers-fail-to-help-software-projects-standish-group-chaos-2020-e65d803e99f2) and increase the failure rate. Again, not surprising for experienced practitioners, as this was already told long before, but became more public since 2017 with the [#NoProjects movement](https://www.allankelly.net/archives/4796/what-ever-happened-to-noprojects-post-projects/).

They concluded that project success is defined by *Good Sponsor*, *Good Team*, *Good Place*, and *Short Decision Latency*. To some extend this aligns with the 2001 findings from [Good to Great](https://app.thestorygraph.com/books/1771dbe4-16a3-4316-83a1-ed2b21984bc9). Organisations become great when they have *Level 5 Leadership* (Good Sponsor) — builds enduring greatness through a paradoxical blend of personal humility and professional will —, they focus on *First Who ... Then What* (Good Team) — we first have the right people before figuring out where to drive it, before vision, before strategy, before tactics, before organisational structure, before technology —, lastly, they *Confront the Brutal Facts of Reality* (Good Place) — a climate where the truth is heard. These are crucial prerequisites to Short Decision Latency to circulate communication quickly. However, Short Decision Latency is entirely dependent on communication paths. Since, Conway's Law dictates that systems reflect the organisation's communication structures, high-latency organisations stuck in silos are unable to produce high-velocity, decoupled system designs, which in turn hamper communication and impede success.

Ultimately, the CHAOS Report recommends moving away from "projects" and adopt Infinite Flow, which lean has been promoting since the 1980's. Somehow, this is the business world finally admitting what Baldwin et al. proved in 2012: tightly coupled organisations produce tightly coupled system architecture which work against flow, while loosely-coupled organisations thrive because they produce loosely coupled system architectures that enable flow, short time to markets, and consequently accelerated feedback to better meet user expectations.

To conclude, the tech industry spent decades trying to fix management processes, only to realise they were fighting a losing battle against the structural gravity of Conway's Law. Just saying ...

## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}) - How the worlds of organisation and product design observed the same thesis independently.
- **Validation: The Research & Reality Check** - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- **Mechanics: The Mathematical & Geometrical Shades** - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- **Strategy: Reversing the Law** - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: The Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
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
