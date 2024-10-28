---
layout: article
title: The Practices That Make Continuous Integration - Fix a Broken Build within 10 Minutes
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes.jpg
---

One precondition of being in a state of Continuous Integration is to fix a broken build within ten minutes. As long as the build is broken, the team cannot perform on-demand production releases. This irrevocably incapacitates the organisation to make money.

---

A team is said to be in a state of Continuous Integration when:

>- [Everyone in the team (or every pair) commits at least once a day to mainline, leading to multiple integrations per day for the whole team.]({% post_url 2024-09-16-the-practices-that-make-continuous-integration-push-every-day %})
>- [Every commit to mainline triggers an automated build and execution of all automated tests.]({% post_url 2024-10-15-the-practices-that-make-continuous-integration-trigger-the-build-on-every-push %})
>- **Whenever the build fails, the team can fix it within 10 mins.**
>
>-- [Jez Humble](https://bsky.app/profile/jezhumble.net)

![Fix a Broken Build within 10 Minutes](/images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-fix-a-broken-build-within-10-minutes.jpg)

Without any doubt [*Agree as a Team to Never Break the Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build) is the undisputable, non-negotiable, number one practice to implement to realise Continuous Integration successfully. We all agree about that. Though, [some do not]({% post_url 2023-03-12-can-the-pull-request-replace-agree-as-a-team-to-never-break-the-build %}).

Nevertheless, that does not mean the build cannot break on any occasion. Some say this practice puts too much pressure on teams, especially on juniors. As a senior, we have to be conscious of our privileges. It is, therefore, crucial to reassure more junior engineers that builds will break. Because life happens, for reasons out of our control, and that is absolutely fine.

Some teams prefer to use Pull Requests with auto-merges once the build passes to [*Mainline*](#mainline) pristine at all times. Even so, successful teams rarely have a red *Mainline*. When they do, they learn and improve.

> If a team only has green builds, it is a sign the team does not improve any more.
>
> -- [Yves Hanoulle](https://www.linkedin.com/in/yveshanoulle/)

(*or something along this line ... I don't remember the exact words, right away*)

However, we must have a process that allows us to quickly repair the build and swiftly return to a green situation. As long as the build is broken, it disables the team's ability to perform on-demand production releases. The longer the build is broken, the vaster the cost of delay and opportunity costs, and the greater the time to market. Together with blocking a whole team with non-negligible salaries, these are fairly impressive incurred costs. All things considered, this stops the organisation to make money.

Hence, whenever the build fails the team [stops the line](https://en.wikipedia.org/wiki/Andon_(manufacturing)), [*Does not Push to a Broken Build*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working%}#practice-3-do-not-push-to-a-broken-build), stops all work, owns the failure and fixes the build with the highest priority. Only once the build is fixed, the team can pick up on-going work again and move on.

When the build is broken, we lose the code-base health monitoring. That impairs Continuous Integration. Adding new code on top of a broken build aggravates the situation. It adds new problems on top of already existing problems. New builds are triggered, making the problem analysis even harder to find the root causes. Because of that, the team is further held away from attaining Continuous Integration.

Without Continuous Integration our application is broken until someone else proves it works. Consequently, it delays delivery.

Therefore, it is imperative to *Agree As a Team To Never Break The Build* while being mindful builds will occasionally break. That is an opportunity for the team to learn.

But why fixing in 10 minutes? Why not five minutes or 15 minutes? This relates to [*Have a Fast Build*]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building%}#practice-14-have-a-fast-build). If the build is under ten minutes, quickly fixing the problem and re-running the build will work if the fix is easy. On the other hand, if the fix is difficult and time-consuming, the easiest and fastest way to fix the build is to [*Revert When Broken*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-4-revert-when-broken). Revert the failing commit and go back to the last known good state. Surely, this necessitates to [*Version Control Everything*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-1-version-control-everything).

[Research](https://www.goodreads.com/book/show/35747076-accelerate) indicates that trunk-based development together with Continuous Integration are statistically significant predictors of the adoption of Continuous Delivery. In turn, Continuous Delivery predicts higher IT delivery performance. Together with the adoption of Lean Product Management and a generative organisation culture, they predict higher organisation performance. As a result, to keep the organisation financially healthy, we should fix broken builds as soon as possible, preferably within 10 minutes.

## Bibliography

- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
- [Continuous Integration Certification](https://martinfowler.com/bliki/ContinuousIntegrationCertification.html), Martin Fowler
- [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate), Dr. Nicole Forsgren, Jez Humble and Gene Kim

## The Series

[The Practices That Make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) series:

1. [Team working for Continuous Integration]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %})
2. [Coding for Continuous Integration]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %})
3. [Building for Continuous Integration]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %})
4. [Make the Build Self-Testing]({% post_url 2024-09-15-the-practices-that-make-continuous-integration-make-the-build-self-testing %})
5. [Push Every Day]({% post_url 2024-09-16-the-practices-that-make-continuous-integration-push-every-day %})
6. [Trigger the Build on Every Push]({% post_url 2024-10-15-the-practices-that-make-continuous-integration-trigger-the-build-on-every-push %})
7. Fix a Broken Build within 10 Minutes
8. [Have Reliable Tests]({% post_url 2024-10-19-the-practices-that-make-continuous-integration-have-reliable-tests %})

## Definitions

### Mainline

The Mainline is the line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.
