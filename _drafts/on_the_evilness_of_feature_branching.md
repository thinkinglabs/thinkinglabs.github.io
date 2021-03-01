---
layout: article
title: On the Evilness of Feature Branching
categories:
tags: [Version Control, Continuous Integration]
---

Branch creation became very easy with the advent of Distributed Version Control
Systems. However, it comes at an unquestionable cost. Long living branches break
the flow of the IT delivery process, impacting stability and throughput. In this
article, I will explore why teams use feature branches, what problems do the use
of feature branches introduce and what techniques exist to avoid them altogether.
Finally, I will explore what exactly is evil about feature branches, which is
not necessarily the problems they introduce - but rather, the real reasons why
teams are using them.

---

## A Tale of Two Teams

In 2012, I had the opportunity to start a technical coaching mission. The
purpose of the mission was to upscale the software engineering skills of a
rather novice team. Novice from an engineering perspective. The team had a
working-experience ranging from 5 to 20 years. They hadn't had the luxury to
attend conferences. Or to work with people that would show them different
ways of working.

Luckily, we were the two of us coaching that team. It is always reassuring to
pair-coach. Especially when you have to introduce lots of change with people
having lots of working-experience.

When starting, we discovered a situation we weren't expecting to still encounter
in 2012. No one in the team, except for one person, was using any version
control system. Code was shared amongst team members using ... shared drives.

In 2018 and 2020, I discovered more organisations still apply the no-version
control anti-pattern.

> Historically I meet 1 team a year on average who aren't using version/source
> code control. Common reasons:
>
> - very immature team
> - SQL
> - PickOS derivative or ERM/CRM system
>
> Last category may even lack tooling
>
> -- Allan Kelly, [Nov 8, 2020](https://twitter.com/allankellynet/status/1325491840146149377)

The first thing we obviously did was **introducing version control**. As the
team was a novice in using version control, I thought Git would be a bridge too
far. Too many concepts to learn. Therefore I suggested SubVersion. Very simple.
Only three concepts to grasp:

- You check out code,
- you modify it,
- and you check it back in. And you are done.

Because allegedly branching was rather painful with SubVersion - less
troublesome than with CVS but still more demanding than with Git - I also
suggested using no branches at all. **Everyone in the team was going to commit
directly into trunk**. To be honest, at the time, I did not understand much
about branching strategies. It all seemed too complicated to me.

That all worked pretty well. Because ... there was a second thing we introduced,
right from the start, **the practice of Continuous Integration** and
**team-commitment that any change had to be covered by automated tests**,
preferably unit tests.
This Continuous Integration later evolved into Continuous Delivery.

At the time, I did not realise this was a valid branching strategy. And that it
had an actual name. It is only years later I learned it was named
**Trunk-Based Development**.

Was trunk never broken? To be honest, yes. More often than good. Remember, this
was a novice team. But that wasn't really a problem. Because Continuous
Integration was in place, allowing us to discover any breaking change early
enough, allowing us to fix it immediately while it was still small and easy to
fix.

When the team gained maturity, we thought it was time to migrate to Git. The
main reasons for that decision were:

- there is more tooling available for managing Git repos;
- and we wanted to adopt the Pull-Request model for code reviews.

So we needed something that would allow us to create branches more easily.

But ... what works for the open source community, where a core team maintains
a system and accepts contributions from the outside, does not necessarily work
very well for a co-located team in a corporate environment.

> Like all powerful tools, there are many ways you can use them (DVCS), and not
> all of them are good.
>
> -- Jez Humble, On DVCS, continuous integration, and feature branches

Here Jez refers to the use of feature branching. And the fact that proponents of Distributed Version Control Systems (DVCS) rely on feature branching to sell
DVCSs. Together with all the tooling that exist around DVCSs, it makes everyone
blind to the problems related to the use of long-running branches.

> [@AgileSteveSmith](https://twitter.com/AgileSteveSmith)
> at CITCON Asia @PaulJulius had a session
> "Are Feature Branches Evil?" :)  I guess that makes us old school...
>
> -- Jeffrey Fredrick, [Mar 29, 2015](https://twitter.com/Jtf/status/582244493824536576)
>
> [@Jtf](https://twitter.com/Jtf)
> [@PaulJulius](https://twitter.com/PaulJulius)
> In the old days they were always evil, now they mostly evil
> but people are blinded by DVCS tooling
>
> -- Steve Smith, [Mar 29, 2015](https://twitter.com/SteveSmith_Tech/status/582245267216424961)

And we've hit those problems. Really, really hard. We tried to find solutions by
introducing ever more complex processes and ever more complex technology. But it
never really solved the underlying problem. It only added more complexity. In
the end, we sat together to discuss the matter and decided to let go on the use
of feature branches and to go back to what worked for us, i.e. trunk-based
development. We never looked back.

8 years later, in 2021, I discovered that team is still practising trunk-based
development. They cannot imagine another way of working.

After that mission, somewhere in 2016, I started a new mission in a totally
different organisation. Very agile, working with highly skilled engineers where
everyone was working in pair almost all the time. But ... they decided as an
organisation to use [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/).
When arriving, I discovered branches living from 5 days to somewhere 30 days.
People had to rebase mainline frequently into their branches, with lots of
rework and causing people to spend much non-valuable time on fixing things.

With the experience I gained working with that previous novice team, I suggested
to run an experiment with trunk-based development. A new project was starting at
the time. Only two people would work on that project. You would wonder why
bother to use GitFlow with a 2-persons project. That wasn't going to be a very
riskful experience, isn't it?

> Convincing people about the immeasurable rewards of Trunk Based Development is
> not an overnight task.
>
> -- Iqbal Ahmed, [Nov 24, 2016](https://twitter.com/propattern/status/801803007461650433)

Whenever I suggest trunk-based development, especially in front of experienced,
skilled engineers, I always get that same reaction: People stare at me like I
am a retarded moron. "*Are you insane? Branching is a commonly accepted practice.
The whole industry uses some sort of branching strategy. And you are suggesting
to have the whole team committing immediately into mainline? It will be a mess
because of all the merge conflicts!*".

> The idea that developers should **work in small batches off master** or trunk
> rather than on long-lived feature branches **is still one of the most
> controversial ideas in the Agile canon**, despite the fact it is the norm in
> high-performing organizations such as Google.
>
> -- 2016 State of DevOps Report

Although trunk-based development is implied by Continuous Integration. Although
trunk-based development has been reported since 2015 by the [State of DevOps
report](https://services.google.com/fh/files/misc/state-of-devops-2015.pdf)
to predict high software delivery performance. And although trunk-based
development is practised by organisations like Facebook, Microsoft, Netflix
and Google at an immense large scale (in [2016](https://dl.acm.org/doi/pdf/10.1145/2854146)
we are speaking about 25.000 developers working on one trunk with 16.000 changes
per day), it is still one of the most controversial practices in the IT
industry.

But, I failed miserably in trying to convince them of the benefits of
trunk-based development and getting them to run a small experiment
with trunk-based development. I lacked the right arguments. I only had that one
experience working with that novice team. Although I used quite some branching
strategies in my past career, I never really paid attention to the problems
they introduce.

So, I took the opportunity to observe what happens when a team adopts a
branching strategy like GitFlow which resulted in this article.
