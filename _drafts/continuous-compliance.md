---
layout: article
title: Continuous Compliance
author: Thierry de Pauw
category: articles
tags: [ Compliance, Continuous Delivery ]
image: /images/continuous-compliance/continuous-compliance.jpg
---

[But, compliance!]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) Somehow, a welcome justification for all the superfluous gates in our software delivery process, and to embarrassingly uphold the unreasonable delays. Contrary to common belief, compliance is not a good reason to go slow. Research is clear about this, going slow for safety is a mistake. It introduces friction, decelerates feedback, drives down quality, and brings a team to a grinding halt. No! Compliance is an excellent ground for better quality and thus faster delivery, accelerate feedback, and ultimately produce better, but also more compliant outcomes.

---

## Governance, Risk, and Compliance (GRC)

But, what is Compliance, anyway? The industry, and at some point including me, tends to make an amalgam between Governance, Compliance and Risk Management. They are frequently used interchangeably. Though, they mean different things.

**Governance** are all the activities an organisation performs to be compliant with external regulations (ECB, EMA, ...), certifications (PCI-DSS, ISO27001, ISAE 3000, ...), frameworks (ITIL, COBIT, ...), or legally binding contracts and internal regulations (the standards, policies, procedures which are translations of external regulations, certifications or frameworks in internal ways of working).

> IT governance defines the structure, processes, and mechanisms by which an organisation's IT activities are directed, monitored, and controlled to achieve business objectives. IT governance framework is essential for organisations seeking to effectively manager their IT activities, manage risks, ensure compliance, and deliver value to the organisation.

But, Governance involves more than the steps to be compliant. It also includes keeping the organisation on track while balancing the interests of all the organisation's stakeholders.

**Compliance** is to comply with relevant laws, regulations, legally binding contracts or even cultural norms. When imposed by law, regulation or contract, Compliance is, generally, not optional. In these cases, not complying increases risks for fines, reputational damage or even a shutdown of the business.

**Risk Management** is one of the Governance activities, to support Compliance. Regulations demand an organisation to manage its risks. But, good leadership also demand for Risk Management to build a successful organisation. 

A *Risk* is a horrible thing that could happen which can negatively impact an organisation's goals, reputation, or operations resulting from ineffective leadership, ethical lapses, inadequate controls, compliance failures, or strategic errors that threaten stakeholder interests. But risks are pervasive. We can never eliminate all risks. Therefore, we need Risk Management in an attempt to mitigate risks.

> A good car has the best brakes.
>
> An organisation that is not compliant, or cheat on compliance, will not make it. We are compliant to be fast and better.
>
> -- a bank CIO

Speed, fast feedback, innovation, and *Compliance* are not a zero-sum game. We can have both. But it requires we build *Compliance* requirements into the delivery process, from the start. Much like the lean principle of *Building Quality In* the product, as opposed to testing it later, to be high performant and compliant we do not check for *Compliance* at the end, it happens continuous, all the time.

> When it hurts, do it more often.
>
> -- Dave Farley, Continuous Delivery

## Where do we start?

![Continuous Compliance](/images/continuous-compliance/continuous-compliance.jpg)

Compliance starts by understanding the regulation.

Organisations often conflate "*their approach to regulation*" with regulation. Not the same thing, at all. Oftentimes, regulation is about "*do we do what we say we do*" (ISO 27001). The most rigorous regulation says "*get two people to look at it*" and "*have an audit trail of what happened*" (PCI-DSS).

It is, therefore, important that the product team reads and understands the regulation. When I say the team, I mean everyone. This is not only limited to the Product Manager. That also includes all Engineers. This ensures that product implementations are aligned with the regulation. Because now, Engineers understand the implications of their code. "*To my understanding if we do this, we are good*". From then on, the team is accountable and responsible to implement and satisfy the compliance requirements. Having that in place, brings us already a long way forward towards Continuous Compliance.

Once we understand the regulation, we can extract the compliance requirements, which in turn define controls to be implemented. The controls go onto the product backlog, and are prioritised alongside functionality. It receives the necessary importance compared to the compared to the required functionality. Be aware that *Compliance*, much like functionality, has market value. Not being compliant can shut us down from the market.

The other part of *Governance*, and consequently of product management, is *Risk Management*. We continuously identify risks, business operations risks as well as IT operations risks and security risks. One more reason to have business, i.e. the people doing the business operations, part of the product team to obtain Continuous Compliance. They are in the best place to identify business risks. Of course when Risk Management becomes a team activity, obviously Engineers will also start identifying business risks, as they start to internalise the business. Same for Product Managers and business operations who become able to identify IT operations and security risks. It becomes communicating vessels.

A predominant *Risk Management* mode in IT is a "*Wouldn't It Be Horrible*"-approach (Hubbard, 1985, Humble et al., 2014). We imagine a particularly catastrophic event occurring. Regardless of its likelihood, it must be avoided at all costs. There is no sense of prioritisation. The question to be answered in managing risks is: "*Which risks are we willing to accept and which ones not?*". **As we are taking steps to mitigate risk in one area, we inevitably introduce more risk, or new risks, in another area** (Humble et al., 2014).

There should not be a free pass for risk mitigation work to jump to the front of the line. Instead, we should quantify risks using [Impact Mapping](https://www.impactmapping.org/) and prioritise using the [Cost of Delay](https://blackswanfarming.com/cost-of-delay/).

Every single day, at the start of the day, the team reviews the risks. Did we identify new risks? What is the impact of the risk when it happens? What is the likelihood of the risk to happen? What is the cost to mitigate the risk? Should we mitigate the risk or can we accept the risk? All this is documented as Decision Records (much like [Architecture Decision Records](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html), however, this time for non-architecture matters).

As with regulation, identified risks to be mitigated create compliance requirements, which in turn define controls. These controls go again on the backlog and are prioritised together with all other controls and functionality. Whether to prioritise a functionality before a risk mitigation control or a regulation requirement control is, in the end, a business decision and lays in the hands of the Product Manager. Note, in this case, the Product Manager is also accountable and responsible for the business operations, i.e. the turnover and costs generated by the business, as well as its compliance.

This upfront risk assessment will prevent a lot of pain when going to production. By identifying these risks we can introduce the most appropriate controls to mitigate the risk and comply with the regulation. However, the challenge will be to find the right balance of controls, in the context of the organisation and the applicable regulation, to still allow teams to deliver value fast while keeping risks at an acceptable levels.

Operating as above, is already a considerable advancement towards *Compliance*. But it does not stop there.

## Get Two People to Look At It

The most demanding regulation require to *get two people to look at it*, also commonly known as "*four-eyes principle*". The main reason for this principle, is to avoid fraud in finance, or introduce faults that could kill someone in healthcare. Therefore, have someone different from the code-author to look at the code.

The classic implementation are formal code reviews using Pull Requests. As already discussed before ([here]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}), [here]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems%}), and [here]({% post_url 2024-02-22-the-good-and-the-dysfunctional-of-pull-requests %})), this has the downside of blocking delivery, delaying feedback, and consequently driving quality down. Additionally, it tends to introduce isolated, solo work, and therefore disables collaboration, and diversity of views to ultimately result in lower quality products. However, in all fairness, it has the benefit to provide a strong evidence that two people have looked at it.

> Information security, auditors, and regulators often put **too much reliance on code reviews to detect fraud**. Instead, they should be relying on production monitoring controls in addition to using automated testing, code reviews, and approvals, to effectively mitigate the risks associated with errors and fraud.
>
> [...] we had a developer who planted a backdoor in the code that we deploy to our ATM cash machines. They were able to put the ATMs in maintenance mode at certain times, allowing them to take cash out of the machines. We were able to detect the fraud quite quickly, and it wasn't through code reviews. These types of backdoors are difficult, or even impossible, to detect when the perpetrators have sufficient means, motive, and opportunity.
>
> -- someone leading the DevOps initiative at a large US financial services organisation, The DevOps Handbook, Chapter 23. Protecting the Deployment Pipeline, p344

*The fraud was quickly detected by employing detective controls using proactive production monitoring, not code reviews.*

Note, no single regulation mandates Pull Requests. Only PCI-DSS explicitly requires a four-eyes principle. How that is implemented is up to us.

A more efficient approach to getting two people to look at it is [Pair Programming](https://en.wikipedia.org/wiki/Pair_programming) or [Team Programming](https://en.wikipedia.org/wiki/Team_programming).

However, Pair Programming or Team Programming can be a cultural stretch for teams. In these situations, [Non-Blocking Code Reviews]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}) would be a better choice, and works fine for non-regulated industries. With the proper tooling in place, we record who reviewed what. It could even work for regulated industries if we have something in place that prevents production deployments as long as not all code reviews have been completed. It has the added benefit that binary artefacts can already be in a test environment before a code review happened, thus reducing the testing delays, and still accelerating feedback compared to Pull Requests.

## Have an Audit Trail of What Happened

A lot of the compliance requirements is about showing evidences, *have an audit trail of what happened*. That is where [Continuous Delivery]({% post_url 2026-01-09-what-is-continuous-delivery %}) enters with its central pattern: the [Deployment Pipeline]({% post_url 2026-01-09-what-is-continuous-delivery %}#deployment-pipeline). The Deployment Pipeline, together with Version Control, acts as an audit trail of anything that happened when getting code out of version control in production into the hands of the users.

The Version Control System tells us what changed, why it changed, when and who was involved in the change. That could be a single person (isolated programming), two people (Pair Programming) or many people (Team Programming). All of this can be recorded. Either using a combination of authentication and signing keys, commit messages, or the [`Co-authored-by`](https://docs.github.com/en/pull-requests/how-tos/commit-changes/creating-a-commit-with-multiple-authors) Git trailers. The why something changed is recorded by including a ticket number in the commit message. Note, the "why" is often overlooked, though it is one of the most important information as it gives us the context and the reason for the change.

The Deployment Pipeline tells us which commit triggered the pipeline-run, which actions happened, and when they happened. It links the binary artefact that gets deployed into production with the commit that triggered the pipeline run. For manual tasks, such as Exploratory Testing, or triggering the production deployment, it additionally records who performed the manual task.

The pipeline collects all the evidences: linting and code quality scanning results, Unit Test execution results, secrets in plain text detection, Software Composition Analysis (SCA, commonly known as vulnerability scanning) results, Static Application Security Testing (SAST, commonly known as security scanning) results, Automated Acceptance Testing, API Security Testing, load and performance testing, etc. and finally, health checks, Smoke Testing.

Whenever any of these tests and checks fail, it fails the Deployment Pipeline. Whenever the pipeline fails the team [stops the line](https://en.wikipedia.org/wiki/Andon_(manufacturing)), stops all work, it [*Does not Push any more code to the Broken Pipeline*]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working%}#practice-3-do-not-push-to-a-broken-build), it owns the failure and fixes the problem with the highest priority. Only once the pipeline is fixed, the team can pick up any on-going work again and move on. This is paramount to prevent vulnerable software in production.

For this to work, it is crucial that all the checks, especially automated tests, are deterministic. When it fails, it fails all the time. Not failing and passing on a rerun. These tests are useless.

## There Is More

The above is already a good start and is a minimum to implement to get a substantial headway. However, there is more ... we should consider putting in place *Continuous Safeguards*.

*Compliance* is not a point-in-time activity that happens before a release. It has to be continuous! Therefore, 

TODO

- continuous SCA (dependabot)
- continuous secrets scanning
- secrets management
- runbooks
- cloud audit trail
- least privileges
- ...

## Conclusion

*Compliance* often creates a sense of discomfort within teams. Many times, the malaise is created due to the team not owning the *Compliance*, but another team or division, often the Risk & Compliance-division, tells them what to do. They are kind of at the mercy. Therefore, start to read the regulation to install a constructive dialogue with the Risk & Compliance-division.

In the end, *Compliance* is only putting in place the product management and engineering practices that enable high-performance.

The industry needs this exact mindset shift. **It is a catalyst for speed rather than a brake pedal!**

## References

- [How to Measure Anything](https://app.thestorygraph.com/books/1642ec2e-e0fa-4d67-aebe-e51bab993bb2), Douglas Hubbard, 1985
- [Continuous Delivery](https://www.goodreads.com/book/show/8686650-continuous-delivery) book, Jez Humble and Dave Farley, 2011
- [Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html), Michael Nygard, 2011
- [Lean Enterprise: How High Performance Organizations Innovate at Scale](https://app.thestorygraph.com/books/be53bcd6-adf8-4c9c-9946-541a1038435d), Humble, Molesky, O'Reilly, 2014
- [The DevOps Handbook](https://www.goodreads.com/book/show/26083308-the-devops-handbook), Gene Kim, Jez Humble, Patrick Debois, John Willis, 2016
