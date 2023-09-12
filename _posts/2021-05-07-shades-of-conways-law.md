---
layout: article
title: Shades of Conway's Law
author:
  name: Thierry de Pauw
  twitter: tdpauw
created_at: 2021-05-07
meta: 11 min read
category: articles
tags: [ Conway's Law ]
---

Over time, different people have articulated **Conway's Law** in various different ways.
This is an overview of the variations I found when recently going over Conway's
Law literature.

---

*Update May 25, 2021: Add the Inverse Conway Manoeuvre.*

*Update June 27, 2021: Add how incremental software development impacts the organisation.*

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

Adding *Tom Cheatham's Amendment to Conway's Law*.

> If a group of N persons implements a COBOL compiler, there will be N−1 passes. Someone in the group has to be the manager.
>
> -— Eric Raymond, The New Hacker's Dictionary (3rd ed.) p. 124., 1996

James Coplien and Neil Harrison expressed it as follows.

> If the parts of an organization (e.g., teams, departments, or subdivisions) do not closely reflect the essential parts of the product, or if the relationships between organizations do not reflect the relationships between product parts, then the project will be in trouble ...
>
> Therefore: Make sure the organization is compatible with the product architecture.
>
> -— James Coplien & Neil Harrison Organisation patterns of agile software development, 2004

Allan Kelly’s Corollary:

> Organisational design is system design.
>
> -— Allan Kelly, 2005

Or put differently by Ruth Malan.

> If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

Ruth Malan has always been good at formulating Conway's Law in catchy ways.

> The architecture of the system gets cemented in the forms of the teams that develop it.
>
> ...
>
> Conway’s Law also kicks in if we take an initial guess at the system decomposition, allocate subsystems to teams, and sally forth–the team boundaries will tend to become boundaries within the system.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

This relates to two points raised by Melvin Conway in his seminal paper:

- At the very beginning: "*the very act of organizing a design team means that certain design decisions have already been made, explicitly or otherwise.*"
- And towards the end as a closing thought: "*The initial design of a system is never the best. The system may need to change. Therefore it requires flexibility of the organisation to design effectively.*" This in turn suggests the requirement for Conway's Corollary which we will get to further down the article.

> Anything else will be a feat of architectural heroics; hard to accomplish, when architectural heroics have to compete with schedule heroics driven by the steady beat of integration clocks.
>
> Architecture needs to happen across the interfaces, and this also means across the system/organization interfaces. It means that system architects (who we call architects) and business architects (who we call managers) should not work as if one has no impact on the other.
>
> -- Ruth Malan, [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

Which nicely winks towards [*Team Topologies*](https://teamtopologies.com/) that discusses team interfaces in depth.

Over beer and food, Martin Thompson and Pieter Hintjes came with the following definition.

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

According to Michael Nygard system architecture is a good source for archaeological research on past enterprise decisions which opens an interesting discussion on technology and politics.

> You can read the history of an enterprise's political struggles in its system architecture.
>
> -- [@mntnygard](https://twitter.com/mtnygard), [May 8, 2013](https://twitter.com/mtnygard/status/332131878830211073)
> 
> @mtnygard A history of Conway's Law
>
> -- [@SteveSmith_Tech](https://twitter.com/SteveSmith_Tech), [May 8, 2013](https://twitter.com/SteveSmith_Tech/status/332146069221810176)
>
> @mtnygard That's some sort of corollary to Conway's Law.
>
> -- [@jmbroad](https://twitter.com/jmbroad), [May 8, 2013](https://twitter.com/jmbroad/status/332132484902948866)
>
> @jmbroad Definitely! It is the effect of changes in structure over time. (Credit goes to @mfeathers for the original thought there.)
>
> -- [@mntnygard](https://twitter.com/mtnygard), [May 8, 2013](https://twitter.com/mtnygard/status/332133107245408256)
>
> @mtnygard @mfeathers Unsurprising. I esteem you both as masters of software sociology. I recommend Arch w/o End State to everyone I know. :)
>
> -- [@jmbroad](https://twitter.com/jmbroad), [May 8, 2013](https://twitter.com/jmbroad/status/332133754724286464)

[Architecture without an end state](https://www.oreilly.com/content/michael-nygard-on-architecture-without-an-end-state/) means accepting that “*changes you’re starting now will co-exist with changes that started last year and the year before. If you adopt that perspective, then you stop trying to rip up the pavement and do something completely new, and you focus a lot more on incremental change*”. And here starts your history of decisions.

> Software, like all technologies is inherently political. Code inevitably reflects the choices, biases and desires of its creators" J Cascio
>
> -- [@stephanierieger](https://twitter.com/stephanierieger), [May 5, 2014](https://twitter.com/stephanierieger/status/463328024591478784)

> Politics plays a huge role. And a lot of the role it plays is in what it silences. But we don't know the stories of silence.
>
> -- Ruth Malan, [Conway's Law-ish](https://web.archive.org/web/20200621234405/http://www.ruthmalan.com:80/Journal/2013/2013JournalMay.htm#Conways_Law_ish), Aug 5, 2013

Interestingly, this discussion on history and politics lays the foundations on how piecemeal growth or incremental software development impacts the organisation.

Incremental software development is an essential condition to growing IT systems based on feedback and learning. It is the only way we can satisfy what is required to support users of IT systems the right way.

> Piecemeal growth, or incremental development, is not just desirable but a fact of life in software. Even so, we need to build more learning into our process. More learning when it is cheaper to find and fix problems with the vision (doing course corrections toward "right system") and structure (built right).
>
> Then, accepting that we will continue to learn and evolve our system, we need to invest in fixing the mistakes. Incrementally adding functionality yes, but repairing structural defects too. This investment is the crucial dual to piecemeal growth that we too often forget in software.
>
> When we keep marching to a frenetic "add value" drumbeat, we get into a situation where the system threatens to crumble under the mass of deferred structural issues.
>
> ...
>
> Going from the messiness of our discovery-oriented process to the well-factored, tested integrity of our engineered system shouldn't be considered rework or waste! Unless we leave it until after it has sorely impacted users and our business viability. That is waste.
>
> As we proceed in the fog of uncertainty, entropy grows -- and produces more fog! Under uncertainty we "give things a try"; accept good enough, and try the next thing. As entropy grows, it introduces its own uncertainty...
>
> -- Ruth Malan, [Conway's Law Reverb](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm#Conways_Law), May 5, 2014

But incremental software development has a consequential corollary. As software grows, entropy grows. To contain entropy, we need to refactor systems. In the end, many refactorings result in a significant redesign of systems. Incremental software development requires growing and redesigning the organisation to fit the new system. It is a consequence of the Inverse Conway Manoeuvre. We will come back to this at the end of the article. Grow the organisation alongside the growing systems.

> Refactoring is the corollary to piecemeal growth, allowing entropy containment. But we have to refactor the organization too? If it would subvert the system (re)design and evolution.
>
> ...
>
> There is a relationship between the architecture of the organization (and its communication flows) and the architecture of the system (and its boundaries and flows). We need to take this into account, to reap synergies rather than doing the harder thing, trying to "swim against the current."
>
> ...
>
> Integrating across organizational divides is a challenge. When left to happy accident, may well have all the smack of accident rather than design - as in, designed to get more what we want, looking for consequences so we get less unintended side-effecting from being system-blind.
>
> -- Ruth Malan, [Conway's Law Reverb](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm#Conways_Law), May 5, 2014

All this naturally follows Allan Kelly's advice: "_Grow the team with the system. Small teams, small systems, piecemeal growth. Start as small as you can and grow as you need too. Don’t start thinking big._"

According to Michael Feathers, when you ship your product, you ship your organisation.

> Conway's Law by [@mfeathers](https://twitter.com/mfeathers) - or "you always ship your organization, so design your organization well" [#craftconf](https://twitter.com/hashtag/craftconf)
>
> -- [@bjorn_fb](https://twitter.com/bjorn_fb), [Apr 24, 2014](https://twitter.com/bjorn_fb/status/459367064470573056)

Again from Michael Feathers.

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

Which is again an expression of the Inverse Conway Manoeuvre.

This seemingly flows into Mel Conway's observation:

> The importance of [Conway's Law] ... is not that your design organization determines the things you can design.
>
> The importance of the principle ... is ... that **your design organization is keeping you from designing some things** that perhaps **you should be building**.
>
> The principle creates an imperative (1) to keep asking: “Is there a better design that is not available to us because of our organization?” and (2) to be open to changing the organization if a better design is found.
>
> -- Mel Conway, [Toward Simplifying Application Development in a Dozen Lessons](http://melconway.com/Home/pdf/simplify.pdf), 2016

To change the organisation you need **Conway's Corollary**:

> And then there is what I call Conway’s Corollary:
>
> “organizational flexibility is important to effective design”.
>
> IMO this is the the most profound part of his article.
>
> -- [@jeffsussna](https://twitter.com/jeffsussna), [May 9, 2021](https://twitter.com/jeffsussna/status/1391441776829943809?s=20)

Without organisational flexibility, as Ruth Malan says, "*[when] architecture of the system and the architecture of the organisation are at odds, the organisation wins*".

The organisation will always be limited to produce designs that match the real, on-the-ground communication structure of the organisation. Note that the real on-the-ground communication structure are not necessarily the ones depicted on the traditional organisation chart. People do not restrict their communications only to the lines on the org chart. Teams reach out to whomever they *depend on* to get their work done. Again team interfaces from [*Team Topologies*](https://teamtopologies.com/).

This brings us gracefully to the **Inverse Conway Manoeuvre**.

> ... organizations should evolve their team and organizational structure to achieve the desired architecture. The goal is for your architecture to support the ability of teams to get their work done - from design through to deployment - without requiring high-bandwidth communication between teams.
>
> -- Nicole Forsgren, PhD, Jez Humble and Gene Kim, [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate), 2018

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

## Acknowledgment

I want to thank [Paul Hammant](https://paulhammant.com/2018/10/07/conways-observation) for nudging me to include the Inverse Conway's Manoeuvre and for saying this is a great article. Thank you, Paul!

I also would like to thank [Ruth Malan](https://twitter.com/ruthmalan) for writing down and sharing her reflections on Conway's Law. A lot of the above content is influenced by the traces Ruth wrote in the sand.

## Bibliography

- [*How Do Committees Invent?*](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968
- [*Structured Design*](https://www.goodreads.com/book/show/946145.Structured_Design), Edward Yourdon and Larry L. Constantine, 1979
- [*The New Hacker's Dictionary (3rd ed.)*](https://www.gutenberg.org/files/3008/3008-h/3008-h.htm), Eric Raymond, 1996
- [*Organisational patterns of agile software development*](https://www.goodreads.com/book/show/756250.Organizational_Patterns_of_Agile_Software_Development), James Coplien & Neil Harrison, 2004
- [*What do I think about Conway's Law now?*](https://www.allankellyassociates.co.uk/static/presentations/EuroPLoP2005/ConwaysLawFocusGroup.pdf), Lise Hvatum and Allan Kelly's at EuroPLoP 2005
- [*Return to Conway's Law*](https://www.allankellyassociates.co.uk/archives/1169/return-to-conways-law/), Allan Kelly, 2006
- [Release It!](), Michael Nygard, 2007
- [*Conway's Law*](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [*Conway's Law-ish*](https://web.archive.org/web/20200621234405/http://www.ruthmalan.com:80/Journal/2013/2013JournalMay.htm#Conways_Law_ish), 2013
- [*Conway's Law Reverb*](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm#Conways_Law), Ruth Malan, 2014
- [*Continuous Delivery and Conway’s Law*]({% post_url 2021-05-13-continuous-delivery-and-conways-law-allan-kelly %}), Allan Kelly, 2014
- [*Toward Simplifying Application Development in a Dozen Lessons*](http://melconway.com/Home/pdf/simplify.pdf), Mel Conway, 2016
- [*Twitter, Reddit and Conway's Law*](https://michaelfeathers.silvrback.com/social-media-architecture-and-conway-s-law), Micheal Feathers, 2017
- [*Team Topologies*](https://teamtopologies.com), Matthew Skelton and Manuel Pais, 2019
- [*Conway's Law*](https://en.wikipedia.org/wiki/Conway%27s_law) on Wikipedia
