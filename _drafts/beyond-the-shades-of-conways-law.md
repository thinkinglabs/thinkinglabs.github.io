---
layout: article
title: Beyond the Shades of Conway's Law
author: Thierry de Pauw
category: articles
tags: [ Conway's Law ]
image: /images/beyond-the-shades-of-conways-law/beyond-the-shades-of-conways-law.png
---

Over fifty years ago, an observation about committees, design and resulting system designs changed the way we look at software - and by extension system - architecture forever. But [Conway's Law](https://www.melconway.com/Home/Committees_Paper.html) is not a single, static rule. Like a prism, it reveals different "shades" depending on how we look at it — through the lens of empirical research, mathematics, or social dynamics.

---

In 2021, I began cataloguing the many expressions of Conway’s Law in an article titled [Shades of Conway's Law]({% post_url 2021-05-07-shades-of-conways-law %}). What started as a merely note-taking exercise eventually evolved into a [talk]({% post_url 2023-08-25-shades-of-conways-law %}) and a broader inquiry with more research, more reading and more connections. Since the topic has grown too large for a single post.

This series, **Beyond the Shades of Conway’s Law**, represents an expansion of those ideas and a reflection on the journey. It is not a definitive 'deep dive' — the topic is far too complex for that, and I am too humble even to dare anything of a deep dive — but rather a navigation through the research, the mathematics, the strategies and the human dynamics that I have encountered along the way.

![Beyond the Shades of Conway's Law](/images/beyond-the-shades-of-conways-law/beyond-the-shades-of-conways-law.png)
<center><i>Google Gemini generated visual</i></center><br/>

> Organisations which design systems are constrained to produce designs which are copies of the communication structures of these organisations.
>
> -- Melvin Conway, [How do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), 1968

Over the years, numerous people paraphrased [Conway's Law](https://www.melconway.com/Home/Committees_Paper.html) in varying ways - the shades. Every paraphrase brings new insights about the consequences and implications. Often, they seem to contradict each other. Is the organisation a mirror of the system, or is the system a mirror of the organisation? Is it a "Law" we must obey, or a "Force" we can harness? At times, this can be particularly confusing in interpreting Conway's Law and its significance.

This series reflects on the evolution of the Law and its many declinations. We will travel from its independent discovery in the 1960s to modern social dynamics, uncovering how the "Homomorphic Force" shapes everything from your team's Slack channels to your system’s microservices.

Through this series, we will integrate insights from:

- The Classics: Simon, Thompson, Galbraith, Alexander, and Parnas.
- The Researchers: Baldwin, MacCormack, and Cataldo.
- The Engineers: Yourdon, Constantine, Raymond, Coplien and Harrison.
- The Conway's Law Thinkers: Ruth Malan and Allan Kelly.

Whether we are an architect struggling with legacy "spaghetti" or a leader trying to restructure for speed, understanding these shades will give us a new vocabulary for the invisible forces at work in our organisation.

This series is a work in progress. It will evolve as I read and incorporate more literature.

## The Series: Navigating the Shades

- **Foundations: The Origin & The Mirroring Principle** - How the worlds of organisation and product design observed the same thesis independently.
- **Validation: The Research & Reality Check** - Moving beyond the "hunch", how researchers proved the Law in different industries, but especially in software.
- **Mechanics: The Mathematical & Geometrical Shades** - The geometry of design: from mathematical isomorphism, homomorphism, congruence to compatibility.
- **Strategy: Reversing the Law** - The system ultimately forces the organisation to change versus deliberately changing the organisation.
- **Scale: Conway's Corollary** - The required organisational flexibility.
- **Dynamics: The Time Component** - The "Engineer Half Life" and why architecture is "sticky" long after teams change.
- **Conclusion: The Different Lenses** - A concluding look at how we perceive organisations and their systems.

## Wait, There is More

When giving my talk, many people I admire provided me with more references to read. With a bit of luck, during the journey, I manage to touch on the foundational giants such as Emery and Trist's "[The Causal Texture of Organizational Environments](http://www.moderntimesworkplace.com/archives/ericsess/sessvol3/GEMTRCAUp53.pdf)" - how the environment forces shape an organisation, underlying the Cynefin model -, Geoffrey West's "[Scale](https://app.thestorygraph.com/books/568aae70-7a2b-4df1-b504-f3bad7696f25)" - why structures must change as they grow -, Philippe Kruchten’s "[4+1 View Model of Software Architecture](https://www.cs.ubc.ca/~gregor/teaching/papers/4+1view-architecture.pdf)" - a system is not one thing but four views, Logical, Process, Physical, and Development -, Wilfred Bion's "[Experiences in Groups](https://library.agnescameron.info/psychiatry/Experiences%20in%20Groups,%20W.R.%20Bion%20(1961).pdf)" - the psychoanalytical side, why groups naturally fragment into the structures they do -, and finally Stephen C. Pepper's "[World Hypothesis](https://app.thestorygraph.com/books/5fac219a-cff4-47b6-94bc-b376b16e53e6)" - how two people can look at the Law and see something different.

Lastly, if I manage to get a hand on the thesis, I would like to process Alexander Skvortcov's thesis "Impact of Organisation Design on Decision-Making Latency Regarding IT Projects: A Mixed Method Analysis" that he [defended in 2024](https://www.linkedin.com/posts/askvortcov_defensedone-degreeunlocked-masteredit-activity-7206782063155232768-PVZH/).

## Acknowledgment

[Ruth Malan](https://mastodon.social/@RuthMalan) and [Adrian Cockcroft](https://mastodon.social/@adrianco) for reviewing an early draft of the series and nudging to publish.

## Bibliography

- [How Do Committees Invent?](https://www.melconway.com/Home/Committees_Paper.html), Melvin Conway, 1968
- The Original Article: [Shades of Conway's Law]({% post_url 2021-05-07-shades-of-conways-law %})
