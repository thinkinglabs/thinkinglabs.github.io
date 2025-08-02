---
layout: article
title: Why do Teams think Trunk-based Development does not work?
author: Thierry de Pauw
category: articles
tags: [Continuous Integration]
---


- They started out using git because it is the default choice now. It encourages use of branches. They never thought about whether or not this is the right thing to do.
  - gitflow
  - sounded like "the old way" of doing things and the whole idea got pigeonholed into that frame and went nowhere.

- lack of confidence, tooling and automated tests required

1. They only know how to split work to assign it to individuals, not to deliver it in slices.`
2. Their experience is with big releases, and big releases are dangerous events that take a lot of time and effort to finish. "You can't do that 2-week hardening and manual 1-week deployment process more than once a month!"
3. "We need a string of inspectors, testers, and approvers to keep code from being released -- you know, in case the individual who coded it made a mistake." (and of course changes are made by solo individuals, because that's how they assign tickets and keep everyone utilized)
4. They are (perhaps rightfully) afraid of their code; it breaks in unexpected ways when they change it.
5. They're sure that compliance takes a large, special pre-release effort.
6. They are convinced that the TBD shops must have better developers than the ones that work in their company.
7. They have never seen it done safely, so their BS filters tell them that it can't be done: "if it was possible and a good idea, we'd be doing it already"

- we can only put finished work on mainline

They do not feel comfortable with the perceived risk of having to deploy “unfinished features” to production.
They want to be able to isolate ongoing development

the push back I usually get is that it is too dangerous. Somebody might check something in that would Break Everything. My response to that is to show how we can build systems with automated test, etc that will reduce that danger. Usually the contretemps is that there isn't time to build that system, so we need to instead take extra time to do code reviews and pull requests.

I think a lot of developers would be of the mindset that it would constitute releasing "unfinished work". They are conditioned to only release work that is "finished".

- lack of automated testing

- lack of incremental skills
  - batch work

Additionally, it is hard to convince them that the initial extra effort of learning and practicing the skills to be able to break work into smaller pieces (especially without impacting the product as it currently works) is worth it as they would say it is faster to "complete it" and then release it.

Many folks don't break down their tasks in a way as to keep everything green and are suspicious of what they see as extra effort to do so.

- no analysis by engineers

A lot of developers are used to being given predetermined work, unfortunately - they already know what to build and how to build it before they start so convincing them of the benefit becomes harder.

- slow builds
  - reduce cycle times -> shift to TBD 

- no collaboration culture

 - Leave me alone in my own bubble and don't bother me with your commits... Mind set
Largely, I think the "why" is cultural. Even though you're supposed to be collaborating with your team and with the rest of the business, you're rewarded based on what you do "as an individual", and you're held accountable for the things that you do "as an individual". That type of culture discourages collaboration and encourages competition.

- lack of decoupled design

The effectiveness of Trunk-Based Development (TBD) is significantly influenced by the architecture of the software. Modular and well-componentized architectures facilitate the fast and frequent integration cycles from TBD. The architecture should support robust automated testing and continuous integration to ensure stability with frequent changes. 
My experience is that this is with chunky tools (like Microsoft Dynamics) way more difficult than with a WebApp.

- we need our main branch to document deployments
- slower is safe: speed and quality are not a zero-sum game
- we need have "project gods" that need to approve everything
- Trust issues, can I trust you to write good code

we just cannot trust the other developers, and then there's a number of reasons given:
1) they will break the tests and the pipeline
2) they will merge bad code that contains bugs
3) theyll make bad design decisions

in one recent case, devs needed to submit PRs which then needed to be approved by at least five (!!!) other devs, and so pull requests was the only viable way of getting that many code reviews (apart from perhaps mob programming, which would be completely out of the question in these orgs, they tend to see devs working alone as the peak of efficiency)

as a result you get a lack of mentoring, upskilling and teaching within the org, and the cycle completes

Many companies, especially the big ones, have organised themselves around hierarchy, pseudo-siloed departments, bureaucracy and lack of trust. When all this comes to the development teams, all the culture goes against practices like TBD 

- Compliancy issue, we need it to be peer reviewed before production

Four eyes-principle because security reasons, so every change needs a PR with an audit trail of a reviewer approving the changes.
What I find intriguing about this is that it has nothing to do with code (and other) quality. It's about avoiding malevolent changes and having some process proof for it.

I would list regulated / change managed environments where your not going to be able to raise feature changes every 10 minutes or even daily. So you would end up with a main branch being deployed to production with lots of random changes together which would be viewed as high risk in that type of organisation.

- "Then we'd never be able to stabilize anything" is what I heard last time I asked the question...

It’s counterintuitive and needs a lot of things to work to get it right. It also depends on the culture of psychological safety in the org. The need for branching is to mitigate risks elsewhere. 
it’s also the default that is taught. It’s ingrained in our tech culture. 

- Companies where management/non technical stakeholder wants/has a right to give a go/no go on a release
- Incomplete test suite ie: when a green build (all tests passes) is not the same as a good release
- Specific case of that one: I've found front end testing to be complicated/brittle/etck
- Long/complex refactorings. It's not everyday and yes, we try to avoid those as much as possible/split them in pieces, but it happens


- 800 developer team, one broken push blocks 799 devs => branches, alternative: commit on green, Gerrit, Google

- feature flags do not work

---
They are too used to binding the integration phase with the deployment phase and the deployment phase with the release phase. They can't see a way to integrate code more often than they distribute it. They cannot see a way to distribute more often than they release it.

---
In 1 sentence: 
It upends their entire development model. 

Trunk based development: 
Check in finished chunks of code every 5 or 10 minutes, that's semi-guaranteed to not break anything. 

1. Most devs don't build small chunks. They copy large chunks from elsewhere.
2. Most devs don't write semi-guaranteed to not break. They write what they think might work, then they try it. If it breaks, they fix.
3. Most systems don't have enough automated tests to confirm whether a small change broke anything. 
4. Most people don't write automated tests with their code for EVERY change, and if they do, they write 1 test for 100 lines of code.
 
TBD assumes that you are doing all those things as a baseline. It's not like TBD is step 1 ... it's step 40 on a journey most folks haven't started on.
---

---
Having developers in any reasonably sized (and especially remote) team push from local straight to main branch is bonkers and will cause major headaches real quick. This is not scaleable. Relying on the developers to only 'push on green' is utopia and requires the developers to be able to run the entire test suite locally.

Trunk based development is all about having just 1 long-lived branch. In the 'scaled' version, all other branches are short-lived feature branch. Developers do they thing on the feature branch and merge to main via pull request (Including all required testing and checks to make sure its working). This is all documented on https://trunkbaseddevelopment.com/


- Remote adds more friction because if I push incorrect code and you 'git pull' that code before I've fixed it, you are now working with faulty code locally. If I'm working in a small, physically co-located team you might ask around casually if someone pushed recently. Or I might shout out that I just pushed faulty code. Either way, loss of productivity. Remote working is great and should be the standard but it definitely does not improve speed of spontanous communication. 

- Lack of skills is actually valid point but this is unfortunately real-world reality. Unless your team is hiring only senior developers but these are, as you probably know, hard to find and expensive. Beyond that, even the most senior developer make mistakes. The scaled version allows for people making mistakes and catching it before it affects everyone.

- When do code review occur? According to the link you posted, they are now optional and happen AFTER merge to main. How to guarantee code quality?

- Most substantial software projects have integration tests that are technically tricky to run on local machines. 

I'm huge fan of trunk-based approach but only the so-called 'scaled' version. I don't see any downsides with. 

---

"I want to give myself the option to change my mind"

“Show me a toy repo with this approach and guardrails”


> What I generally say when I move teams closer to it is to think of TBD as a forcing function, or we could say similarly Continuous Delivery is a forcing function. What I mean by that is that the objections and obstacles that come up are very useful. They point to factors in your environment that should change. Those things have other harmful effects.
>
> What stops us all from working closer to trunk, and therefore closer to each other? Which of those factors is easiest to change, and what other benefits would there be?
>
>It's a generally productive journey no matter if you get halfway there or all the way.
>
> -- Ray Myers, 

## Acknowledgements

[Luke Kanies](https://hachyderm.io/@lkanies) for [nudging me on Mastodon to write this article](https://hachyderm.io/@lkanies/111766866897656806) after publishing the complete [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series.

Steve Berczuk, Jeremy Kahne, Hibri Marzook, Tim Ottinger, Tom Jans, Markus Tacker, Juup Schuurkes, Alan Mellor, Kyle Griffin Aretae, James Bowen, Alessio Coser, Steve Ropa, Andrew Milne, Ray Myers, David Sandilands, Mike Emeigh, Daniel Bartley, Juan Florez, Kenny (Baas), Schwegler, Martin Van Aken, Sven Hofstede, Angelo Moreira, Enrico Teterra, Pascal Dufour Tom Leake, John Hearn, Chris Ford
