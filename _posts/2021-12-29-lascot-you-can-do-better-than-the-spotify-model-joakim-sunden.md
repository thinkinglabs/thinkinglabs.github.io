---
layout: note
title: You can do better than the Spotify Model
event:
  name: Lean Agile Scotland
  date: 2017-10-06
author:
  name: Joakim Sundén
  twitter: joakimsunden
created_at: 2021-12-28
video: https://vimeo.com/240125835
category: notes
tags: [ Agile ]
---

Let's put aside the 'bubblegum and unicorns' of the Spotify Engineering Culture videos and talk about what doesn't quite work at Spotify, and how we're trying to solve it. This is a failure/learning report intended for coaches and other change agents who need encouragement that it's always hard AND it's always possible to improve.

Agile coach at Spotify from 2011 -> 2017

2011: 12 teams and 60 people in tech

2017: 184 teams and 1800 people

Spotify Engineering Culture video + white paper, some blog posts and conference talks -> makes up the folklore of the Spotify Model

We definitely never intended to be a model, or a framework at Spotify.

We were just trying to describe: "*wow, this seems pretty cool what we are doing and others seem to be interested, great we can go to conferences*"

We never really claimed this solves all of our problems, and that it is so amazing. That work seems to have been done by others.

## What is a model?

from Oxford Dictionary of English:

> - a thing used as an example to follow or imitate

that seems to be how most people approach it

> - a simplified description, especially a mathematical one, of a system or process, to assist calculations and predictions

this is probably the real one: *all models are wrong, but some are useful*

even at the time we wrote the Spotify Engineering Culture, we were not even doing it;
there was part ambition, part approximation

ex. Tribes are co-located, we have never been able to have Tribes co-located from day one, it never happened, sometimes mission is more important than co-location

> Tomorrow is my first day at my dream job as an Agile Coach for Spotify ...
>
> Spotify feels like a reward after years of leading organisations through change - sometimes kicking and screaming!
>
> -- a new agile coach hire at Spotify 

So you think Spotify is Agile nirvana -> you're in a surprise

## Surprise #1: Where are all the agile engineering practices?

no pairing, headphones

> I don't always test my code, but when I do, I do it in production

a lot taken from Facebook: move fast, break things

Questionnaire sent to Spotify Engineers:

- Are you familiar with concepts such as maintainable code, Simple Design, Clean Code and SOLID principles?

  answers: some, might be, not sure, not using it much

even people coming from ThoughtWorks and Pivotal who did pair programming for years, were not able to introduce it. No traction.

Why?

- Facebook hero culture: move fast, break things -> TDD slows us down
- we don't recruit for it: mostly young people, they don't learn that at school
- skill and talent somehow compensate for this lack of practices

## Surprise #2: Actually, where are the rest of the agile practices

lack of discipline with agile practices

squads might do planning every two weeks, no review of what has been accomplished

do retrospectives a lot, but people don't challenge themselves and don't follow up on actions

> An interested observer should be able to walk into the team workspace and get a general idea of how the project is going in 15 seconds. He should be able to get more information about real or potential problems by looking more closely.
>
> -- Kent Beck on Informative Workspaces

there are no sprint backlogs, no scrum boards

Why?

- not really anyone accountable for the team's delivery:

  everyone is accountable

  -> no-one taking the accountability

- every team is autonomous
  
  => every team needs one iOS developer, one Android developer, one data analyst, one of each basically
  
  -> leads to high specialisation, not a lot of collaboration and cross-functional learning

- chapter leaders are there to grow and manage people, have no accountability for the delivery

  => product owner becomes the leader of the team
  
  with junior POs who are not experienced enough it can easily become command-and-control regarding delivery instead of instituting collaboration, improve the work system, get shorter cycles

- culture of delivering on quality, not on time

  => no real mechanism on how can we deliver this faster

- a lot of imposter syndrome going on at Spotify: like with the ThoughtWorks and Pivotal example

   X: oh wow, they don't do pair programming and TDD, oh no they evolved beyond this.

   Y: No, no, they haven't arrived that far but who am I to question and challenge this.

   => leads to: everyone is so great, I must be wrong

- the autonomy at Spotify

  => we optimise for comfort over effectiveness
  
  autonomy requires two pillars: alignment but also competence

But is it really a problem?

Project Aristotle at Google: What makes great teams?

- psychological safety
- meaning
- feeling that you have an impact

at Spotify we are doing pretty well at all these things
-> maybe this leads to good enough

Shouldn't we be able to deliver more?

that's the issue: when we try to align and deliver something bigger together, that is really hard because we haven't come to that discipline in the teams that would enable us to take that to the next level and coordinate our efforts

because we have autonomous teams it leads to a way of working where we don't depend on each other's code.

How to fix it?

improve accountability
-> team is accountable for the way of working and continuous improvement

mastery of skills is only one part, continuous improvement, collaboration, are the other aspects you are reviewed on for performance and salary

=> changed a little bit the hero culture in more collaborative

switch things around:

- Product Tribe Leads are now accountable for org health
- Tech Tribe Leads are now accountable for delivery

## Surprise #3: Shouldn't everyone at Spotify be using the Spotify Model?

agile is primarily limited to R&D

other departments are more traditional

Why?

- well that's pretty much how it works everywhere, isn't it?
- CTO was the one passionate about driving autonomy and agile, focussed a lot on tech, at the start the rest at Spotify was very small, it was all about tech
- when growing we want to attract big names, they don't necessarily work agile and they have there way of working and want to make their impression on the organisation

  -> not necessarily a fit with how we work in R&D

## Surprise #4: What's with all the managers?

pretty many managers at Spotify

example: IO Tribe Roles

- 1 Chief Tribe Lead
- 5 Tribe Leads
- 12 Chapter Leads
- 13 Product Owners
- 6 Agile Coaches
- 75 Engineers also known as individual contributor (IC)

=> 1 manager for every ~5 IC

=> 1 lead (including coaches) for every ~2 IC

people would expect a more flat organisation

Why?

- we don't have a reporting structure, but a supporting structure

  even if there are a lot of managers, it does not feel like it

  -> supporting, growing people

- hyper growth: 12 teams -> 184 teams

> What I'm focussed on is growth, growth, growth. It is prio one, two, three, four and five for us.
>
> -- Daniel Ek, CEO of Spotify

=> constant flux of people coming into the organisation

=> teams split, difficult to keep teams stable

=> constant re-org and new managers -> also explains the lack of discipline

maybe we shouldn't have focussed on autonomy => every time team splits they re-invent the wheel

How to fix it?

- there is nothing wrong with all these managers necessarily

  there is a constant onboarding of new people, which is a task for managers

## Is this depressing?

No!

I do not find Spotify's problems depressing because I am confident that Spotify will not all of a sudden give up on getting better.

> Having no problems is the biggest problem of all.
>
> -- Toyota

> Stop trying to borrow wisdom and think for yourself. Face your difficulties and think and think and think and solve your problems yourself. Suffering and difficulties provide opportunities to become better. Success is never giving up.
>
> -- Taiichi Ohno

Toyota was also a company that was copied a lot. They laughed because the competition did not copy the real model, only the practices.

Most Agile Coach candidates ask these questions:
1. What is the best thing about working at Spotify?
2. What is the most challenging thing about working at Spotify

The answer to both questions is the same: Autonomy!

You are free to help wherever you want:

- how can we make the life of people better,
- how can we increase engagement,
- how can we deliver better products faster
- ...

there are so many things to choose from, how do you know you are choosing the right thing

Autonomy means you are free to act.

It also means you have to face your difficulties and think and think and think and solve problems yourself.

which is hard!

Autonomy means you succeed by never giving up.

there are new challenges all the time

How organisations implement the Spotify Model: (from [South Park The Underpants Business](https://www.southparkstudios.com/video-clips/g55kxx/south-park-the-underpants-business))

- Phase 1: Implement "Spotify model"
- Phase 2: ????
- Phase 3: Profit!

the line for simplistic solutions is longer than the line in front of "*how to think for yourself*".

But! You should also think for yourself.

Taiichi Ohno copied a lot. He was inspired by Ford (the production lines) and US supermarkets (just in time replenishment)
but he thought for himself and adapted that to his context.

So:

- Phase 1: Face your difficulties and think for yourself.
- Phase 2: Solve your problems yourself.
  
  please be inspired by others. I can reassure you, Spotify did.

- Phase 3: Profit!

this is the REAL "Spotify Model": continuous adaptation, learning, change

that one you can actually copy!
