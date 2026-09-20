---
layout: article
title: "Beyond the Shades of Conway's Law - Scale: Conway's Corollary"
author: Thierry de Pauw
category: articles
tags: [ Conway's Law, Open Systems Theory ]
---

The first prototypes of a system are merely hints towards what a final design could look like. Then again, they are only clues. To crystallise the design, we have to iterate with more new experiments and collect feedback. However, this repercuss in possible unexpected ways on the organisation for the unexpecting leader.

---

As we know, in engineering, the initial design of a system is rarely the best.

> The initial design of a system is never the best. The system may need to change. Therefore it requires flexibility of the organisation to design effectively.
>
> -- Melvin Conway, [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

As we work on the system, we often learn the relevant architecture. As we move forward, we get feedback, new information, we learn, and we adapt.

But this has consequences ... for the organisation. This requires organisational flexibility to come to an effective design. This is **Conway's Corollary**.

> Organizational flexibility is important to effective design
>
> – Conway’s Corollary, Jeff Sussna (@jeffsussna), Twitter, May 9, 2021

Without organisational flexibility, we are limited to produce a system design that matches the real, on-the-ground communication structure of the organisation. Because "*if the system architecture and the organisation architecture are at odds, the organisation wins*" (Ruth Malan, 2008).

Be aware that the real on-the-ground communication structures are not necessarily the ones depicted on the traditional organisation chart. People do not restrict their communications only to the lines on the organisation chart. Teams reach out to whomever they *depend on* to get their work done.

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

Many refactorings result in a significant redesign of the system.

Henceforth, incremental software development impacts the organisation because we are redesigning the system. It requires growing and redesigning the organisation as the system grows to fit the new system. It requires organisational flexibility.

> They [system and organization] will co-evolve, because if they don't, Conway's Law warns us that the organization form will trump intended designs that go "cross-grain" to the organization warp.
>
> -- Ruth Malan, [Conway’s Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Feb 13, 2008

Organisation and system need to co-evolve!

[Adrian Cockcroft](https://mastodon.social/@adrianco), the former Chief Architect of Netflix, confirmed this on Mastodon in a [conversation with Ruth Malan](https://mastodon.social/@tdpauw/111003294054784503): "*I think I have seen this at Netflix and AWS. They annually re-aligned teams with the new domain boundaries.*"

This creates two imperatives:

1. To keep asking ourselves: “Is there a better design that is not available to us because of our organization?”, and
2. Can we change the organization if a better design is found.

50 years later, Melvin Conway observed the same:

> The importance of the principle ... is ... that your design organization is keeping you from designing some things that perhaps you should be building.
>
> -- Melvin Conway, [Toward Simplifying Application Development in a Dozen Lessons](https://melconway.com/Home/pdf/simplify.pdf), 2017

The importance of the Law is not that the organisation is constrained to produce system designs that copy the organisational structures.

No, the importance of the Law is that the organisation is keeping us from designing the things we should be building to delight our users.

If the organisation is keeping us from producing the right thing, the organisation should be flexible enough to be redesigned in order to come to a better product design that better fits the needs of our users. This requires organisational flexibility to come to a more effective design ([*Conway's Corollary*](#conways-corollary)).

Without organisational flexibility, "*[when] architecture of the system and the architecture of the organisation are at odds, the organisation wins*" (Ruth Malan, 2008).

Yet, that is not that simple, especially not for long-lived organisation with long-lived systems, because of the [*Reverse Conway’s Law*](#reverse-conways-law). The system architecture acts as a force on the organisation and closes the options we have to design the structure of the organisation.

Because an initial design is rarely the best one, and because of incremental software engineering ... architecture is never done. It is never finished. It is continuously evolving (see [Building Evolutionary Architectures](https://app.thestorygraph.com/books/0f3cecf8-ee0b-407b-b711-a105d4ae3b3d)).

Hence, system architecture is a great source for archaeological research on past enterprise decisions.

> You can read the history of an enterprise's political struggles in its system architecture.”
>
> -- Michael Nygard (@mtnygard), Twitter, May 8, 2013

Changes that we are starting now will coexist with changes that started last year and the year before. If we adopt that perspective, then we stop trying to rip apart systems and start all over again. Instead we should focus a lot more on incremental change. Here starts our history of decisions.

At one conference, I was asked to provide an example of the code reflecting past enterprise decisions. Here are two examples:

- One FinTech had a Document Vault feature, basically the ability to securely store legal documents. Yet, customers and the Product Manager referred the feature as Document Manager or File Manager, to eventually settle with File Manager. Ultimately, this got renamed over time in the code. However, during years, there was this single directory in the infrastructure code still called `document_vault`. That is for the history of that feature.

- When another startup decided to opt for AWS as cloud provider, they created all environments in a single AWS account against AWS's advise. From my experience screening organisations for technology due diligence, this seems to be a classic mistake, even within big organisations. Obviously, to segregate environments, all infrastructure resources were named with environment prefixes (or suffixes ... or even infixes ... consistency is an option). Eventually, they migrated to a multi-account setup, however, without changing the naming. Now they have in every account, infrastructure resources unnecessarily named after the environment. Another history story to tell when onboarding new colleagues. "*X: That is an odd way of naming. Y: It is. Let me tell you the story ...*.

## The Series: Navigating the Shades

[Beyond the Shades of Conway's Law series]({% post_url 2026-04-24-beyond-the-shades-of-conways-law %}):

- [Foundations: The Origin & The Mirroring Principle]({% post_url 2026-06-07-beyond-shades-of-conways-law-foundations %}) - How the worlds of organisation and product design observed the same thesis independently.
- [Validation: The Research & Reality Check]({% post_url 2026-06-20-beyond-shades-of-conways-law-validation %}) - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- [Mechanics: The Mathematical & Geometrical Shades]({% post_url 2026-08-31-beyond-shades-of-conways-law-mechanics %}) - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- **Strategy: Reversing the Law** - How the system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: Conway's Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Bibliography

- [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968
- [Conway's Law](https://web.archive.org/web/20181022001505/http://traceinthesand.com:80/blog/2008/02/13/conways-law/), Ruth Malan, 2008
- [Architecture without an end state](https://www.oreilly.com/content/michael-nygard-on-architecture-without-an-end-state/), Michael Nygard, 2012
- [Conway's Law Reverb](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm#Conways_Law), Ruth Malan, 2014
- [Toward Simplifying Application Development in a Dozen Lessons](http://melconway.com/Home/pdf/simplify.pdf), Mel Conway, 2016
- [Building Evolutionary Architectures](https://app.thestorygraph.com/books/0f3cecf8-ee0b-407b-b711-a105d4ae3b3d), Rebecca Parsons, Neal Ford, Patrick Kua, 2017
