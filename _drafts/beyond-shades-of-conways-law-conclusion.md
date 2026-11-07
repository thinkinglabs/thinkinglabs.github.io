---
layout: article
title: "Beyond the Shades of Conway's Law - Conclusion: The Different Lenses"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
---

---


## Managers are Architects

> Another implication of Conway’s Law is that if we have managers deciding on teams, and deciding which services will be built, by which teams, we implicitly have managers deciding on the system architecture.
>
> -- Ruth Malan, Conway’s Law, 2008

So if managers decide on teams, which services to be built by which teams, we have managers deciding on system architecture and as such become architects

But the inverse is also true …

## Architects are Managers

> When I think of the really good technical people I know ... to solve technical problems requires them to work outside of the technical domain
>
> -- Allan Kelly, Return to Conway’s Law, 2006

People who claim to be an *Architect* need both technical and social skills. They need to understand both the people and the work within the socio-technical framework. They need to have a say in the organisational structures. Therefore, they have to be a manager too.

Anyone who makes decisions about the shape and placement of engineering teams is strongly influencing the systems architecture. This also suggests that even HR may be strongly shaping software architecture by deciding how teams are composed and interrelate ([Accidental Architects - how HR designs software systems]({% post_url 2022-02-11-flowcon-accidental-architects-how-hr-designs-software-systems-matthew-skelton %}), Matthew Skelton).

By now, it should be clear, that organisation design and system design are communicating vessels. Both need to be tackled together by the same informed group of people, i.e. managers *and architects*.

> Ultimately a big part of architecture isn’t about the technical or
> solution detail. It’s about putting in the right structures, ways of
> working, lines of communication and overall conditions
>
> -- @himal, Twitter, May 3, 2021

> Architecture needs to happen across the interfaces, and this also means across the system/organization interfaces. It means that system architects (who we call architects) and business architects (who we call managers) should not work as if one has no impact on the other.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

## How to Cope with Conway's Law

> Allan Kelly’s Advice
>
> Grow the team with the system. Small teams, small systems, piecemeal growth.
>
> Start as small as you can and grow as you need too.
>
> Don’t start thinking big.

Start small.

Delay staffing for as long as possible. Once we start adding staff, we are adding more communication structures to the organisation. We are adding more nodes to the hierarchy, and more nodes to the software. It grows the software. It changes the design of the software.

Instead of that. Start with the smallest team possible. Get a small system working. Small teams, small systems. Grow the team with the system, as we need. That is how we can keep control on our system architecture.

The bigger the team, the more the organisational structure will dictate our software structure. The harder it becomes to contain the software architecture.

Do not start to think big! Once we start thinking big, we need to staff. Once we staff, systems grow and get out of control ... because of the *Thousand Module Effect*, *Mealy’s Law* and *Brooke's Law*. In the end, we need to keep all those people ~~busy~~ working.

It is a hard sell to managers not to hire. That is counter intuitive.

At one FinTech, after the second funding round, the CEO went crazy. "*We need to hire, hire!*". My reaction was: "*No! No, no, no. We are not ready to hire. The organisation and the system are not ready.*". In the end, they did not hire. Not because they listened to me, but because it is hard to hire 🤷 Ultimately, they grew with the same team size. At some point even at reduced size, because they pivoted. Grow the business, not the team!

Start small! Probably slightly smaller than we think we need.

That is all interesting. But, this is only about growing an organisation. This works for startups and scale ups. What about all those existing big corporations with their current entangled teams? How to solve that?

Many will advocate the [*Inverse Conway Manoeuvre*](#inverse-conways-manoeuvre). As already said, that will not work for rigid, long-lived systems inside long-lived organisations because of the [*Reverse Conway’s Law*](#reverse-conways-law).

I do think we need to re-architect both the organisation and the IT systems together. Still, if we change one, we have to change the other and vice-versa. This will have to happen in many, many more smaller increments to cope with the *Homomorphic Force*, that structure preserving mapping that is at the heart of Conway’s Law and that keeps everything in balance. Thus, we need to make small changes, and adapt. This will take a decent long time to get where we want to be.

To cope with time, to stay focussed, I would adopt a continuous improvement framework like the [Improvement Kata](https://public.websites.umich.edu/~jmondisa/TK/The_Improvement_Kata.html) to create vision. Vision creates alignment for the whole organisation. We do this because of that. Because we want to achieve this thing in a far, far future.

---

<!-- from the original 2021 article -->

Therefore we need to understand what software architecture is needed before we organise the teams.

> Team assignments are the first draft of the architecture.
>
> Michael Nygard, [Release It!](https://www.goodreads.com/book/show/1069827.Release_It_), 2007

This means that anyone who makes decisions about the shape and placement of engineering teams is strongly influencing the systems architecture. And here we have Ruth Malan again.

> Another implication of Conway’s Law is that if we have managers deciding on teams, and deciding which services will be built, by which teams, we implicitly have managers deciding on the system architecture.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

Thus organisation design and software design are communicating vessels and both need to be tackled by the same informed group of people, i.e. managers *and architects*.

> Ultimately a big part of architecture isn’t about the technical or
> solution detail. It’s about putting in the right structures, ways of
> working, lines of communication and overall conditions
>
> -- [@himal](https://twitter.com/HimalMandalia), [May 3, 2021](https://twitter.com/HimalMandalia/status/1389119305145634816)

Therefore ...

> More then ever I believe that someone who claims to be an *architect* needs both technical and social skills, they need to understand people and work within the social framework. They also need a remit that is broader than pure technology -- they need to have a say in organizational structures and personnel issues, i.e. they need to be a manager too.
>
> Allan Kelly, [Return to Conway's Law](https://www.allankellyassociates.co.uk/archives/1169/return-to-conways-law/), Jan 6, 2006

To conclude ...

> When I think of the really good technical people I know ... sooner or later they all come to the point where they realise that **to solve technical problems requires them to work outside of the technical domain**.
>
> Allan Kelly, [Return to Conway's Law](https://www.allankellyassociates.co.uk/archives/1169/return-to-conways-law/), 2006

But ...

> I’ve had mixed experiences on this. Leadership that understands it has
> supported me in making the necessary structural changes. Leadership
> that does not understand... I run into problems with very quickly.
>
> “Why are you hacking my org? Aren’t you a tech person? Stay in your lane”
>
> -- [@himal](https://twitter.com/HimalMandalia), [May 3, 2021](https://twitter.com/HimalMandalia/status/1389124875047088129)

Alright, what started as just summarising the various ways different people have articulated Conway's Law as a sort of note-taking for myself, became a cross-reference of thoughts, observations and links between this whole mix. This article seems to become a never ending work.


## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}) - How the worlds of organisation and product design observed the same thesis independently.
- [Validation: The Research & Reality Check]({% post_url 2026-06-20-beyond-shades-of-conways-law-validation %}) - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- [Mechanics: The Mathematical & Geometrical Shades]({% post_url 2026-08-31-beyond-shades-of-conways-law-mechanics %}) - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- [Strategy: Reversing the Law]({% post_url 2026-09-20-beyond-shades-of-conways-law-strategy %}) - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- [Scale: Conway's Corollary]({% post_url 2026-10-31-beyond-shades-of-conways-law-scale %}) - The required organisational flexibility.
- [Dynamics: Conway's Time Component]({% post_url 2026-11-05-beyond-shades-of-conways-law-dynamics %}) - The "Engineer Half-Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Bibliography
