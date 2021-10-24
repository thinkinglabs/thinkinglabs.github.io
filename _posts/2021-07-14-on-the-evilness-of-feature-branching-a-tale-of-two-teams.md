---
layout: article
title: On the Evilness of Feature Branching - A Tale of Two Teams
author: Thierry de Pauw
meta: 6 min read
category: articles
tags: [Version Control, Continuous Integration]
---

On the experience of working with two totally different teams: one novice
practising trunk-based development, the other very experienced being used by
GitFlow.

---

*Update Oct 20, 2021: Add [Johanna Rothman](https://twitter.com/johannarothman)'s
confirmation that novice teams can practise trunk-based development.*

In 2012, I started a technical coaching mission to upscale the software
engineering skills of a rather novice team. Novice from an engineering
perspective, not so much from a working-experience perspective. They had
working experience ranging from 5 to 20 years. Sometimes, people do not have the
luxury to attend the right conferences. Or to work with people that would show
them different ways of working.

Luckily, we were the two of us to coach the team. Pair-coaching is tremendously
reassuring. Especially when you have to introduce plenty of changes with people
having many years of working experience.

At the start, we came upon a situation we were not expecting to still discover
in 2012. No one in the team, except for one person, was using any version
control system. Code was shared amongst team members using ... shared
drives. Deployments also happened from ... shared drives.

It seems this no-version control anti-pattern is applied more often than
expected as I discovered again in 2018 and 2020.

> Historically I meet 1 team a year on average who aren't using version/source
> code control. Common reasons:
>
> - very immature team
> - SQL
> - PickOS derivative or ERM/CRM system
>
> Last category may even lack tooling
>
> -- Allan Kelly [@allankellynet](https://twitter.com/allankellynet), [Nov 8, 2020](https://twitter.com/allankellynet/status/1325491840146149377)

Obviously, as a first action, we **introduced version control**. As the
team was a novice in using version control systems, I thought Git would be a
bridge too far. Too many concepts to learn. Therefore I suggested SubVersion. It
is pretty easy to use. You only have three concepts to grasp:

- You check out the code,
- you modify it,
- and you check it back in.
- And you are done. Fairly simple, isn't it?

Because by all accounts branching was reasonably painful with SubVersion - less
troublesome than with CVS but still more demanding than with Git - I also
suggested using no branches at all. **Everyone in the team was going to commit
directly into trunk**. Frankly, at the time, I did not understand much
about branching strategies. It all seemed too complicated to me. I had hard
times trying to fit the workflow in my head.

That worked pretty well. Because ... there was a second thing we introduced,
right from the start, **the practice of Continuous Integration** and
**team-commitment that any change had to be covered by automated tests**,
preferably unit tests.

Continuous Integration later evolved towards Continuous Delivery.

At the time, I did not realise this was a valid branching strategy. And
that it actually had a name. It is only years later I discovered it was named
**Trunk-Based Development**.

Was trunk never broken? Admittedly, yes, it happened. More often than good.
Remember, this was a novice team. But that was not really a problem. Because
Continuous Integration was in place, allowing us to discover any breaking change
early, and to fix it immediately while it was still small and easy to
fix.

When the team gained maturity, we thought it was time to migrate to Git. The
reasons for that decision were twofold:

- there is more tooling available to manage Git repos;
- and we wanted to adopt the Pull-Request model for code reviews and so branch
  creation had to be effortless without friction.

But ... what works for the open-source community, where a core team maintains
a system and accepts contributions from the outside, does not necessarily work
very well for a co-located team in a corporate environment.

> Like all powerful tools, there are many ways you can use them [DVCS], and not
> all of them are good.
>
> -- Jez Humble, On DVCS, continuous integration, and feature branches

The fact that proponents of Distributed Version Control Systems (DVCS) rely on
feature branching to sell DVCSs together with all the tooling that exists around
DVCSs makes everyone blind to the problems created by the use of feature
branching.

With the team, we have hit these problems violently. We tried to find
solutions by introducing ever more entangled processes and ever more complicated
technology. But it never really solved the underlying problem except for adding
a significant amount of complexity. In the end, we sat together to discuss the
matter and decided to let go of the use of feature branches. We went back to
what worked for us, i.e. trunk-based development. We never looked back.

In January 2021, 8 years later, I was invited by the team's organisation to
present [Feature Branching is Evil]({% post_url 2016-10-29-feature-branching-considered-evil %})
as part of training. During the question and answer, I discovered the team is
still practising trunk-based development. **They can still not imagine a
different way of working**. For them, it is the most natural thing to do.

After this experience, somewhere in 2016, I started a new mission in a totally
different organisation. Very agile, working with highly skilled engineers where
everyone was working in pairs most of the time. But ... they decided as an
organisation to use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/).
When arriving, I discovered branches were living from 5 days to somewhere 30
days. People had to rebase mainline frequently into their branches, causing lots
of rework and spending much non-valuable time on fixing what got broken.

With the experience I gained working with that novice team, I suggested
running an experiment with trunk-based development. At the time, a new project
was going to start. Only two people would work on that project. You would
already wonder in the first place, why bother to use GitFlow on a 2-persons
project. That experiment was not going to be very risky, is it?

> Convincing people about the immeasurable rewards of Trunk Based Development is
> not an overnight task.
>
> -- Iqbal Ahmed ([@propattern](https://twitter.com/propattern)), [Nov 24, 2016](https://twitter.com/propattern/status/801803007461650433)

Whenever I suggest trunk-based development, especially in front of experienced,
skilled engineers, I always get that same reaction: People stare at me like I
am an idiot. "*Are you insane? Branching is a commonly accepted
practice in the industry. Are you suggesting to have the whole team committing
immediately into mainline? It will be a mess. We will have merge conflicts
all over the place!*".

> The idea that developers should **work in small batches off master** or trunk
> rather than on long-lived feature branches **is still one of the most
> controversial ideas in the Agile canon**, despite the fact it is the norm in
> high-performing organizations such as Google.
>
> -- 2016 State of DevOps Report

Although trunk-based development is implied by Continuous Integration;

Although trunk-based development has been reported since 2015 by the [State of DevOps
report](https://services.google.com/fh/files/misc/state-of-devops-2015.pdf)
to predict high software delivery performance;

Although trunk-based development is practised by organisations like Facebook,
Microsoft, Netflix and Google at an immense large scale (in [2016](https://dl.acm.org/doi/pdf/10.1145/2854146)
we were speaking about 25.000 developers working from one trunk with 16.000
changes per day);

**Trunk-based development is still one of the most controversial practices in the
IT industry.**

In the end, I failed miserably in trying to get that organisation to just run a
small experiment with trunk-based development. I was not able to bring over the
possible benefits of trunk-based development. I lacked the correct arguments as
I only had that one experience with that one novice team. Though I have used
quite some branching strategies in my past career, I never really paid attention
to the problems they introduce.

That mission was an opportunity to observe what happens when a team adopts a
branching strategy like GitFlow, which resulted in my seminal presentation
[Feature Branching is Evil]({% post_url 2016-10-29-feature-branching-considered-evil %}).

In closing, from the narrow set of data I have, we can conclude that you do not
have to be a rock-star team to practice trunk-based development. Novice teams
can do this, as well as experienced teams are not able to.

> Showing my age: Before we had version control, we only did trunk-based
> development. Even with several people. I was certainly a novice then. It
> worked. (We talked to each other when things didn't work.)
>
> -- Johanna Rothman ([@johannarothman](https://twitter.com/johannarothman)), [Jul 15, 2021](https://twitter.com/johannarothman/status/1415658424956772354)

It all comes down to
having the right mindset. A can-do mindset. A whatever-happens-this-will-work
mindset. And also knowing what practices to apply to facilitate this. I will
come back to this in a future article.

Though I have a limited set of data, others having enough data as [The State
of DevOps Report](https://puppet.com/resources/report/2020-state-of-devops-report/)
and the book [Accelerate](https://itrevolution.com/accelerate-book/)
have equally confirmed trunk-based development together with
Continuous Integration is a predictor for Continuous Delivery,
which in turn together with Lean Product Management and a
Generative organisational culture predicts a high performing organisation.

## Acknowledgment

[Steve Smith](https://twitter.com/SteveSmith_Tech) for reviewing this series.

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. A Tale of Two Teams
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. Why Are Feature Branches a Problem?
4. How Can We Avoid Feature Branching Problems?
5. Questions I Regularly Get Asked about Trunk-Based Development
6. What Are The Benefits of Trunk-Based Development?
7. Where is the Evilness of Feature Branching?
