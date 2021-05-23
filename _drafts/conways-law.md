---
layout: note
title: Notes on Conway's Law
author:
  name: Thierry de Pauw
  twitter: tdpauw
created_at: 2021-05-02
date: 2021-05-02
meta: 8 min read
category: notes
tags: [ Conway's Law ]
---

Definitions of Conway's Law can be found in [Shades of Conway's Law]({% post_url 2021-05-07-shades-of-conways-law %})

> [Conway's Law] creates an imperative (1) to keep asking: “Is there a better design that is not available to us because of our organization?” and (2) to be open to changing the organization if a better design is found.
>
> -- Mel Conway, [Toward Simplifying Application Development in a Dozen Lessons](http://melconway.com/Home/pdf/simplify.pdf), 2016

## Observing the history of decisions from software

> You can read the history of an enterprise's political struggles in its system architecture.
>
> -- [Michael Nygard](https://twitter.com/mtnygard), [May 8, 2013](https://twitter.com/mtnygard/status/332131878830211073)
>
> @mtnygard A history of Conway's Law
>
> -- [Steve Smith](https://twitter.com/SteveSmith_Tech), [May 8, 2013](https://twitter.com/SteveSmith_Tech/status/332146069221810176)
>
> @mtnygard That's some sort of corollary to Conway's Law.
>
> -- [Curious Jon](https://twitter.com/jmbroad), [May 8, 2013](https://twitter.com/jmbroad/status/332132484902948866)


> Software, like all technologies is inherently political. Code inevitably reflects the choices, biases and desires of its creators" J Cascio
>
> -- [Stephanie Rieger](https://twitter.com/stephanierieger/status/463328024591478784?s=20), [May 5, 2014](https://twitter.com/stephanierieger/status/463328024591478784?s=20)

> Politics plays a huge role. And a lot of the role it plays is in what it silences.
>
> -- Ruth Malan, [Conway's Law-ish, Aug 5, 2013](https://web.archive.org/web/20200621234405/http://www.ruthmalan.com:80/Journal/2013/2013JournalMay.htm#Conways_Law_ish)

## Incremental development and Refactoring

> Piecemeal growth, or incremental development, is not just desirable but a fact of life in software. Even so, we need to build more learning into our process.
>
> More learning when it is cheaper to find and fix problems with the vision (doing course corrections toward "right system") and structure (built right).
>
> Then, accepting that we will continue to learn and evolve our system, we need to invest in fixing the mistakes. Incrementally adding functionality yes, but repairing structural defects too. This investment is the crucial dual to piecemeal growth that we too often forget in software.
>
> When we keep marching to a frenetic "add value" drumbeat, we get into a situation where the system threatens to crumble under the mass of deferred structural issues.


> Going from the messiness of our discovery-oriented process to the well-factored, tested integrity of our engineered system shouldn't be considered rework or waste! Unless we leave it until after it has sorely impacted users and our business viability. That is waste.


> As we proceed in the fog of uncertainty, entropy grows -- and produces more fog! Under uncertainty we "give things a try"; accept good enough, and try the next thing. As entropy grows, it introduces its own uncertainty...


> Refactoring is the corollary to piecemeal growth, allowing entropy containment. But we have to refactor the organization too? If it would subvert the system (re)design and evolution.


> There is a relationship between the architecture of the organization (and its communication flows) and the architecture of the system (and its boundaries and flows). We need to take this into account, to reap synergies rather than doing the harder thing, trying to "swim against the current."


> Integrating across organizational divides is a challenge. When left to happy accident, may well have all the smack of accident rather than design - as in, designed to get more what we want, looking for consequences so we get less unintended side-effecting from being system-blind.

-- Ruth Malan, [Conway's Law Reverb, May 5, 2014](https://www.ruthmalan.com/Journal/2014/2014JournalMay.htm)

> your org structure isn't solving your problem.
> it's an artifact of how you've solved it before.
>
> -- Adam Jacob

> architectural innovations destroy the usefulness of the architecture knowledge of established firms
>
> -- architecture innovation: the reconfiguration of existing product technologies and the failure of established firms, henderson, r. & clark, k. 1990

=> we continuously redesign our systems to make them better and to adjust to changing stimuli

=> so we must do the same for our team structures

and this reinforces the significance of piecemeal growth and refactoring and how it impacts organisational design

-- [Conway's Law: The Skeleton of DevOps](https://www.slideshare.net/danslimmon/conways-law-the-skeleton-of-devops), Dan Slimmon

## Contradictions in definitions

> I wonder how many readers of your extensive blog post discover contradictions in different interpretations.
> It is quite important considering e.g. gross misinterpretation of creating stiff teams structure that correlates with microservices (each teams owns a bunch).
>
> [@vgrgic](https://twitter.com/vgrgic),  [May 21, 2021](https://twitter.com/vgrgic/status/1395626485256364032?s=20)

https://threadreaderapp.com/thread/1395680362953461761.html

https://threadreaderapp.com/thread/1395701960305610755.html



## Resources

- [Conway's Law and You](https://www.youtube.com/watch?v=odJ8esf2h6E), Michael Feathers
- [Microservices and the Inverse Conway](https://www.youtube.com/watch?v=uamh7xppO3E), James Lewis

  slides: https://www.slideshare.net/Codemotion/microservices-and-the-inverse-conway-manoeuvre-james-lewis-codemotion-rome-2017

- [Conway's Law 50 years later](http://melconway.com/keynote/Presentation.pdf), Melvin Conway
- [Conway's Law as a Theorem](https://www.melconway.com/keynote/Theorem.pdf), Melvin Conway
