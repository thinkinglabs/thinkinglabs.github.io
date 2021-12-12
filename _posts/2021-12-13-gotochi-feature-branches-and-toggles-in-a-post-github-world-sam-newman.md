---
layout: note
title: Feature Branches and Toggles in a post-GitHub World
event:
  name: GOTO Chicago
  date: 2017-05-01
author:
  name: Sam Newman
  twitter: samnewman
created_at: 2017-10-17
video: https://www.youtube.com/watch?v=lqRQYEHAtpk
category: notes
tags: [ Continuous Integration, Version Control ]
---

Why I got interested in micro services? Because from my early days at ThoughtWorks was actually helping people ship software more quickly. I spent lots of time looking at Continuous Integration, Continuous Delivery, cloud automation, infrastructure automation, automated tests, and all these sort of things. And realise that actually it was the architecture of these systems that made it hard to ship software more quickly.

This talk is really getting back to my roots where we will re-examine a lot of these original principles we were focusing on in the early days of the Continuous Delivery movement and see if they still apply in this sort of new post-GitHub world.

## 2004

Back to the early days of my career. I joined ThoughtWorks. They immediately dispatched me to a client called Dixon Travel.

I was working on a point of sale system. The project was running for quite some time. I joined the project at a quite interesting moment, they were quite behind schedule. There was quite some push to get things out.

The team was currently working on the 3th release of the project: R3

The bulk of the organisation was working on the R3 branch. Checking in lots and lots of changes. But there was this awareness there was lots of technical debt.

There were a bunch of people that wanted to make substantial changes to the codebase.

-> will be quite hard while still delivering features

-> going to do what was usual at that time: cut off a part of the team and let them do architectural changes at larger scale.

=>  forked off the R4 branch.

After some time the R4 team thought: we have a pretty good grasp of what is going on now and we think actually this is a version of code we wanna send live.

-> we need to make this R4 branch the live production code.

But!! while we were doing our stuff (refactoring our code) the R3 branch evolved and we had to bring in these changes into R4.

That will be easy! We just need to merge in many, many months of development work done by hundreds of developers. That is going to be absolutely fine. Right? Turns out, not so much.

I arrived just when this process had happened.

So, we have a very exciting proposition for you: "*How would you like to join the R3-R4 Merge Bug Fix Team?*" Which of course the only correct answer is: Yay :(

So this was a team I was part of for several months. The only reason this team existed was to fix the bugs and regressions that had occurred as a result of this mammoth merging of 2 branches of code.

This scarfed myself and many other people

* -> let to a lot of the changes on how we think about handling branches
* -> let to trunk-based development and Continuous Delivery

But weren't you doing Continuous Integration? You are ThoughtWorks the company that popularised the whole concept of CI. Why weren't you integrating your code to avoid this huge big giant merge?

The reality was: we were. We price continuous integration very bravely. It is a very important concept. But I am not sure we always have the same definition.

Continuous Integration works in a very simple way:

I work on some code, I check in my changes in a source control

* then some kind of CI tool will pick up that change
* integrate it with the large codebase
* it does a compile and verification step
* you get feedback on whether or not your change worked

The next developer checks in his code and needs to make sure their changes integrate with my changes.

Having no merge conflicts is not enough to validate integration. The software needs to still behave semantically as expected after we brought these 2 changes together.

1. Validate the integration

   a build that validates the integration: compilation, static analysis, automated testing.

   if I check in a change and I break the build -> the integration failed.

   hopefully I ran the test before I checked in -> got a legitimate integration problem happening.

   => you got to fix that build.

1. When the build breaks, fix it!

   the top job of the team: making sure that build is fixed.

   if you checked in that breaking change, you fix that breaking change.
  
   no one else checks in until that's done.

   => leads to some interesting behaviours:

   * people would not check in at 4pm on a Friday.

     Because if the build breaks, they are not going to the pub. -> that's a leaky thing.
   * you want to integrate often.

     Because if you take a long time to finally check in your changes, you might find that actually while you were working locally on your machine and finally check that code in, many days later, you likely have that big merge problem again.

     To avoid that ... the other rule

1. Integrate daily

   you do continuous integration => you integrate daily.

   That is what [Martin Fowler's article](https://www.martinfowler.com/articles/continuousIntegration.html) is saying.

   That is Continuous Integration.

The reality was, on Dixon, we were doing Continuous Integration. The problem was: how we were doing it.

-> the R3 and R4 people working on their code. Separate branches of code.

* R3 had a CI build.
* R4 also had a CI build. But that integration was a pure local integration. Only looking at the changes in isolation of that team!!

=> when we pulled over the functionality from R3 (into R4)

=> still that same old problem: hug big giant merge! So clearly there is something a bit different here ...

Nonetheless, this idea of constant integration was something we're always talked about.

## Integrate Once A Day

**The more frequently you integrate your changes, the more easy it is going to be because by definition you should have a smaller scope of change.**

But that goal of integrating daily, buts up with other problems.

Not all your work can be done in a single day of work. Even if you thought it could be. Something is going to happen: you are called into a meeting, or a volleyball game, or something like that.

You can't necessarily finish a feature every single day. Because some features are more complex then others. If you want to integrate often, to make it easy to handle merges. How do you do that when you got work that is half finished?

## How can you deal with half-finished work?

There is a bunch of different ways that we can handle this problem.

### Option 1: wait to check in

We don't actually do this any more, but we used to do this. We wouldn't check in for several days. If your machine broke or your hard drive crashed, you lost several days of work.

=> we want to put our code somewhere safe in case something bad happens.

### Option 2: make a branch!

We take a branch of the code, to allow us to work effectively on features that are not quite ready to go into production. Because the feature is not yet finished.

-> now that promotion activity through a release branch allows us to release that feature.

I am working on a new feature. It will take me several days. -> I create a separate branch and commit my changes locally on that branch.

My colleague does like wise. Creates also a branch. Works on his feature.

This allows us, although our feature is not quite implemented yet, not fully complete yet, to safely commit on that branch. When I am ready I merge that back into trunk.

Then my colleague does the same and finds out I've made lots of changes and he gets really annoyed because he gets a very big merge activity.

This is how feature branches work:

You make those changes safely on separate branches, allowing you to make lots of commits until your feature is ready and then you merge this back in. You can use CI tools to actually build on those branches and get feedback if things are still working and get Continuous Integration on the branch.

The issue however is that we have the same problem as we did with the R3-R4 merge. We are integrating continuously with our branch. **We are not integrating continuously with everybody else its changes.** We are still deferring integration in that deployable unit.

=> this leaves me with my general problem with all this approach: the pain of a merge.

> Pain of merge = fn (size_of_merge, duration_since_last_merge)

**Pain of a merge**: *a function of how big is that merge, how big the delta is, and how long is it since you last tried to integrate with that code*.

It is not just the size, it is the duration. Duration matters because you've lost track on what is going on on trunk. It is hard to understand what changes have been made when you were off in your own little bubble implementing your feature on a side.

#### Big merge = commit race!

Big merged often lead to the fun act of commit races.

* You've been working for several days on a feature and you know it is going to be a bit of a pain to merge.
* But your colleague also has a big commit he wants to make.

What do you do? You distract him and commit your code in before they can commit their code in. -> they now have to deal with the merge.

It's funny, but it is also annoying.

There's another issue that comes up though, and another reason why I am hated on having branches for feature delivery.

#### Merging refactorings is *really* hard

**Merging refactorings is very difficult.**

When you are just adding new code, integrating that is fairly straightforward, it is fairly easy. But if you are actually refactoring your code, i.e. you introduce a brand new abstraction. Source control tools are aware of textual differences. They are not aware of semantic changes. They can't read in the intent behind a change made 4 weeks ago and reapply that intent on the new code you are merging in. We don't have operational transforms inside our source control tools.

=> what you start seeing when people are working on branches for several days?

=> discouraged effectively from performing refactoring

Because if they refactor on their branch, they actually make that merge activity quite difficult.

You are trying to do something nice. You are trying to make that code a nicer place and all you've done is make your own job more difficult when you try to merge that feature in.

When you see these very, very long lived branches, you see that people don't tend to refactor much.

On codebases where you have lots of long lived branches, again you don't see a lot of refactoring going on because it is a too dangerous activity.

=> I am not a big fan of feature branches.

=> I want to integrate often, I don't want branches

But what if I checked in anyway?

### Option 3: check in anyway

How does that work? Because if the feature isn't finished how can I check in my code anyway?

This is the idea behind what is now called *Trunk-Based Development*.

Everyone integrates into trunk.

Everybody is working on the same branch. We are all integrating together.

> Integrate often ...
>
> ... fast feedback ...
>
> ... break up merge pain

The idea is:

* we integrate very often -> we make lots and lots of small integration steps.
* we get fast feedback when integrations work
* we are also breaking up that merge pain
  * we don't have one giant merge activity at the end
  * we've got lots of incremental merges going on

#### But what about half-finished features?

Again we still have to deal with the fact that we don't have an answer with how about to deal with half finished features.

To make trunk-based development work, where you integrate once a day to mainline, we have to have some other technique.

-> Feature Toggles.

## Feature Toggles

Hide the partially implemented feature in the running system.

Example: Existing UI and we want to add a new widget, but it is not yet finished.

* code for new functionality is checked in,
* it is integrated,
* it is not actually visible in a production environment,
* it is not visible to my customers,
* but I have the ability to turn it on to test it.

Configuration files is one way to do it. In some way this has to be mapped to a Boolean in your code.

```plain
...
super_widget = on
...
```

Other common ways: something like a flag, a command line flag

```bash
$ run -Dsuper_widget=on
```

Google who famously do trunk-based development, they make use of flags to turn features on and off.

Really fancy? use your flags to turn something on and off at runtime.

-> centralised configuration management system: Zookeeper or Consul

It is quite easy to see how to implement something like I want to hide a widget in a UI.

But what about changes to existing functionality?

A lot of time we are changing existing functionality.

What happens when I am changing another widget and actually it is going to behave differently in the future. How would I half implement that?

Example: Go (formerly Cruise)

Used Hypersonic in the early days for meta data storage. We recognised that Go should be able to support other databases like Postgres or MySQL. But that would take several weeks of work. In the mean time we still wanted to ship new functionality. Hypersonic wa quite coupled. How do we go about doing this? 

-> you effectively create a brand new implementation of the changed functionality.

-> we come up with a work in progress Generic SQL Persistence.

As you check in an early version of this, it can be integrated and run tests against it. But you need the ability to sort of turn it on to see how it is working in terms of the whole system.

=> the next thing you need to do is create an abstraction point in your code: a higher order Persistence Interface + the ability to turn it on and off.

=> have a toggle around this: by default the Hypersonic Persistence is wired in, can be replaced by the Generic SQL Persistence through configuration.

For many weeks when people downloaded Cruise, there was an internal configuration file deeply into the system (the you should not touch this configuration file thing) that would allow you to turn on this work in progress. Well if you did it would not work as it was not finished. But the team itself was able to actually play with that, make sure it worked well, configure it and when they were happy roll that change out.

Once that feature was embedded in and happy with it, you removed the old implementation.

Rather then using feature branching where you have a branch of code where your other implementation is with the change in behaviour, instead you are co-existing both implementations in the same code base at the same time via an abstraction point.

=> **Branch by Abstraction**: *rather than branching in the source code, I am branching in the same version of the code*.

People don't like this as you actually have to refactor your code to create an abstraction point. My view on this, if you don't feel comfortable to refactor to create an abstraction point, you have different problems.

But nonetheless this use of branch by abstraction model allows you to check in a change into existing behaviour without using branches, then you can choose which abstraction you are going to use using a feature toggle mechanism.

There are some things to be aware of using feature toggles and there are some pitfalls. I've certainly seen some bad uses of these techniques.

### Important Rules

* Use a flag in as few places as possible.

  Example: if I want to turn a widget off and on I only need one Boolean in my templating code somewhere. Maybe one place, maybe 2 places is ok.

  I've worked with a team, they were using every flag at 50 or 60 places in there codebase. Became a real nightmare. Really confusing.

  => limit to one place in your codebase.

* Remove them when you are done.

  When you don't need them any more, remove them.

  That same team had over 200 flags that were different on QA vs Production. You had no understanding whether the software you were testing in QA was the same that you actually deployed in your Production environment.

=> be very, very careful about how to use these flags. You don't want lots!

=> you remove them once your done using

=> using them in a small number of places and you'll be ok.

### Side Benefits

=> opens up the possibility to implement other deployment related activities that can be really useful when deploying in a safe manner.

* A/B testing

  I've got the ability in the same code base to code 2 implementations of the same abstraction, of the same piece of functionality. 
  
  -> I can now use that for A/B testing. 
  
  Based randomly I gave you different implementations of that abstraction point.
  
  Or based on some characteristics of your customer basis.
  
  Or maybe I even mark a certain customer group as being the beta testers and they get the new implementation.

* Canary Releasing

  with a little bit of more work 
  
  where we release a brand new version of our functionality to a small subset of our users. If it behaves correctly we can ramp up the number of people to see it.

[Paul Hammant](https://twitter.com/paul_hammant) set up a site [trunkbaseddevelopment.com](https://trunkbaseddevelopment.com/) that describes a lot of these patterns.

To come back to Dixons:

We came back from this experience realising:

* long lived branches are really problematic.
* finding alternative ways of working with software in terms of how we handle source control is really important.
* let to extending the ideas behind Continuous Integration became [Trunk-Based Development](https://trunkbaseddevelopment.com) then let to the [Continuous Delivery book](https://www.goodreads.com/book/show/8686650-continuous-delivery) ... published in 2011

[Dave Farley](https://twitter.com/davefarley77) who wrote the book together with [Jez Humble](https://twitter.com/jezhumble) was the mean tech lead of the Dixons project. He learned so much by experience, they kind of pulled together this new way of working in that book.

An awful lot has actually changed since then. But so much in the book still really does apply. There are lots of ideas in the book that are really important. One of the main shift was this idea of moving towards:

**Treat every check-in as a release candidate.**

-> you should be happy when every check-in goes into production.

-> shift in thinking about release cadence and release frequency (not only making releases more reliable and improving code quality).

-> the value of much more fast and frequent releases.

This is best articulated in [John Allspaw](https://twitter.com/allspaw)'s talk [Ops Meta-Metrics: The currency you use to pay for change](https://www.slideshare.net/jallspaw/ops-metametrics-the-currency-you-pay-for-change-4608108. It's an old talk, but his slide deck is still gold.

He made this observation that when we release software infrequently, you have a two fold problem:

1. if you take a long time between each release, each release has a larger change. Has a larger delta. There are more changes, more lines of code between this release and a previous release.
  
   -> this release is inherently more risky. More chances of something going wrong.

   -> every release remediation will be more complicated. Much more stuff has changed.
  
   -> often safer to just rollback then try to fix that thing in situ.

1. if you are only releasing infrequently your release process isn't used that often.
  
   -> more likely the release is going to have problems

1. you are not learning: would the customer like these features or not.

=> get these weird, nasty anti-patterns:

You don't release that often. When you do release you have a problem. You have a problem because the size of the release is so large. It increased the risk of that release. And you had issues and so people get crossed and say: "*How do we make sure we don't have a problem at our next deployment?*". We will be extra especially careful at the next one. We spent more time, and apply more rigour

-> put more processes in place.

-> the next release will be even longer. When we do that: "*Oh we get a problem, what should we do?*".

-> let's be even more careful by the next release

=> your release cadence reduces

It is amazing how much of the work around Continuous Delivery with clients is actually looking at the release processes and realising that a large amount of the release procedures that are in place inside that organisation amounts to the organisational scar issue. Like something really bad happened to us 10 years ago. we've put something in place to stop that problem from happening again. No one actually remembers what that problem actually was.

John made that observation:

* if you shrink the size of each release
* you have a smaller delta of each release
* -> the risk of each release is much smaller
* -> less likely you are going to have a problem with that
* if you do, it is going to be easier to diagnose and fix that.
* you also release software more often
* -> therefore your release process is more likely to work because you do it a lot
* you also get to learn from that.

The Continuous Delivery book was asking: "*How can we get this rigour of ensuring quality of our software, integrating our software more frequently, but also ship our software to our customers more frequently?*"

It actually comes back to these core ideas:

* Integrate often

  You make sure all of your software works together.
  
  If you defer integration, integration is more expensive and less likely to work.

* Keep batch size small
  
  Keep the size of your changes small. Again if you are integrating often, each integration is going to be small.

* Ship often
  
  Ship your software frequently.

While Dave and Jez are working on the Continuous Delivery book there was a little source control engine called Git buzzing.

## And then there was Git

Git is covered in detail in the book. But really wasn't making much impact in the world of software development as a whole. Even in 2011 the number of people using it in corporate sectors was quite small. It was very big in the open source sector.

We should actually remember where Git came from. Git was designed as a replacement for BitKeeper. Which was being used until that point to manage the Linux kernel. There was a falling out around licensing. Linus was stuck with a problem that he needed an alternative source control system.

It is probably important to reflect on why git works the way it does. It does to enable people to maintain the Linux kernel. This kernel is quite different to most software we work on. Most of our software we integrate down to a single deployment. We deploy into one location for the most of us. Most of us work on centrally deployed systems used by multiple customers. The Linux kernel is not one thing. There is no one version. It is made of a whole number of different patches, different operating systems who apply different patches onto their code. The RedHat kernel is different from the Ubuntu kernel. It's kind of a mix and match metaphor.

Nonetheless Linus set this driver to make it very fast to integrate patches sent to him. Using version control systems at the time he reckoned it would take 30 seconds to integrate a patch.

Goal: merge a patch in less then 3 seconds

His goal was to apply a patch in 3 seconds or less. This doesn't mean understanding the patch and reading it and reasoning about it. But the actual process of integrating that in.

Borrowing from previous DVCS systems like BitKeeper, Arch and the others, we have Git. Git has a few characteristics that shifted the game a little bit when you start thinking about feature branching.

### Branches much more lightweight

One of the very first things to realise is that branches inside Git are significantly more lightweight then in traditional version control tools that came before.

In SVN branching was a major activity. Because creating a branch normally involved a whole copy of that source on the server. That could be a significant impact. Therefore you wouldn't just create branches when you need them. You actually had to have a conversation about it. What that meant was when you did branch that branch would lie around for a while. Often you would be encouraged to use that branch for multiple purposes. The R3-R4 thing at Dixons was due to the cost of branching. It was easier to have one branch instead of lots and lots of branches.

There are some nice things like:

Full local copy of the source history.

That is kind of nice and cool. You can commit locally and then push from your local source code.

And also:

Merging of text is better but ...

The merging of text in Git was significantly better then SVN. It seems to do a better job of identifying changes in text, and picking up things like renames and things like that. To be fair, SVN got things better as well.

To understand though: branches are more lightweight in Git and the textual merging has been better then some of the systems before. But it is still not actually a semantic merge.

Git was rumbling around at this time but hadn't really kicked into high gear primarily because people weren't using it that much other then for that kernel.

## Then there was GitHub ...

GitHub is a major part why Git became popular.

2008 when GitHub got launched. It took them a while.

There 3th blogpost announced the support for a thing called Pull Request.

Pull Requests were actually in the earliest versions of Git. It was there from the very early days. But the GitHub developers thought they could do better and developed a web front end. The idea was: if you want to make a change to a piece of code, what you do is: You fork the code you want to make a change to. You make that change within that branch. Then you tell the maintainers: I have a new version of your code. I've made a change in functionality. Could you take a look at it and merge that change in?

This proofed to be a fundamental shift the away open source software is developed.

Ruby on Rails: when moving over to GitHub, the pull request mechanism drastically lowered the barrier to entry from untrusted committers, as from people that weren't part of the core team => explosion in growth of the number of committees involved actively

That little twist of making it very easy for you to work on your changes safely and then tell people about it and have the maintainers look at and apply those changes in a fairly safe manner really shifted things.

So no surprise: 3 years after launching they were already more successful then both Google Code, which now closed down, and SourceForge together.

But of course Sam you were talking about feature branching and how bad feature branches are earlier.

But PRs use branching!

Basically pull requests are a fill from a feature branch. You are creating a fork of the code, you are working on that change and then you are asking people to back it in.

Pull Requests work very well when you got people outside of a core team who are committing less sporadically, who are maybe not part of that core trusted team. You have the ability for them to make it easy to commit. But you have the ability to also vet that change and integrate that change. Which is a substantially a different thing.

I don't really like to see people working inside small co-located teams making use of Pull Requests internally. What's the point? What's the value of that ceremony?

But with untrusted committers, which represent ultimately the vast majority of open source contributions, the Pull Request mechanism works very well. Although yes there are potential downsides of branches. You can't have those on untrusted committers. There is some value of "untrusted committers".

That got successful. GitHub got really, really incredibly empowering the representation of how open source could work and how untrusted committers could work.

## And then there was GitFlow ...

Because if there is something worth doing, there is something worth doing really complicated.

Now Git really lowered the cost of creating branches. It made it much cheaper, quicker and more faster and more efficient to create branches.

-> people started using this to create different variations on the feature branch mechanism.

This is one overview on how feature branching could work:

* master branch
* hotfix branch
* release branches
* development branch
* feature branches

I don't understand all this because I am old and quite stupid. There are some people that really like this model and have created tools on top of the GitFlow mechanism.

This is a formalised mechanism for doing feature branches.

**I really have trouble conceptualising this model in my head.** 

Models like GitFlow are actually optimising for a model where a developer is sitting by themselves working on a feature for a long period of time.  Fundamentally that doesn't sit right to me. This idea that you have a developer that's working on a feature by themselves for a period of time.

**The creation of software is a social activity.** It's a collective activity. I like the idea that an important feature lots of people have been working on that and knows how that works.

Again in an Open Source world where by definition because of geography, because of availability of people this is always going to happen.

But on a team structure GitFlow feels weird to me because it's just promoting and enabling working by yourself on a branch for a long period of time.

That doesn't help me ship software frequently and integrate often (frequent deploys => small changes).

Then I get some people saying: "*But we use GitFlow. But we always merge back in really, really fast. We integrate really, really frequently. GitFlow is fine.*"

But if I merge in frequently, why do I need GitFlow?

If you are integrating back to mainline every day why the hell do you need GitFlow?

This doesn't seem to make sense to me. I am still not entirely sure of the sweet spot for GitFlow. It seems overly complicated to get a head around it to contribute to Open Source projects and for co-located teams there are better ways of working. I am happy to be proven wrong. But every single picture that explains me how GitFlow works, makes me wanna kill myself.

## Split.io, Launch Darkly

Other things have moved on as well. We now have organisations that are actually providing solutions that make feature toggling very easy.

[Split.io](https://www.split.io/) and [LaunchDarkly](https://launchdarkly.com/) are the 2 best examples of that.

They have very interesting features with a centralised dashboard to manage your feature flags.

But I have real reservations about offloading my feature flags into SaaS products like this because ultimately this thing has to be up for my system to work.

That coupling really worries me. Split.io has done things to mitigate this. But I'm still not sure.

But on the other hand they make it really, really easy for you to integrate toggles. That lets you build really interesting things on top of it. They make it very easy to segment flags by customer. You can easily identify beta customers and assign beta features to these customers. They even do geolocation aware features. You can rollout some feature to some part of the world based on IP address.

## The DevOps Handbook

In this book they do revisit the topic of Trunk-Based Development.

Published end of 2016.

Trunk-Based Development is likely the most controversial practice discussed in this book

However the data from Puppet Labs' [2015 State of DevOps Report](https://services.google.com/fh/files/misc/state-of-devops-2015.pdf) is clear:

> trunk-based development predicts higher throughput and better stability, and even higher job satisfaction and lower rates of burnout.

[State of DevOps Report 2016](https://services.google.com/fh/files/misc/state-of-devops-2016.pdf):

> We found that having branches or forks with very short lifetimes (less than a day) before being merged into trunk, and less than 3 active branches in total are important aspects of Continuous Delivery, and all contribute to higher performance. So does merging code into trunk or master on a daily basis.

This means they found it statistically significant correlation between practicing Trunk-Based Development and high performing IT teams. That's not to say you can't be a high performing IT team and use feature branching. That is just not what they found in general to be the case.

Now we start to get some fairly rigorous research that is implying what some of us were believing from experiences and started to see these things might apply. That doesn't invalidate your experiences. You may well be part of an organisation using feature branches and is working extremely well. In which case that's great.

What we are starting to see now is that research on general shows that you may be well better off practicing a different form of development.

## So are branches evil?

Summarising this off, I am not necessarily here to say branches are inherently evil. They are probably less evil then they were in the past. Anyone tried to do branch management in CVS or PVCS, MKS Source Integrity, StarTeam Versions, StarTeam Dimensions, SCCS, ClearCase. A lot of these experiences were quite miserable. Some of them regarding branches were awful.

Do branches got a lot easier to work with? Git showed us how light weight they can be. Some of the traditional challenges have been reduced.

But ultimately it also comes down to that same problem:

**If you are using branches to avoid integration, you are probably not actually going to be optimising for frequent delivery of software.** Not optimising for integration early, making sure your software actually works.

By all means use feature branches for things like experimental code. Use  branches for things like release branching where you have a unidirectional merge.

But using them for feature branches I still remain unconvinced 14 years on.

I keep coming back to the same sentence repeated again and again in the Continuous Delivery book and earlier in Continuous Integration:

> * integrate often
> * keep batch size small
> * ship often

If you want to ship software quickly, find out if your software works and, as the State of DevOps Report states, reduce team burnout. Practicing trunk-based development is probably still the right answer. Even after all the changes and shifts we've had.
