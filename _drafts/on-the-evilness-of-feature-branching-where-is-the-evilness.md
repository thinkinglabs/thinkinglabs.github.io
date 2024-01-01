---
layout: article
title: On the Evilness of Feature Branching - Where is the Evilness
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

During this whole article series - [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) - I have not mentioned a single time anything evil about feature branching. So, where is the evilness?

---

Interestingly, the evilness is not so much [the problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %}) that are introduced by the practice of feature branching. No, in all honesty, it is not that. It is, as a matter of fact, extremely subtle making it even more pernicious to teams and organisations that make use of feature branches.

In point of fact, the evilness lies behind the use of feature branches.

> However, it is important to understand that **long-lived feature branches are** a sympton. The **evil** hides beneath.
>
> --  Alexandru Bolboaca ([@alexboly](https://twitter.com/alexboly)), Nov 8th, 2016
>

What are the real reasons teams using feature branches for, which are not necessarily [the reasons]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) proponents of feature branching commonly mention.

From my humble experience helping organisations reaching a better IT delivery experience the real reasons are:

1. There is a lack the incremental software engineering skills inside the team
1. The codebase is too coupled preventing teams from adopting incremental software development skills
1. There is a lack of automated tests preventing teams to have enough confidence to not introduce regressions when committing more frequently into mainline
1. Or the build is just too slow preventing teams to run the build frequently enough in order to commit more frequently into mainline

As a result, feature branching is a treatment to symptoms teams experience due to lack of skills and practices. It is not a solution to a root cause. As a consequence, they have the tendency to hide the real problems. In reality, they prevent teams to improve. They keep teams in a sub-optimal state.

As opposed, trunk-based development will uncover immediately all the problems the team has. Allowing the team to truly do something about it.

Obviously, success is optional. It is easier for teams to keep the comfort of feature branches. They do not have to perform the difficult thinking that goes with trunk-based development but that unleashes incredible quality and delivery performance. But moreover, reduces so many risks and drives down stress, fatigue and burn out.

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. [But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
4. [The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %})
5. [How To Avoid The Problems?]({% post_url 2022-06-14-on-the-evilness-of-feature-branching-how-to-avoid-the-problems %})
6. [What about Code Reviews?]({% post_url 2023-12-14-on-the-evilness-of-feature-branching-what-about-code-reviews %})
7. What Are The Benefits of Trunk-Based Development?
8. Where is the Evilness of Feature Branching?
