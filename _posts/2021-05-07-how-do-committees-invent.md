---
layout: note
title: How Do Committees Invent?
author:
  name: Melvin Conway
  twitter: conways_law
paper: https://www.melconway.com/Home/Committees_Paper.html
created_at: 2021-05-02
meta: 5 min read
category: notes
tags: [ Conway's Law ]
---

This is [the paper](https://www.melconway.com/Home/Committees_Paper.html) behind **Conway's Law**. I've assembled
some snippets from the paper that triggered me and added some thoughts.

---

Informal version:

> > Any organization that designs a system (defined more broadly here than just information systems) will inevitably produce a design whose structure is a copy of the organization's communication structure.
>
> -- **Conway's Law**

## Stages of Design

> there's never enough time to do something right, but there's always enough time to do it over.
>
> -- **Conway's Second Law**

## The designed system

> ... the very act of organizing a design team means that certain design decisions have already been made, explicitly or otherwise.
>
> Given any design team organization, there is a class of design alternatives which cannot be effectively pursued by such an organization because the necessary communication paths do not exist.
>
> Therefore, there is no such thing as a design group which is both organized and unbiased.


> We can view a system as a linear graph.
>
> Each node is a subsystem which communicates with other subsystems along the branches.
>
> Each subsystem may contain a structure similarly portrayed.

In turn each subsystem can again be viewed as a linear graph consisting of subsystems along branches.

> "Interface" refers to the inter-subsystem communication path or branch.

![The System as a linear graph](https://www.melconway.com/Home/Committees_Paper_files/commfig1.gif)

> The linear-graph notation is useful because it provides an abstraction that has the same form for the two entities we are considering:
>
> - the design organization
> - and the system it designs.
>
> - Replace "system" with "committee."
> - Replace "subsystem" with "subcommittee."
> - Replace "interface" with "coordinator."
>
> Just as with systems, we find that design groups can be viewed at several levels of complication.
>
> Is there any predictable relationship between the graph structure of a design organization and the graph structure of the system it designs? The answer is: Yes, the relationship is so simple that in some cases it is an identity.


> we have demonstrated that there is a very close relationship between the structure of a system and the structure of the organization which designed it.
>
> This kind of a structure-preserving relationship between two sets of things is called a homomorphism.

> ... there is a homomorphism from the linear graph of a system to the linear graph of its design organization.
>
> -- **Conway's Third Law**

## Systems image their design groups

> ... it is reasonable to assume that for any system requirement there is a family of system designs which will meet that requirement, we must also inquire whether the choice of design organization influences the process of selection of a system design from that family.
>
> If we believe our homomorphism, then we must agree that it does.
>
> To the extent that an organization is not completely flexible in its communication structure, that organization will stamp out an image of itself in every design it produces. The larger an organization is, the less flexibility it has and the more pronounced is the phenomenon.


> A contract research organization had eight people who were to produce a COBOL and an ALGOL compiler.
>
> ... five people were assigned to the COBOL job and three to the ALGOL job. The resulting COBOL compiler ran in five phases, the ALG0L compiler ran in three.

## System management

> The structures of large systems tend to disintegrate during development, qualitatively more so than with small systems.
>
> -- **Conway's Fourth Law**

> Why do large systems disintegrate?
>
> First, It is a natural temptation of the initial designer to delegate tasks when the apparent complexity of the system approaches his limits of comprehension. ... Either he struggles to reduce the system to comprehensibility and wins, or else he loses control of it.
>
> Second, application of the conventional wisdom of management to a large design organization causes its communication structure to disintegrate.
>
> One fallacy behind this calculation is the property of linearity which says that two men working for a year or one hundred men working for a week are resources of equal value.
>
> Assuming that two men and one hundred men cannot work in the same organizational structure our homomorphism says that they will not design similar systems; therefore the value of their efforts may not even be comparable.
>
> From experience we know that the two men, if they are well chosen and survive the experience, will give us a better system.

This confirms the experience we have build up over the years that:

Start small and grow the team with the system. Piece-meal growth. Refactor the system => Refactor the team => re-teaming

Delay staffing as long as possible => minimises communication boundaries

=> [**Brook's Law**](https://en.wikipedia.org/wiki/Brooks%27s_law): "*Adding manpower to a late software project makes it later*."

Intercommunication Formula from Fred Brooks: n(n - 1) / 2

-> team of 5 -> 10
-> team of 15 -> 105
-> team of 50 -> 1.225
-> team of 150 -> 11.175

-- Fred Brooks, 1975

=> [**Parkinson's Law**](https://en.wikipedia.org/wiki/Parkinson%27s_law): "*work expands so as to fill the time available for its completion*"

Manager's prestige is linked to the size of the design budget and the size of the design team

=> managers are incentivised to increase the size of the budget and of the team

> Probably the greatest single common factor behind many poorly designed systems now in existence has been the availability of a design organization in need of work.


> As you relate below, dysfunctions of the organization become errors in the software (per Melvin Conway).
>
> [@JeffGrigg1](https://twitter.com/JeffGrigg1), [May 3, 2021](https://twitter.com/JeffGrigg1/status/1389270571616178182?s=20)


> The second step in the disintegration of a system design -- the fragmentation of the design organization communication structure -- begins as soon as delegation has started.
>
> Third, the homomorphism insures that the structure of the system will reflect the disintegration which has occurred in the design organization.

## Conclusion

Formal version:

> ... organizations which design systems (in the broad sense used here) are constrained to produce designs which are copies of the communication structures of these organizations.
>
> -- **Conway's Law**

=> organizations are constrained to produce application designs which are copies of their communication structures

=> This often leads to unintended friction points.

=>  The **Inverse Conway Manoeuver** recommends evolving your team and organizational structure to promote your desired architecture. Ideally your technology architecture will display isomorphism with your business architecture.

> ... we have found a criterion for the structuring of design organizations: a design effort should be organized according to the need for communication.

> This criterion creates problems because the need to communicate at any time depends on the system concept in effect at that time. Because the design which occurs first is almost never the best possible, the prevailing system concept may need to change.

[Jeff Sussna calls this **Conway's Corrollary**](https://twitter.com/jeffsussna/status/1391441776829943809):

> Therefore, flexibility of organization is important to effective design.
>
> -- **Conway's Corrollary**


> Ways must be found to reward design managers for keeping their organizations lean and flexible. There is need for a philosophy of system design management which is not based on the assumption that adding manpower simply adds to productivity.

I guess, this is where [Team Topologies](https://teamtopologies.com/) comes into play.

