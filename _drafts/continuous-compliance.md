---
layout: article
title: Continuous Compliance
author: Thierry de Pauw
category: articles
tags: [ Compliance, Continuous Delivery ]
image: /images/continuous-compliance/continuous-compliance.jpg
---

[But, compliance!]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) Somehow, a welcome justification for all the superfluous gates in our software delivery process, and to embarrassingly uphold the unreasonable delays. Contrary to common belief, compliance is not a good reason to go slow. Research is clear about this, going slow for safety is a mistake. It introduces friction, decelerates feedback, drives down quality, and brings a team to a grinding halt. No! Compliance is an excellent foundation for better quality and thus faster delivery, accelerated feedback, and ultimately produce better, but also more compliant outcomes.

---

## Governance, Risk, and Compliance (GRC)

But, what is *Compliance*, anyway? The industry, and at some point including me, tends to make an amalgam between *Governance*, *Compliance* and *Risk Management*. They are frequently used interchangeably. Though, they mean different things.

**Governance** are all the activities an organisation performs to be compliant with external regulations (ECB, EMA, ...), certifications (PCI-DSS, ISO27001, ISAE 3000, ...), frameworks (ITIL, COBIT, ...), or legally binding contracts and internal regulations (the standards, policies, procedures which are translations of external regulations, certifications or frameworks in internal ways of working).

IT governance defines the structure, processes, and mechanisms by which an organisation's IT activities are directed, monitored, and controlled to achieve business objectives. IT governance framework is essential for organisations seeking to effectively manage their IT activities, manage risks, ensure compliance, and deliver value to the organisation. ([COBIT 5](https://www.isaca.org/resources/cobit/cobit-5), [ISO 38500](https://www.iso.org/standard/81684.html), Humble et al., 2014)

But, Governance involves more than the steps to be compliant. It also includes keeping the organisation on track while balancing the interests of all the organisation's stakeholders.

**Compliance** is to comply with relevant laws, regulations, legally binding contracts or even cultural norms. When imposed by law, regulation or contract, Compliance is, generally, not optional. In these cases, not complying increases risks for fines, reputational damage or even a shutdown of the business.

**Risk Management** is one of the Governance activities, to support Compliance. Regulations demand an organisation to manage its risks. But, good leadership also demands for Risk Management to build a successful organisation. 

A *Risk* is a horrible thing that could happen which can negatively impact an organisation's goals, reputation, or operations resulting from ineffective leadership, ethical lapses, inadequate controls, compliance failures, or strategic errors that threaten stakeholder interests. But risks are pervasive. We can never eliminate all risks. Therefore, we need Risk Management in an attempt to mitigate risks.

> A good car has the best brakes.
>
> An organisation that is not compliant, or cheats on compliance, will not make it. We are compliant to be fast and better.
>
> -- a bank CIO

Speed, fast feedback, innovation, and Compliance are not a zero-sum game. We can have both. But it requires we build Compliance requirements into the delivery process, from the start. Much like the lean principle of *Building Quality In* the product, as opposed to testing it later, to be high performant and compliant we do not check for Compliance at the end, it happens continuously, all the time.

> When it hurts, do it more often.
>
> -- Dave Farley, Continuous Delivery

## Where do we start?

![Continuous Compliance](/images/continuous-compliance/continuous-compliance.jpg)

Compliance starts by understanding the regulation.

Organisations often conflate "*their approach to regulation*" with regulation. Not the same thing, at all. Oftentimes, regulation is about "*do we do what we say we do*" (ISO 27001). The most rigorous regulation says "*get two people to look at it*" and "*have an audit trail of what happened*" (PCI-DSS).

It is, therefore, important that the product team reads and understands the regulation. When I say the team, I mean everyone. This is not only limited to the Product Manager. That also includes all Engineers. This ensures that product implementations are aligned with the regulation. Because now, Engineers understand the implications of their code. "*To my understanding if we do this, we are good*". From then on, the team is accountable and responsible to implement and satisfy the compliance requirements. Having that in place, brings us already a long way forward towards Continuous Compliance.

Once we understand the regulation, we can extract the compliance requirements, which in turn define controls to be implemented. The controls go onto the product backlog, and are prioritised alongside functionality. It receives the necessary priority alongside to the required functionality. Be aware that Compliance, much like functionality, has market value. Not being compliant can shut us down from the market.

The other part of Governance, and consequently of product management, is Risk Management. We continuously identify risks, business operations risks as well as IT operations risks and security risks. One more reason to have business, i.e. the people doing the business operations, part of the product team to obtain Continuous Compliance. They are in the best place to identify business risks. Of course when Risk Management becomes a team activity, obviously Engineers will also start identifying business risks, as they start to internalise the business. Same for Product Managers and business operations who become able to identify IT operations and security risks. It becomes communicating vessels.

A predominant Risk Management mode in IT is a "*Wouldn't It Be Horrible*"-approach (Hubbard, 1985, Humble et al., 2014). We imagine a particularly catastrophic event occurring. Regardless of its likelihood, it must be avoided at all costs. There is no sense of prioritisation. The question to be answered in managing risks is: "*Which risks are we willing to accept and which ones not?*". **As we are taking steps to mitigate risk in one area, we inevitably introduce more risk, or new risks, in another area** (Humble et al., 2014).

There should not be a free pass for risk mitigation work to jump to the front of the line. Instead, we should quantify risks using the classic ISO 27001 Risk Assessment Template (Clauses 6.1.2 and 8.2) to quantify a risk value as the product of the risk impact and its likelihood. Each risk receives a risk value based on its impact and likelihood to occur. Impact is quantified with an amount of Euros (e.g. Low - < 50.000 EUR, Medium - < 100.000 EUR, High - < 500.000 EUR, Severe - < 1.000.000 EUR, Critical - > 1.000.000 EUR ). The team then decides its risk tolerance as the boundary risk value above which a risk must be treated and below which a risk can be accepted. Treatment can be one of risk reduction (reduce the risk level), risk transfer (the risk is transferred to another party) or risk avoidance (the activity resulting in the high risk should be avoided).

|              | **Likelihood** | Rare (1) | Unlikely (2) | Possible (3) | Likely (4) | Certain (5) |
| ------------ | -------------- | - | - | - | - | - |
| **Impact**   |                |  |   |  |  |  |
| Low      (1) |                | 1 | 2  | 3 | 4 | 5 |
| Medium   (2) |                | 2 | 4  | 6 | 8 | 10 |
| High     (3) |                | 3 | 6  | 9 | 12 | 15 |
| Severe   (4) |                | 4 | 8  | 12 | 16 | 20 |
| Critical (5) |                | 5 | 10 | 15 | 20 | 25 |

Or quantify risks using [Impact Mapping](https://www.impactmapping.org/) and prioritise using the [Cost of Delay](https://blackswanfarming.com/cost-of-delay/).

Every single day, at the start of the day, the team reviews the risks. Did we identify new risks? What is the impact of the risk when it happens? What is the likelihood of the risk to happen? What is the cost to mitigate the risk? Should we mitigate the risk or can we accept the risk? All this is documented as Decision Records (much like [Architecture Decision Records](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html), however, this time for non-architecture matters).

As with regulation, identified risks to be mitigated create compliance requirements, which in turn define controls. These controls go again on the backlog and are prioritised together with all other controls and functionality. Whether to prioritise a feature before a risk mitigation control or a regulation requirement control is, in the end, a business decision and rests in the hands of the Product Manager. Note, in this case, the Product Manager is also accountable and responsible for the business operations, i.e. the turnover and costs generated by the business, as well as its compliance.

This upfront risk assessment will prevent a lot of pain when going to production. By identifying these risks we can introduce the most appropriate controls to mitigate the risk and comply with the regulation. However, the challenge will be to find the right balance of controls, in the context of the organisation and the applicable regulation, to still allow teams to deliver value fast while keeping risks at acceptable levels.

Operating as above, is already a considerable advancement towards Compliance. But it does not stop there.

## Get Two People to Look At It

The most demanding regulations require to *get two people to look at it*, also commonly known as "*four-eyes principle*". The main reason for this principle, is to avoid fraud in finance, or introduce faults that could kill someone in healthcare. Therefore, have someone different from the code-author to look at the code.

The classic implementation are formal code reviews using Pull Requests. As already discussed before ([here]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}), [here]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems%}), and [here]({% post_url 2024-02-22-the-good-and-the-dysfunctional-of-pull-requests %})), this has the downside of blocking delivery, delaying feedback, and consequently driving quality down. Additionally, it tends to introduce isolated, solo work, and therefore disables collaboration, and diversity of views to ultimately result in lower quality products. However, in all fairness, it has the benefit to provide a strong evidence that two people have looked at it.

> Information security, auditors, and regulators often put **too much reliance on code reviews to detect fraud**. Instead, they should be relying on production monitoring controls in addition to using automated testing, code reviews, and approvals, to effectively mitigate the risks associated with errors and fraud.
>
> [...] we had a developer who planted a backdoor in the code that we deploy to our ATM cash machines. They were able to put the ATMs in maintenance mode at certain times, allowing them to take cash out of the machines. We were able to detect the fraud quite quickly, and it wasn't through code reviews. These types of backdoors are difficult, or even impossible, to detect when the perpetrators have sufficient means, motive, and opportunity.
>
> -- someone leading the DevOps initiative at a large US financial services organisation, The DevOps Handbook, Chapter 23. Protecting the Deployment Pipeline, Case Study: Relying on Production Telemetry for ATM Systems, p344

*The fraud was quickly detected by employing detective controls using proactive production monitoring, not code reviews.*

Note, no single regulation mandates Pull Requests. Only PCI-DSS explicitly requires a four-eyes principle. How that is implemented is up to us.

A more efficient approach to getting two people to look at it is [Pair Programming](https://en.wikipedia.org/wiki/Pair_programming) or [Team Programming](https://en.wikipedia.org/wiki/Team_programming).

However, Pair Programming or Team Programming can be a cultural stretch for teams. In these situations, [Non-Blocking Code Reviews]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}) would be a better choice, and works fine for non-regulated industries. With the proper tooling in place, we record who reviewed what. It could even work for regulated industries if we have something in place that prevents production deployments as long as not all code reviews have been completed. It has the added benefit that binary artefacts can already be in a test environment before a code review happened, thus reducing the testing delays, and still accelerating feedback compared to Pull Requests.

## Have an Audit Trail of What Happened

A lot of the compliance requirements is about providing evidence, *have an audit trail of what happened*. That is where [Continuous Delivery]({% post_url 2026-01-09-what-is-continuous-delivery %}) enters with its central pattern: the [Deployment Pipeline]({% post_url 2026-01-09-what-is-continuous-delivery %}#deployment-pipeline). The Deployment Pipeline, together with Version Control, acts as an audit trail of anything that happened when getting code out of version control in production into the hands of the users.

The Version Control System tells us what changed, why it changed, when, and who was involved in the change. That could be a single person (isolated programming), two people (Pair Programming) or many people (Team Programming). All of this can be recorded. Either using a combination of authentication and signing keys, commit messages, or the [`Co-authored-by`](https://docs.github.com/en/pull-requests/how-tos/commit-changes/creating-a-commit-with-multiple-authors) Git trailers. The reason why something changed is recorded by including a ticket number in the commit message. Note, the "why" is often overlooked, though it is one of the most important information as it gives us the context and the reason for the change.

The Deployment Pipeline tells us which commit triggered the pipeline-run, which actions happened, and when they happened. It links the binary artefact that gets deployed into production with the commit that triggered the pipeline run. For manual tasks, such as Exploratory Testing, or triggering the production deployment, it additionally records who performed the manual task.

The pipeline collects all the evidences: linting and code quality scanning results, Unit Test execution results, secrets in plain text detection, Software Composition Analysis (SCA, commonly known as vulnerability scanning) results, Static Application Security Testing (SAST, commonly known as security scanning) results, Automated Acceptance Testing, API Security Testing, Dynamic Application Security Testing (DAST), load and performance testing, etc. and finally, health checks, Smoke Testing.

Whenever any of these tests and checks fail, it fails the Deployment Pipeline. Whenever the pipeline fails the team [stops the line](https://en.wikipedia.org/wiki/Andon_(manufacturing)), stops all work, it [*Does not Push any more code to the Broken Pipeline*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working%}#practice-3-do-not-push-to-a-broken-build), it owns the failure and fixes the problem with the highest priority. Only once the pipeline is fixed, the team can pick up any on-going work again and move on. This is paramount to prevent vulnerable software in production.

For this to work, it is crucial that all the checks, especially automated tests, are deterministic. When it fails, it fails all the time. Not failing and passing on a rerun. These tests are useless.

## What about Segregation of Duties?

This is arguably the single most misunderstood requirement in enterprise IT compliance. It is the number one excuse used to slow down delivery, justifying manual handoffs, enforce infrequent release schedules, and bring teams to a standstill. Few regulatory concepts cause so much self-inflicted friction.

It was historically intended to prevent financial fraud or faults that could threaten human life by ensuring no single person controls the entire delivery process end-to-end. The rule of thumb was simple: the person authoring the code may neither release nor deploy it. In IT, this is often misinterpreted as "Engineers must not have the ability to deploy in production" or "Engineers may not have production access". This leads to blocking code reviews with Pull Requests, lengthy Change Approval Boards (CABs), or dedicated operations teams performing deployments based on engineers' instructions. Consequently, it slows down the feedback loops and drives down quality. In the end, the things we put in place to supposedly control quality, do the exact opposite: they bring down quality.

Pair and Team Programming already provide continuous peer oversight against unapproved changes.

Furthermore, when compliance controls dictate that all production deployments (including emergency interventions) must pass through a single path — the Deployment Pipeline — and that no single human can bypass the pipeline's quality and security gates, the pipeline itself acts as the independent segregation mechanism. For this to work, it is essential that the Deployment Pipeline is repeatable, reliable, consistent, and deterministic.

The pair or team write and review the code, and the deterministic pipeline independently tests, verifies and deploys the code.

Engineers do, however, need access to production, especially telemetry, to investigate outages. This access must be limited to read-only permissions to satisfy the non-repudiation requirements while keeping teams empowered to support their systems.

## There Is More

The above is already a good start. It is a minimum to get a substantial headway. However, there is more ... we have to consider *Continuous Safeguards*.

Compliance is not a point-in-time activity that happens before a release. Scanning for vulnerabilities and plain text secrets, as well as DAST must run continuously across repositories and applications because new CVEs are discovered in existing code every day, after a release happened.

Runtime workloads and pipelines use secrets requiring secret stores for storing the secrets. However, we also need a process to provision secret values into those secret stores using Infrastructure as Code. Either the secrets are stored encrypted in version control using tools such as [SOPS](https://getsops.io/), or the Infrastructure as Code connects directly to a password manager as the secrets source of truth.

Audit trails require [non-repudiation](https://en.wikipedia.org/wiki/Non-repudiation). Therefore, we eliminate any manual production modifications, and revoke write permissions from staff members. Following the [Principle of Least Privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege), staff members — including administrators — are granted read-only access. This protects against scenarios where an administrator accidentally deletes a critical infrastructure resource during routine maintenance, taking down all production traffic (a true story). Crucially, it also ensures that any cloud infrastructure change has to be performed by a Deployment Pipeline using Infrastructure as Code. Only the Deployment Pipeline receives write permissions. To limit blast radius further, delete permissions should be revoked from the Deployment Pipeline by default, granted only when a resource is explicitly intended to be destroyed. This practice has saved us in the past from accidentally destroying a data store. Finally, following the [break-the-glass principle](https://nhimg.org/glossary/break-glass-procedure/) administrators retain identity access management permissions to elevate their permissions strictly emergency situations.

Non-repudiation also requires [immutable infrastructure](https://www.ibm.com/think/topics/immutable-infrastructure) and ephemeral environments. This is standard when patching cloud-native workloads such as Docker containers and Lambda functions. Similarly, virtual machine patching happens using virtual machine images where virtual machines are replaced and not modified at runtime. The other benefit is, it cuts down [configuration-drift](https://www.ibm.com/think/topics/configuration-drift).

When altering permissions, we need a trace of those changes. Therefore, a cloud audit trail needs to be in place to track all activities on the cloud platform. The audit trail tells us who (which Deployment Pipeline, which workload, which staff member), did what, and when. It does not tell us the why. On top of the audit trail, we have alerting in place notifying us of any risky activities such as permission changes or network modifications.

Compliance-as-Code or [Policy-as-Code](https://www.ibm.com/think/topics/policy-as-code) leverages automation to shorten feedback loops and shift compliance left. Compliance controls are defined as code and applied by Deployment Pipelines. A compliance control can be used to detect, prevent, or correct violations (Morris, 2025). Typically, Policy-as-Code is used to comply with standards such as the [NIST 800-53](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final) framework or [Center for Internet Security (CIS)](https://www.cisecurity.org/). Detection controls report when a violation occurred. This is typically security monitoring of workloads and infrastructure. Prevention controls disallow non-compliant actions. This is generally the checks and tests performed by the Deployment Pipeline that stops the pipeline (such as SCA, SAST, DAST, Automated Acceptance Tests, ...). Correction controls combine detection with an automated corrective action, such as removing unauthorised user accounts.

As mentioned in the "*Case Study: Relying on Production Telemetry for ATM Systems*", Continuous Compliance relies as much on continuous production monitoring and alerting (detective controls), as it does on pre-deployment checks (preventive controls).

Lastly, to keep Mean Time to Recover under control, it is vital to have standard responses in place for anticipated situations with [runbooks](https://en.wikipedia.org/wiki/Runbook).

## Conclusion

Compliance often creates a sense of discomfort within teams. Many times, the malaise is created due to the team not owning the Compliance, but another team or division, often the Risk & Compliance-division, tells them what to do. They are kind of at the mercy. Therefore, start to read the regulation to install a constructive dialogue with the Risk & Compliance-division. Bring the auditor in the loop, and explain the processes and compliance controls the team has in place with continuous risk management, Deployment Pipelines, monitoring, and scanning.

In the end, Compliance is only putting in place the product management and engineering practices that enable high-performance.

A common mistake by regulated organisations is to apply a one-size-fits-all approach to regulation and enforce compliance controls to every part of the organisation. A better approach is to confine the regulatory requirements to the regulated activities (see [PCI-DSS and continuous deployment at Etsy](https://continuousdelivery.com/2012/07/pci-dss-and-continuous-deployment-at-etsy/) and "*Case Study: PCI Compliance and a Cautionary Tale of Separating Duties at Etsy*" from The DevOps Handbook p339).

The industry needs this exact mindset shift. **It is a catalyst for speed rather than a brake pedal!**

## Acknowledgement

[Elizabeth Zagroba](https://mastodon.social/@ez@chaos.social) for the awesome notes during the [Continuous Compliance session at SoCraTes 2026]({% post_url 2026-09-27-socrates-2026-continuous-compliance %}).

## Related Articles

- [On the Evilness of Feature Branching - But Compliance]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %})
- [What is Continuous Delivery?]({% post_url 2026-01-09-what-is-continuous-delivery %})

## References

- [How to Measure Anything](https://app.thestorygraph.com/books/1642ec2e-e0fa-4d67-aebe-e51bab993bb2), Douglas Hubbard, 1985
- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, Jez Humble and Dave Farley, 2011
- [Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html), Michael Nygard, 2011
- [Lean Enterprise: How High Performance Organizations Innovate at Scale](https://app.thestorygraph.com/books/be53bcd6-adf8-4c9c-9946-541a1038435d), Humble, Molesky, O'Reilly, 2014
- [The DevOps Handbook](https://www.goodreads.com/book/show/26083308-the-devops-handbook), Gene Kim, Jez Humble, Patrick Debois, John Willis, 2016
- [Infrastructure as Code, 3rd edition](https://app.thestorygraph.com/books/dab98a8c-7167-4ef5-9008-e0757713ac7f), Kief Morris, 2025
- [Continuous Compliance session at SoCraTes]({% post_url 2026-09-27-socrates-2026-continuous-compliance %}), Thierry de Pauw, 2026
