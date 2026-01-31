---
layout: article
title: Continuous Compliance
author: Thierry de Pauw
category: articles
tags: [ Compliance, Continuous Delivery ]
image: /images/continuous-compliance/continuous-compliance.jpg
---

[But, compliance!]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) Somehow, a welcome justification for all the superfluous gates in our software delivery process, and to embarrassingly uphold the unreasonable delays. Contrary to common belief, compliance is not a good reason to go slow. Going slow for safety is a mistake. It introduces all sorts of disorders, drives down quality, and decelerates even more till a grinding halt. No! Compliance is an excellent ground for better quality and thus to go fast, accelerate feedback, and ultimately produce better, but also more compliant outcomes.

---

But, what is Compliance, anyway? The industry, and at some point including me, tends to make an amalgam between Governance, Compliance and Risk Management, and use them interchangeably. Though, they mean different things.

**Governance** are all the activities an organisation performs to be compliant with external regulations (ECB, EMA, ...), certifications (PCI-DSS, ISO27001, ISAE 3000, ...), frameworks (ITIL, COBIT, ...), or legally binding contracts and internal regulations (the standards, policies, procedures which are translations of external regulations, certifications or frameworks in internal ways of working).

> IT governance defines the structure, processes, and mechanisms by which an organisation's IT activities are directed, monitored, and controlled to achieve business objectives. IT governance framework is essential for organisations seeking to effectively manager their IT activities, manage risks, ensure compliance, and deliver value to the organisation.

But, Governance involves more than the steps to be compliant. It also includes keeping the organisation on track while balancing the interests of all the organisation's stakeholders.

**Compliance** is to comply with relevant laws, regulations, legally binding contracts or even cultural norms. When imposed by law, regulation or contract, Compliance is, generally, not optional. In these cases, not complying increases risks for fines, reputational damage or even a shutdown of the business.

**Risk Management** is one of the Governance activities, to support Compliance. Regulations demand an organisation to manage its risks. But, good leadership also demand for Risk Management to build a successful organisation. 

A Risk is a negative outcome which negatively impact an organisation's goals, reputation, or operations resulting from ineffective leadership, ethical lapses, inadequate controls, compliance failures, or strategic errors that threaten stakeholder interests. But risks are pervasive. We can never eliminate all risks. Therefore, the need for Risk Management. *Which risks are we willing to accept and which ones not?*. **As we are taking steps to mitigate risk in one area, we inevitably introduce more risk, or new risks, in another area.**

> A good car has the best brakes.
>
> An organisation that is not compliant, or cheat on compliance, will not make it. We are compliant to be fast and better.
>
> -- a bank CIO

Speed, fast feedback, innovation, and Compliance is not a zero-sum game. We can have both. But it requires we build Compliance requirements into the delivery process, from the start. Much like the lean principle of *Building Quality In* the product, as opposed to testing it later, to be high performant and compliant we do not check for Compliance at the end, it is continuous.

![Continuous Compliance](/images/continuous-compliance/continuous-compliance.jpg)

Where do we start?

Compliance starts by understanding the regulation. Organisations often conflate "*their approach to regulation*" with regulation. Not the same thing, at all. Oftentimes, regulation is about "do we do what we say we do. The most rigorious regulation says "get two people to look at it" and "have an audit trail of what happened". Therefore, it is of utmost importance that the product team reads and understands the regulation. When I say the team, I mean everyone. This is not only the Product Manager. That is also all engineers. That is the only way to make sure product implementations are aligned with the regulation. Because now, engineers understand the implications of their code. "*To my understanding if we do this, we are good. That might be shaggy.*" The team is accountable and responsible to implement and satisfy the compliance requirements. Having that in place, is already a major step towards Continuous Compliance.

Once we understand the regulation, we can extract the compliance requirements, which in turn define controls to be implemented. The controls go onto the product backlog, and can be prioritised alongside functionality. We can give it the necessary importance compared to functionality with market value. Having said that, Compliance has also market value. Not being compliant can shut us down from the market.

As said, part of Compliance is Risk Management. That too has to become part of product development. We continuously identify risks, business operations risks as well as IT operations risks and security risks. One more reason to have business, i.e. the people doing the business operations, part of the product team to have Continuous Compliance. They are in the best place to identify business risks. Of course when Risk Management becomes a team activity, obviously engineers will also start identifying business risks, as they start to internalise the business. Same for product managers and business operations who start to identify IT operations and security risks. It becomes communicating vessels.

A predominant mode of thinking in IT is a "*Wouldn't It Be Horrible"-approach to Risk Management (Hubbard, Humble et al.). We imagine a particularly catastrophic event occurring, regardless of its likelihood/.It must be avoided at all costs. There is no sense of prioritisation.

There should not be a free pass for work to mitigate risks to jump to the front of the line. Instead, we should quantify risks using [Impact Mapping](https://www.impactmapping.org/) and prioritise using the [Cost of Delay](https://blackswanfarming.com/cost-of-delay/).

Every single day, at the start of the day, the team reviews the risks. Did we identify new risks? What is the impact of risk when it happens? What is the likelihood of the risk to happen? What is the cost to mitigate the risk? Should we mitigate the risk or can we accept the risk? All this is documented as Decision Records.

As with regulation, identified risks to be mitigated create compliance requirements, which in turn define controls. These controls go again on the backlog and are prioritised together with all other controls and functionality. Whether to prioritise a functionality before a risk mitigation control or a regulation requirement control is, in the end, a business decision and lays in the hands of the Product Manager. Note, in this case, the Product Manager is also accountable and responsible for the business operations, i.e. the turn over and costs generated by the business.

This upfront risk assessment will prevent a lot of pain when going to production. By identifying these risks we can introduce the most appropriate controls to mitigate the risk and comply with the regulation. However, the challenge will be to find the right balance of controls, in the context of the organisation and the applicable regulation, to still allow teams to deliver value fast while keeping risks at an acceptable levels.

So, if we already operate as above, we are already a long way forward. But it does not step there.

A lot of the compliance requirements is around showing evidences, have an audit trail of what happened. That is where Continuous Delivery enters with its central pattern: the [Deployment Pipeline]({% post_url 2026-01-09-what-is-continuous-delivery %}#deployment-pipeline). The Deployment Pipeline, together with Version Control, acts as an audit trail of everything that happened when getting code out of version control in production into the hands of the users.

The Version Control System tells us what changed, why it changed, when and who was involved in the change. That could be a single person (isolated programming), two people (Pair Programming) or many people (Team Programming). All of this can be recorded. Either using a combination of authentication and signing keys, commit messages, or `Co-authored-by` Git trailers. The why something changed is recorded by including a ticket number in the commit message.

The Deployment Pipeline tells us which action happened, when, on which commit, and for manual tasks it records who performed the manual task. It will also link a binary artefact with the commit that triggered the build and produced the artefact.

attaches test, and other reports like vulnerability scans to the pipeline run.

fails the pipeline on any test failure, vulnerability, code quality

## Have Two People to Look at It

Classicly, implemented in the case of isolated, solo work with formal code reviews using Pull Requests. As already discussed ([here]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}), [here]({% post_url 2022-05-30-on-the-evilness-of-feature-branching-the-problems%}), and [here]({% post_url 2024-02-22-the-good-and-the-dysfunctional-of-pull-requests %})), this has the downside of blocking delivery, therefore delaying feedback, and consequently driving quality down. In all fairness, it has the benefit of providing evidence that two people has looked at it.

If we want to keep solo work because Pair Programming or Team Programming is a cultural stretch for the team, and therefore want to keep formal code reviews, [Non-Blocking Code Reviews]({% post_url 2023-05-02-non-blocking-continuous-code-reviews-a-case-study %}) would work fine for non-regulated industries. With the proper tooling in place, we record who reviewed what. This could work for regulated industries if we have something in place that prevents production deployments as long as not all code reviews have been completed. It has the added benefit that binary artefacts can already be in a test environment before a code review happened, thus reducing the testing delays, and still accelerating feedback compared to Pull Requests.

Two or more people satisfy the requirement of "have two people to look at it". Note, no mention of a Pull Request here. Also, the Pull Request requires additional tooling outside of Version Control.

Single person can also satisfy that if it is followed by a mandatory code review. How this is implemented can have lead time and feedback cycle consequences.



## References

- [How to Measure Anything](https://app.thestorygraph.com/books/1642ec2e-e0fa-4d67-aebe-e51bab993bb2), Douglas Hubbard, 1985

- [Lean Enterprise: How High Performance Organizations Innovate at Scale](https://app.thestorygraph.com/books/be53bcd6-adf8-4c9c-9946-541a1038435d), Humble, Molesky, O'Reilly, 2014
