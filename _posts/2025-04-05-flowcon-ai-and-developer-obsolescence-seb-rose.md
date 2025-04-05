---
layout: note
title: "AI and developer obsolescence: Is this the beginning of the end?"
event:
  name: FlowCon
  date: 2025-04-02
author:
  name: Seb Rose
  linkedin: sebrose
created_at: 2025-04-02
category: notes
tags: [ AI, Complexity, Abstractions, FlowCon ]
image: /images/flowcon-ai-and-developer-obsolescence-seb-rose/less-refactoring.jpg
---

Everything looks solvable if you ignore most of the complications. Many things look impossible when you’re overwhelmed by the details.

Abstraction has been fundamental in helping humanity harness computing technology to deliver world changing solutions. But, over the years, there have been many failed attempts to raise the level of abstraction and empower the wider population to create software without the need for specialist developers. And the need for skilled software developers has risen inexorably.

Does the current interest in AI and low/no code development simply herald the cyclical return of our economy's yearning for ever higher levels of abstraction and reduced reliance on software developers? Or has the technological landscape changed sufficiently to make developer obsolescence a more likely outcome?

---

## Is there a problem?

why 4GLs, why low code/no code, why AI?

- accelerate digital innovation
- reduce current IT backlog
- escape legacy debt
- reduce dependency on hard to hire technical skills
- protect against technology churn

-> some sort of reasons for people to look at AI

Three common complaints

- misalignment of business & IT => put business in control
- time-to-market & speed => increase productivity
- shortage of skilled people => reduce the need for software developers

mantra: better - faster - cheaper

## How did we get here?

Colossus computer

Machine code to assembler

![Machine code to assembler](/images/flowcon-ai-and-developer-obsolescence-seb-rose/machine-code-to-assembler.jpg)

-> raising levels of abstraction is to make it easier for us humans to understand what we did days or weeks ago

IDE magic - VSCode -> autocompletion

AI generated code - Copilot -> it does not give you some options

I imagine some of you look at the code before accepting it, 95% of the world developers use to copy/paste from SO, they will just accept the code from AI

deferencing C++ pointer: most engineers don't know what they do, they place randomly asterisks and arrows in front of a variable, AI helps a lot in getting this right

LowCode -> OutSystems

NoCode - WordPress -> really easy, until it does not work

## What has abstraction got do with it?

Core issue: it is about abstraction

> the process of removing physical, spatial, or temporal details or attributes in the study of objects or systems to focus attention on details of greater importance;
>
> -- Wikipedia

remove the details of each particular line of code to get a better understanding of the whole

-> it is a process of generalisation

abstraction is there to hide complexity, it does not mean we can get rid of complexity

two sorts of complexity

- accidental complexity: can be simplified by a new idea, design, technique, procedure or approach
- essential complexity: can't be simplified or loses value whn it is simplified

> Abstraction is Evil
>
> -- Jim Coplien ("Cope"), ACCU 2000

> In most object oriented design, most abstraction is evil. It is an excuse to ignore things we don't want to deal with even though we should.
>
> -- Jim Coplien

## Where did complexity go?

The Last One (TLO), PC magazine, Feb 1981

> At last - the end of programming

https://teblog.typepad.com/david_tebbutt/2007/07/the-last-one-pe.html

first mention of lowcode

it is called The Last One, because it would be the last development platform you ever need

LowCode:

- loads of configuration, they always break when the platform upgrades
- a lot of complexity is pushed down
- it is not code, but a lot harder to find the problem
- troubleshooting is difficult

Consultancy: be less dependent on expensive experts

> TLO not only worked but, for donkey's years, its publisher made money out of a consulting business wrapped around the software.

three common complains revisited:

- misalignment of business & IT: we still need for IT domain expertise
- time-to-market & speed: delays for customisation takes as long as coding & troubleshooting is more difficult
- shortage of skilled people: lack of even more specialised consultants

## Can AI and ML replace software development?

Can AI and ML help?

> Artificial general intelligence is the hypothetical ability of an intelligent agent to undersatnd or learn any intellectual task ...
>
> -- Wikipedia

LLM is a type of machine learning model designed for natural language processing tasks such as language generation.

the largest and most capable LLMs are generative pre-trained transformers (GPTs)

LLMs are data greedy

-> consume huge amount of energy, is this a technology we want to support?

> AI is neither artificial nor intelligent
>
> -- Kate Crawford, Microsoft researcher

LLMs differ from human cognition because they are not embodied

-> limited capacity to innovate

but unpredictable hallucinations and predictable limitations

> More broadly, a wide range of computational processes ... have their own internal logic, which cannot be accurately captured by a learning machine such as a transformer network.
>
> ...
>
> ChatGPT is not solving maths and engineering challenges from first principles, so you would not want to use it to pilot a plane or build a bridge.
>
> --Tony Prescott, the psychology of AI

would we want to let AI manage bank systems, health systems, ... ?

 GitClear: Less refactoring

![The hype cycle](/images/flowcon-ai-and-developer-obsolescence-seb-rose/the-hype-cycle.jpg)

 refactor less
 copy/paste more
 churn is going up

=> reduced performance

State of DevOps 2024

they are generally positive about AI but ...

> We see that the effect on delivery throughput is small, but likely negative (an estimated 1,5% reduction for every 25% increase in AI adoption)
>
> ...
>
> The negative impact on delivery stability is larger (an estimated 7,2% reduction for every 25% increase of AI adoption)
>
> -- State of DevOps 2024

## Does AI present other new challenges?

Bias

- sample bias
- measerment bias
- prejudice bias

### Explainability

difficult to understand why AI generated this code

### Prompt engineering

we wanted to be less dependent on skilled engineers
you just need to be better at prompt engineering

### Requirements management

we need to understand in detail what the assumption are

a killer for AI

important area where we need to be better, not abdicate our responsibility

## Where does this leave us?

the hype cycle: we are at the beginning

![Less Refactoring with AI](/images/flowcon-ai-and-developer-obsolescence-seb-rose/less-refactoring.jpg)

> There's still no silver bullet
>
> -- Fred Brooks

AI and ML are tools not solutions
useful in certain areas

Three existing approaches

- misalignment of business & IT - we need to collaborate
- time-to-market & speed - continuous delivery, commit to trunk, don't wait for code reviews
- shortage of skilled people - education and training, get better at mentoring people

## Takeaways

Essential complexity cannot be simplified

AI and ML are tools not solutions

There are new challenges incorporating into working practices

AI will only help us getting better, faster, cheaper for limited domains only
