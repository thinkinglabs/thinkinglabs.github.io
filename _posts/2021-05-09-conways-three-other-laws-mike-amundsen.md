---
layout: note
title: Conway’s three other laws
author:
  name: Mike Amundsen
  twitter: mamund
slides: http://amundsen.com/talks/2015-10-velocity-teams/index.html
video: https://www.oreilly.com/library/view/velocity-conference-amsterdam/9781491928042/video231746.html
created_at: 2021-05-08
meta: 8 min read
category: notes
tags: [ Conway's Law, Brooks' Law, Dunbar ]
---

> Most of us know about Conway’s adage “*Any organization will produce a design which is a copy of the organization’s communication structure.*” But Conway coined four laws in his 1968 paper “*How Do Committees Invent?*” What are the other ones? Why are we not talking about them? And what do they tell us about optimizing teams in a distributed world?
>
> -- Mike Amundsen

Note taker note: *The notes were taken based only on the slides without the voice over.*

Here and there I've added my own observations in an italic paragraph.

---

## Effective Teams for Microservices

> [Microservices] allow organizations [to align] the architecture of their systems to the structure of their teams.
>
> -- Sam Newman, [Demystifying Conway’s Law](https://www.thoughtworks.com/insights/articles/demystifying-conways-law), 2015

## Conway's Law

> Any organization that designs a system (defined more broadly here than just information systems) will inevitably produce a design whose structure is a copy of the organization's communication structure.
>
> -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

=> A system’s design is a copy of the organization’s communication structure.

=> **Communication *[structures/channels]* dictates design.**

**Brooks’ Law**:

> Adding manpower to a late software project makes it later.
>
> -- Fred Brooks, 1975

**Intercommunication formula**:

```plain
n * (n − 1) / 2
```

-- *Fred Brooks, 1975*

=>

| team size | formula          | # intercommunications |
| ----------| -----------------| ----------------------|
| 5         | => 5*(5–1)/2     | = 10                  |
| 15        | => 15*(15–1)/2   | = 105                 |
| 50        | => 50*(50–1)/2   | = 1,225               |
| 150       | => 150*(150–1)/2 | = 11,175              |

**Dunbar’s Number**:

> A measurement of the “cognitive limit to the number of individuals with whom any one person can maintain stable relationships.”
>
> -- Robin Dunbar, 1992

=> As brain size increases, so does group size. Human group size as predicted by Dunbar's model comes out to about **150**.

=> Dunbar's Number = the max number of relationships a person can maintain

**Dunbar Groups**:

> - Intimate friends: 5
> - Trusted friends: 15
> - Close friends: 35
> - Casual friends: 150
>
> -- Robin Dunbar, 1992

Fred Brooks intercommunication formula `n * (n - 1) / 2` together with Conway's "*Communication dictates design*"

=> Conway's First Law tells us: **team size is important**

=> make the teams as small as necessary

Assessment: If you don’t have a personal relationship with every member of your TEAM, your team is probably TOO BIG.

Guidance: Aim for TEAM SIZE of “Dunbar level 1” (5), possibly “Dunbar level 2” (15).

*=> Amazon's two pizza teams*

## Conway's Second Law

> There is never enough time to do something right, but there is always enough time to do it over.
>
> -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

**Efficiency-Thoroughness Trade Offs (ETTOs)**:

Book: The ETTO Principle, Efficiency-Thoroughness Trade-Off, Why Things That Go Right Sometimes Go Wrong, Eric HollNagel

Satisficing v. Sacrificing

> **Satisficing** is explained as a consequence of limited cognitive capacity.
>
> **Sacrificing** is explained as a consequence of the intractability of the work environment”
>
> -- Eric Hollnagel, 2009

=> Problem too complicated? Ignore details.

=> Not enough resources? Give up features.

ETTOs are “normal” and result in success more often than failure.

Example: two interpretations of safety

- Safety-I

  Safety means that the number of things that go wrong (accidents, incidents,  near misses) is as low as possible.

  Safety can be achieved by first finding and then eliminating or weakening the causes of adverse outcomes.

- Safety-II = Resilience:

  Safety means the number of things that go right is as high as possible.
  
  Safety is the ability to succeed under varying conditions

  Safety requires an understanding of everyday performance. Safety can be achieved by strengthening this ability.

--  Hollnagel, Safety-I and Safety-II, 2014

=> the enemy is intractability.

> intractable
>
> *adjective*
>
> 1. : not easily governed, managed, or directed
>
>    //intractable problems
>
> 2. : not easily relieved or cured
>
>    // intractable pain
>
> 3. : not easily manipulated or shaped
>
>    // intractable metal
>
> -- [Merriam-Webster](https://www.merriam-webster.com/dictionary/intractable)

> intractability
>
> A problem that can be solved in theory (e.g. given large but finite resources, **especially time**), but for which in practice any solution takes **too many resources** to be useful, is known as an intractable problem.
>
> -- [Wikipedia](https://en.wikipedia.org/wiki/Computational_complexity_theory#Intractability)

Increasing Intractability

1. Systems grow too large
2. Rate of change increases
3. Overall expectations keep rising
  
-- Eric Hollnagel, 2009

=> Conway's Second Law tells us: **PROBLEM SIZE is important**

=> make the solution as small as necessary

Assessment: If you (or your team) cannot explain ALL the code in your release package, your release is TOO LARGE

*relates to Dan North - keep code as simple as possible, code that fits in your head*

Guidance: Execute many SMALL releases instead of a few LARGE releases.

=> Key Benefits of Continuous Delivery

- Higher Quality
- Improved Time to Market
- Reduced Cost
- Early ROI

-- Raphael Carvalho, [Continuous Delivery](https://slides.com/raphaelcarvalho/continuous-delivery#/9), 2014

## Conway's Third Law

**Homomorphism**:

> There is a homomorphism from the linear graph of a system to the linear graph of its design organization
>
> -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

> homomorphism
>
> *noun* Mathematics
>
> a transformation of one set into another that preserves in the second set the relations between elements of the first.
>
> -- [Oxford Languages](https://www.google.com/search?q=homomorphism+definition)

> structure-preserving relationship between two sets of things is called a *homomorphism*
>
> -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

=> Conway’s Third Law tells us: **CROSS-TEAM INDEPENDENCE is important**

=> make each team fully independent

Assessment: If you have to hold a release until some other team is ready, you are not an INDEPENDENT TEAM

*Because of the homomorphic force, when teams are dependent on each other, systems will become coupled and dependent. Therefore, the more teams are independent, the more systems become decoupled and independent from each other.*

**How engineers mitigate (anticipated) problems with dependencies on other teams?**

There were five strong responses that **minimize the dependency** itself, and two that adjust the project schedule.

- 63% Minimize code dependencies [on other teams]
- 59% Align product schedule with their dependencies’ schedules in order to ship only when their dependencies have finished their own work. This can be problematic if a dependency slips their schedule.
- 57% Have a backup plan in order to ship without the problem dependency
- 53% Reprioritize affected work items, potentially slipping a feature or work item to the next release
- 49% Eliminate code dependencies, which could mean to “clone and own” (copy and paste) the desired functionality from the other team’s code-base

-- Begel, et al, [Coordination in Large-Scale Software Teams](https://andrewbegel.com/papers/coordination-chase09.pdf), 2009

## Conway's Fourth Law

**Disintegration**:

> The structures of large systems tend to disintegrate during development, qualitatively more so than with small systems.
>
> -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

Three reasons Disintegration occurs...

1. > The realization that the system will be large, together with organization pressures, make irresistible the temptation to assign too many people to a design effort
   >
   > -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

   => Brooks’ Law: *Adding manpower to a late software project makes it later.*

2. > Application of the conventional wisdom of management to a large design organization causes its communication structure to disintegrate.
   >
   > -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

   => Dunbar’s Number: *A measurement of the “cognitive limit to the number of individuals with whom any one person can maintain stable relationships.*

3. > Homomorphism insures that the structure of the system will reflect the disintegration which has occurred in the design organization.
   >
   > -- Mel Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1967

   => Conway's Law: *Communication dictates design.*

=> Conway’s Fourth Law tells us: **TIME is against LARGE teams**

=> make release cycles short and small

=> Size/Complexity: The more complex and bigger [the product is] the higher the risk of failure.

![Size/Complexity table from Standish Chaos Report 2015](https://res.infoq.com/articles/standish-chaos-2015/en/resources/Complexity%20Matrix.jpg)

-- [Standish Chaos Report 2015](https://www.infoq.com/articles/standish-chaos-2015/)

Assessment: If your release dates are often missed, your SCOPE is TOO BIG.

Guidance: Aim for a SCOPE that supports a release cycle of two weeks or less.

## Review our options

1. **Conway's First Law**: actively manage communications within the teams and across teams.

   system dependencies vs team dependencies

   => Reduce [System] Complexity => Reduce Uncertainty

   -- Herbsleb, [Tactics for Global Software Development](https://herbsleb.org/web-pres/slides/Siemens-conference-7-17-08-dist.pdf), 2008

   > I'm puzzled :thinking:
   >
   > I went over slides about Conway's 3 other laws. Very insightful!
   >
   > It affirms: the lesson from Conway's Law is:
   > increase communication
   >
   > I thought Conway's Law was exactly about reducing communication.
   > Too much communication = too much system coupling.
   >
   > Am I wrong?
   >
   > -- [@tdpauw](https://twitter.com/tdpauw), [May 8, 2021](https://twitter.com/tdpauw/status/1391099588778549249)
   >
   > Lines of communication, structures. System coupling results from mirroring how communication flows, the bureaucratic roles and functions involved etc. Not the volume of communication. If anything,  in a flat hierarchy of teams working in the open you want an increased flow
   >
   > -- [@HimalMandalia](https://twitter.com/HimalMandalia), [May 8, 2021](https://twitter.com/HimalMandalia/status/1391103879249637376)

   *=> keep teams small => increase communication*

   => increase communication via:

   - real-time chat tools
   - video conferencing
   - online forums/news groups
   - wiki and web sites

   => reduce the effort required to locate and interact with the "right people"

2. **Conway’s Second Law**: Remember the process is continually repeating.

   => Continuous Delivery

   > The core concept of making small frequent changes, and testing at every step, reduces the risk inherent in deploying new code.
   >
   > Jez Humble

   => Support continuous processes

   - Implement small changes
   - Test immediately
   - Deploy constantly

   => Shorten the feedback loop as much as possible.

3. **Conway’s Third Law**: Organize teams in order to achieve the desired system.

   => Microservices

   > Organized around business capabilities (because Conway's Law).
   >
   > Productions, not Projects.
   >
   > -- James Lewis & Martin Fowler, [Microservices](https://martinfowler.com/articles/microservices.html), 2014

   => Organize teams by product or Business Unit

   - Combine design, develop, test, & deploy
   - Include storage, business process, & UI
   - Allow teams autonomy within their boundary
   - Require teams to interoperate, not integrate

   => Make sure teams own their complete lifecycle.

4. **Conway's Fourth Law**: Keep your teams as small as necessary, but no smaller.

   => Sizing Teams

   > If a team can’t be fed with two pizzas, it’s too big.
   >
   > -- Jeff Bezos, Amazon

   => Make team as small as necessary

   - Resist urge to grow teams in response to deadlines
   - Consider Dunbar’s groups when sizing teams
   - Be prepared to break into smaller teams [*=> Re-teaming and Allan Kelly's "start small and grow"*]

   => It’s better to be “too small” than to be “too big".

## Conway’s Lessons from 1967

1. Increase communications
2. Support continuous process
3. Organize teams by products
4. Make teams as small as necessary
