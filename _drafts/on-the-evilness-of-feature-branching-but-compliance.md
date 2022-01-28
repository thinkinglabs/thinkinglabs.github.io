---
layout: article
title: On the Evilness of Feature Branching - But Compliance
author: Thierry de Pauw
category: articles
tags: [Version Control, Continuous Integration]
---

In [part 2 of this series - Why do Teams use Feature Branches?]({% post_url 2021-10-25-on-the-evilness-of-feature-branching-why-do-teams-use-feature-branches%}) - I examined all the possible reasons teams mention for why they use feature branches. When I published the article I received one unexpected reaction I want to give some more attention: "_I do agree with all you wrote in your post but ... segregation of duties, enforce 4 eyes principles, strict legal rules, get audited by the national bank, etc…_".

---

This article is for most a summary taken from different books who are better at explaining compliance than I am.

> For us we do it [feature branching] because it is the least worst solution when you need to be compliant and implement segregation of duties, enforce 4 eyes principles, strict legal rules, get audited by the national bank, etc… We do strive to automate everything in our pipeline though, so we limit the damage and get the smallest possible delays in the process. I do agree with all you wrote in your post though.
>
> -- a CTO from an organisation in the finance industry

Here the organisation uses feature branches to adopt a pull request based code review to implement segregation of duties in order to be in compliance with legal rules and audits run by the National Bank of Belgium.

> ... the way we use feature branches guarantees a better audit trail.
>
> -- a CTO from an organisation in the finance industry

## Definitions

Let's start with setting some things clear. Many times Governance, Risk and Compliance are mixed. Most of the time when people speak about Governance, they really mean Compliance. Therefore, here are some definitions.

> **Governance** is about keeping our organisation on course. It is the primary responsability of the boards of directors, but it applies to all people working for the organisation.
>
> -- Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 232

> **Risk** is the exposure we run for the possibility of something unpleasant occurring. As it is impossible to eliminate every risk, the question to be answered in managing risk is, “Which risks are you willing to live with?” As you take steps to mitigate risk in one area, you inevitably introduce more risk in another area.
>
> -- Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 233

> **Compliance** is obedience to laws, industry regulations, legally binding contracts, and even cultural norms. When bound by law, regulation, or contract, **compliance is not optional**. If we choose not to comply, we increase our risk of fines, operational shutdowns, or damage to our reputation.
>
> -- Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 233

Governance involves creating the vision and goals for implementing technology changes at a rate that will allow the business to succeed.

The goal is to be able to safely deliver changes to a system by deploying a release to the production environment in compliance with the relevant laws, regulations, contracts and certifications applicable to the system. The compliance structures are meant to ensure quality and correctness of the system and are a form of risk management.

## Controls

Upfront attention to risks can save a lot of pain before deploying to production. It helps setting up the appropriate controls in place to keep us in compliance. The challenge is to find the correct balance of control that allows teams to move forward quickly and keeps risks related to compliance down to an acceptable level.

Controls can be **preventive** by applying barriers or **detective** by monitoring.

Preventive controls -> PR based code reviews
Async code reviews is a form of monitoring and thus is a detective control.

Many think preventive controls are more effective. The opposite is true. People need to get things done, often under delivery pressure. They will find all possible creative ways to circumvent these controls. The end result is not reducing risks. The preventive controls will increase risks, lead to unnecessarily high costs, people stopping to care and improvement coming to a halt.

In the case of Pull Requests,
- having to wait for a reviewer followed by waiting for the reviewee together with all time wasted due to the required context switching;
- accumulating large batches of changes and push that to a code review and approval.

In the end, these preventive controls become useless and introduce a false sense of security.

> Teams that reported no approval process or used peer review achieved higher software delivery performance. Finally, teams that required approval by an external body achieved lower performance.
>
> -- Accelerate, Chapter 7. Management Practices for Software - Implement a Lightweight Change Approval Process, p. 79

Change approval does not work to reduce risks and increase the stability of systems. It slows things down. It is in fact worse than having no change approval at all.

Often organisations rely on segregation of duties to reduce the risk for fraud or mistakes. It is often required by regulation (PCI-DSS) or by auditors. No single person can implement a change and deploy it into production. But, in today's high complex systems with increasing deployment frequency, we need fast feedback to see the outcomes of our changes.

Segregation of duties will slow down the deployment frequency and reduce the feedback for engineers. Did we implement the right thing? Is it behaving as expected? Is it behaving nicely? Doesn't it cause any harm? ...

As a result, it prevents engineers to take full responsability for the quality of their work and reduces reduces learning.

Segregation of duty introduces fear and reluctance around deployments and maintenance because no-one has a full view on the whole system outside their little portion of the software stack.

> Information security, auditors, and regulators often put **too much reliance on code reviews to detect fraud**. Instead, they should be relying on production monitoring controls in addition to using automated testing, code reviews, and approvals, to effectively mitigate the risks associated with errors and fraud.
>
> -- someone leading the DevOps initiative at a large US financial services organisation via The DevOps Handbook, Chapter 23. Protecting the Deployment Pipeline, p. 344

Despite having preventive controls in place like code reviews and approvals, fraud happened at that organisation. It was quickly detected by means of detective controls through proactive production monitoring.

> **Trust, but verify**
>
> -- a Russian proverbe via Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance, p. 240

Trust the people they will do the right thing! Then verify they are not abusing the trust through monitoring and regular reviewing and auditing.

Compliance managers rely on change approval processes like code reviews to fulfil compliance requirements. They require evidence that any change has been appropriately authorised.

If we have a continuous delivery deployment pipeline in place, the majority of the changes don't need to go through a manual change approval. We can now rely on controls like automated testing and proactive production monitoring.

The advantage of using lean principles and continuous delivery in product development is that it enables a fine-grained, adaptive approach to risk management. As we work in small batches and are able to trace each change to our systems from check-in to deployment, we can quantify the risk of each change and manage it appropriately.

When deployments happen through a deployment pipeline, results of each step of the pipeline are recorded. Auditors love this. If we record ticket numbers from our ticketing system in each commit we can backtrace each deployment to aversion control commit and from there to a ticket. Now, we have all the context on why a change happened.

> Even a team that has shared experiences with high trust and shared goals can begin to struggle when low trust control mechanisms are put into place.
>
> -- PCI Compliance at ETsy via The DevOps Handbook, Chapter 12. Protecting the Deployment Pipeline, p. 342

## Alternatives

Pair programming, continuous inspection of code, asynchronous code reviews, production monitoring.

Their are two mechanisms to satisfy the letter and intent of segregation of duties:

1. For any change, someone not involved in authoring the change should review it.
2. Changes should only be applied into production using a fully automated process using a deployment pipeline. No changes should arrive into production without prior being committed into version control, validated by the build and automated tests, and deployed into production through a fully automated process.

Risk Management Theatre: we check boxes so that when something goes wrong, we can say that at least we followed the process. At best, that process only introduces delays and handoffs. At worst, increases risks and reduces stability.

## Bibliography

- Lean Enterprise, Chapter 12. Embrace Lean Thinking for Governance, Risk and, Compliance
- The DevOps Handbook, Chapter 23. Protecting the Deployment Pipeline
- Accelerate, Chapter 7. Management Practices for Software - Implement a Lightweight Change Approval Process
- [Compliance in the DevOps Culture](https://martinfowler.com/articles/devops-compliance.html)
