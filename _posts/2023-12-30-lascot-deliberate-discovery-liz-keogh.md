---
layout: note
title: Deliberate Discovery
author:
  name: Liz Keogh
  website: https://lizkeogh.com/
event:
  name: Lean Agile Scotland
  date: 2018-10-04
created_at: 2018-10-04
category: notes
tags: [ Cynefin, Real Options, Lean Agile Scotland ]
---

Blog post: <https://lizkeogh.com/2012/09/21/the-deliberate-discovery-workshop/>

## Blameless Post-Mortems

only work in organisations with the right culture.

if the culture is not right, people start to think: "*oh, it is that meeting where we know it is the fault of the testers but we may not say that.*"

it works at Etsy because they have the right culture: who did what when?

they can deliberately say, this happened because of that person, did this, and that person did that, ...

this is possible because they have this blameless culture

therefore I like to call Blameless Post-Mortems in such organisations "**Learning Reviews**"

## Cynefin

most of the time problems arise from a cascade of problems (causes)

=> create a timeline (using post-it's); only put things that are actually **factual**

4 columns:

| Story | Commitment | Discovery | Options |

commitments: moments where decisions were made that you could not undo or you didn't know you could; could be: deploy, commit

- what was the point at which the decision became hard to reverse?
- when did an investment get made that was hard to recover?

discovery: discover it is the wrong decision; what would have helped me to discover that, which information => a checklist, pairing

- what could you have done to undo that commitment
- what would have given the information to have a different decision
- were there any ways you could have discovered information earlier that would have led to a different decision?
- who could you have talked to?
- where was the information located, and could you have gone there?

options: rollback procedure, trunk-based (to avoid merge pain), toggles & canaries

- what would have made it **an option** not a commitment ?
- were there any ways of paying to keep options open, perhaps making the commitment later, when more information was present?
- was the commitment simply made too early?

=> safety nets: pairing, insurance: these are all options to catch bad decisions

ex. UK: come with a passport because you never know you have to take the plane to return back (because trains are not working) and you need an id

=> Options Thinking

graphic novel: [Commitment](https://www.goodreads.com/book/show/17910885-commitment), Chris Mats

## Conscious vs Unconscious decisions

unconscious decisions are also deliberate: lots of decisions are taken unconsciously

## Deliberate Discovery

=> spikes and prototypes help to discover deliberately

- assume ignorance
- assume second order ...
- ...
(more on slide)

## Real Options

- options have value (financially)
- options expire

did anyone have the expertise that the decision was wrong?

never commit early unless you know why

## What should we do next?

Discovery + Options => Suggestions

Place the suggestions on an X-Y diagram

where Y: impact -> lowest to highest impact

and X: ease of doing -> hardest to easiest of doing

draw a line: highest impact, easiest to do

=> everything at the top of that line are the once the team should actually do

Outage: timeline of what happened with post-its

ask team members to grab the post-its where they actually could make the difference and place it on the Impact/Ease of Doing diagram as Suggestions

## Wrap up

How likely is it that something similar will happen again?

- Complicated:
  
  If very likely, would adding the discovery process you identified help you avoid this problem?
  
  This matches the “complicated” Cynefin domain, so cause and effect can usually be correlated and making the discovery early will often prevent the problem occurring.

- Complex:
  
  If it’s unlikely to happen again, would adding the options process also provide options in any other cases?
  
  This matches the “complex” Cynefin domain, and processes which create options allow decisions to become safe-to-fail experiments or probes instead.
