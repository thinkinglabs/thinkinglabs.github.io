---
layout: article
title: "Beyond the Shades of Conway's Law - Foundations: The Origin & The Mirroring Principle"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/beyond-the-shades-of-conways-law/beyond-the-shades-of-conways-law-foundations.png
---

In 1968, Melvin Conway expressed a theory on how system designs follow the design organisation's communication structures. In the same period, the communities of organisation design and product design observed the same thesis independently. This became known as the **Mirroring Principle**.

---

Back in 1968, Melvin Conway formulated the following hypothesis:

> Organisations which design systems are constrained to produce designs which are copies of the communication structures of these organisations.
>
> -- Melvin Conway, [How do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

![Conway's Law, Credit Tomasz Tunguz — Venture Capitalist at RedPoint](/images/shades-of-conways-law/conways_law_cornet.png)
<center><i>Source: <a href="https://empathy.guru/2018/10/14/im-not-the-only-person-interested-in-conways-law/">I’m Not the Only Person Interested in Conway’s Law</a>, Chuck Pezeshki</i></center><br/>

Essentially, this means, the organisation and the system keep each other in balance. Modifying the organisation will have an impact on the system. Modifying the system will have consequences for the organisation. Not considering that will cause friction in the organisation or the system. That may have dramatic consequences from a design point of view.

To be competitive as an organisation in the market, and to effectively design the right thing our customers expect us to deliver, we better understand and take advantage of this.

Note that when Melvin Conway mentions a system he really means this in the broad sense. This is not limited to only software or IT systems. This can be buildings, planes, machinery, vehicles, but also engines or public transportation systems, communication systems, …, anything.

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

When reading Thompson I realised that Thompson was foundational for organisation design. Before Thompson there were two lines of thoughts:

*Organisations as closed systems*. Which assumes all elements and processes of interest are internal to the organisation. The idea here is to limit uncertainty as much as possible and thus to eliminate the influence of its environment. Think Taylorism, looking for the one best way to organise a task. This is standard factory production line systems.

*Organisations as open systems*. We cannot think of the organisation alone without its surrounding environment. The organisation structure and behaviour are affected by environmental influences. The organisation must be an adaptive system that tries to survive its environment.

> ... differences in technical functions, or technologies, cause significant differences among organisations ...
>
> -- Thompson, Organizations in Action, 1967, p12

According to Thompson **an organisation is not either closed or open, it is both**. The internal technical core, the production component of the organisation is closed. We want to shield this off from the influence of the environment. But at the boundaries, the organisation must attend and adapt to changes in the environment. Therefore, it has to be open to environmental signals. As such, at its boundaries, it is an open system.

Galbraith introduces the following proposition:

The greater the uncertainty of the task, the more information decision makers need to process during the task execution, to achieve a given level of performance.

> ... the greater the task uncertainty, the greater the amount of information that must be processed among decision makers during task execution ...
>
> This is the problem of organisation design ...
>
> As the amount of uncertainty increases [...] the organisation must adopt integrating mechanisms ...
>
> -- Galbraith, Organization Design: An Information Processing View, 1974

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

Notes on the Synthesis of Form is all about how to optimise the process of design, i.e. the process of inventing physical things. In a way, we try to reduce the gap between the designer’s small capacity and the great size of their task.

According to Alexandre, every design problem starts with an effort to achieve fitness between the form and its context. The *form* is the solution to the design problem. The *context* defines the design problem. Fitness means, we try to adapt the form, the solution, to its context, the problem definition.

No complex adaptive system will succeed in adapting, in a reasonable amount of time, unless the adaption happens subsystem by subsystem, where each subsystem is relatively independent from each other.

Therefore, we may picture the process of form-making, i.e. designing, as the action of a series of subsystems.

> We may therefore picture the process of form-making as the action of a series of subsystems, all interlinked, yet sufficiently free of one another to adjust independently in a feasible amount of time.
>
> -- Alexander, Notes on the Synthesis of Form, 1964, p41

Now, that works because the cycles of correction and recorrection, which occur during adaptation, are restricted to one subsystem at a time.

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

![Beyond the Shades of Conway's Law](/images/beyond-the-shades-of-conways-law/beyond-the-shades-of-conways-law-foundations.png)
<center><i>Google Gemini generated visual</i></center><br/>

All of the above was summarised in the 2016 paper [The Mirroring Hypothesis](https://www.hbs.edu/ris/Publication%20Files/Colfer%20Baldwin%20Mirroring%20Hypothesis%20Ind%20Corp%20Change-2016_8aa320ff-6aa6-42ef-b259-d139012faaf6.pdf) from Baldwin and Colfer.

They concluded that **the organisational ties in firms will correspond to the technical dependencies in the work being performed**.

> The mirroring hypothesis predicts that organizational ties within a project, firm, or group of firms (e.g., communication, collocation, employment) will correspond to the technical dependencies in the work being performed.
>
> The Mirroring Hypothesis, Baldwin and Colfer, 2016

In recent years, this idea of the *Mirroring Principle* and *Conway’s Law* has resurfaced as a kind of guiding principle on how to organise teams. However, there is still a good deal of people that are fairly sceptical about this because it is just a hypothesis. In the end, Melvin Conway did not provide a proof for the law.

There is a little story behind Melvin Conway's paper that he explains on his website. Conway send the paper to the Harvard Business Review. They rejected it on the grounds that there was no proof for the thesis. He then submitted it to Datamation, a major IT magazine at that time, which published it in April 1968.

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
