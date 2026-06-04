---
layout: article
title: "Beyond the Shades of Conway's Law - Foundations: The Origin & The Mirroring Principle"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/shades-of-conways-law/conways_law_cornet.png
---

In 1968, Melvin Conway expressed a thesis on how system design follows the organisation's communication structures. In the same period, the communities of organisation design and product design observed the same thesis independently, which later became known as the **Mirroring Principle**.

---

> 💡 **Editorial Note:** Writing this piece was a true catharsis, pushing me well out of my usual comfort zone as a software practitioner talking about Continuous Integration and Continuous Delivery. Looking up to [Ruth Malan](https://mastodon.social/@RuthMalan), I never saw myself talking about Conway's Law and organisation design. However, here I am exploring beyond the shades of Conway's Law, and looking past the surface-level definitions to dive straight into the parallel historical worlds of Product and Organisation Design.

---

Melvin Conway's thesis reads as follows:

> Organisations which design systems are constrained to produce designs which are copies of the communication structures of these organisations.
>
> -- Melvin Conway, [How do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

![Conway's Law, Credit Tomasz Tunguz — Venture Capitalist at RedPoint](/images/shades-of-conways-law/conways_law_cornet.png)
<center><i>Source: <a href="https://empathy.guru/2018/10/14/im-not-the-only-person-interested-in-conways-law/">I’m Not the Only Person Interested in Conway’s Law</a>, Chuck Pezeshki</i></center><br/>

Essentially, this means, the organisation and the system keep each other in balance. Modifying the organisation will have an impact on the system. Modifying the system will have consequences for the organisation. Not considering that will cause friction in the organisation or the system, which may have dramatic consequences from a design point of view.

To be competitive as an organisation in the market, and to effectively design the right thing our customers expect us to deliver, we better understand and take advantage of this.

Note that when Melvin Conway mentions a system he really means this in the broad sense. This is not limited to only software or IT systems. This can be buildings, planes, machinery, vehicles, but also engines or public transportation systems, communication systems, …, so, anything.

## The Mirroring Principle

Interestingly, around the same time various people from different communities made a similar observation as Melvin Conway. Later, referred to as the **Mirroring Principle**.

It was mainly concentrated around two communities:

- Product Design: the people from product design and products as complex systems, with the cornerstone on designing products to execute tasks efficiently.

  - 1964: Christopher Alexander with [Notes on the Synthesis of Form](https://app.thestorygraph.com/books/3bec9938-fb40-4616-b2c6-ab2d4de650ea)
  - 1972: D.L. Parnas with [On the criteria to be used in Decomposing Systems into Modules](https://www.win.tue.nl/~wstomv/edu/2ip30/references/criteria_for_modularization.pdf)

- Organisation Design: the people around organisation design and organisations as complex systems, with a focus on designing organisations for efficient task completion.

  - 1967: James D. Thompson with [Organizations in Action](https://app.thestorygraph.com/books/25918476-f7e4-40de-b00b-7566a26632c4)
  - 1974: Jay R. Galbraith with [Organization Design: An Information Processing View](http://strategy.sjsu.edu/www.stable/pdf/Galbraith,%20J%20R,%201974,%20Interfaces.%204%20pp%2028-36.pdf)

However, it is not clear whether all these people were aware of each other and knew they made observations alike.

## Product Design

In 1964, Christopher Alexander expands on how to optimise the process of design, i.e. the process of inventing physical things. Every design problem starts with an effort to achieve fitness between the form and its context. The *form* is the solution to the design problem. The *context* defines the design problem. *Fitness* means, we try to adapt the form, the solution, to its context, the problem definition.

Yet, no complex adaptive system will succeed in adapting, in a reasonable amount of time, unless the adaption happens subsystem by subsystem, where each subsystem is relatively independent from each other. In a way, we try to reduce the gap between the designer’s small capacity and the great size of their task.

> We may therefore picture the process of form-making [i.e. designing] as the action of a series of subsystems, all interlinked, yet sufficiently free of one another to adjust independently in a feasible amount of time.
>
> -- Alexander, Notes on the Synthesis of Form, 1964, p41

Now, that works because the cycles of correction and recorrection, which occur during adaptation, are restricted to one subsystem at a time.

In the end, **it is easier to cope with complexity when it is decomposed into a series of linked sub-problems**. This establishes that systems must be partitioned into boundaries to manage cognitive load and design complexity. This is the **inside-out architectural view**.

In 1972, David Parnas reached a similar conclusion: hiding design decisions behind information boundaries. This idea became known as **encapsulation**.

> ... separate groups would work on each module with little need for communication ...
>
> -- Parnas, On the criteria to be used in Decomposing Systems into Modules, 1972

*On the criteria to be used in Decomposing Systems into Modules* is a seminal paper in software engineering. In this paper, Parnas introduced the concept of information hiding to control complexity. Because each module in a technical system is informationally isolated from the other modules, separate product teams can build and ship independently from each other on different modules.

**Information hiding is a fundamental principle underlying The Mirroring Principle**.

## Organisation Design

But an organisation does not architect systems in a vacuum. An organisation cannot be understood in isolation from its environment. It operates within an external environment. In 1965, Fred Emery and Eric Trist introduced the concept of the [*Causal Texture of Organizational Environments*](http://www.moderntimesworkplace.com/archives/ericsess/sessvol3/GEMTRCAUp53.pdf) - the degree of interconnectedness and predictability of the external world.

> A main problem in the study of organizational change is that the environmental contexts in which organizations exist are themselves changing, at an increasing rate and towards increasing complexity. This point, in itself, scarcely needs laboring.
>
> -- Emery & Trist, [*Causal Texture of Organizational Environments*](http://www.moderntimesworkplace.com/archives/ericsess/sessvol3/GEMTRCAUp53.pdf), 1965

Emery & Trist argued that early systems and management theory historically treated organisations as *closed systems*, assuming all elements and processes of interest are internal to the organisation. The idea here is to limit uncertainty as much as possible, to protect and optimise the factory-line - the classic Taylorist viewpoint, looking for the one best way to organise a task - and thus to ignore and eliminate the influence of its environment.

> the importance of openness or closedness to the environment as a means of distinguishing living organisms from inanimate objects. [...] any living entity survives by importing into itself certain types of material from its environment, transforming these in accordance with its own system characteristics and exporting other types back into the environment. By this process the organism [...] becomes capable of attaining stability in a time-independent steady state — a necessary condition of adaptability to environmental variance.
>
> ... openness to the environment of a steady state maintains the capacity of the organism for work, without which adaptability--and hence survival--would be impossible.
>
> -- Emery & Trist, [*Causal Texture of Organizational Environments*](http://www.moderntimesworkplace.com/archives/ericsess/sessvol3/GEMTRCAUp53.pdf), 1965

Emery & Trist questioned this closed-systems view by having an **outside-in view** and setting an *open systems* view. We cannot think of the organisation alone without its surrounding environment. The organisation structure and behaviour are affected by environmental influences. The organisation must be an adaptive system that tries to survive its environment. Modern environments shift from simple and predictable over complex up to what they called a "*Turbulent Field*", where rapid technological, economic, and social shifts interconnect to create constant, unpredictable chaos. The environment becomes the primary driver of internal organisational complexity.

They identified four "ideal types" of environments, of *causal textures*, ordered by their degree of interconnectedness and complexity.

> Causal Texture:
>
> the complex, interconnected web of relationships, events, and variables within an environment or system. It describes the degree to which different elements in a space are causally dependent on one another.
>
> -- David Ing, [Causal texture, contextualism, contextural](https://coevolving.com/blogs/causal-texture-contextural-contextualism/), 2020

- Type I - *The Placid, Randomised Environment*. The simplest type of environmental texture. Resources and threats are randomly distributed and remain relatively unchanged. There is no distinction between *tactics* (day-to-day actions) and *strategy* (long-term plan). "*the optimal strategy is just the simple tactic of attempting to do one's best on a purely local basis*" (Schutzenberger). The best tactic can be learned from trial and error. In the IT industry, this would be a small, independent consulting firm that builds simple, custom Microsoft Access databases. Success relies on basic customer service and executing standard, repeatable, predictable routines.

- Type II - *The Placid, Clustered Environment*. More complicated, but still static. However, the resources and threats are not randomly distributed but cluster together in certain ways. Strategy becomes more important. Survival results from what the organisation knows about its environment. Organisations grow, become hierarchical, with a tendency towards centralised control, such as rolling out an ERP system, adopting large enterprise software stacks like SAP or Oracle, or building out legacy internal IT systems. Because system changes are highly disruptive, IT leaders use long-term roadmaps.

- Type III - *The Disturbed, Reactive Environment*. A dynamic environment containing multiple competing organisations. What one organisation knows, can also be known by the other organisations. Actions from one organisation trigger reactions from the other organisations. It is not only about tactics and strategy, but also *operations* — which of the other organisations' possible tactics do we want to take place, while ensuring the other tactics do not happen. Survival depends on operational flexibility — anticipating and reacting to the competitive countermoves much like the public cloud infrastructure (IaaS) price war. AWS, GCP and Azure monitoring each other. When one reduces prices or launches a service, the others have to react to block the other to gain market share.

- Type IV - *The Turbulent Fields*. The environment is in constant motion. Change does not only come from the competition but also from the changing environment like evolving regulations, new technologies, shifting consumer behaviour. Look at the recent accelerated LLM evolutions. Tech organisations cannot just plan a five-year strategy. They need to co-evolve with the market, and adapt.

How does an organisation survive this unexpected environmental change? This is where James D. Thompson comes in. Thompson was foundational for organisation design. Before Thompson there were two lines of thoughts:

> ... differences in technical functions, or technologies, cause significant differences among organisations ...
>
> -- Thompson, Organizations in Action, 1967, p12, Chapter 1 (Strategies for Studying Organizations)

Thompson accepted Emery and Trist's concept of the Causal Textures by asking a pragmatic structural question: *How does an organisation actually perform core work when the ground beneath it is constantly moving?* Today, organisations wonder how teams can build and deliver stable, reliable software products that fit users' needs when the market conditions, and technologies change all the time. He argued that **an organisation is neither purely closed nor purely open; it is both**. The organisation copes with uncertainty by protecting their 'technical core', the organisation's production component - i.e. the factory and its workers and engineers, or software teams with engineers, etc. - to act as a closed system, to maximise efficiency. We want to shield off the core internal teams from the influence of the environment. This means the internal core must be predictable using Continuous Integration, and Continuous Delivery with rigorous testing.

> Proposition 2.2: Under norms of rationality, organizations seek to buffer environmental influences by surrounding their technical core with input and output components.
>
> Proposition 2.3: Under norms of rationality, organizations seek to smooth out input and output transactions.
>
> Proposition 2.4: Under norms of rationality, organizations seek to anticipate to environmental changes which cannot be buffered or leveled.
>
> If environmental fluctuations penetrate the organization and require the technical core to alter its activities [adapt], then environmental fluctuations are exogenous variables [i.e. causal variables] within the logic of technical rationality. To the extent that **environmental fluctuations** can be anticipated, however, they can **be treated as constraints** on the technical core which closed system of logic can be employed.
>
> -- Thompson, Organizations in Action, 1967, p20-22, Chapter 2 (Rationality in Organizations)

But at the boundaries, the organisation must attend and adapt to changes in the environment. Therefore, it has to be open to environmental signals. As such, at its boundaries, it is an open system. To do this, the organisation creates "boundary-spanning units" to absorb and buffer external shock waves. This means having decoupled architectures, and product managers — they filter out market noise — to act as shock absorbers, with short iterations and continuous discovery. Organisational design becomes an exercise in placing boundaries to minimize the cost of coordination under environmental uncertainty.

> The crucial problem for boundary-spanning units [...] is [...] adjustment to constraints and contingencies not controlled by the organization — [...] exogenous variables.
>
> ...
>
> ... organizations [...] seek to isolate their technical cores from environmental influences **by establishing boundary-spanning units to buffer or level environmental fluctuations**.
>
> -- Thompson, Organizations in Action, 1967, p67, Chapter 6 (Organizational Rationality and Structure)

Accordingly, an organisation does not randomly draw boundaries. It protects its engineers (Thompson, Chapter 2) and spins up dedicated outward-facing roles, such as product managers, to absorb the fluctuations from the environment. Equally, following Conway's Law, the system architecture maps perfectly to the interfaces of these boundaries. We are not setting up random silos, but, we are building protection, which, inevitably, the software architecture is forced to copy.

```plain
[Emery & Trist's Causal Textures, the Environment]
                 │ 
                 ▼
     ┌───────────────────────┐
     │ Thompson's Buffer     │ (Open, Boundary-Spanning Unit to absorb Environment changes)
     │   ┌───────────────┐   │
     │   │ Technical     │   │ (Closed for internal Efficiency)
     │   │ Core          │   │
     │   └───────────────┘   │
     └───────────────────────┘
```

While Emery & Trist define the external textures and Thompson explains the organisational structure to survive the environment and isolate the core work, Jay R. Galbraith articulates organisation design using a micro-level dimension: the flow of information.

Galbraith's *Information Processing View* introduces the following proposition: **the greater the uncertainty of the task, the more information decision makers need to process during the task execution, to achieve a given level of performance**.

> ... the greater the task uncertainty, the greater the amount of information that must be processed among decision makers during task execution ...
>
> This is the problem of organisation design ...
>
> As the amount of uncertainty increases [...] the organisation must adopt integrating mechanisms ...
>
> -- Galbraith, Organization Design: An Information Processing View, 1974

If a task is well understood before executing the task, much of the activity can be preplanned. However, if it is not understood, then much more knowledge need to be acquired during the task execution.

The effect of uncertainty is that it limits our ability to preplan. Therefore, **the variations in organisational forms are variations in the strategies to increase our ability to preplan**, and so **increase our ability to manage uncertainty**. Executing a task, consequently, becomes an organisation design problem.

To solve this problem, Galbraith suggests four strategies to allow an organisation to increase information processing capacity:

- *Creation of Slack Resources*. As Tom Demarco denoted in [Slack](https://app.thestorygraph.com/books/276edcbf-3af8-4421-bf53-94a6518e8e85), an organisation that runs at full capacity is unable to innovate because it has zero capacity to learn, adapt, and reinvent itself. Therefore, leave 20-30% planning buffer to absorb unforeseen complexities during task execution.

- *Creation of Self-Contained Tasks*. Reduce the need for information by setting up, cross-functional, autonomous, decoupled product teams with end-to-end responsibility as well as having decoupled, isolated technical services.
  
- *Investment in Vertical Information Systems*. Increase the organisation's capacity to process information with enterprise product portfolios, to track roadmaps, and observability, to instantly see the health of the organisation's product. All information is available to everyone. No need-to-know nonsense.
  
- *Creation of Lateral Relationships*. Hierarchy lines on the org-chart as only communication channels is a disaster. They are too narrowband (Demarco). Cut through the vertical. Create direct horizontal channels with peers to solve problems instantly through Communities of Practice and open shared chat channels.

With information capacity as the constraint, Galbraith reveals the underlying operational mechanics of organisational boundaries: teams are configured not just to group skills, but to optimise information flow. Accordingly, Conway's Law discloses that teams optimised for information flow produce decoupled system architectures. Conversely, when an organisation keeps its rigid, vertical communication hierarchy, the system architecture mirrors it into deeply fragmented, siloed, coupled systems that choke under stress.

## The Architecture of Complex Systems: Near-Decomposability

Both communities, Organisation Design and Product Design, take their inspiration from Herbert A. Simon, [The Architecture of Complexity](https://www2.econ.iastate.edu/tesfatsi/ArchitectureOfComplexity.HSimon1962.pdf) in 1962.

> My thesis has been that one path to the construction of a non-trivial theory of complex systems is by way of a theory of hierarchy.
> ...
> In their dynamics, hierarchies have a property, near-decomposability, … [It] simplifies the description of a complex system, and makes it easier to understand ...
>
> Simon, The Architecture of Complexity, 1962

Simon introduces the idea of partitioning a complex problem, complex systems in a series of linked sub-problems to contain complexity. Very much alike Thompson's organisation is both closed and open, Galbraith's organisation strategies to manage uncertainty, Alexander's decomposition of the process of form-making, i.e. designing, in sub-problems and Parnas' concept of information hiding.

What Parnas called "information hiding" in software architecture (product design) is exactly what Thompson called a "boundary-spanning buffer" in organisational design. Both concluded that if we do not build abstractions around our core complexity, the environment will destroy our system.

Both, Alexander with its "process of form-making" and Thompson with "boundary-placing" focus on a shared action: *partitioning*.

## The Mirroring Hypothesis

When bringing these two parallel worlds together - Product Design and Organisation Design - Melvin Conway's 1968 observation becomes an inevitable law — or, in all correctness, a thesis that only became a law 40 years later once proof was provided by new academic research (more on this in Part 2 - Validation: The Research & Reality Check).

Product Design splits technical form to manage cognitive load. Organisation Design splits teams to handle environment and information constraints.

Thompson defines the organisational strategy to protect its core by structuring its internal teams to cope with the environment (Emery & Trist). These internal teams then represent a physical partitioning of the design process (Alexander).

However, these organisational boundaries - to shield from the environment - become the communication channels of the organisation. But, when uncertainty rises, we have to process more information. To keep communication costs low and optimise for information flow (Galbraith), the system architecture's modular boundaries (Parnas) must reflect the internal team's buffering boundaries (Thompson) to build autonomous, loosely coupled teams and Communities of Practice (Galbraith). Accordingly, the system architecture, mirrors the communication lines to minimise coordination overhead, and thus mirrors the organisational defence mechanism against external influences.

```plain
                                 Emery & Trist (Causal Textures - Environment)           
                                    │
                                    ▼
Alexander (Partitioning)    ---▶ Thompson ("Technical Core" + "Buffers" to survive the environment)
                                    │
                                    ▼
                                 Galbraith (Optimise Information Flow)              
                                    │
                                    ▼
Parnas (Information Hiding) ---▶ The Mirroring Principle (System Architecture copies Organisation Buffers)
```

The *Mirroring Principle* asserts a structural correspondence between two networks, one organisational (the org-chart) and one structural (the system architecture). Said differently, our communication structures dictate our system boundaries. Because technical modules naturally map directly to specific design teams, organisational structure and technical architecture will always tend to align.

Again, messy corporate structures produce messy software!

This was summarised in the 2016 paper [The Mirroring Hypothesis](https://www.hbs.edu/ris/Publication%20Files/Colfer%20Baldwin%20Mirroring%20Hypothesis%20Ind%20Corp%20Change-2016_8aa320ff-6aa6-42ef-b259-d139012faaf6.pdf) by Baldwin and Colfer. They concluded that **the organisational ties in firms will correspond to the technical dependencies in the work being performed**.

> The mirroring hypothesis predicts that organizational ties within a project, firm, or group of firms (e.g., communication, collocation, employment) will correspond to the technical dependencies in the work being performed.
>
> The Mirroring Hypothesis, Baldwin and Colfer, 2016

In recent years, this idea of the *Mirroring Principle* and *Conway’s Law* has resurfaced as a kind of guiding principle on how to organise teams. However, many people still remain fairly sceptical because it is still just a hypothesis. In the end, Melvin Conway did not provide a proof for the law.

There is a little story behind Melvin Conway's paper that he explains on his website. Conway send the paper to the Harvard Business Review. They rejected it on the grounds that there was no proof for the thesis. He then submitted it to Datamation, a major IT magazine at that time, which published it in April 1968.

But, in the meantime there has been some academic research done that support the thesis. Part 2 "*Validation: The Research & Reality Check*" explores this in more detail.

## Acknowledgments

[Eduardo da Silva](https://www.linkedin.com/in/emgsilva/), [João Rosa](https://www.linkedin.com/in/joaoasrosa/) and  [Trond Hjorteland](https://www.linkedin.com/in/trondhjort/) for shedding a light and fixing my thinking flaws.

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

- [The Architecture of Complexity](https://www2.econ.iastate.edu/tesfatsi/ArchitectureOfComplexity.HSimon1962.pdf), Simon, 1962
- [The Causal Texture of Organizational Environments](http://www.moderntimesworkplace.com/archives/ericsess/sessvol3/GEMTRCAUp53.pdf), Emery and Trist, 1965
- [Notes on the Synthesis of Form](https://monoskop.org/images/f/ff/Alexander_Christopher_Notes_on_the_Synthesis_of_Form.pdf), Alexander, 1964
- [Organizations in Action: Social Science Bases of Administrative Theory](https://www.goodreads.com/book/show/2284827), Thompson, 1967
- [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968
- [On the Criteria To Be Used in Decomposing Systems into Modules](https://www.win.tue.nl/~wstomv/edu/2ip30/references/criteria_for_modularization.pdf), Parnas, 1972
- [Organization Design: An Information Processing View](http://strategy.sjsu.edu/www.stable/pdf/Galbraith,%20J%20R,%201974,%20Interfaces.%204%20pp%2028-36.pdf), Galbraith, 1974
- [Causal texture, contextualism, contextural](https://coevolving.com/blogs/causal-texture-contextural-contextualism/), David Ing, 2020
