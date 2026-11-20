---
layout: note
title: Mapping Bias to Testing in the LLM-era
event:
  name: Agile Testing Days
  date: 2026-11-17
author:
  name: Maaike Brinkhof
  linkedin: maaike-brinkhof-tester
slides: https://www.maaikebrinkhof.nl/biases-llm/
category: notes
tags: [ Testing, LLM, Bias, AI, Agile Testing Days ]
created_at: 2026-11-17
category: notes
---

We human beings are gullible. When we should slow down our thinking we often end up taking the mental shortcut instead: we are biased. The widespread use of LLM's seems to have worsened the problem.

Back in 2017, I gave a talk at this conference called "Mapping Biases to Testing". It was inspired by the book "Thinking, Fast and Slow" by Daniel Kahneman. In the talk I explained the difference between System One and System Two thinking, and I gave some examples of specific cognitive biases that I saw happening in myself and others at work.

Fast forward to 2026 and it feels prudent to freshen up this talk for the "LLM-era" that we seem to be living in.

We human beings are so mentally vulnerable and gullible. When we should slow down our thinking, we often end up taking the mental shortcut instead: we are biased. The widespread use of LLM's seems to have worsened the problem. The allure of offloading important (testing) tasks to a machine that doesn't care or feel is apparently irresistible for many of us. This comes at a cost: our own critical thinking skills, cognitive capabilities and other computer based skills we need to excel at our job are atrophying.

In this 2026 edition of Mapping Biases to Testing I will zoom in on biases I see happening when people use LLM's:

- anchoring effect
- confirmation bias
- cognitive dissonance
- availability heuristic
- technology bias

I will close off with a plea to you to keep using your brain. We should all embrace the friction that comes with learning. Basically, come to this talk if you still care about using your brain.

---

## Basics about Biases

**cognitive bias**: a systematic pattern of deviation from norm or rationality in judgment. Individuals create their own subjective reality from their perception of the input.

this subjective reality is not real; may dictate their behaviour in the world

- confirmation bias
- halo effect
- anchoring effect
- sunken-cost fallacy
- ...

unbiased doesn't exist; being objective is a lie

reality is filtered through the lens that is your brain

## Book: [Thinking, Fast and Slow](https://app.thestorygraph.com/books/c4c8b5ac-1332-463c-ab43-0f636f1e86b9)

- System 1: fast, automatic, emotional, frequent, stereotypes, unconscious, what we do a lot
- System 2: slow, effortful, infrequent, calculating, conscious (also when in a loud environment and you are trying to listen to someone)

System 1 risks

- jumping to conclusions
- overconfidence, based on experience
- not seeing risks or problems, blind spots
- not being aware of our own biases
- 1 person doing the testing: sure there will be blind spots

System 2 risks

- it is too slow, we don't have the time to fulfil the task
- it still does not guarantee that we are doing the right thing

System 1 benefits

- system 1 test techniques (blink testing), detect patterns
- experience can be used to spot problems
- serendipity in testing: an experienced tester can follow a hunch and find important problems

System 2 benefits

- test design
- exploratory testing
- ask questions, spot problems, 
- ...

Software development has a huge bias problem

- too many people in tech think they are rational and smart => leads to overconfidence
- white men in tech ([https://www.universiteitleiden.nl/en/news/2025/02/ai-is-currently-a-straight-white-man-and-that-is-a-big-problem?ref=maaikebrinkhof.nl](https://www.universiteitleiden.nl/en/news/2025/02/ai-is-currently-a-straight-white-man-and-that-is-a-big-problem?ref=maaikebrinkhof.nl))
- software has been discriminator to minorities, because the software was created by people who are biased ([https://sciencepolicy.hsites.harvard.edu/blog/racial-discrimination-face-recognition-technology](https://sciencepolicy.hsites.harvard.edu/blog/racial-discrimination-face-recognition-technology))

Biases are present in the result of our work

we can try to be aware of it, that's the best we can do

System 1 and System 2: develop our own heuristics of when to slow down, or when to follow a hunch; but it is never going to be perfect

## Problem: testing is misunderstood

reading Thinking Fast and Slow helped to understand testing, and change the approach to testing

people think that by testing we can proof that something works and sign off

the true purpose of testing is to find new information to support the business

however we cannot do it perfectly; who tests the tester; why would one tester be able to spot every risk accurately before going to production

unofficial working agreement

- we all eat the dogfood, I cannot be responsible by myself to test the product
- including PO, management; no accountability displacement
- mistakes will happen anyway in production
- we choose to learn from these mistakes, not a blame game
- the tester will lead the process of problem-fiding effectively
- developers are responsible for automation in testing
- exploratory testing found a bug? devs decide whether to create automation for it
- other good practices: code review, being critical whether the code is even needed, developer lead

and then came LLMs and they fucked it all up

## Part 2: influence of LLMs on software development

different lenses:

- Creation of LLM: to what degree are biases an even bigger problem than they already were
- Process of using LLMs: how is widespread LLM usage changing the way we code ...
- Human that uses the LLM
- Result of LLM usage
- Influence on work culture

paper: [Unlawful by design: Exposing the human rights costs of generative AI](https://www.amnesty.org/en/documents/pol40/0996/2026/en/), Amnesty

trained on stolen data

labelled by exploited workers ([https://www.theguardian.com/global-development/2026/feb/05/in-the-end-you-feel-blank-indias-female-workers-watching-hours-of-abusive-content-to-train-ai)](https://www.theguardian.com/global-development/2026/feb/05/in-the-end-you-feel-blank-indias-female-workers-watching-hours-of-abusive-content-to-train-ai)))

and the data centers required to run all this crap ruin the planet by consuming vast amounts of water and electricity ([https://memeburn.com/ai-water-consumption-statistics-2026-and-key-findings/?ref=maaikebrinkhof.nl](https://memeburn.com/ai-water-consumption-statistics-2026-and-key-findings/?ref=maaikebrinkhof.nl))

[On the Acceptance of GenAI](https://smallsheds.garden/blog/2026/on-the-acceptance-of-genai/), Joep Schuurkens

> by using GenAI we accept ...

Book tip: [Empire of AI](https://app.thestorygraph.com/books/e5889514-b56e-4507-8d7e-1899a329d3ad) by Karen Hao

the problem of bias has increased beyond a reasonable doubt

tech companies decide what is included and what not, it is censored

we cannot separate politics from these tools

Process: rage

- back to counting LoC
- speed uber alles
- quality? management doesnt't know her

no solid foundation anymore

constantly changing the code introduces constant new risks

but the test automation will catch the bugs??? who writes the tests, the LLM?

before we would change small bits and then go to production, in an iterative way, that worked pretty well

now we let Claud refactor the code and the tester will catch the remaining problems

genAI has been a net negative for the process of implementing software products

Risks? who gives a shit; we prompt our way to a solution

LLMs has put developers to sleep;  code is documentation; developers are eroding their documentation by putting their faith in prompts

developers have stopped caring, because they cannot keep up with the deluge of requests from management; developers quit their jobs because of LLMs ([https://www.theregister.com/os-platforms/2026/08/10/linus-torvalds-says-ai-has-made-huge-linux-kernel-updates-the-new-normal/5285268](https://www.theregister.com/os-platforms/2026/08/10/linus-torvalds-says-ai-has-made-huge-linux-kernel-updates-the-new-normal/5285268) NARRATOR: it seems that, in the mean time, Linus Torvald has shifted into the AI-camp 🤷)

Human: bye braincells

- "it's just a tool"
- "I use it responsibly", cognitive dissonance, it is a sweet lie we tell ourselves
- cognitive surrender

it makes us lazy

it triggers our System 1 constantly

[https://www.science.org/doi/10.1126/science.adi0248](https://www.science.org/doi/10.1126/science.adi0248)

[https://www.theregister.com/ai-and-ml/2026/07/19/using-ai-makes-people-less-likely-to-admit-they-dont-know-something/5274567](https://www.theregister.com/ai-and-ml/2026/07/19/using-ai-makes-people-less-likely-to-admit-they-dont-know-something/5274567)

two excellent articles:

- [There's no such thing as Just a Tool](https://deadsimpletech.com/blog/no-such-thing-as-just-a-tool), Iris Meredith
- [Toolmen](https://aworkinglibrary.com/writing/toolmen)

Result: quality???

- Dunning-Kruger is so hot right now, managers thinking they are developers
  - testers being told that testing can be replaced by test automation, anyone can do testing
  - now developers are experiencing the same
- accountability displacement
- SLOP

Actuarial Science

[If no one pays for proof, everyone will pay for the loss](https://freakonometrics.hypotheses.org/89367), Arthur Charpentier

it is all about speed, without feedback loops, how can this be ready for production

the quality of the software is hard to assess as an outsider, it is a black box; so we can only create trust by using it

Actuarial Science is all about risk

Testers: are about slowing down, iterative, risk thinking; seen by management as costs, but makes sure software is stable

The tragedy of good testing

Culture: bring the rot

- the problem isn't exactly new
- work culture is fucked
- things that mattered a lot suddenly don't

the LLM era is the combination of everything that was already rot in tech

I think I'm done thinking about genAI for ...

Book: [Blood in the machine](https://app.thestorygraph.com/books/20d56e80-b31d-432d-8e5b-3e4a234de0dc), Brian Merchant

Remember: unbiased doesn't exist. No tool is neutral

Imagine being confident enough in our own skills and abilities that we don't wee the need to offload this to a machine
