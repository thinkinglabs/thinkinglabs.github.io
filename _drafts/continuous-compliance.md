---
layout: article
title: Continuous Compliance
author: Thierry de Pauw
category: articles
tags: [ Compliance, Continuous Delivery ]
---

[But, compliance!]({% post_url 2022-02-22-on-the-evilness-of-feature-branching-but-compliance %}) Somehow, a welcome justification for all the superfluous gates in our software delivery process, and to embarrassingly uphold the unreasonable delays. Contrary to common belief, compliance is not a good reason to go slow. Going slow for safety is a mistake. It introduces all sorts of disorders, drives down quality, and decelerates even more till a grinding halt. No! Compliance is an excellent ground for better quality and thus to go fast, and accelerate feedback, to ultimately produce better, but also more compliant outcomes.

---

But, what is compliance, anyway? The industry, and at some point including me, tends to make an amalgam between governance, compliance and risk management, and use them interchangeably. Though, they mean different things.

**Governance** are all the activities an organisation performs to be compliant with external regulations (ECB, EMA, ...), certifications (PCI-DSS, ISO27001, ISAE 3000, ...), frameworks (ITIL, COBIT, ...), or legally binding contracts and internal regulations (the standards, policies, procedures which are translations of external regulations, certifications or frameworks in internal ways of working).

But, governance involves more than the steps to be compliant. It also includes keeping the organisation on track while balancing the interests of all the organisation's stakeholders.

**Compliance** is to comply with relevant laws, regulations, legally binding contracts or even cultural norms. When imposed by law, regulation or contract, compliance is, generally, not optional. In these cases, not complying increases risks for fines, reputational damage or even a shutdown of the business.

**Risk Management** is one of the governance activities, to support compliance. Regulations demand an organisation to manage its risks. But, good leadership also demand for risk management to build a successful organisation. 

A Risk is a negative outcome which negatively impact an organisation's goals, reputation, or operations resulting from ineffective leadership, ethical lapses, inadequate controls, compliance failures, or strategic errors that threaten stakeholder interests. But risks are pervasive. We can never eliminate all risks. Therefore, the need for Risk Management. *Which risks are we willing to accept and which ones not?*. **As we are taking steps to mitigate risk in one area, we inevitably introduce more risk, or new risks, in another area.**

> A good car has the best brakes.
>
> An organisation that is not compliant, or cheat on compliance, will not make it. We are compliant to be fast and better.
>
> -- a bank CIO

Speed, innovation, better outcomes vs compliance is not a zero-sum game. We can have both. But it requires we build compliance requirements into the delivery process, from the start. Much like the lean principle of *Building Quality In* the product, as opposed to testing it later, to be high performant and compliant we do not check for compliance at the end, it is continuous.

Where do we start?

Regulation -> Requirements -> Controls -> non-functional requirements

part of the backlog

one reason why the product team needs to read and understand the regulation

the product team is accountable for the compliance requirements



## References

- [Lean Enterprise: How High Performance Organizations Innovate at Scale](https://app.thestorygraph.com/books/be53bcd6-adf8-4c9c-9946-541a1038435d), Humble, Molesky, O'Reilly
