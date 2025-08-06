---
layout: article
title: Why do Teams think Single-branch Development Does not Work?
author: Thierry de Pauw
category: articles
tags: [Continuous Integration]
---

Despite [research showing that Continuous Integration indirectly leads to better quality and stability](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648). Despite that, Continuous Integration implies the practice of trunk-based development, and hence single-branch development. And despite all the [benefits of practising trunk-based development]({% post_url 2025-07-21-on-the-benefits-of-trunk-based-development %}), most teams still think this cannot possibly work for them and are stuck with the [evilness of feature branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}).

---

This is a quite surprising observation given that when [RCS](https://en.wikipedia.org/wiki/Revision_Control_System) was introduced in 1982, followed by [CVS](https://en.wikipedia.org/wiki/Concurrent_Versions_System) in 1990, and then [SubVersion](https://en.wikipedia.org/wiki/Apache_Subversion) in 2000, teams stuck to [Mainline](#mainline) because branching was too complicated. Then [Git](https://en.wikipedia.org/wiki/Git) came along in 2005 with the promise of easy branch creation. However, Git was specifically designed to meet the Linux kernel development needs that required decent branch support to review and accept outside contributions. That is different from most commercial closed-source corporations. Context matters. Yet, teams rarely take context into account, and so they are trapped in branches, still, thinking they are acting professionally.

This brings us to the first reason teams think single-branch development cannot work, which is quite demarking. For the older generation of engineers who have known CVS or SubVersion before, single-branch sounds like the "old way" of doing. Not cool. The younger generation, however, has only known Git and the use of branches. Any alternatives are unknown to them. Branches are the default that is taught to younger generations. It is ingrained in the technology culture. Committing directly to mainline does not even cross their mind. If it did, it sounds like an aberration. Cannot. That is like a commandment given by a higher spiritual something: "*Thou shalt not commit to main.*" ( ... without merging a branch).

Even if they may consider it, they hit the next problem: lack of confidence. Fear of breaking things. Where "things" could be breaking the build, breaking automated tests, thus introducing non-working code that impacts a whole team, presumably creating a loss of "productivity". To avoid this, it requires the team to [*Run a Local Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) and [*Commit Only on Green*]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green). "Things" could also be breaking production because something slipped through the automated tests, if any, or enough exists.

This brings us to the next obstacle: lack of or insufficient automated tests. Therefore, they introduce an illusion of control and safety through a heavy code review process using the classic Pull Request, assuming this will compensate for the absence of automated tests. Here is the deal. The code review will not make a difference, anyway. We might as well commit straight to mainline without automated tests; the outcome will probably be the same.

This goes along with the idea that slow is safe. Slow ensures quality and stability. Thus, we need a string of inspectors, testers, and approvers in case someone makes a mistake. Yet, speed and quality are not a zero-sum game. It is not either, or. [The State of DevOps Report](https://cloud.google.com/devops/state-of-devops?hl=en) debunked this since 2015. We need speed to achieve quality. Speed gives fast feedback to improve stability. Conversely, we need quality to get to speed. Quality reduces rework. Nonetheless, mistakes and defects will happen, anyway, regardless of all the safety controls in place. Systems are used in the most unpredictable ways. In that case, slow also means slow to recover. We would be better off establishing a fast recovery process.

How do we guarantee quality? First, there is no such thing as "guaranteeing quality". We can only strive to deliver quality. That is entirely what trunk-based development teams do. Quality is their highest concern. They are empowered to fix and improve any untidy code at all times. It just happens. Next, code reviews will not "guarantee" quality.

"*But, frontend automated tests are complicated, complex and brittle, so we do not have them.*". True, frontend testing is demanding, but not unachievable. Also, teams overlook unit testing frontend logic. Often because frontend code is shaggy and untestable due to a lack of a decently decoupled design. The brittleness often has to do with improper test design. In the end, the [Automated Acceptance Tests]({% post_url 2021-07-22-acceptance-testing-for-continuous-delivery-dave-farley %}) advocated by the Continuous Delivery community is frontend testing.

To sustainably *Run a Local Build*, it necessitates to [*Have an Exceedingly Fast Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build). That is the next issue. Most teams have overly slow builds. If they have automated tests, they are especially slow. Either because they test too much, tests are too broad, or the local build executes too many tests, not the right tests, or do not practice [*Progressive Testing*]({% post_url 2024-11-03-raising-the-continuous-integration-bar %}), or the application code is simply not efficient. Keeping fast builds while automated test suites grow takes hard work. Teams invest too little in continuous improvement.

The lack of confidence, although recognised by teams, comes from something considerably unknown to teams: a lack of engineering skills. Most senior engineers are not senior. They have inadequate skills to not break "things". The crucial missing skill is *incremental software engineering*, the ability to split large changes into a series of small incremental changes that do not break the system and keep everything working at all times.

This typically evokes the idea that single-branch development requires a "mature" team, whatever mature means. Which somehow confirms the lack of engineering skills that teams at all means do not want to face. Fairly contradicting. If mature means experienced, yes, that is certainly helpful, but not required. We have seen successful novice teams with single-branch development as well as so-called experienced teams failing due to insufficient skills. Note that in the 90s, many Extreme Programming practitioners were beginners.

Furthermore, it is challenging to convince teams that the initial effort to learn incremental development skills is rewarding. For them, it is "faster", "easier" to complete the task in a big batch and release it. Completely oblivious of the risks. Again, fairly contradicting, as those same teams implement onerous code reviews in an attempt to mitigate risks elsewhere.

Missing incremental skills naturally devolve into batch work, large changesets, which fit well with the branch-thinking. Batch work definitely disables the adoption of single-branch development.

System design also plays a role in this. Heavily coupled systems promote batch work. Any change ripples through all layers of the system, ripping apart the application and guaranteeing a non-working system for an extended period. In that case, branches prevent that. Even so, when merging, we let go of a large changeset into the wild, which, once more, introduces substantial risks. The effectiveness of trunk-based development is significantly influenced by the system design. Modular, decoupled designs facilitate fast and frequent integration cycles from trunk-based development. The design should ascertain stability through frequent changes inherent to single-branch development. At the same time, experienced engineers will be able to work around a too-coupled design, because they master incremental development skills. These are the true seniors.

Because there is a lack of incremental skills, teams need branches to refactor code. They have not learned how to refactor in small incremental steps. Subsequently, refactoring happens in large batch sizes. On the other hand, because refactoring on branches introduces a fair amount of merge conflicts, it discourages the adoption of refactoring practices. Indisputably, technical debt rises to unmanageable levels.

Incremental software engineering involves growing a feature on mainline small commit by small commit, regardless of feature size. That denotes we have unfinished functionality on mainline. As a consequence, we might have unfinished functionality in production. Many teams are unable to conceive that idea. They are used to bind the integration phase with the deployment phase and the deployment phase with the release phase. They cannot see a way to integrate code more often than they distribute it. They cannot see a way to distribute more often than they release it. That brings the other widespread commandment: "*Thou shalt only push finished features to mainline.*". Engineers are conditioned to only release finished work. Whatever "finished" means. For new features, there will always be a certain back-and-forth to finalise that feature. Again, it requires skills to push, in a controlled way, unfinished features to production, which brings us again to the concept of seniority.

Conversely, this demand [Feature Flags](https://martinfowler.com/articles/feature-toggles.html). "*We tried Feature Flags. It did not work. We went back to feature branches.*". Be aware that not all incremental development requires Feature Flags. Work can be hidden by not wiring pieces before they are completed. Agreed, in certain cases, we need Feature Flags. Many times, the problem teams face with Feature Flags is a lack of [Feature Flag management](https://help.split.io/hc/en-us/articles/360006960391-Managing-technical-debt). Unmanaged flags are undeniably evil.

The idea of releasing at any time, without a week or two hardening phase, is distressing. Teams are still used to releases as events, requiring preparation. Shout-outs on company chat channels to not merge Pull Requests in preparation for a release are typical signals of this. With incremental software engineering skills, there will never be a stabilisation phase. The system will be continuously stable, enabling on-demand production releases at any given moment. This is quite puzzling for teams that have never experienced this.

The way work is organised in most organisations and teams works against collaboration and single-branch development. Many teams still believe more work can be achieved by parallelising work and having overly specialised profiles, think frontend and backend engineers, infrastructure engineers, etc. However, this has been repeatedly refuted in the literature. As a result, work is split into smaller chunks assigned to individuals who work in isolation, not to deliver features in slices. Furthermore, teams hold individuals accountable for their work rather than the team accountable. Consequently, there is a lack of collaboration and a lack of T-shaped profiles. Unsurprisingly, this emphasises the use of branches to isolate the individual work. If teams adopt pairing or teaming, the need for branches evaporates. Even so, if pairing or teaming is a cultural stretch, T-shaped profiles and collaboration through design workshops remove the need for branches.

Then, we have the lack of trust that prevents teams from adopting a single-branch development model. We may not say this out loud. That is too confronting. Nevertheless, it is real. Someone might break the build, the pipeline, or introduce a bug, bad design, or simply make a mistake, you name it. They set all sorts of checks and balances, bureaucracy and hierarchies in place to moderate that. They apply [Theory X over Theory Y](https://en.wikipedia.org/wiki/Theory_X_and_Theory_Y). A culture that goes against practising trunk-based development. Ergo, we have omission of mentoring, upskilling and teaching. The cycle completes.

Remote adds more friction. Of course, remote demands more attention to create a team. Commonly, it is just a bunch of remote engineers working in isolation. Bringing us back to the lack of collaboration exacerbated by a lack of engineering skills. Remote does not prevent single-branch development when the team has a decent engineering baseline and collaborates.

Finally, ["*Yes, but compliance.*"]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}). Everything has to be reviewed and approved; hence, we need branches. The killer argument to grind teams to a definitive halt. This is quality theatre. [Research](https://app.thestorygraph.com/books/0baa7f2a-3f3f-4752-9d81-0434117d0648) is clear about this: process gates drive down quality. The precise thing we put in place to supposedly improve quality, or prevent malicious code, does the exact opposite. We do not question the regulatory need to have reviews. They can simply be realised in a more efficient way with pairing, teaming or [non-blocking reviews]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}).

“*Show me a toy repo with this approach and guardrails.*”. The knockout argument. We outright cannot because of intellectual property and non-disclosure agreements. Moreover, a "toy repo" would not be representative. Teams need to experience this on real, complex systems. This is not a theoretical approach. We lived it on elaborate systems.

Lastly, "*We already do scaled trunk-based development.*" with a six-engineer team as documented in [Trunk Based Development: Styles and Trade-offs](https://trunkbaseddevelopment.com/styles/#short-lived-feature-branches), joyfully bypassing the first paragraph about [Committing Straight to the Trunk](https://trunkbaseddevelopment.com/styles/#committing-straight-to-the-trunk). Generally, "scaled trunk-based development" with a team of six is just an embellishment for plain [GitHub Flow](https://githubflow.github.io/) with too long-living branches. True, trunk-based-development.com mentions the scaled version, but using short-lived branches and starting from 100 engineers. How many teams have 100 engineers working on a single branch? Right!

## Conclusion

Naturally, people will say this is all very subjective. Of course, otherwise they have to confront the harsh reality they are in. Still, we have seen and experienced all this when coaching and reviewing many technology organisations.

Regrettably, most engineers have never seen trunk-based development implemented safely. They have only experienced the perilous way. As anticipated, their bullshit filter tells them that if this were a good idea, we would be doing it thus far. Therefore, that must be a bad idea.

To be successful with single-branch development requires [adopting a sheer amount of practices]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}). Trunk-based development assumes this as a baseline. That is not a given. It is hard work. Adopting trunk-based development is not the first step. It is step 40 on a journey most teams have not even embarked on. Once they start, the outcome is so rewarding. However, most teams do not realise what it offers. We have to go through all this to experience the benefits. Once we experience them, we cannot imagine another world.

> What I generally say when I move teams closer to it is to think of trunk-based development as a forcing function, or we could say similarly, Continuous Delivery is a forcing function. What I mean by that is that the objections and obstacles that come up are very useful. They point to factors in your environment that should change. Those things have other harmful effects.
>
> What stops us all from working closer to trunk, and therefore closer to each other? Which of those factors is easiest to change, and what other benefits would there be?
>
> It's a generally productive journey, no matter if you get halfway there or all the way.
>
> -- [Ray Myers](https://www.linkedin.com/in/cadrlife/)

## Acknowledgement

[Luke Kanies](https://hachyderm.io/@lkanies) for [nudging me on Mastodon to write this article](https://hachyderm.io/@lkanies/111766866897656806) after publishing the complete [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series.

Steve Berczuk, Jeremy Kahne, Hibri Marzook, Tim Ottinger, Tom Jans, Markus Tacker, Juup Schuurkes, Alan Mellor, Kyle Griffin Aretae, James Bowen, Alessio Coser, Steve Ropa, Andrew Milne, Ray Myers, David Sandilands, Mike Emeigh, Daniel Bartley, Juan Florez, Kenny (Baas), Schwegler, Martin Van Aken, Sven Hofstede, Angelo Moreira, Enrico Teterra, Pascal Dufour, Tom Leake, John Hearn, Chris Ford for [their contributions on LinkedIn](https://www.linkedin.com/posts/tdpauw_ive-been-asked-to-write-an-article-on-why-activity-7154112252285960195-AQVA/).

## Related Articles

- [Why do Teams not practice Continuous Integration?]({% post_url 2025-07-26-why-do-teams-not-practice-continuous-integration %})
- [On the Benefits of Trunk-based Development]({% post_url 2025-07-21-on-the-benefits-of-trunk-based-development%})
- [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %})
- [Continuous Integration! Where to Start?]({% post_url 2024-11-01-continuous-integration-where-to-start %})
- [The Practices that make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %})

## Definitions

### Mainline

The Mainline is the line of development in Version Control, which is the reference from which system builds are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.
