---
layout: article
title: Can the Pull Request Replace Do Not Break the Build
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

Recently [someone suggested on social media](https://www.linkedin.com/feed/update/urn:li:activity:7035345874251567104?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7035345874251567104%2C7035742403227480064%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287035742403227480064%2Curn%3Ali%3Aactivity%3A7035345874251567104%29), as a reaction to [Practices that make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}), that a Pull Request based approach without the reviews could supersede [Agree as a Team to Never Break the Build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). This would remove the need to rely on team agreements to avoid broken builds as they would now be guaranteed. As much as this looks attractive, it ignores everything that flows from *Agree as a Team to Never Break the Build*.

---

Though, defining team agreements is definitely difficult. The problem here is not so much agreeing as a team to not break the build. I guess the real problem is being able to satisfy the agreement.

In this regard, Pull Request approach is certainly attractive. It is often introduced because teams do not want to [Run a Local Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building%}#practice-12-run-a-local-build). They do not want to run a local build because usually the build is just too slow. Of course, when the build is slow, it is difficult to keep satisfying the agreement. Running the local build before each [commit](#commit) when it is slow is perceived as a waste of time. Team members are then tempted to commit without running a local build. From this moment, introducing a broken build and impacting the team becomes quite likely.

It is therefore a natural reaction from teams to protect [mainline](#mainline) with a Pull Request. The Pull Request executes the [Commit Build](#commit-build). Only when the *Commit Build* is green the Pull Request is merged to mainline. This can happen fully automatically. Even without prior code review which is honestly quite refreshing.

This approach sounds honestly interesting but ... It ignores all the little unconscious intrinsic subtleties that comes with it.

First of all, there is a high risk for context switching that time and time again comes with the commit-push-and-forget approach of Pull Requests. Once pushed, team members switch to a new task hoping the Pull Request build will eventually pass. This comes with many drawbacks. Feedback is delayed till the Pull Request build passes ... or not. If the build fails, the team member has to drop what they just started to switch back to the previous task that is obviously not yet done. Clearly this comes with increased work in progress. More work in progress, means more inventory and more money stuck into the system.

These problems could be avoided if the team member monitors the Pull Request build after pushing until the build passes before starting new work. This unmistakably only works when we [Have a Fast Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building%}#practice-14-have-a-fast-build). But by introducing the Pull Request build together with fire-and-forget mode we have removed the incentive to *Have a Fast Build*.

Because we do not *Run a Local Build* there is no motivation any more to [Commit Only on Green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green) which in turn disables the adoption of Test Driven Development (TDD). When not practising TDD we loose two things. First, we cannot [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding%}#practice-6-commit-frequently) any more. Second, we have lost our design tool. As such we run the risk of introducing too much coupling in the codebase and disabling [Decouple the Codebase]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-8-decouple-the-codebase).

When our code base is too coupled, it becomes very difficult to work in small increments and to *Commit Frequently*. Any change will ripple through all layers of the code base. It will rip apart the application. As a result, the application will not work for a long period of time. All of this delays delivery and feedback which in turn impacts quality.

(no need to hide unfinished functionality)

Lastly, and this is important and often overlooked, the Pull Request approach can only work once we serialise the merging of Pull Requests to mainline. The Pull Request build only gives us feedback on whether this branch integrates with mainline. It does not give us any information on whether this branch integrates with all other parallel branches. Therefore, to reduce the noise, we have to integrate branches one at a time. Not doing so, delays the integration feedback to the central integration build on mainline. If the build happens to break after merging multiple branches at the same time, even after a successful Pull Request build, finding which combination of branches caused the failure will be fairly time-consuming. From this moment on, we run the risk of having a broken build for a long period of time. Disabling the ability to perform on-demand production deployments. Inevitably this increases the time to market, pressure on the team and stress.

## Conclusion

The Pull Request approach might work as long as it is not a replacement for slow builds. Once it is a replacement for slow builds, it disables a whole range of practices that make Continuous Integrations. In turn, it disables Continuous Integration.

Even when teams *Have a Fast Build*, teams have to be aware that the merging of the Pull Requests need to be serialised to avoid having a broken central build on mainline. Which in turn delays delivery, feedback and decline quality.

## Definitions

### Commit

In the context of Distributed Version Control Systems (DVCS), when I say commit I honestly mean *commit-and-push*.

### Mainline

The line of development in Version Control which is the reference from which the builds of the system are created that feed into a deployment pipeline.

For CVS and SubVersion, this is *trunk*. For Git, this is the remote *main* branch. For Mercurial, this is the remote *default* branch.

### Commit Build

The build performed during the first stage of the [Deployment Pipeline](https://continuousdelivery.com/implementing/patterns/#the-deployment-pipeline) or the central build server. It involves checking out the latest sources from *Mainline* and at a minimum compiling the sources, running a set of *Commit Tests*, and building a binary artefact for deployment.
