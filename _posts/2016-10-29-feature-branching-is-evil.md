---
layout: talk
title: Feature Branching is Evil
date: 2016-10-29
category: talks
tags: [ Version Control, Branching, Continuous Integration ]
conferences:
  - name: SoCraTes-FR 2016
    date: 2016-10-29
  - name: Continuous Delivery Conference NL 2016
    date: 2016-12-01
  - name: XP 2017
    date: 2017-05-23
  - name: XPDays Ukraine 2017
    date: 2017-11-11
    video_link: https://youtube.com/watch?v=h4DM-Wa0aDQ
  - name: SoCraTes-BE Meetup Jan 2018
    date: 2018-01-24
  - name: Agile Belgium Meetup Feb 2018
    date: 2018-02-20
  - name: Agile India 2018
    date: 2018-03-09
  - name: Software Craftsmanship Lille Meetup May 2018
    date: 2018-05-03
  - name: NewCrafts 2018
    date: 2018-05-17
    video_link: https://vimeo.com/275529985
  - name: Journée Agile 2018
    date: 2018-05-18
  - name: WeCraft & DevOps Meetup Sept 2018
    date: 2018-09-19
  - name: Lean Agile Scotland 2018
    date: 2018-10-03
    video_link: https://vimeo.com/299653588
  - name: Agile & Automation Days Poland 2018
    date: 2018-10-15
  - name: Agile Tour Brussels 2018
    date: 2018-10-31
  - name: OSDC 2019
    date: 2019-05-14
  - name: DevTernity 2019
    date: 2019-12-06
    video_link: https://www.youtube.com/watch?v=h7LeD7VevyI
  - name: CfgMgmtCamp 2023
    date: 2023-02-06
    video_link: https://www.youtube.com/watch?v=cHgDdRW3WO0
  - name: Agile2023
    date: 2023-07-24
speakerdeck:
  data_id: 6e5c22252bbc42b09caedba221567c27
  download_link: https://speakerd.s3.amazonaws.com/presentations/6e5c22252bbc42b09caedba221567c27/feature_branching_is_evil.pdf
youtube:
  data_id: cHgDdRW3WO0
redirect_from:
  - /talks/socrates-fr-2016-feature-branching-is-evil
  - /talks/cdconfnl-2016-feature-branching-is-evil
  - /talks/xp-2017-feature-branching-is-evil
  - /talks/xpdays-ukraine-2017-feature-branching-is-evil
  - /talks/socrates-be-meetup-201801-feature-branching-considered-evil
  - /talks/agile-belgium-meetup-201802-feature-branching-considered-evil
  - /talks/agile-india-2018-feature=branching-is-evil
  - /talks/software-craftsmanship-lille-meetup-201805-feature-branching-is-evil
  - /talks/newcrafts-2018-feature-branching-is-evil
  - /talks/journee-agile-2018-feature-branching-is-evil
  - /talks/wecraft-devops-meetup-201809-feature-branching-is-evil
  - /talks/lascot-2018-feature-branching-considered-evil
  - /talks/aadays-2018-feature-branching-considered-evil
  - /talks/atbru-2018-feature-branching-considered-evil
  - /talks/feature-branching-considered-evil
  - /talks/2016/10/29/feature-branching-considered-evil
---
Feature branching is one of the most commonly accepted practices in the IT industry. It is mainly used to control quality and to control feature delivery. However, many times the inverse is true. Branches break the flow of the IT delivery process, reducing both stability and throughput. Unfortunately, oftentimes teams are not aware of this. They truly think they are doing the right thing.

The session explores why teams are using feature branches, what problems are introduced by using them and what techniques exist to avoid them altogether. It explores exactly what's evil about feature branches, which is not necessarily the problems they introduce - but rather, the real reasons why teams are using them.

After the session, you'll understand a different branching strategy, how it relates to Continuous Integration and how it will predict better quality and higher delivery throughput.

Learning outcomes - you will be able to:

- understand why teams are using feature branching
- explain why feature branching is problematic
- describe alternatives to feature branching
- understand if all teams can adopt trunk-based development

References:

- [SCM Patterns](http://www.scmpatterns.com/) (ch 4 Mainline; ch 5 Active Development Line), Stephen Berczuk and Brad Appleton
- [Growing Object Oriented Software guided by Tests](http://www.growing-object-oriented-software.com/), p172 Keyhole Surgery for Software, Steve Freeman and Nat Pryce
- [Continuous Delivery](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912) (ch 14 Advanced Version Control), Jez Humble and Dave Farley
- [The Role of Continuous Delivery in IT and Organizational Performance](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2681909), Nicole Forsgren and Jez Humble
- [The State of DevOps Report 2016](https://puppet.com/resources/whitepaper/2016-state-of-devops-report), Alanna Brown, Nicole Forsgren, Jez Humble, Nigel Kersten and Gene Kim
- [DevOps Handbook](https://www.amazon.com/DevOps-Handbook-World-Class-Reliability-Organizations/dp/1942788002) (ch 11 Enable and Practice CI), Gene Kim, Jez Humble, Patrick Debois and John Willis
- [Accelerate](https://www.amazon.com/Accelerate-Software-Performing-Technology-Organizations/dp/1942788339) (ch 4 Technical Practices), Nicole Forsgren, Jez Humbe and Gene Kim
- [Measuring Continuous Delivery](https://leanpub.com/measuringcontinuousdelivery) (ch 7 The Mainline Throughput indicator), Steve Smith
- [trunkbaseddevelopment.com](https://trunkbaseddevelopment.com/)
- [ThoughtWorks Technology Radar on GitFlow](https://www.thoughtworks.com/radar/techniques/gitflow)
- [Continuous Integration on a dollar a day](http://www.jamesshore.com/Blog/Continuous-Integration-on-a-Dollar-a-Day.html), James Shore
- [On DVCS, Continuous Delivery and Feature Branches](https://continuousdelivery.com/2011/07/on-dvcs-continuous-integration-and-feature-branches/), Jez Humble
- [Why software development methodologies suck](https://continuousdelivery.com/2012/08/why-software-development-methodologies-suck/), Jez Humble
- [Don't Feature Branch](http://www.davefarley.net/?p=160), Dave Farley
- [Feature Branch](https://martinfowler.com/bliki/FeatureBranch.html), Martin Fowler
- [Version Control Stragies series](http://www.alwaysagileconsulting.com/articles/version-control-strategies/), Steve Smith
- [More Feature Branches means less Continuous Integration](https://www.infoq.com/news/2015/10/branching-continuous-integration), InfoQ interview with Steve Smith
- [The Death of Continuous Integration](https://speakerdeck.com/stevesmithcd/the-death-of-continuous-integration), Steve Smith
- [Long-Running Branches Considered Harmfull](https://blog.newrelic.com/2012/11/14/long-running-branches-considered-harmful/), Jade Rubick
- An e-mail conversation with Steve Smith on Trunk Based Development
- [Continuous Isolation](https://paulhammant.com/2017/02/14/fake-news-via-continuous-isolation/), Paul Hammant
- [What is Trunk Based Development?](http://paulhammant.com/2013/04/05/what-is-trunk-based-development/), Paul Hammant
- [Trunk Based Development](https://mrdevops.io/trunk-based-development-8376fe577c11), Jon Arild Tørresdal
- [You Are What You Eat](https://vimeo.com/162625187), Dave Hounslow
- [Google's Scaled Trunk Based Development](http://paulhammant.com/2013/05/06/googles-scaled-trunk-based-development/), Paul Hammant
- [Legacy App Rejuvenation](http://paulhammant.com/2013/03/11/legacy-app-rejuvenation/), Paul Hammant
- [Why Google Stores Billions of Lines of Code in a Single Repository?](http://m.cacm.acm.org/magazines/2016/7/204032-why-google-stores-billions-of-lines-of-code-in-a-single-repository/fulltext), Google
- [The history of “Taking Baby Steps”](http://blog.adrianbolboaca.ro/2013/01/the-history-of-taking-baby-steps/), Adrian Bolboaca
- [Baby Steps TDD approach](http://www.slideshare.net/davidvoelkel/baby-steps-tdd-approaches), David Völkel
- [4 Simple Tricks to avoid Merge Conflicts](http://team-coder.com/avoid-merge-conflicts/), Robert Mißbach
- [From GitFlow to Trunk Based Development](http://team-coder.com/from-git-flow-to-trunk-based-development/), Robert Mißbach
- [Short-lived branches](http://articles.coreyhaines.com/posts/short-lived-branches/), Corey Haines
- [Introducing Branch by Abstraction](http://paulhammant.com/blog/branch_by_abstraction.html), Paul Hammant
- [Branch by Abstraction](http://www.martinfowler.com/bliki/BranchByAbstraction.html), Martin Fowler
- [Make Large Scale Changes Incrementally with Branch by Abstraction](https://continuousdelivery.com/2011/05/make-large-scale-changes-incrementally-with-branch-by-abstraction/), Jez Humble
- [branchbyabstraction.com](https://branchbyabstraction.com)
- [Feature Toggles](http://www.martinfowler.com/articles/feature-toggles.html), Pete Hodgson
- [#NoStaging](https://www.youtube.com/watch?v=lD3ZuvLFiDo) - Pipeline Conf 2016, Dave Nolan
- [When Feature Flags go Wrong](https://www.infoq.com/articles/feature-flags-gone-wrong), Edith Harbaugh
- [Managing Feature Flag Debt with Split](https://www.split.io/blog/managing-feature-flag-debt-split/), Adil Aijaz
- [Continuous Delivery and Code Review](https://groups.google.com/forum/#!topic/continuousdelivery/LIJ1nva9Oas) from the Continuous Delivery Google Group
- [Theory X and Theory Y](https://en.wikipedia.org/wiki/Theory_X_and_Theory_Y) from Wikipedia
- [Continuous Review](http://paulhammant.com/2013/12/05/continuous-review/), Paul Hammant
- [Non-Continuous Review](http://paulhammant.com/2014/01/10/non-continuous-reviews/), Paul Hammant
- [Code Review: Why are we doing it?](https://codurance.com/2015/09/29/codereview/), Sandro Mancuso
- [Code Reviews in Trunk Based Development](http://team-coder.com/code-reviews-in-trunk-based-development/), Robert Mißbach
- A conversation in the SoCraTes Slack #codereview channel on … Code Reviews and Trunk Based Development
- A [reply on Twitter by Michiel Rook](https://twitter.com/michieltcs/status/991666977390448640) regarding When code reviews would not be required
- [Non-Blocking Continuous Code Review -  a case study]({%  post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}), Thierry de Pauw
- [I Found Something Better Than Pull Requests…](https://www.youtube.com/watch?v=WmVe1QrWxYU), Dave Farley
