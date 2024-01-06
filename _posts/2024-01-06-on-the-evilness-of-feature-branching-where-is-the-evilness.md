---
layout: article
title: On the Evilness of Feature Branching - Where is the Evilness
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

During this whole article series - [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) - I have not mentioned a single time anything evil about feature branching. So, where is the evilness? Is it [the problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %}) they introduce? Or [the reasons]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) teams use them for? Or [the compliance reasons]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) that pushes teams into using feature branches? In all truthfulness, it is none of these. But something else.

---

Interestingly, the evilness is not so much [the problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %}) that are introduced by the practice of feature branching. No, in all honesty, it is not that. It is exceedingly subtle. It makes it even more pernicious for teams and organisations that use feature branches. Consequentially, it becomes pretty grinding for organisations to get away with feature branches.

To tell the truth, the evilness lies surprisingly behind the use of feature branches.

> However, it is important to understand that **long-lived feature branches are** a symptom. The **evil** hides beneath.
>
> --  Alexandru Bolboaca ([@alexboly](https://twitter.com/alexboly)), Nov 8th, 2016
>

So, what are the real reasons teams use feature branches? These are not necessarily [the reasons]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) proponents of feature branching commonly mention.

From my humble experience helping organisations to reach a better IT delivery experience I have noticed the real reasons they use feature branches are in fact:

1. There is a **lack of incremental software engineering skills** inside the team.

   It makes it very difficult to commit multiple times per day to mainline. Bigger increments require more time to implement. It means fewer commits per day and less feedback.

2. The **codebase is too coupled**.

   It prevents most teams from adopting incremental software engineering skills. Accordingly, it becomes pretty difficult to work incrementally with a too-coupled codebase. Any change ripples through all layers of the codebase making sure the application does not work for an extended period. As long as the application does not work, we cannot commit. So, this again means fewer commits and again less feedback.

   Having said that, mature teams with the appropriate skills can work incrementally even so with heavily coupled code bases. It requires to know the proper techniques that will help do that. It mostly comes down to mastering incremental software engineering skills.

   Hence, this means if a team masters incremental software engineering skills, it can handle a too-coupled codebase and can evolve it into a loosely coupled codebase. Yet, if a team does not master incremental software engineering skills, confronted with a coupled code base, it will be difficult for the team to learn and adopt incremental software engineering skills. In that case, the team is condemned to obliviousness and be trapped.

3. There is a **lack of automated tests**.

   It stops teams from having enough confidence they are not introducing any regressions when committing more frequently into mainline. When there is no confidence, teams have to rely on more manual regression testing. In turn, this again holds teams from committing multiple times a day to mainline, again reducing feedback.

4. Or the **build is just too slow**.

   It holds teams off from running the build frequently enough to allow them to commit multiple times per day to mainline. Bear in mind, when we say *build* it involves the execution of all the unit tests. Bear also in mind, that engineers must [run a local build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) before committing to mainline in order to reach Continuous Integration. So, if the build takes 42 minutes, engineers can only commit every 42 minutes. Conversely, if the [build only takes 30 seconds](https://www.joelonsoftware.com/2009/03/27/solid-state-disks/), engineers can commit every 30 seconds. With that in mind, we can easily conceive what an acceleration in feedback this means. This is unseen.

   Alright, 30 seconds might be out of reach, though. But [5 minutes should be the target]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-14-have-a-fast-build). Ten minutes should be the maximum.

Because of all the above, we can conclude that feature branching is a treatment for symptoms teams experience because they lack the proper skills and practices. It is not a solution to a root cause. As a consequence, feature branches tend to hide the real problems. They hinder teams from improving. Finally yet importantly, feature branches keep teams in a sub-optimal state.

As opposed, trunk-based development will uncover all these problems immediately. It allows the team to truly do something about this. Inevitably, they can improve!

## Final Thoughts

Clearly, success is optional. It is easier for teams to stay in the comfort of feature branches. They do not have to go through the demanding thinking ahead that goes with trunk-based development. It happened to me many times I had to revert changes because I made them in the wrong order or I made too big changes at once. This requires practice, many times. However, trunk-based development drives down stress, fatigue and burnout, together with an unseen reduction of risks. As a side effect, it unleashes incredible quality and delivery performance. Look at that! Why then stay in that comfort zone when it does not provide any benefits other than being comfortable and avoiding hard thinking?

In my humble opinion, feature branching is for the risk-averse, fixed mindset. If teams are aware of that, it is a perfectly acceptable choice. But do not expect delivery performance. Do not push quality and delivery performance expectations on teams. Under those circumstances, teams can only slowly burn out ... And this, impacts organisational performance.

## Acknowledgments

Black Bottle and Tomatin for the creative support.

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. [But Compliance!?]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
4. [The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %})
5. [How To Avoid The Problems?]({% post_url 2022-06-14-on-the-evilness-of-feature-branching-how-to-avoid-the-problems %})
6. [What about Code Reviews?]({% post_url 2023-12-14-on-the-evilness-of-feature-branching-what-about-code-reviews %})
7. Where is the Evilness?
