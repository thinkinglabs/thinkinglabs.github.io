---
layout: article
title: On the Evilness of Feature Branching - Why do Teams use Feature Branches
author: Thierry de Pauw
meta: 11 min read
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 1 of this series - a Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
I introduced two quite different teams.
One novice team practising trunk-based development,
the other experienced but being used by GitFlow.
Now I would like to explore why teams use feature branches. What are their
reasons? What problems are they trying to solve with long-running branches?

---

> I like the way that question is asked. It gets people in the state of mind of
> wondering _why_ someone else doesn't see the world like they/we do. And they
> really don't, but it's gonna make sense in their own context.
>
> Wouter Lagerweij ([@wouterla](https://twitter.com/wouterla)), [Aug 16, 2021](https://twitter.com/wouterla/status/1427352220362739712)

Before we move on, let me first clarify two definitions: 

- what is *mainline*, and
- what is *feature branching*.

> **Mainline** is the line of development which is the reference from which the
> builds of your system are created that feed into your deployment pipeline.
>
> -- [Jez Humble](https://twitter.com/jezhumble)

For Git, this is the *main* branch.
For Mercurial, this is the *default* branch.
For CVS and SubVersion, this is *trunk*.

[//]: # (Wouter: even link terug maken naar trunk-based development zodat het duidelijk is dat we het over hetzelfde hebben?)

> **Feature Branching** is a practice where people do not merge their code into
> mainline until the feature they are working on is "*done*"
> (but not yet “*done done*”).
>
> -- [Jez Humble](https://twitter.com/jezhumble)

**Done** means it is dev-complete. But there is still a lot of work to be done
before the feature gets into production.

[//]: # (Wouter: misschien aangeven wat 'dev-complete' _wel_ in zich heeft (bijv. unit-tests...) )

- execution of all the unit tests and static code analysis;
- creation of a new release candidate;
- deployment of the release candidate to a staging environment;
- execution of the smoke tests;
- execution of all the automated acceptance tests;
- then manual exploratory testing can start;
- eventually, in parallel, execution of the security and performance tests;
- if all testing was successful, deployment into production can start;
- again execution of the smoke tests;
- and finally, it can be released to the end-user.

When all of the above is done, we call the feature *done done*.

The implementation of a feature starts with the creation of a branch. The
feature grows on that branch. Upon completion of the feature it goes through a
gating process called a *code review*. When the gating process is successful,
the feature gets merged back into mainline.

[//]: # (Wouter: ook 'pull request' noemen, aangezien dat vaak synoniem wordt gebruikt?)

To be clear, when speaking about *feature branching* we truly mean long-running
branches, i.e. branches that last for **longer than a day**.

To understand the reasons teams put forward to use feature branches, I asked
proponents of feature branching for their reasons.

## It allows us to work in isolation, therefore we are more productive

When I first heard of this argument, I have to admit this sounded fair to me.
But, then I started to think this through. Wait a minute, this is a local
optimisation.

We are optimising for individual developer productivity. But designing IT
systems and software products is rarely an individual activity. Most of the time
it is a team activity.

> Developing in isolation can help an **individual** go faster. But it does not
> help a **team** go faster. Merge time and rework cannot be estimated and will
> vary wildly, and the team can only go as fast as the slowest merge.
>
> -- [Steve Smith](https://twitter.com/SteveSmith_Tech)

As long as you have not merged back into mainline you simply do not know how much
work is still left to do. Because of potential merge conflicts, and because of
potential rework caused by merge conflicts at merge time. Integrating changes
into mainline becomes then a time-consuming and rather
unpredictable activity. This makes the whole IT delivery process very
unpredictable which increases the lead time, and the time to market for your
product.

[//]: # (Wouter: Mijn gedachten gaan naar: assumptie is dat individuele performance leidend is, maar tegelijk wordt al geaccepteerd dat wat opgeleverd moet worden niet individueel is: waarom anders de code review? code-review is laat in process, wachten op andere mensen, traag, etc. En dat leidt tot lead time discussie?)

But, the goal of any organisation is actually to make money by sustainably 
minimising the lead time to create a positive business impact.

*Lead Time* is the clock wall time between us, as a team or as an organisation, have
an idea, that idea gets designed and implemented and finally gets in the hands of the
users and used by real users.

[//]: # (Wouter: bovenstaande zin loopt niet helemaal... have -> having?)

*Business impact* is anything that:

- creates money, this is turn-over;
- saves money, this is cost-savings;
- and protects money, this is being ahead of your competition.

We want to reduce the lead time because we want to accelerate feedback. We want
to know as fast as possible if the thing we have just implemented and deployed
into production is actually being used and how it is being used. Based on this
information, we can make new decisions. We can run new experiments to find new
unmet needs of our customers and find new ways to delight our customers. Which is
an immense competitive advantage.

By using feature branching we are, in fact, doing quite the opposite! We
are going to delay feedback by increasing lead time and time to market.

Therefore instead of optimising for developer productivity, we should optimise
for team productivity and adopt a team-oriented branching strategy.

> If it hurts, do it more often. Bring the pain forward.
>
> -- [Dave Farley](https://twitter.com/davefarley77)

## If a refactoring goes nowhere, we can just delete it

Again, when I first heard this argument, I thought: "Fair enough. This sounds
evident."

However, what I think they are trying to say here is: "*We have this problem for
which we do not know the solution right away. So we are just trying something,
by committing code into a remote branch, hoping that somewhere we will get to a
solution. If in the end, we do not get to a solution, we can just delete our
work by deleting the remote branch.*"

If we do not know the solution right away, why do we not **spike out some ideas**?

> A spike solution is a very simple program to explore potential solutions.
> Build the spike to only address the problem under examination and ignore all
> other concerns. Most spikes are not good enough to keep, so expect to throw it
> away.
>
> -- Don Wells, [extremeprogramming.org](http://www.extremeprogramming.org/rules/spike.html)

The purpose of a **Spike** is to write some throwaway code to test out an idea.

The output of a spike is not production code. During a spike, you should never
commit code into a version control system. From my humble experience, the
minute code lands into version control, it is labelled production code. From then
on, it becomes extremely hard to throw away that code because of the
[sunk cost fallacy](https://en.wikipedia.org/wiki/Sunk_cost#Fallacy_effect).

The output of a spike is **knowledge, not code**.

After a couple of hours, we should know if our idea worked out or not.
If it did not work out, no worries, we just throw away that code and try another
idea.
If it did work out, fantastic, we have just found the solution to our problem.
Again we throw away that code and start over again. But this time, we implement
the solution in small incremental steps using the knowledge we have just created
during that spike.

[//]: # (Wouter: Ja, nice. Toevoeging: spikes zijn 'sharp', focus op 1 probleem, and 'short', klein experiment. Als je het 'we kunnen de refactoring weggooien' argument aanneemt is het dus ook zo dat je die refactoring niet te groot wil laten zijn, anders is het zonde van het werk en gaje 'm nooit weggooien. Maar als het een kleine refactoring is, waarom zou je dan die feature branch nog nodig hebben? Punt is: kleine stapjes zijn beter)

## It allows us to control the quality of what goes into production

Only features that went successfully through a quality gating process, called
a Pull Request, get merged into mainline. As such, these features get deployed
into production. This is how, most of the time, teams try to control the quality
of what goes into production.

At best, the quality gating process consists of executing automated tests against
the branch. Hopefully, tests are rerun on mainline after the merge. This is not
necessarily standard practice. At worst, it consists of manual regression
testing and some code review on the branch. This on its own already blocks the
flow of work through the value stream and delays feedback because it keeps the
branch open for an extended period of time. Eventually, this is followed by more
manual regression testing on mainline. Note how this involves a lot of rework
and waste of time for little quality benefits.

[//]: # (Wouter: Je laat niet echt expliciet zien dat het voor rework zorgt, of dat de quality benefits klein zijn. Misschien maakt dat deze sectie meteen te groot, hoor. Maar aangezien ik net voor m'n boek over onbedoelde side-effects heb zitten schrijven: developers moeten wachten op feedback, gaan iets anders doen, en zijn daar dan druk mee, zitten niet meer in de vorige PR, andere developers moeten review doen, maar goed doen kost tijd, grote PRs, want long lived feature branch, dus wordt vaak gehaast gedaan, dus niet heel goed, dus levert niet veel op. Plus: developers die PR review doen kennen context niet goed, mede door focus op individueel werk, dus kunnen vaak alleen oppervlakkig of puur technisch reviewen en niet op bedoelde functionaliteit, dus weer beperkte waarde. En omdat die waarde beperkt is, wordt het doen van review minder belangrijk, dus uitgesteld, dus nog trager. En geeft irritatie over en weer. Jezus, mensen, ga toch pairen, of doe op z'n minst even een korte design sessie samen voor je begint te programmeren! <ok, ik word weer kalm...>)

Controlling quality is the exact purpose of Continuous Integration and, by
extension, Continuous Delivery. As opposed to trying to control quality through
manual merges.

> The objective is to eliminate unfit release candidates as early in the process
> as we can ... You are effectively prevented from releasing into production
> builds that are not thoroughly tested and found to be fit for their intended
> purpose.
>
> -- [Dave Farley](https://twitter.com/davefarley77) and [Jez Humble](https://twitter.com/jezhumble), Continuous Delivery: Reliable Software Releases
> through Build, Test, and Deployment Automation

We aim to eliminate bad quality release candidates as early as possible. Only
changes that successfully went through all stages of the deployment pipeline,
and that have been thoroughly tested, get into production.

[//]: # (Wouter: roept bij mij wat vragen op over 'wat is quality', wat weer ver gaat. Maar 1 van de dingen die ik vaak zie is dat met niet precies weet wat voor soort dingen eigenlijk uit een code-review zouden moeten komen, behalve 'het is beter als meer mensen het gezien hebben', en dat daardoor de echt vraag van 'wanneer is iets goed of niet' onbeantwoord blijft.)

## It allows us to keep mainline stable

There is this commonly accepted belief that branches are required to keep
mainline stable. However, the opposite is more often true. **More often than not,
branches will be the cause of an unstable mainline.**

Why is that?

Because branches delay integration, they create a bigger inventory of
un-integrated code. The bigger inventory means the merge will pull in more and more changes.
Merging back the branch into mainline becomes harder and harder. Resulting in
demanding, time-consuming merges that often will result in an unstable mainline.

Because branches also delay communication with the team, integrating the branch
becomes exponentially more difficult with the lifetime of the branch.
When keeping a branch open for 8 hours, 5 days or 30 days, the team can only adapt
to the changes on the branch at best within 8 hours, 5 days or 30 days. That
leaves a lot of time for the team to accumulate more and more code which makes the
integration of the branch harder and harder. On the other hand, when
committing directly into mainline, the 
[//]: # (Wouter:whole) 
team sees the changes within minutes,
allowing the team to accommodate immediately with the new changes.

I guess the reason for this commonly accepted belief we need branches to keep
mainline stable is:

- Teams have trouble accepting they can actually commit intermediate changes into
  mainline when a feature is not yet finalised. For many teams, this is
  inconceivable.
- Teams simply do not know how to keep an IT system always working on mainline
  while having a whole team committing continuously into mainline.
- Teams are often not good at applying changes to a codebase without blocking the rest
  of the team.
- Branching is a commonly accepted practice in the industry. Few question this.
- Lastly, teams have usually always worked this way. They cannot imagine another
  way of working.
  
All of the above often creates a negative feedback loop. Because teams are bad
at keeping IT systems always working on mainline, because teams are not good
at applying changes without blocking team members, and because teams are used
to work this way, they continue this mode of operation. As a result, teams are
stuck in a local optimum instead of adopting a continuous improvement mindset.

[//]: # (Wouter: Ik vind dit een belangrijk punt. De 'bad at' enzo is wat confronterend... De 'local optimum' is belangrijk. Ze hebben gewoon niet de _andere_ practices in-place om van feature branching af te kunnen stappen. En dat gaat richting het afety blanket waar ik al een kopje van zie hieronder...)

In all sincerity, breaking with this way of working requires quite some expertise
and experience. Changing this is not an overnight task. It requires a tremendous
change in approach and mindset. And it demands the adoption of a reasonable amount
of organisational and technological changes. But, the problem is, however,
organisations can only take a certain amount of changes at the same time. How can
they pace that many changes? How can they organise and sequence this? Many
organisations are overwhelmed and see the number of changes as insurmountable.
Although it is enormously liberating once organisations have learned the
required practices.

## It allows us to control which features get into production

Or, more precisely, we can prevent that unfinished features get into
production. Because incomplete functionality sits on the feature branch. The
feature cannot be deployed into production as long as the branch has not been
merged back into mainline.

> Feature Branching is a poor man's modular architecture, instead of building
> systems with the ability to easy swap in and out features at
> runtime or deploy-time they couple themselves to the source control providing
> this mechanism through manual merging.
>
> -- [Dan Bodart](https://twitter.com/DanielBodart)

In fact, we are now using the Version Control System to turn features off and on
through manual merging. This is nothing else than a poor man’s modular architecture.

Instead of using our Version Control System as a manual toggling mechanism we
should design our systems in such a way that we can turn features off and on at
deploy time or at runtime time.

[//]: # (Wouter: Plus: het risico! _Manual_ merge, onverwachte bijwerkingen, moeilijk terug te draaien, onmogelijk om in verschillende configuraties te testen... Het is gewoon veel te gevaarlijk om dingen op die manier te doen. Matches for children, zoals Ron Jeffries wel eens zegt?)

## It is a safety blanket

Of course, it is a safety blanket. This is obvious to me and to the members of
the XP and Continuous Delivery community. But are teams aware of that safety
blanket?

To this, [Wouter Lagerwije](https://twitter.com/wouterla)
[replied](https://www.linkedin.com/feed/update/urn:li:activity:6829049430356828160?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A6829049430356828160%2C6829160062494281728%29&replyUrn=urn%3Ali%3Acomment%3A%28activity%3A6829049430356828160%2C6830417880614518784%29)
to me:

"*They are aware of the problems they would see if they switch to
trunk-based development. They do not want to confront those problems. And
moreover they do not know how to confront those problems.*

*They see those problems as a result of inherent complexity of software
development. While we see them as accidental complexity. In other words: they do
not think there is another way to avoid those problems, and see feature branches
as a healthy compromise. While we see that the compromise is keeping them from
progressing from that local optimum they are in.*"

By adopting feature branches, teams and organisations seek security. They
add more processes to fix for missing technical excellence and lack of trust.

[//]: # (Wouter: trust, en zelfvertrouwen?)

Hoping to avoid breaking things in front of stakeholders, i.e. first of all
the users, but also C-level and investors. They try to avoid looking bad
and avoid damaging their reputation.

This lack of technical excellence and this fear of breaking things,
creates this uncontrollable fear of getting bad code into the codebase and
getting bad code into production.
But, bad code is not necessarily a problem even if it gets into production,
as long as we can detect it and fix it fast.

However, branching will only bring a **false sense of security** and **a false sense of
control**. Because again ... it delays feedback. It introduces batching up work.
Because of the increased batch sizes, it increases changesets and thus
increases the amount of code released into the wild. In turn, this increases
risks. In the end, what they are trying to avoid, i.e. taking risks, breaking
things, is actually emphasised by adopting more processes through using
feature branching.

[//]: # (Wouter: emphasised is niet het goede woord. exacerbated?)

In all honesty, it is this false sense of security that makes feature branching
so evil. Feature branches tend to hide the real problems teams have. Whereas,
when teams commit immediately into mainline, it will uncover their
problems and allowing teams to actually do something about it.

## Yes, but GitHub

This is my favourite argument from proponents of feature branching.

> Literally every GitHub repository that accepts pull requests uses short lived
> branches. It’s insane to say it “doesn’t work” when it’s the pre-eminent
> method of software collaboration today.
>
> -- James Nugent ([@jen20](https://twitter.com/jen20)), [Jul 13 2021](https://twitter.com/jen20/status/1415047268575727619?s=20)

In my humble opinion, this sounds like Cargo Culting the Open Source world.

> A cargo cult is an indigenist millenarian belief system in which adherents
> perform rituals which they believe will cause a more technologically advanced
> society to deliver goods.
>
> -- [Wikipedia](https://en.wikipedia.org/wiki/Cargo_cult)

Many IT teams adopt Open Source rituals, like branching and Pull Requests,
thinking they will achieve higher technological maturity, unseen quality levels
and profound team coolness.

Obviously, none of this is true. Teams will not ever achieve technological maturity
when they are hiding their problems behind branches. They will not reach better
quality with the "many eyes" principle as the [many security incidents](https://twitter.com/tastapod/status/1415203858465312768?s=20)
of the past years, from SSL to LDAP, have made clear.

Let me repeat this ...

> What works for the open-source community, where a core team maintains
> a system and accepts contributions from the outside world does not
> necessarily work very well for a co-located team in a corporate environment.
>
> -- Me, [On the Evilness of Feature Branching - A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})

[//]: # (Wouter: Open Source development is een model met weinig mensen met veel kennis en veel mensen met weinig kennis. Daarvoor is het een goede match met PRs en aparte branches. Dat maakt het ook fragiel, en langzaam. Als je in een commerciele organisatie je teams op dezelfde manier opzet, en kennis niet deelt, te veel juniors voor te weinig seniors, etc., dan kan feature branching een work-around zijn voor het personeels- en team-configuratie- probleem dat je creeert. Maar het betekent ook dat je langzaam bent, niet flexibel in hoe je mensen in kan zetten, en saai werk en frustraties maakt voor je juniors. Bravo.)

## Acknowledgment

[Steve Smith](https://twitter.com/SteveSmith_Tech), [Wouter Lagerweij](https://twitter.com/wouterla) and [Dietrich Moerman](https://www.linkedin.com/in/dietrichm/) for reviewing the article.

All the magnificent people present at my SoCraTes 2021 session
[*Why do teams use Feature Branching?*](https://overjoyed-bar-e2f.notion.site/SoCraTes-Germany-2021-932e61b2144b4b68b2da4625e3a808e7?p=217f01fdeee24746970e9a8828f74980).

The many people who replied to my LinkedIn question
[*Why do teams use Feature Branching?*](https://www.linkedin.com/posts/tdpauw_lean-versioncontrol-productivity-activity-6829049430356828160-g07L/).

Lagavulin, Port Charlotte, Glenfarclas and Black Bottle for keeping me company late at night.
