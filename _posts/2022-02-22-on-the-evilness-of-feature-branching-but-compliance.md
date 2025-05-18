---
layout: article
title: On the Evilness of Feature Branching - But Compliance
author: Thierry de Pauw
category: articles
tags: [Compliance, Version Control, Pull Request, Continuous Integration]
---

In [part 2 of this series - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %}) - I examined all the possible reasons teams mention for why they use feature branches. There was, however, one reason, I did not mention that people referenced as the ultimate reason: "*We use feature branches and pull requests to comply with regulations*". I would like to explore this and show there are other options to comply that do not have the same drawbacks.

---

*Update May 18, 2025: Add "Co-authored-by" as alternative.*

*Update May 18, 2025: Add pairing with Pull Request as alternative.*

*Update May 18, 2025: Add "Wouldn't it be horrible if".*

---

Compliance is an often-cited reason to introduce all sorts of wasteful non-value-adding activities.

> For us we do [feature branching] because it is the least worst solution when you need to be compliant and implement segregation of duties, enforce 4 eyes principles, strict legal rules, get audited by the national bank, etc… We do strive to automate everything in our pipeline though, so we limit the damage and get the smallest possible delays in the process. I do agree with all you wrote in your post though.
>
> ...
>
> We also do pair programming, I think the way we use feature branches guarantees a better audit trail.
>
> -- a CTO from a finance organisation

The organisation uses feature branches to adopt a pull request based code review model. This allows them to have segregation of duties and the 4-eyes principle to comply with regulations prescribed by the Belgian National Bank, the organisation regulating the Belgian finance industry.

Interestingly, the 4-eyes principle was already achieved with pair programming. Feature branching is merely in place for tracking purposes - having an audit trail to prove code reviews have been done - and segregation of duty - the person that approves the change is different from the person(s) that implemented the change to avoid fraud, compromised or malicious engineers, or mistakes.

## What is compliance?

**Compliance** is taking steps to comply with relevant laws, industry regulations, legally binding contracts or even cultural norms. **Generally, compliance is not optional** when imposed by law, regulation or contract. In these cases, not complying increases risks for fines, reputational damage or even a shutdown of the business.

Compliance never comes alone. It goes together with Governance and Risk Management. Together they are referred to as GRC (Governance, Risk Management and Compliance).

**Governance** is about keeping the organisation on track while balancing the interests of the organisation's stakeholders such as shareholders, senior management executives, customers, suppliers, financiers, the government, and the community.

In the case of technology, governance provides the vision and the goals on how to implement technology changes to ensure the right stability and throughput to create positive business impact.

**Risk** is the possibility of something bad happening. It is ubiquitous. We can never eliminate all risks. Hence, the need for **Risk Management**. But, the "*Wouldn't it be horrible if*"-approach to Risk Management is predominantly present in IT security. Regardless of the likelihood, it must be avoided at all costs, resulting in no sense of prioritisation (source: Lean Enterprise, p237). Therefore, *which risks are we willing to accept and which ones not?*. **As we are taking steps to mitigate risk in one area, we inevitably introduce more risk in another area.**

## Are Feature Branches and Pull Requests a necessity for Compliance?

Feature Branches and Pull Requests are definitely not required for compliance.

First of all, most regulations and frameworks like [ITIL](https://en.wikipedia.org/wiki/ITIL), [COBIT](https://en.wikipedia.org/wiki/COBIT) or [Sarbanes-Oxley](https://en.wikipedia.org/wiki/Sarbanes%E2%80%93Oxley_Act) do not prescribe specific practices to implement like 4-eyes and segregation of duties. For instance, many think Sarbanes-Oxley section 404 imposes this. Oftentimes, heavy processes are established as a result of someone misinterpreting what is required, but not mandated by the said regulation or framework. Only the [PCI-DSS](https://en.wikipedia.org/wiki/Payment_Card_Industry_Data_Security_Standard) regulation explicitly requires segregation of duties ([PCI DSS v3.2.1](https://www.pcisecuritystandards.org/documents/PCI_DSS_v3-2-1.pdf?agreement=true), Requirements *6.3.2 Code Reviews by individuals other than the originating code author* and *6.4.2 Separation of Duties between development/test and production environments*).

Sadly enough, organisations frequently follow the "**wouldn't it be horrible if**" approach to risk management (from "*How to measure anything*", Douglas Hubbard). They imagine a particularly catastrophic event that could happen. It must be prevented at any cost regardless of its likelihood.

Instead, we should quantify risks using [Impact Mapping](https://www.impactmapping.org/) and prioritise using the [Cost of Delay](https://blackswanfarming.com/cost-of-delay/). This upfront risk assessment will prevent a lot of pain when going to production. By identifying these risks we can introduce the most appropriate controls to comply with the organisation's regulations. However, the challenge will be to find the right balance of controls, in the context of the applicable regulations, that still allow teams to deliver value fast while keeping risks at an acceptable low level. Nevertheless, compliance and speed are not a dichotomy. We can have both.

The controls can be **preventive** by applying barriers or **detective** by monitoring.

Often organisations rely on segregation of duties as a preventive control to reduce the risk for fraud or mistakes. Many think preventive controls are more effective. But, the opposite is true. In today's highly complex systems where cause and effects are only known in hindsight with unpredictable, emergent outcomes, we can only probe, sense and respond. Therefore, we can only conduct safe to fail experiments to obtain fast feedback on the outcomes of our changes. Enabling us to make new decisions about new experiments to run. Also, teams need to get things done, often under delivery pressure. To deliver, they will find all sorts of creative ways to get around these preventive controls. In the end, the outcome of preventive controls is not reducing risks. But, paradoxically, they will increase risks, lead to unnecessarily high costs, or worse people will stop caring and improvement will come to a halt.

In this context, pull request based code reviews are an example of segregation of duties and as such a preventive control. It creates an illusion of control on technology changes together with an illusion of quality and it allows to tick the compliance checkbox. But, in general, it is bad for delivery.

- It increases the risk for delayed delivery as team members have to wait for reviewers, followed by the obvious ping-pong between reviewer and reviewee. Before they realise, they are a couple of days later and delivery is delayed.
- It often encourages large batches of changes, creating big changesets, in turn introducing higher risks for failure and again delayed delivery.
- Large changesets usually result in expediting the code review, executing the review in a shallow way resulting in poor added value. A behaviour known as bikeshedding or the [Law of Triviality](https://en.wikipedia.org/wiki/Law_of_triviality).

  > 10 lines of code = 10 issues.
  >
  > 500 lines of code = "looks fine."
  >
  > Code reviews.
  >
  > -- I Am Devloper ([@iamdeveloper](https://twitter.com/iamdevloper)), [Nov 5, 2013](https://twitter.com/iamdevloper/status/397664295875805184)

---

> Information security, auditors, and regulators often put **too much reliance on code reviews to detect fraud**. Instead, they should be relying on production monitoring controls in addition to using automated testing, code reviews, and approvals, to effectively mitigate the risks associated with errors and fraud.
>
> -- someone leading the DevOps initiative at a large US financial services organisation from The DevOps Handbook, Chapter 23. Protecting the Deployment Pipeline, p344

*Despite having established preventive controls like code reviews and approvals, fraud still happened at that large financial US organisation. One malicious engineer planted a backdoor in the code deployed to the ATM cash machines. They were able to put the ATMs into maintenance mode at certain times allowing them to take cash out of the machines. The fraud was not detected through code review. It was quickly detected employing detective controls using proactive production monitoring.*

---

Scientific research from [Dr Nicole Forsgren](https://twitter.com/nicolefv) and the book [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate) (also by Dr Nicole Forsgren and friends) found that change approval does not reduce risks nor does it increase the stability of systems. Though, it certainly slows down IT delivery. They also found that teams reporting no change approval and teams performing peer-reviews both achieve a higher delivery performance.

Preventive controls like pull request based code reviews become easily useless and introduce a false sense of security. It reduces feedback for engineers. Did we implement the right thing? Is it being used? Is it behaving as expected? How is it being used? Is it behaving nicely? Does it not cause any harm? ... In the end, it prevents engineers to take full responsibility for their work and it reduces learning.

That said, if our activity is covered by PCI-DSS, alright, unfortunately, we will have to rely on code reviews with segregation of duties where the person who reviews the change is different from the person(s) authoring the change. However, that does not mean we have to adopt feature branching and pull requests. There are other ways to achieve the same. Now be aware, we only have to implement this control for that one activity covered by PCI-DSS, not for the whole organisation (see [PCI-DSS and continuous deployment at Etsy](https://continuousdelivery.com/2012/07/pci-dss-and-continuous-deployment-at-etsy/) and "*Case Study: PCI Compliance and a Cautionary Tale of Separating Duties at Etsy*" from The DevOps Handbook p339).

## What are the alternatives to Feature Branching and Pull Requests that still meet Compliance?

First ...

Trust, but verify. Trust the people they will do the right thing! Then verify they are not abusing the trust through monitoring and regularly reviewing and auditing.

Second ...

People tend to conflate Pull Requests and Code Reviews. Whenever someone suggests pull requests are bad, people jump wondering if they mean no code reviews. No, that is not what was said. Pull Requests are Code Reviews. But Code Reviews are not necessarily Pull Requests. There are other, more lean ways to obtain the same outcomes.

How can we perform Code Reviews in compliance with regulations? We have several options to satisfy the letter and intent of segregation of duties, i.e. someone not involved in authoring the change should review it.

1. [Pair Programming](https://martinfowler.com/articles/on-pair-programming.html) or [Ensemble Programming](https://ensembleprogramming.xyz/) gives us continuous pre-commit code review for free without blocking the flow of work. The change is being reviewed while it is being authored. In addition, the change is never authored by a single person. Peer pressure ensures fraud is unlikely to happen.

   [Dave Farley](https://twitter.com/davefarley77) repeatedly [reports Pair Programming is good enough as a code review](http://www.davefarley.net/?p=285) in highly regulated industries like finance, healthcare and gambling to demonstrate that the code has been reviewed and that there is some independent oversight/verification of changes.

   It has the benefit of *building quality into* the product instead of "*inspecting quality in*" later after the fact.

   But, what about traceability? How do we prove changes have been authored in pairs?

   The easiest option is to use Git's [`Co-authored-by`](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors) facility. It allows recording as many co-authors as there are collaborators in the pair or ensemble. Adding co-authors in every commit can become cumbersome. [Someone on LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7325792858500751361?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7325792858500751361%2C7326252666941005826%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287326252666941005826%2Curn%3Ali%3Aactivity%3A7325792858500751361%29) pointed me to [git-mob](https://github.com/rkotze/git-mob) to solve that.

   But, for some regulations, this could not be enough as the co-authors are not verified. In that case ...

   > If you mean two-eyes type compliance, I've done this where Alice and Bob are pairing by e.g. Bob signs the commit from Alice's machine (where she is logged in via SSO). The company issues the PGP keys and associates them with the user's account. This was at a Big German Bank.
   >
   > -- Daniel Terhorst-North ([@tastapod](https://twitter.com/tastapod)), [Jul 15, 2021](https://twitter.com/tastapod/status/1415593667008634882)

   Here Alice commits with her SSL certificate but the commit is signed with Bob's PGP key. The SSL certificate identifies Alice and the PGP signing identifies Bob. We now have evidence the code has been seen by two pairs of eyes and we can trace back which eyes have seen which code.

   When pairs or ensemble teams, in addition, also tag each commit with a ticket number from the ticketing system, we now have full traceability on who has seen/authored which commit in the context of which feature or bug.

   *Update May 18, 2025: With the Twitter debacle, some sources are not available any more. Daniel Terhorst-North recently repeated this on LinkedIn.*

   > Implemented this at $BigInvestmentBank. They used certificate-based SSO to login, so we generated new ‘check-in certificates’ and allocated them to each team member. That way you would be (provably) pushing changes from one dev’s machine, signed with the other’s certificate, proving four-eyes compliance.
   >
   > We also generated the release and change docs in the build, using Jira and commit messages (‘closes #219’, etc.). We had a precommit hook to check that the commit message had a Jira number in it. The commit refs also tied all the test cases to their respective Jira ticket so we had round trip provenance on those too.
   >
   > A few other procedural and automation hooks—built in conjunction with the compliance team—and we had an approved path to live for small changes that took ½ day instead of 6 weeks.
   >
   > -- [Daniel Terhorst-North](https://www.linkedin.com/in/tastapod/), [May 7, 2025](https://www.linkedin.com/feed/update/urn:li:activity:7325792858500751361?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7325792858500751361%2C7326147551244558336%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287326147551244558336%2Curn%3Ali%3Aactivity%3A7325792858500751361%29)

2. Pair Programming with Pull Requests. We combine the convenience of pair programming with the review recording facilities from Pull Requests.

   > IMO frequent "PR"s that are approved by the other member of the pair is the easiest way to encode four eyes into most tooling. I'd prefer a direct way but this isn't so onerous.
   >
   > -- [Chris Ford](https://www.linkedin.com/in/ctford/), [May 7, 2025](https://www.linkedin.com/feed/update/urn:li:activity:7325792858500751361?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7325792858500751361%2C7326176195232903168%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287326176195232903168%2Curn%3Ali%3Aactivity%3A7325792858500751361%29)

   Alice and Bob are pairing on Bob's machine. Once they are finished, Bob opens a Pull Request. Alice approves the Pull Request. At this moment, we have a trace of the pair and a proof that 4-eyes happened.

   But, compared to the previous option, it comes with the administrative overhead and the non-negligible delays of creating a Pull Request. Option 1 allows to just do the work, push and move on with the next thing.

3. [Non-Blocking code reviews]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}), i.e reviewing each commit on mainline after the fact when the change is already committed into mainline. It has the advantage of never blocking the flow of work through the value stream. Code reviews can be traced on a Kanban board with code review work-in-progress limits to ensure they will be done. Reviews are run by a different person from the one authoring the change, enabling segregation.

   Again, what about traceability? How do we prove the changes have been reviewed?

   Teams tag every commit with a ticket number from the ticketing system. When the change is done and ready for review, they create a code review in a code reviewing tool like [JetBrains Upsource](https://www.jetbrains.com/upsource/) or [Atlassian Crucible](https://www.atlassian.com/software/crucible) (I only know these two and I only have experience with Crucible). These tools can group commits based on a ticket number into a code review. The code review can be linked to the ticketing system. Now we have full traceability on when a feature was reviewed by who in the context of which feature or bug and which commits were involved.

4. Feature Flagging allows us to commit to mainline but not always release. We only turn on the feature and release to users when everything has been thoroughly checked, tested and approved. Before releasing, the change already sits in production days or weeks in advance, giving us valuable feedback on how it behaves in production. We can even mimic production load by having users perform invisible calls to the change. This can easily complement the first two approaches: Pair/Ensemble Programming or Asynchronous reviews where a third, other person decides to turn the feature on. Further increasing segregation without impacting the flow of work.

## Conclusion

Lean principles and Continuous Delivery enable a fine-grained and adaptive approach to risk management. As we work in small batches and we can trace each change from commit to deployment, we can quantify the risk of each change and manage it appropriately.

It is a fallacy to think feature branches are a necessity to comply with regulations. Compliance can be achieved with trunk-based development. It requires a bit more creativity, a bit more thinking out of the box, a bit more of engineering talking with legal and auditors, a bit less control and a bit more trust.

In conclusion, feature branching with pull requests is [Risk Management Theatre](https://continuousdelivery.com/2013/08/risk-management-theatre/). We check compliance boxes to cover assess when things go wrong. At least we followed the process. At best, that process only introduces delays and hand-offs. At worst, it increases risks and reduces stability.

## Acknowledgment

[Steve Smith](https://twitter.com/SteveSmith_Tech) and [Wouter Lagerweij](https://twitter.com/wouterla) for reviewing and providing feedback on multiple drafts of the article.

## Bibliography

- [Lean Enterprise](https://www.goodreads.com/book/show/18167218-lean-enterprise), Jez Humble, Joanne Molesky, Barry O'Reilly

  *Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance*

- [The DevOps Handbook](https://www.goodreads.com/book/show/26083308-the-devops-handbook), Gene Kim, Jez Humble, Patrick Debois, John Willis

  *Chapter 23. Protecting the Deployment Pipeline*

- [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate), Dr Nicole Forsgren, Jez Humble, Gene Kim

  *Chapter 7. Management Practices for Software - Implement a Lightweight Change Approval Process*

- [Compliance in the DevOps Culture](https://martinfowler.com/articles/devops-compliance.html), Carl Nygard
- [Continuous Compliance](http://www.davefarley.net/?p=285), Dave Farley
- [Regulatory compliance](https://en.wikipedia.org/wiki/Regulatory_compliance), Wikipedia
- [Governance, Risk Management and Compliance (GRC)](https://www.investopedia.com/terms/g/grc.asp), Investopedia
- [Corporate Governance](https://www.investopedia.com/terms/c/corporategovernance.asp), Investopedia
- [Risk](https://en.wikipedia.org/wiki/Risk), Wikipedia

## The Series

The [On the Evilness of Feature Branching]({% post_url 2021-04-26-on-the-evilness-of-feature-branching %}) series:

1. [A Tale of Two Teams]({% post_url 2021-07-14-on-the-evilness-of-feature-branching-a-tale-of-two-teams %})
2. [Why Do Teams Use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches %})
3. But Compliance!?
4. [The Problems]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems %})
5. [How To Avoid The Problems?]({% post_url 2022-06-14-on-the-evilness-of-feature-branching-how-to-avoid-the-problems %})
6. [What about Code Reviews?]({% post_url 2023-12-14-on-the-evilness-of-feature-branching-what-about-code-reviews%})
7. [Where is the Evilness?]({% post_url 2024-01-06-on-the-evilness-of-feature-branching-where-is-the-evilness %})
