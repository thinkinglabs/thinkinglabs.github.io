---
layout: article
title: On the Evilness of Feature Branching - But Compliance
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 2 of this series - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches%}) - I examined all the possible reasons teams mention for why they use feature branches. The article received one interesting remark I want to give some more attention to: "_I do agree with all you wrote in your post but ... segregation of duties, enforce 4 eyes principles, strict legal rules, get audited by the national bank, etc…_".

---

> For us we do [feature branching] because it is the least worst solution when you need to be compliant and implement segregation of duties, enforce 4 eyes principles, strict legal rules, get audited by the national bank, etc… We do strive to automate everything in our pipeline though, so we limit the damage and get the smallest possible delays in the process. I do agree with all you wrote in your post though.
>
> ...
>
> We also do pair programming, I think the way we use feature branches guarantees a better audit trail.
>
> -- a CTO in a finance organisation

Here the organisation uses feature branches to adopt a pull request based code review modal. This allows them to have segregation of duties and 4-eyes principle to be compliant with regulations imposed by the Belgian National Bank, the organisation that regulates the Belgian finance industry.

Interestingly, the 4-eyes principle was already achieved with pair programming. Feature branching is in place for tracking purposes - having an audit trail to prove code reviews are being done - and segregation of duty - the person that approves the change is different from the person or persons that implemented the change to avoid fraud, compromised or malicious engineers or mistakes.

Compliance is an often-cited reason to approve all sorts of wasteful non-value-adding activities.

Note, most regulations and frameworks like [ITIL](https://en.wikipedia.org/wiki/ITIL) and [COBIT](https://en.wikipedia.org/wiki/COBIT) do not prescribe specific practices to implement. Oftentimes, heavy processes are established as a result of somebody's misinterpretation of what is required, but not mandated by the said regulation or framework. Only the PCI-DSS regulation explicitly requires segregation of duties.

But what is compliance?

> **Compliance** is obedience to laws, industry regulations, legally binding contracts, and even cultural norms. When bound by law, regulation, or contract, **compliance is not optional**. If we choose not to comply, we increase our risk of fines, operational shutdowns, or damage to our reputation.
>
> -- Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 233

Compliance never really comes alone. It mostly goes together with Governance and Risk (GRC).

> **Governance** is about keeping our organisation on course. It is the primary responsibility of the boards of directors, but it applies to all people working for the organisation.
>
> -- Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 232

Governance is about creating the vision and the goals to implement technology changes with the right stability and throughput to create positive business impact, i.e. generating money (turnover), saving money (cost savings) or protecting money (being ahead of the competition).

> **Risk** is the exposure we run for the possibility of something unpleasant occurring. As it is impossible to eliminate every risk, the question to be answered in managing risk is, “Which risks are you willing to live with?” **As you take steps to mitigate risk in one area, you inevitably introduce more risk in another area.**
>
> -- Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 233

An example of risk mitigation is imposing a pull request based code review model. This may be good for compliance officers as it creates an illusion of control on technology changes together with an illusion of quality and it allows to tick the compliance checkbox. But it is generally bad for delivery teams because ...

- It increases the risk for delayed delivery as team members have to wait for reviewers, followed by the necessary ping-pong between reviewer and reviewee. Before they realise, they are a couple of days later.
- It often encourages large batches of changes, creating big changesets, in turn introducing higher risks for failure.
- Often large changesets results in expediting the code review in a shallow way resulting in poor added value.

  > 10 lines of code = 10 issues.
  >
  > 500 lines of code = "looks fine."
  >
  > Code reviews.
  > 
  > -- I Am Devloper ([@iamdeveloper](https://twitter.com/iamdevloper)), [Nov 5, 2013](https://twitter.com/iamdevloper/status/397664295875805184)

  This behaviour is also known as the [Law of Triviality](https://en.wikipedia.org/wiki/Law_of_triviality).

Interestingly, the goal of GRC-processes is to deliver changes safely by deploying a release into the production environment in compliance with the relevant laws, regulations and contracts applicable to the system. When done well, GRC structures and processes improve value delivery, i.e. improve both quality and throughput, through effective risk management. This is aligned with the goal of delivery teams. Unfortunately, often these compliance processes introduce bottlenecks and increase the risk for delayed delivery. Forcing teams to complete activities with little added value.

Commonly, GRC teams adopt the "_wouldn't it be horrible if_" approach (from How to measure anything, Douglas Hubbard). They imagine a particularly catastrophic event that could happen. It must be prevented at any cost regardless of its likelihood. Instead, we should quantify risks using [Impact Mapping](https://www.impactmapping.org/) and prioritise using [Cost of Delay](https://blackswanfarming.com/cost-of-delay/).

Analysing risks upfront can prevent a lot of pain before releasing a new version of the system. Identifying those risks helps with putting in place the appropriate controls to satisfy compliance. The challenge will be to find the right balance of controls to allow teams to deliver value fast and keep risks at an acceptable low level.

Controls can be **preventive** by applying barriers or **detective** by monitoring.

Pull request based code reviews is an example of preventive control. On the other hand, asynchronous code reviews (also known as reviewing after the fact or reviewing every commit on mainline) is a form of monitoring and can be seen as a detective control.

Many think preventive controls are more effective. The opposite is true. Teams need to get things done, often under delivery pressure. To achieve that, they will find all sorts of creative ways to get around these preventive controls. The outcome is not reducing risks. The preventive controls will in fact increase risks, lead to unnecessarily high costs, or worse people will stop to care and improvement will come to a halt.

Often organisations rely on segregation of duties as a preventive control through for instance code reviews to reduce the risk for fraud or mistakes. But, in today's highly complex systems where cause and effects are only obvious in hindsight with unpredictable, emergent outcomes, we can only probe, sense and respond. Therefore, we need to conduct safe to fail experiments, not failsafe design. This is why fast feedback is required to see the outcomes of our changes as early as possible so we can take new decisions and decide on new experiments.

Scientific research from [Dr Nicole Forsgren](https://twitter.com/nicolefv) and the book [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate) (also by Dr Nicole Forsgren and friends) found that change approval does not reduce risks and increases the stability of systems. On the contrary. It slows IT delivery down. It is worse than having no change approval at all.

Preventive controls like segregation of duties will slow down and reduce the feedback for engineers. Did we implement the right thing? Is it being used? Is it behaving as expected? How is it being used? Is it behaving nicely? Doesn't it cause any harm? ... In the end, it prevents engineers to take full responsibility for their work and it reduces learning.

> Information security, auditors, and regulators often put **too much reliance on code reviews to detect fraud**. Instead, they should be relying on production monitoring controls in addition to using automated testing, code reviews, and approvals, to effectively mitigate the risks associated with errors and fraud.
>
> -- someone leading the DevOps initiative at a large US financial services organisation via The DevOps Handbook, Chapter 23. Protecting the Deployment Pipeline, p. 344

Despite having established preventive controls like code reviews and approvals, fraud happened at that large financial US organisation. One malicious engineer planted a backdoor in the code deployed to the ATM cash machines. They were able to put the ATMs into maintenance mode at certain times allowing them to take cash out of the machines. The fraud was not detected through code review. It was quickly detected employing detective controls using proactive production monitoring.

Preventive controls like code reviews easily become useless and introduce a false sense of security.

> **Trust, but verify**
>
> -- a Russian proverb, Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 240

Trust the people they will do the right thing! Then verify they are not abusing the trust through monitoring and regularly reviewing and auditing.

## Alternatives

What are the alternatives?

There are two mechanisms to satisfy the letter and intent of segregation of duties:

1. For any change, someone not involved in authoring the change should review it. This can be obtained using different practices or a combination of these practices.

    - [Pair Programming](https://martinfowler.com/articles/on-pair-programming.html) or [Ensemble Programming](https://ensembleprogramming.xyz/) gives you continuous code review for free without blocking the flow of work. The change is never authored by a single person and peer pressure makes fraud unlikely to happen.

    - Asynchronous code reviews, i.e reviewing each commit on mainline after the fact enables reviewing by a different person from the one authoring the change without blocking the flow of work.

    - Feature Flagging allows us to turn on the feature only when everything has been thoroughly checked and approved.

      > Well, this is where my handy-dandy tool comes in.
      >
      > Feature flagging means you’re committing to trunk all the time, but not always releasing until everything is checked, approved, tested, etc.
      >
      > -- Heidi, Sticker Thoughtleader ([@wiredferret](https://twitter.com/wiredferret)), [Jul 15, 2021](https://twitter.com/wiredferret/status/1415733359523811328)

2. Changes should only be applied into production using a fully automated process using a deployment pipeline. No single change can arrive into production without first being committed into version control, validated by the build and automated tests, and deployed into production through a fully automated process. Thence we do not have to rely that much anymore on manual change approvals but can depend on controls like automated testing and proactive production monitoring.

## Traceability

How do we achieve traceability of reviews? Auditors require evidence that any change has been appropriately authorised.

For Pair Programming or Ensemble Programming:

> If you mean two-eyes type compliance, I've done this where Alice and Bob are pairing by e.g. Bob signs the commit from Alice's machine (where she is logged in via SSO). The company issues the PGP keys and associates them with the user's account. This was at a Big German Bank.
>
> -- Daniel Terhorst-North ([@tastapod](https://twitter.com/tastapod)), [Jul 15, 2021](https://twitter.com/tastapod/status/1415593667008634882)

For Asynchronous Reviews:

Teams tag every commit with a ticket number from the ticketing system. When the feature is done, they create a code review in a code review tool like JetBrains Upsource or Atlassian Crucible. These tools can group commits based on a ticket number. The code review can be linked to the ticketing system. Now we have full traceability on when a feature was reviewed by who.

In addition, when deployments happen through a deployment pipeline, the results of each step of the pipeline are recorded. Auditors love this. If we record ticket numbers from our ticketing system in each commit we can backtrace each deployment to version control commit and from there to a ticket. Now, we have all the context on why a change happened.

## Conclusion

Lean principles and continuous delivery enable a fine-grained, adaptive approach to risk management. As we work in small batches and can trace each change from commit to deployment, we can quantify the risk of each change and manage it appropriately.

It is a fallacy to think feature branches are a necessary evil to be compliant with regulations. Compliance can be achieved with trunk-based development. It requires a bit more creativity, a bit more thinking out of the box, a bit more engineering talking with legal and auditors and a bit less control.

We could conclude that feature branching for compliance reasons is a form of [Risk Management Theatre](https://continuousdelivery.com/2013/08/risk-management-theatre/). We check compliance boxes to cover assess when things go wrong. At least we followed the process. At best, that process only introduces delays and hand-offs. At worst, it increases risks and reduces stability.

## Acknowledgment

[Steve Smith](https://twitter.com/SteveSmith_Tech) and [Wouter Lagerweij](https://twitter.com/wouterla) for reviewing and providing essential feedback on the article.

Quarantine due to COVID symptoms gave me plenty of time to finally finalise this difficult article.

## Bibliography

- [Lean Enterprise](https://www.goodreads.com/book/show/18167218-lean-enterprise), Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, Jez Humble, Joanne Molesky, Barry O'Reilly
- [The DevOps Handbook](https://www.goodreads.com/book/show/26083308-the-devops-handbook), Chapter 23. Protecting the Deployment Pipeline, Gene Kim, Jez Humble, Patrick Debois, John Willis
- [Accelerate](https://www.goodreads.com/book/show/35747076-accelerate), Chapter 7. Management Practices for Software - Implement a Lightweight Change Approval Process, Dr Nicole Forsgren, Jez Humble, Gene Kim
- [Compliance in the DevOps Culture](https://martinfowler.com/articles/devops-compliance.html), Carl Nygard
