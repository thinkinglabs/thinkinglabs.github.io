---
layout: article
title: Shades of Conway's Law
author:
  name: Thierry de Pauw
  twitter: tdpauw
created_at: 2021-05-07
meta: 8 min read
category: articles
tags: [ Conway's Law ]
---

Over time, different paraphrased versions of **Conway's Law** got in use into
addition to the original one. This is an attempt to give an overview of the
ones I have found when recently going over Conway's Law literature.

---

The original definition of **Conway's Law** by Melvin Conway.

> Organisations which design systems are constrained to produce designs which are copies of the communication structures of these organisations.
>
> -— Melvin Conway, How Do Committees Invent?, 1968

Yourdon and Constantin rephrased Conway's Law more firmly.

> The structure of any system designed by an organization is isomorphic to the structure of the organization.
>
> -- Edward Yourdon and Larry L. Constantine, Structured Design, 1979

Eric Raymond restated Conway's Law as follows.

> The organization of the software and the organization of the software team will be congruent.
>
> -— Eric Raymond, The New Hacker's Dictionary (3rd ed.), 1996

Summarising the COBOL example from the paper.

> If you have 4 groups working on a compiler, you’ll get a 4-pass compiler.
>
> -— Eric Raymond, The New Hacker's Dictionary (3rd ed.) p. 124., 1996

Tom Cheatham's Amendment to Conway's Law.

> If a group of N persons implements a COBOL compiler, there will be N−1 passes. Someone in the group has to be the manager.
>
> -— Eric Raymond, The New Hacker's Dictionary (3rd ed.) p. 124., 1996

James Coplien and Neil Harrison expressed it as follows.

> If the parts of an organization (e.g., teams, departments, or subdivisions) do not closely reflect the essential parts of the product, or if the relationships between organizations do not reflect the relationships between product parts, then the project will be in trouble ... Therefore: Make sure the organization is compatible with the product architecture.
>
> -— James Coplien & Neil Harrison Organisation patterns of agile software development, 2004

Ruth Malan is good at formulating Conway's Law in catchy ways.

The following relates to the closing thoughts of Melvin Conway: "*The initial design of a system is never the best. The system may need to change. Therefore it requires flexibility of the organisation to design effectively.*".

> Another implication of Conway’s Law is that if we have managers deciding on teams, and deciding which services will be built, by which teams, we implicitly have managers deciding on the system architecture.
>
> Conway’s Law also kicks in if we take an initial guess at the system decomposition allocate subsystems to teams, and sally forth–the team boundaries will tend to become boundaries within the system.
>
> -- Ruth Malan, [Conway's Law, Feb 13, 2008](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/)

> Architecture needs to happen across the interfaces, and this also means across the system/organization interfaces. It means that system architects (who we call architects) and business architects (who we call managers) should not work as if one has no impact on the other.
>
> -- Ruth Malan, [Conway's Law, Feb 13, 2008](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/)

Over beer and food, Martin Tompson and Pieter Hintjes came with the following definition.

> Conway's Law, which states, roughly, that the things an organization produces will reflect how the organization communicates.
>
> Martin Tompson or Pieter Hintjens, [Sex in Title, and Other Stories](http://hintjens.com/blog:73), Dec 16, 2013

In the same article, Pieter Hintjes continues ...

> A large scale system is one that stretches across time and space. A large organization similarly, stretches across time and space. Conway's Law ties the two. How we organize defines how we think collectively, and thus what we make collectively.
>
> -- Pieter Hintjes, [Sex in Title, and Other Stories](http://hintjens.com/blog:73), Dec 16, 2013

Again Ruth Malan.

> We can expect continued evolution not just in the systems we create, but the organizational forms that create them.
>
> As we create more systems-of-(themselves complex)-systems, we can expect the organizational forms to have to evolve to accommodate the greater system-level challenges in the system and in the organization.
>
> They [system and organization] will co-evolve, because if they don't, Conway's Law warns us that the organization form will trump intended designs that go "cross-grain" to the organization warp.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20190924192153/http://www.ruthmalan.com:80/Journal/2013/2013JournalDecember.htm#Conways_Law), Dec 17, 2013

According to Michael Nygard system architecture is a good source for archaeological research on past enterprise decisions.

> You can read the history of an enterprise's political struggles in its system architecture.
>
> -- [Michael Nygard](https://twitter.com/mtnygard), [May 8, 2013](https://twitter.com/mtnygard/status/332131878830211073)

Michael Feathers says when you ship your product, you ship your organisation.

> Conway's Law by [@mfeathers](https://twitter.com/mfeathers) - or "you always ship your organization, so design your organization well" [#craftconf](https://twitter.com/hashtag/craftconf)
>
> -- [@bjorn_fb](https://twitter.com/bjorn_fb), [Apr 24, 2014](https://twitter.com/bjorn_fb/status/459367064470573056)

Again Michael Feathers.

> In capsule form, Conway’s Law implies that if you have, say, three teams, chances are you will end up with three subsystems whether you intend to or not.
>
> When the cost of communication goes up we, often unconsciously, organize our work to minimize it.
>
> If it’s easier for me to share a vision and communicate within my local team, we end up producing something cohesive that is a bit detached from other teams’ work.
>
> -— Michael Feathers, [Twitter, Reddit and Conway's Law](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), 2017

Lastly, I found in Dan Slimmon's slides [Conway's Law: The Skeleton of Devops](https://www.slideshare.net/danslimmon/conways-law-the-skeleton-of-devops) this one from Adam Jacob (we assume the one from Chef).

> Your org structure isn't solving your problem.
>
> It's an artifact of how you've solved it before.
>
> -- Adam Jacob

## Bibliography

- [*How Do Committees Invent?*](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway
- [*What do I think about Conway's Law now?*](https://www.allankellyassociates.co.uk/static/presentations/EuroPLoP2005/ConwaysLawFocusGroup.pdf), Lise Hvatum and Allan Kelly's at EuroPLoP 2006
- [*Continuous Delivery and Conway’s Law*](https://www.slideshare.net/allankellynet/conways-law-continuous-delivery), Allan Kelly
- [*A Trace in the Sand*](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm), Ruth Malan
- [Conway's Law](https://en.wikipedia.org/wiki/Conway%27s_law) on Wikipedia
