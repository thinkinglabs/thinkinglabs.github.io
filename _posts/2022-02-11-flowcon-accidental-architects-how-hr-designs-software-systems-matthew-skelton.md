---
layout: note
title: Accidental Architects - how HR designs software systems
event:
  name: FlowCon
  date: 2020-11-12
author:
  name: Matthew Skelton
  twitter: matthewpskelton
slides: https://www2.slideshare.net/matthewskelton/accidental-architects-how-hr-designs-software-systems-team-topologies-flowconfr-20201112 
video: https://www.youtube.com/watch?v=ctEGTBOR1JY
created_at: 2020-11-12
category: notes
tags: [ HR, Conway's Law, Dunbar's Number, FlowCon ]
---

Who designs the architecture of your software systems? Conway's Law suggests that HR may be strongly shaping software architecture by deciding how teams are composed and interrelate. Do you want HR designing your software architecture?

---

topology = the way in which constituent parts are interrelated or arranged

=> team topology = the way in which teams interrelate and arranged

Who designs the architecture of software systems?

- is it software engineers?
- is it software architects?
- or could it actually the HR department?

HR can act as accidental architects of software systems

> Any organization that designs a system (defined broadly) will produce a design  whose structure is a copy of the organisation's communication structure.
>
> -- Conway's Law 1968

Confirmed by other papers.

> ... products tend to 'mirror' the architectures of the organizations in which they are developed. This dynamic occurs because the organization's governance structures, problem solving routines, and communication patterns constrain the space in which it searches for new solutions.
>
> -- MacCormack et al, Exploring the Duality between Product and Organizational Architectures: A Test of the Mirroring Hypothesis, 2012

> We find strong evidence to support the hypothesis that a product's architecture tends to mirror the structure of the organization in which it is developed.
>
> -- MacCormack et al, Exploring the Duality between Product and Organizational Architectures: A Test of the Mirroring Hypothesis, 2012

Jet engine design & manufacture:

> ... we provide empirical evidence that product ambiguity exists, and it is more likely to be present across organizational and system boundaries.
>
> -- Sosa et al, The Misalignment of Product Architecture and Organizational Structure in Complex Product Development, 2004

Automotive design & manufacture:

> ... mismatches between product architecture and organizational structure [are] positively associated with quality problems.
>
> -- Gokpinar et al, The impact of misalignment of organizational structure and product architecture on quality in complex product development, 2010

We can take advantage of the mirroring effect of Conway's Law
=> Reverse Conway's Manoeuvre

Design the organisation to mirror the desired system architecture

=> this is basically heretic compared to the way software systems are designed where we don't take the organisation into consideration

What does this mean in practice?

Imagine: 4 software teams that do front-end and back-end and a single database team

=> communication path in the organisation: Teams A-B-C-D -> DB team

=> results in the following architecture:

| ![Team Topology: Multiple App teams + Single DB team](/images/flowcon-accidental-architects-how-hr-designs-software-systems/topology-1.png) | ![Architecture: Multiple Apps + Single DB team](/images/flowcon-accidental-architects-how-hr-designs-software-systems/architecture-1.png) |

if however we want an organisation as follows:

| ![Team Topology: Multiple App teams with full end-to-end responsibility](/images/flowcon-accidental-architects-how-hr-designs-software-systems/topology-2.png) | ![Architecture: Multiple Apps each with a DB](/images/flowcon-accidental-architects-how-hr-designs-software-systems/architecture-2.png) |

=> requires teams with end-to-end knowledge including DB knowledge

> if the architecture of the system and the architecture of the organization are at odds, the architecture of the organization will win.
>
> -- Ruth Malan, 2008

=> the organization's design is a constraint on the "solution search space"

Guiding principles for designing software systems:

- Rapid flow of change => continuous flow of change
- We need to listen what happens in the live environment and bring this back into the organization => fast feedback

If we have many handovers => causes delays and waiting times => kill the flow of change

=> we need a team that has end-to-end responsibility:

- releasability
- testability
- operability
- supportability

=> Product Team

=> Stream-Aligned team: focus on the business domain, don't need to take care of the underlying platform nitty-gritty details

In larger organisations we often have a platform => Platform team

Stream-Aligned teams are not dependent on each other => loosely coupled

There is a limit on the size of these teams
because there is a natural limit on trust inside teams

> an individual's social network (meaningful relationships) is typically in the order of 100-200 individuals
>
> -- Robin Dunbar

Similar team boundary in military:
[Social Inflection Point](https://commando.dev/writing/social-inflection-points/) that exist in military groupings, Ben Ford

- section: 8 (size of a hunting group)
- troop: 30-50 (size of a guild)
- company: 100-150 (size of a village)

Trust dynamics can change when crossing a Dunbar boundary. Expect different rules & non-linear effects.

AutoTrader example: when rearranging offices, made sure everyone involved in different business units (car leasing, commercial car sales and private car sales), were on the same floor
=> enable the fast flow of change inside a business unit

Slack (the tool): have one workspace per team => trust

Co-design the organisation and the system architecture

=> joint effort between engineers, architects and the people that make organisational decisions (managers, HR, facilities)

Fundamental is a Team-first approach

=> this gives you a flavour on why HR might be an accidental architecture if you don't make it a joint effort

## Resources

[Team Topologies for Remote Teams](https://teamtopologies.com/remote-first)

[Team Topologies on GitHub](https://github.com/teamtopologies)
