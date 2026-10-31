---
layout: article
title: "Beyond the Shades of Conway's Law - Scale: Conway's Corollary"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law, Open Systems Theory ]
---

The first prototypes of a system are merely hints towards what a final design could look like. Then again, they are only clues. To crystallise the design, we have to iterate with more new experiments to collect feedback. However, this has unexpected repercussions for the unsuspecting leader.

---

As we know, in engineering, the initial design of a system is rarely the best.

> The initial design of a system is never the best. The system may need to change. Therefore it requires flexibility of the organisation to design effectively.
>
> -- Melvin Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

As we work on the system, we often learn the relevant architecture. As we move forward, we get feedback, new information, we learn, and we adapt.

## Conway's Corollary

As already hinted by Conway, this has consequences ... for the organisation. This requires organisational flexibility to come to an effective design. This is **Conway's Corollary**.

> Organizational flexibility is important to effective design
>
> – Conway’s Corollary, Jeff Sussna (@jeffsussna), Twitter, May 9, 2021

Without organisational flexibility, we are limited to produce a system design that matches the real, on-the-ground communication structure of the organisation. Because "*if the system architecture and the organisation architecture are at odds, the organisation wins*" (Ruth Malan, 2008).

Be aware that the real on-the-ground communication structures are not necessarily the ones depicted on the traditional organisation chart. People do not restrict their communications only to the lines on the organisation chart. Teams reach out to whomever they *depend on* to get their work done. This informal organisation chart aligns with the architectural *Process View* and *Physical View* (Kruchten, 1995, more on this [*Mechanics: The Mathematical & Geometrical Shades*]({% post_url 2026-08-31-beyond-shades-of-conways-law-mechanics %})).

## Incremental Engineering

Incremental software development is an essential condition to growing IT systems based on feedback and learning. It is a necessary requirement to satisfy user demand, and to build the right thing.

> Piecemeal growth, or incremental development, is not just desirable but a fact of life in software. Even so, we need to build more learning into our process. More learning when it is cheaper to find and fix problems with the vision (doing course corrections toward "right system") and structure (built right).
>
> Then, accepting that we will continue to learn and evolve our system, we need to invest in fixing the mistakes. Incrementally adding functionality yes, but repairing structural defects too. This investment is the crucial dual to piecemeal growth that we too often forget in software.
>
> When we keep marching to a frenetic "add value" drumbeat, we get into a situation where the system threatens to crumble under the mass of deferred structural issues.
>
> [...]
>
> Going from the messiness of our discovery-oriented process to the well-factored, tested integrity of our engineered system shouldn't be considered rework or waste! Unless we leave it until after it has sorely impacted users and our business viability. That is waste.
>
> As we proceed in the fog of uncertainty, entropy grows -- and produces more fog! Under uncertainty we "give things a try"; accept good enough, and try the next thing. As entropy grows, it introduces its own uncertainty...
>
> -- Ruth Malan, [Conway's Law Reverb](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm#Conways_Law), May 5, 2014

However, incremental software development has consequences. As software grows, entropy grows. To contain entropy, we need to refactor systems. 

> Refactoring is the corollary to piecemeal growth, allowing entropy containment. But we have to refactor the organization too? If it would subvert the system (re)design and evolution.
>
> -- Ruth Malan, [Conway's Law Reverb](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm#Conways_Law), May 5, 2014

## System Redesign vs Organisational Flexibility

Many refactorings result in a significant redesign of the system.

Henceforth, incremental software development impacts the organisation because we are redesigning the system. It requires growing and redesigning the organisation as the system grows to fit the new system. It requires organisational flexibility.

> They [system and organization] will co-evolve, because if they don't, Conway's Law warns us that the organization form will trump intended designs that go "cross-grain" to the organization warp.
>
> -- Ruth Malan, [Conway’s Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

Following the Open Systems Theory (OST) Design Principle 2 (DP2) socio-technical structure, organisation and system need to co-evolve — shifting the responsibility for coordination and control to the teams doing the work, allowing the teams to progress the organisation design as needed as the system design evolves over time (more on this in [*Strategy: Reversing the Law*]({% post_url 2026-09-20-beyond-shades-of-conways-law-strategy %}#conclusion)).

[Adrian Cockcroft](https://mastodon.social/@adrianco), the former Chief Architect of Netflix, confirmed this on Mastodon in a [conversation with Ruth Malan](https://mastodon.social/@tdpauw/111003294054784503): "*I think I have seen this at Netflix and AWS. They annually re-aligned teams with the new domain boundaries.*"

This creates two imperatives:

1. To keep asking ourselves: “*Is there a better design that is not available to us because of our organisation?*”, and
2. Can we change the organisation if a better design is found.

## The Blind Spot

50 years later, Melvin Conway observed the same:

> The importance of the principle ... is ... that your design organization is keeping you from designing some things that perhaps you should be building.
>
> -- Melvin Conway, [Toward Simplifying Application Development in a Dozen Lessons](https://melconway.com/Home/pdf/simplify.pdf), 2017

The importance of the Law is not that the organisation is constrained to produce system designs that copy the organisational structures.

No, the importance of the Law is that the organisation is keeping us from designing the things we should be building to delight our users. The organisation chart is hiding the ideal solution for the teams. Paradoxically, leadership is often completely unaware of these structural mechanics.

If the organisation is keeping us from producing the right thing, the organisation should be flexible enough to be redesigned in order to come to a better product design that better fits the needs of our users. This requires organisational flexibility to come to a more effective design ([*Conway's Corollary*](#conways-corollary)).

Without organisational flexibility, "*[when] architecture of the system and the architecture of the organisation are at odds, the organisation wins*" (Ruth Malan, 2008).

Yet, that is not that simple, especially not for long-lived organisations with long-lived systems, because of the [*Reverse Conway’s Law*]({% post_url 2026-09-20-beyond-shades-of-conways-law-strategy %}#the-reverse-conways-law-the-legacy-reality). The system architecture acts as a force on the organisation and closes the options we have to design the structure of the organisation.

Because an initial design is rarely the best one, and because of incremental software engineering ... architecture is never done. It [does not have an end](https://www.oreilly.com/content/michael-nygard-on-architecture-without-an-end-state/). It is continuously evolving ([Building Evolutionary Architectures](https://app.thestorygraph.com/books/0f3cecf8-ee0b-407b-b711-a105d4ae3b3d), Rebecca Parsons et al.).

## The Scaling Paradox

Conway's Law says any organisation designing systems is constrained to design a mirror of the organisation's communication structures. [*Conway's Corollary*](#conways-corollary), on the other hand, shows that when systems scale and designs evolve it requires organisational flexibility and the ability to respond to change in order to design the right things for their customers. However, organisations scale sub-linearly. Sub-linear scaling leads to bounded growth and limited lifespan, i.e organisations eventually stop growing and die (West, 2017).

The exponential growth of organisations is a downright myth. The fact they grow sub-linearly indicates a domination by increasing returns of economies of scale over innovation. Organisations typically operate as highly-constrained top-down structures striving to optimise for efficiency by reducing operational costs and increasing profits, but not for effectiveness. To achieve more efficiency, organisations add more rules, more protocols, more bureaucracy, and more hierarchy, at the expense of innovation (West, 2017).

As organisations scale, teams are taken by strong emotions — anxiety, fear, hate, love, hope, anger, guilt, depression. They lose touch with their purpose, outcomes stagnate, while unconsciously adopting defensive modes. Teams look upward for direction, protect territories, or chase silver bullets (Bion, 1961; see also French & Simpson, 2010).

Ultimately organisations choke on the volume of decisions bubbling up the hierarchy, resulting in decision latency (Galbraith, 1973, 1977), delayed feedback, delayed learning. They become risk averse, more rigid, less agile, less able to respond to change (West, 2017). Eventually, they will go back to conservative solutions and innovation falls flat.

Ultimately, only five percent of the organisations stay alive after 30 years. Almost half of them disappeared in ten years time. Very few organisations have survived hundreds of years. Those who did, are of relatively modest size, operating in highly specialised, niche markets, continue to produce high-quality products for a small, dedicated clientele, and have barely grown (West, 2017).

Most organisations tend to be conservative, shortsighted. Because of the bureaucracy, the knowledge gets fossilised inside the organisation's communication channels preventing any architectural innovation (see [Validation: The Research & Reality Check]({% post_url 2026-06-20-beyond-shades-of-conways-law-validation %})). Organisations become less supportive for risky ideas. They tend to become unidirectional and lack diversity. An indicator of reduced resilience and a recipe for disaster (Henderson and Clark, 1990, West, 2017).

In contrast, cities scale super-linearly and open-ended, i.e. they scale exponentially. Cities become more diverse as they grow. They become multi-dimensional, strongly correlated to the super-linear and open-ended growth, which is a crucial component for resilience and the seeming immortality. Cities operate in a much more distributed fashion and embody innovation (West, 2017).

## Conclusion

Ultimately, organisational flexibility is rare at scale. To successfully scale, and keep delivering the right products that customers expect, it is crucial to adopt a Design Principle 2 structure (DP2) and vital to start small (**Allan Kelly's Advice**)!

> Grow the team with the system. Small teams, small systems, piecemeal growth.
>
> Start as small as you can and grow as you need too.
>
> Don’t start thinking big.
>
> -- Allan Kelly, [Continuous Delivery and Conway’s Law]({% post_url 2021-05-13-continuous-delivery-and-conways-law-allan-kelly %}), 2014

When evolving a system, to contain entropy, many refactorings will happen leading to considerable redesigns. To ensure our experiments lead to building the right thing that the market is demanding, it is imperative the organisation shows enough flexibility to restructure and adapt to the new designs. Small teams, accountable and responsible for their systems and markets, reduce bureaucracy and enable innovation.

Organisations need to scale their business, not teams! Keeping teams small, is an inescapable reality.

## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}) - How the worlds of organisation and product design observed the same thesis independently.
- [Validation: The Research & Reality Check]({% post_url 2026-06-20-beyond-shades-of-conways-law-validation %}) - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- [Mechanics: The Mathematical & Geometrical Shades]({% post_url 2026-08-31-beyond-shades-of-conways-law-mechanics %}) - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- [Strategy: Reversing the Law]({% post_url 2026-09-20-beyond-shades-of-conways-law-strategy %}) - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: Conway's Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Bibliography

- [Experiences in Groups and Other Papers](https://app.thestorygraph.com/books/00a599d7-49d1-4b35-9d19-a67652910ed2), Wilfred R. Bion, 1961
- [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968
- [Designing Complex Organisations](https://app.thestorygraph.com/books/c746ca36-a5d7-4c2a-995c-6330c4d363bd), Jay R. Galbraith, 1973
- [Organisation Design](https://app.thestorygraph.com/books/6b226d10-9cb0-41a2-89fa-bab1f81ee5d1), Jay R. Galbraith, 1977
- [Architectural Innovation: The Reconfiguration of Existing Product Technologies and the Failure of Established Firms](http://www.iot.ntnu.no/innovation/norsi-pims-courses/tushman/Handerson%20&%20Clark%20(1990).pdf), Henderson and Clark, 1990
- [Architectural Blueprints — The "4+1" View Model of Software Architecture](https://arxiv.org/pdf/2006.04975), Philippe Kruchten, 1995
- [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [The 'work group': Redressing the balance in Bion's Experiences in Groups](https://www.benhughes-consulting.co.uk/site/assets/files/1102/0018726710365091.pdf), R. French and P. Simpson, 2010
- [Architecture without an end state](https://www.oreilly.com/content/michael-nygard-on-architecture-without-an-end-state/), Michael Nygard, 2012
- [Conway's Law Reverb](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm#Conways_Law), Ruth Malan, 2014
- [Continuous Delivery and Conway’s Law]({% post_url 2021-05-13-continuous-delivery-and-conways-law-allan-kelly %}), Allan Kelly, 2014
- [Toward Simplifying Application Development in a Dozen Lessons](http://melconway.com/Home/pdf/simplify.pdf), Mel Conway, 2016
- [Building Evolutionary Architectures](https://app.thestorygraph.com/books/0f3cecf8-ee0b-407b-b711-a105d4ae3b3d), Rebecca Parsons, Neal Ford, Patrick Kua, 2017
- [Scale: The Universal Laws of Life, Growth, and Death in Organisms, Cities, and Companies](https://app.thestorygraph.com/books/568aae70-7a2b-4df1-b504-f3bad7696f25), Geoffrey West, 2017
