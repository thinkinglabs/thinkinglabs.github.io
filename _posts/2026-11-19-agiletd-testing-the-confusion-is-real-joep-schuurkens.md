---
layout: note
title: "Testing: the confusement is real"
event:
  name: Agile Testing Days
  date: 2026-11-18
author:
  name: Joep Schuurkens
  linkedin: joepschuurkes
slides: https://slides.smallsheds.garden/atd2026-testing-the-confusement-is-real.html#/
category: notes
tags: [ Testing, Agile Testing Days ]
created_at: 2026-11-18
category: notes
---

Any change in software testing seems larger than it is, because few people know what they should expect of testers.

During my 20 years in testing I've experienced many changes. Waterfall, Agile, and DevOps. Scripted, exploratory, and automated testing. Shifting left, shifting right, and sticking a CI/CD pipeline in between. Testers in a separate team, testers in the same team, and quality engineers near the team. And of course, now there's GenAI. But I can't help but think: the more things change, the more they stay the same.

The job has always been about effectively uncovering information about the quality of the software your organization is building. And there has always been a lot of confusion in organisations on how to organize testing. That has forced testers to mold themselves to fit into whatever spaces organisations have reserved for them. Unfortunately this has lead to quite some dysfunctional approaches to testing, with the testers often being among the worst victims.

So join me as I share stories from my 20 years in testing. Stories that show how things kept changing, while the core of testing stayed the same. I'll distinguish activities and roles that are a result of organisational dysfunction and ones that have lasting value. Because that's the only way to future-proof your career: building skills that align with that core of testing, not (just) with the dysfunctions.

---

**confusement**: an ongoing statement of confusion that does not get resolved

I've been doing this ...

```plain
started in 2006
waterfall, agile, devops, CI/CD pipelines
test engineer, quality engineer, staff/principal test engineer
scrum master, development team lead
scripted testing, exploratory testing, test automation
telecom, finance, tech company, start-up, government
```

I've been writing things

- ["Tester" is an overloaded variable](https://smallsheds.garden/blog/2022/tester-is-an-overloaded-variable/) (2022)
- [A good tester is all over the place](https://smallsheds.garden/blog/2023/a-good-tester-is-all-over-the-place/) (2023)
- [So you want to become a test engineer?](https://smallsheds.garden/blog/2024/so-you-want-to-become-a-test-engineer/) (2024)
- [How essential are your testers?](https://smallsheds.garden/blog/2025/how-essential-are-your-testers/) (2025)
- [We do not all have the same job](https://smallsheds.garden/blog/2025/we-do-not-all-have-the-same-job/) (2025)
- [How do I know my testers are doing a good job?](https://smallsheds.garden/blog/2026/how-do-i-know-my-testers-are-doing-a-good-job/) (2026)
- [If developers have autonomy, mastery and purpose, what do you need testers for?](https://smallsheds.garden/blog/2026/if-developers-have-autonomy-mastery-purpose/) (2026)

## 12 Sources of Confusion

### we do not all do the same job

"*In software testing...*"

current job: we only release during a single week of the year, because for the rest of the year no-one needs it

previous job at startup: we had Continuous Deployment

### we only see places that hire testers

no one starts with hiring a tester, some never hire a tester

### activities and roles and titles

- activity: moment in time
- role: period of time, but it is also something that you can step out
- title: permanent, the thing HR cares about

I found a bug, found the source of the bug, and showed it to the developer, "Why don't you fix it?!?" Ah yes, right, send a PR

### so many different titles

```plain
test engineer, QA engineer, agile test engineer
quality engineer, test automation engineer
test analyst, test specialist
automation tester, software engineer in test
test coordinator, test manager, test lead
test architect, quality coach
```

no one cares about the title

### the context changes

in the age of ... waterfall, agile, CI/CD, DevOps, GenAI

the context might have changed, or you use different words: agile with quarterly planning, CI/CD but you only have a pipeline, genAI is going to change everything but we have trouble finding good results

### are testers technical?

everyone in IT is technical!
should you be? YES!

still Testers who are not willing to be technical

### non-testers test too

```plain
developers, UX designers, business analysts
product owners, project managers, team leads
users
```

seen many people, non-testers, doing testing and being good at it

why do we need people specialised in this?

what is it that testers do because everyone else does it too

### developers don't know

the good ones know dev testing

they don't go to our conferences, we don't go to theirs

many developers think Test Strategy is the Test Pyramid, where are the quality attributes, the risks?

### management doesn't know

how would they, most don't have a testers background, most have a developer background
few have ever been in testing

### testers don't know

how do we educate testers

essential vs accidental education

I have a philosophy degree, then I needed a job ...

what else exist in the community? contract testing, exploratory testing, ...

you have to be lucky in what you encounter (note-taker: also true for developers)

developers most likely have a computer science degree (note-taker: not always true)

developers have organisations to look up to, we don't have orgs that have testing right

### testers don't agree

we don't even agree on how we disagree

schools of Testing; which one to choose is wrong; the point is about the principles we apply in choosing certain techniques, but we are not having that conversation

### this list is too long

insert whole list here

there are too many confusions, too many to solve

## the confusement is real

about what ~~good~~ software testing is

## consequences of the confusement

### most organisations tend to have dysfunctional testing

we're sure we need testing, because something something quality

if your work is only testing, you will feel miserable as described by Elisabeth Hendrickson in More Testing Worse Quality

### dysfunctional testing

managing work over doing work: writing the 50 page test plan, test reports, ...

testing silo: everyone looking at the tester at the end of the sprint: are we going to be able to meet the sprint goals?

having a head of Engineering and a head of Quality sending a very clear message to the head of eng whether they are responsible for quality

effort with little value

### dysfunctional testing requires coping skills

getting good at dysfunctional activities working around dysfunctions

when you have to write a 50 page test plan you try to avoid it

testers measured by the number of test cases executed => testers execute empty test cases and pass them to green

### danger zone

you get very good at something that shouldn't be done at all

**don't build coping skills at the expense of core skills**

you are going to paint yourself into a corner career-wise

### the goal of testing

- effectively uncovering
- relevant information
- about the quality of the product

### core testing skills

- exploratory testing
- technical skills
- domain skills
- collaboration skills
- self-care

### exploratory testing

investigating, evaluating, and reporting

[The nine skills of exploratory testing](https://smallsheds.garden/blog/2024/the-nine-skills-of-exploratory-testing/)

### technical skills

technical testing skills (executing SQL queries), software engineering skills

### domain skills

being able to (inter)act with the people within the domain, the people that use the software

in my job at the Dutch Elections: during election time: I help running the elections

### collaboration skills

it takes a team

### self-care

you, professional community, non-software people (do something very different)

## dealing with the confusion

### I'm not any less confused

torn between my own confusement and seeing my added value: if software engineers test what am I doing here

and I am in a rather functional org right now!

[If developers have autonomy, mastery and purpose, what do you need testers for?](https://smallsheds.garden/blog/2026/if-developers-have-autonomy-mastery-purpose/)

### the cynical conclusion

you will always end up in moderately to highly dysfunctional orgs, because they don't know about testing and need to hire many testers

### the other conclusion

people working together is always a messy business

### three options

- shrink your role: focus on the scoping skills, but then you'll do this at all orgs
- expand your role: become an expert at something, book "So Good They Cannot Ignore You", fix some of the dysfunctions, watch out for burnout, don't fight all the battles at once
- go somewhere role: you will go to another org that is also dysfunctional in another way, so new dysfunctions which can be a breath of air

**choose your dysfunctions wisely**

closing message:

> Be so good at
> identifying and filling the gaps
> that you are no longer needed.
>
> Be so good at it
> that you are needed everywhere.
>
> -- Bas van Opstal
