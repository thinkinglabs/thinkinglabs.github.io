---
layout: talk
title: Feature Branching is Evil
conference: XP2017
date: 2017-05-23
speakerdeck:
  data_id: 6e5c22252bbc42b09caedba221567c27
  download_link: https://speakerd.s3.amazonaws.com/presentations/6e5c22252bbc42b09caedba221567c27/XP2017_-_Feature_Branching_is_Evil.pdf
---
Why is our software industry vastly adopting Feature Branching ? "To isolate the work of the developer so he can be more productive" I was told. But does it really make your team more productive ? Are the projected benefits worth the problems it introduces ?

Feature Branching became mainstream in most IT organisations because proponents of DVCSs mostly rely on Feature Branching to sell DVCS. And probably also because of the success of GitFlow ...
But like all powerful tools, there are many ways you can use DVCSs, and not all of them are good. Feature Branching is definitely not a good way to use them. Although branch creation is easy, this does not mean cheap in the long run. It comes with a certain cost, certainly in the context of Continuous Integration and Continuous Delivery.
Amongst others, one of the biggest problems, is that it breaks the early feedback cycle of Continuous Integration. As long as the Feature Branch is not merged back into main line, the feature is not integrated into the application.

The evilness lies not much in the problems introduced by Feature Branching, but rather in the reasons teams are using them.

During this session we will explore the reasons for using Feature Branches, what is wrong about Feature Branching and what techniques you can use to avoid them all together.

The target audience for this session are software engineers, technical team leaders, architects, and anyone using version control systems in a Continuous Integration and Delivery context.
