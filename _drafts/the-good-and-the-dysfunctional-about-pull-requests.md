---
layout: article
title: The Good and the Dysfunctional about Pull Requests
author: Thierry de Pauw
category: articles
tags: [Code Review]
---

Now and then, I rant about Pull Requests on social media. The rants are on the inefficiencies and the fairly little value of Pull Request compared to the cost they come with. The friends that understand lean principles receive these rants with applause and cheering. But it also comes with a fair share of somehow offended people that feel the need to belittle and instigate unprofesionalism. I guess it is time to provide some more argumentation than social media allows.

---

> Fucking PRs! 🙄
>
> When the PR is finally approved and merged, damn a bug.
>
> New PR for a fucking one-line change. Really?!? Again waiting for approval.
>
> Several days of delay that could be solved in a couple of hours with trunk-based development and pairing.
>
> Do teams practising pull requests actually want to deliver? I don't think so. What I observe speaks against it.
>
> Yes, but quality! Yeah right, quality. If that would be the primary reason you wouldn't use PRs. If one thing is sure, PRs do not improve quality at all. It's quality theatre.
>
> We would achieve better quality by letting something go into production without any approval that eventually fails in production but that we can fix in minutes, which we can absolutely not achieve with PRs.
>
> Alright, I needed to ventilate. Thank you!
>
> -- Me, [Feb 19th, 2024](https://www.linkedin.com/posts/tdpauw_fucking-prs-when-the-pr-is-finally-activity-7165442161969201153-mA8v)

## The Good

Decades ago, open-source software gave us the ability for anyone in the world to contribute to a codebase of a public project. Contributors could be on different ends of the world, in vastly different time zones, not even knowing each other's names for that matter.

Back then this happened by emailing patch files, which are essentially diffs, to a mailing list. The owner of the project applied the patch to their source code, reviewed it and decided whether to integrate the proposed change or not. A pretty cumbersome process.

Then in 2008, [GitHub popularised the the Pull Request](https://github.blog/2008-02-23-oh-yeah-there-s-pull-requests-now/) which [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds) actually invented in 2005 shortly after releasing Git with [git-request-pull](https://git-scm.com/docs/git-request-pull). Essentially, it is a request to pull changes from a forked repository into an upstream repository.

Pull Requests are designed to make it easier to accept contributions from the outside world, from untrusted people we do not know about.

For the Open Source Software (OSS) world, the Pull Request makes absolute sense. That was a game changer. It suddenly made it easy for people outside the core team to commit. But, the core team has the ability to vet that change, suggest improvements and eventually integrate the change. That is the good part about Pull Requests. It improved collaboration and co-creation of Open Source.

## The Dysfunctional

At the core Pull Requests allow someone to contribute to a codebase they do not have ownership about. That is what Open Source Software is about.

Fast-forward, the Pull Request has been transformed into a dogma by all sorts of software organisations without understanding the consequences. The IT industry has transposed an Open Source model into the closed-source corporate world where teams are supposed to collaborate to realise more innovation.

> With PRs we created a world where the amount of time we spend reviewing code has become disproportionate to the time spent creating value.
>
> -– Seb Rose ([@sebrose@mastodon.scot](https://mastodon.scot/@sebrose)), Aug 29, 2022

Here is the first problem of applying the Pull Request model to closed-source corporate teams. We are essentially asking engineers to contribute to a code base while denying full ownership of the said code base as they cannot decide whether to accept the change or not. Why the hell would we ask someone to request to put some code changes into something they should already own? That does not make sense at all.

This lies the basis for lots of team dysfunctions.

First, it can introduce an exercise of power. This happens happens easily when done via tooling, asynchronously instead of face-to-face, synchronously like with pairing or teaming. Who decides which change is accepted and which not? The team lead? The architect? The seniors? Or do we have real peer-reviews where juniors can review seniors and team leads and architects? That is a refreshing idea!

Second, if reviews are done by seniors, are they trained to have the appropriate mentoring skills? Do they have the ability to communicate clearly and constructively? It is not because they are senior they are good at communicating. Especially, when reviews happen through a tool it requires lots of consciousness about the effect of our words and phrases. I have experienced an architect that was pretty bad at written communication. Back then, I was a fairly senior. So, I was pretty well protected by my status. Yet, this was a miserable experience. Everyone was telling me, but you know they are a nice person. That can be, but my experience says differently. I never met the person and I profoundly disliked them. It might be, the organisation lost some engineers because of that behaviour.

Third, because this might be an exercise of power, there might be a risk reviews vary in content based on who wrote the code. Whose change is accepted and whose change not? There is a bias problem that may disproportionately harm.

If there is no mechanism in place to curate and train effective code reviews, it is unlikely that the process will be free from any abuse and/or bias. As a reviewer we should listen, reflect on the code without judgement, without harming. We provide a willing ear so that others can do a better job at solving a problem. Anyone who can’t do that should not do any code reviews.

Fourth, code reviews should not be gatekeeping, which Pull Requests are clearly. The change is accepted or not. As long as it is not accepted, it will simply not get into production.

Lastly, code reviews are not a must. They are optional. It is a choice of the team whether to run code reviews or not. The team is not more mature because it practices code reviews. The team is also not a bunch of rag-tags if they do not practice code reviews.

Yes, but letting go unreviewed code into production is dangerous. Well, not more dangerous than letting go reviewed code into production. The number of times obvious errors not covered by automated tests have not been spotted during a review is unimaginable. Yet, they still fail in production. The only response teams have to this is: "*We have to be better at reviewing code*". No! The answer should be: "*We need to be better at fixing production problems quickly*". Anything that gets in the way of that, needs to be removed. Only then we will improve over the whole line. If code passes all automated tests, we might be pretty confident it will be ok in production. If it is not, that is not a big deal if we have a process that can cope with that. Pull Request are certainly the solution to this as they slow the team down to quickly fix production problems. [DORA](https://dora.dev/) identified the mean time to recover as one of the four core metrics that define high performing teams.

But, I do not trust my code. Oftentimes, this is an expression of a deeper problem. This happens in environments with legacy code where engineers do not understand the code. They do not have any faith on whether their changes broke the system or not. Or this happens in dysfunctional teams with a blaming culture. Engineers want to protect themselves against that. Therefore, they lean to others to get a sense of faith in their code. To obtain a sense of security, but not true security. It gives an illusion of control. In the end, it is about diluting responsibility. Despite that, I do not think any process can fix that, certainly not a Pull Request process. That being the case, the organisation has a cultural problem  requiring profound attention.

## Do not confuse Pull Requests with Code Reviews


## Bibliography

- [1 Dev, 3 Teams, 3 git pull request review experiences](https://linearb.io/blog/three-git-pull-request-review-strategies)
- [A pull request is not really a part of GIT version control. Is it just like a cultural artifact?](https://www.quora.com/A-pull-request-is-not-really-a-part-of-GIT-version-control-Is-it-just-like-a-cultural-artifact)
- The Talk: [Non-Blocking Continuous Code Reviews, a Case Study]({% post_url 2024-02-06-non-blocking-continuous-code-reviews-a-case-study %})
