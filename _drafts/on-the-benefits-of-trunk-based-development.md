---
layout: article
title: On the Benefits of Trunk-based Development
author: Thierry de Pauw
category: articles
tags: [Continuous Integration]
---

On the [Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) and subsequent articles mentioned several times how trunk-based development is a superior delivery approach to any of its alternatives. Every single article declines some of its benefits. But the benefits are scared around. This summarises the value of trunk-based development.

---

Although, trunk-based development is implied by the practice of Continuous Integration. Although, it has been reported since 2015 by the State of DevOps report and later by the book Accelerate to lead to higher IT delivery performance. Although, organisations like Microsoft, Netflix and Google practice trunk-based development. In the case of Google at extremely large scale In 2016 we were speaking about 16.000 engineers working from a single trunk with 25.000 changes per day. It is still the most controversial practice in the IT industry.

Any time we suggest trunk-based development we are called unprofessional followed by belittling. In all honesty, ...

If we are committing more frequently into a remote mainline ...

... we produce more frequent builds.

If we produce more frequent builds ...

... we can deploy more frequently.

If we can deploy more frequently ...

... we significantly reduce time to market and cost of delay.

If we can deploy more frequently ...

... we accelerate feedback. We can run more experiments in production.

If we can run more experiments ...

... we can find more unmet needs of our users. We can find more ways to delight the user. This increases customer satisfaction exponentially. In the end, it allows the organisation to make more money.

If we can build more frequently ...

... we will uncover more problems sooner ...

... allowing us to fix them when they are still small and easy to fix.

This enables us to Build Quality Into the product instead of testing quality later.

In the end, together with accelerated feedback this leads to better quality.

Trunk-based development predicts better quality and higher delivery throughput, shorter times to market, reduced cost of delay.


Research is clear:

> -- Accelerate

* commit more frequently, more frequent builds, more frequent releases & deploys, reduced lead time and time to market
* run more experiments, find more unmet needs and delight our users, accelerated feedback, economic perspective
* build more frequently, uncover more problems sooner, allowing to fix them immediately while they are still small and easy to fix quickly, enabling to build quality into the product, leading to better quality

* together with pairing/teaming or non-blocking reviews leads to reduced WIP, because of Little's Law (Lead Time = WIP/Throughput), reduced time to market, accelerated feedback

* economics: less WIP, less inventory, less money stuck into the system

> So work in progress is inventory. Inventory is money invested but that doesn’t generate any revenue or better any value. Or said differently zero feedback. It is money stuck. Teams have spent time to create a thing no one uses. We are just burning 🔥 a massive pile of money 💰 to heat the offices 🤷
https://www.linkedin.com/posts/tdpauw_from-my-limited-observation-many-it-teams-activity-7227011756936605698-QimV?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAAhhqIBIVipRWnJ_lCwJ8-zFcZbjyz9ic0

* when everyone commits small changes to the remote mainline, it fosters collective responsibility to never break the build
https://www.linkedin.com/posts/jankutomas_heres-the-thing-about-trunk-based-development-activity-7207395952427446273-Gw6u?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAAhhqIBIVipRWnJ_lCwJ8-zFcZbjyz9ic0

* less WIP, more feedback, accelerates learning, become risk accepting, incentives innovation
https://www.linkedin.com/posts/tdpauw_heres-a-bold-observation-about-pull-requests-activity-7204497399627612162-GsYh?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAAhhqIBIVipRWnJ_lCwJ8-zFcZbjyz9ic0

* less technical debt, no complains about managing tech debt, it just happens, we fix odd things immediately when we see it

> There's an angle that folks don't consider.
> When we do trunk-based development, the WIP we commit gets used, before any actual user sees it, by our whole team.
> They flush out so many bugs by just using our WIP.
> They would never get to do that were we feature-branched.
>
> -- GeePaw Hill

* less risks, because smaller batch sizes
https://www.linkedin.com/posts/tdpauw_a-thing-i-noticed-when-having-practiced-trunk-based-activity-7246403503403802624-tH_r?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAAhhqIBIVipRWnJ_lCwJ8-zFcZbjyz9ic0

* less cognitive load (no PR admin)

* DORA: practice for high-performing teams

Feature branches/PR = institutionalised workaround
https://www.linkedin.com/posts/davenicolette_ive-noticed-a-trend-of-people-describing-activity-7308198412489789441-SjI8?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAAhhqIBIVipRWnJ_lCwJ8-zFcZbjyz9ic0

Continuing to handhold teams will not make them more ready. Let them fail. It is going to be alright.

How can we convince people of the benefits of trunk-based development?

Here’s the obnoxious truth. We can’t! 🤷

quality is the highest concern of trunk-based development
https://www.linkedin.com/posts/tdpauw_heres-another-thing-about-trunk-based-development-activity-7208355216633593856-SweN?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAAhhqIBIVipRWnJ_lCwJ8-zFcZbjyz9ic0

high trust
https://www.linkedin.com/posts/tdpauw_a-lack-of-trust-inside-teams-surely-prevents-activity-7258435891717640192-7GPN?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAAhhqIBIVipRWnJ_lCwJ8-zFcZbjyz9ic0
