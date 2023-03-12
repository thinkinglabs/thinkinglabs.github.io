---
layout: article
title: Can the Pull Request Replace Do Not Break the Build
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

Recently, as a reaction to the [Practices that make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}), [someone suggested on LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7035345874251567104?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7035345874251567104%2C7035742403227480064%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287035742403227480064%2Curn%3Ali%3Aactivity%3A7035345874251567104%29) the Pull Request based approach without formal reviews could supersede [Agree as a Team to Never Break the Build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). The benefit would be it removes the need to rely on team agreements to avoid broken builds. Now they would be guaranteed by the Pull Request build. As attractive as this looks, it ignores everything that emanates from *Agree as a Team to Never Break the Build*.

---

Though, defining team agreements is unquestionably demanding. The problem here is not so much agreeing as a team to never break the build. I guess the real obstacle here is to keep satisfying the agreement.

The Pull Request approach is, in this regard, manifestly attractive. Often it is introduced because teams do not want to [Run a Local Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building%}#practice-12-run-a-local-build). They do not want to run a local build because usually, the build is just too slow. Of course, when the build is slow, it becomes arduous to keep fulfilling the agreement. Running the local build before each [commit](#commit) when the build is slow is perceived as a waste of time. It then becomes tempting for team members to commit without running a local build. It then becomes quite likely to introduce a broken build and to severely impact the team.

Therefore, teams naturally start to protect [mainline](#mainline) with a Pull Request. The Pull Request executes the [Commit Build](#commit-build), which in this case we will call the *Pull Request Build* to make the distinction with the Commit Build that happens on mainline. Only when the Pull Request Build passes to green, can the Pull Request be merged to mainline. That can happen entirely automatically, without any manual intervention, even without a prior formal code review, which is genuinely outright refreshing (but that is another discussion we will not have here).

To be fair, the approach sounds sincerely interesting but ... It ignores all the little unconscious intrinsic subtleties that come with it.

First, there is a high risk for context switching found in the commit-push-and-forget approach that commonly comes with Pull Requests. Once pushed, team members switch to a new task hoping the Pull Request Build will eventually pass ... somewhere ... in a not so near future. That comes with many drawbacks. Feedback is delayed till the Pull Request Build passes ... or not. If the build fails, the team member has to drop what they just started to switch back to the previous task that is visibly not yet done. This comes clearly with increased work in progress. More work in progress, means more inventory, more money stuck into the system, and more delays.

To avoid these problems, the team member has to monitor the Pull Request Build after pushing, before starting new work, until the build passes. This can unmistakably only work when we [Have a Fast Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building%}#practice-14-have-a-fast-build). But with the introduction of the Pull Request Build together with a fire-and-forget mode we have removed the incentive to *Have a Fast Build*.

Because we do not *Run a Local Build* there is no motivation any more to [Commit Only on Green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green) which in turn disables the adoption of Test Driven Development (TDD). When we do not practise TDD we lose two things. First, we cannot [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding%}#practice-6-commit-frequently) any more. Second, we have lost our design tool. As such, we run the risk of introducing too much coupling in the codebase and disabling [Decouple the Codebase]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-8-decouple-the-codebase).

When our code base is too coupled, it becomes ambitious to work in small increments and to *Commit Frequently*. Any change will ripple through all layers of the code base. It will rip apart the application. As a result, the application will not work for a long period. All of this undeniably delays delivery and feedback in turn impacting quality.

Lastly, and this is important and often overlooked, the Pull Request approach can only work when we serialise the merging of Pull Requests to mainline. The Pull Request Build gives us only feedback on whether this branch integrates with mainline. It does not give us any information on whether this branch integrates with all other parallel branches that exist at the same time. Therefore, to reduce the noise, we need to integrate branches one at a time. Failure to do so delays the integration feedback towards the central integration build on mainline. If the build appears to break after merging multiple branches at the same time, even after a successful Pull Request Build for each of these branches, finding which combination of branches caused the failure will be reasonably time-consuming and laborious. Ultimately, we risk experiencing a broken build for a long time. Which consequently disables the ability to perform on-demand production deployments. Inevitably this increases the time to market, pressure on the team, stress, fatigue and burn-out.

## Conclusion

The Pull Request approach might work when it is not a replacement for slow builds. Once it is a replacement for slow builds, it disables a whole range of [Practices that make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}). Which in turn, prevents the adoption of Continuous Integration.

Even when teams *Have a Fast Build*, they must be aware that merging the Pull Requests need to be serialised to avoid having a broken central build on mainline. Which in turn delays delivery, and feedback and declines quality.

## Acknowledgment

[Dragan Stepanovič](https://twitter.com/d_stepanovic) for providing his thoughts on the article.

## Definitions

### Commit

In the context of Distributed Version Control Systems (DVCS), when I say commit I honestly mean *commit-and-push*.

### Mainline

The line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at a minimum compiling the sources, running a set of *Commit Tests*, and building a binary artefact for deployment.
