---
layout: article
title: "Parent-Child Dynamics at Work: It Has To Be a Leadership Problem, right?"
author:
  name: Thierry de Pauw
  twitter: tdpauw
category: articles
tags: [ Leadership, Organisations ]
---

[Corporate Rebels](https://www.linkedin.com/company/corporate-rebels---the-search-for-the-happy-grail) posted on LinkedIn "*[Most workplaces are stuck in the Parent–Child script](https://www.linkedin.com/feed/update/urn:li:ugcPost:7521142361360416769/): managers act as parents; employees act as children. Self-managing organisations flip it. They cultivate Adult–Adult relationships.*" [As much as I would like to confirm this](https://www.linkedin.com/posts/tdpauw_as-much-as-id-like-to-confirm-this-that-ugcPost-7522682242566029312-aZV9/). It has to be a leadership problem, right? For a long time, that was also my firm conviction. However, organisational reality is more nuanced. As confronting as this may seem, for many workplaces, the workplace as a whole — i.e. staff and leadership together — creates and nurtures this Parent-Child relationship.

---

*Update Nov 22nd, 2026: Add additional sources.*

*Update Nov 22nd, 2026: Improve the conclusion.*

---

> [Parent-Child dynamics at work] comes from psychologist Eric Berne.
>
> He showed that in every interaction we slip into one of three “ego states”:
>
> - 👉 Parent: authoritative, nurturing, disciplinarian.
> - 👉 Adult: independent, rational, problem-solving.
> - 👉 Child: dependent, playful, compliant.
>
> Most workplaces are stuck in the Parent–Child script:
>
> - Managers act as Parents (giving orders, granting approval).
> - Employees act as Children (obeying, complying, seeking permission).
>
> The problem? That script keeps people dependent, disempowered, and silent.
>
> -- [Corporate Rebels](https://www.linkedin.com/company/corporate-rebels---the-search-for-the-happy-grail), [Oct 28, 2026](https://www.linkedin.com/feed/update/urn:li:ugcPost:7521142361360416769/)

When people come together to form a group, they naturally operate at two distinct levels (Bion, 1961).

- the **Work Group**: focused on realising a task, highly energetic capacity to engage with reality and truth (time and constraints), and encourages member development and autonomy. A conscious understanding.
- the **Basic Assumption Group**: when a group faces strong emotions — anxiety and uncertainty — they lose touch with their purpose and unconsciously adopt defence mechanisms.

Work Group and Basic Assumption Group are group mentalities. They are facets of the group, not the people (Bion, 1961).

## Unconscious Defence

When the group stops operating as a Work Group, it collapses into one of three primitive modes, the *Basic Assumptions*. The feeling of security decides unconsciously which basic assumption to adopt. In all three modes, the manager is not seen as a leader, but as a receptacle for dumping the shared emotions (Bion, 1961).

- *Pairing Group*: focuses unconsciously on two individuals (or two ideas) in the hope that their interaction will create some sort of fantasy, something good, that will solve all current problems (adopting microservices, operating under Kubernetes, ...).
- *Fight-Flight Group*: its primary purpose is to preserve itself by either attacking an enemy or running away from the threat (us vs them, product vs engineering vs operations, spending energy refactoring instead of delivering value, ...).
- *Dependent Group*: helpless, ignorant, dependent on the leader who will provide all the answers ("*Tell us which architecture to implement*", refusing to make local decisions to avoid risks of failures, ...). This is the same dependence as a child towards a parent.

The root cause for the Parent-Child dynamic is an inevitable output from the group operating in *Basic Assumption Dependency*. This contradicts the classic organisational discourse that leaders impose control on passive staff members.

As confronting as it may be, for many workplaces, it is the workplace as a whole, i.e. leaders and staff, that creates and nurtures this Parent-Child relationship. The dynamic is emergent. The group actively pulls the leader into a "Parent" role as an unconscious defence mechanism for shared emotions. The group relies on the leader for actions, thoughts, and feelings. The group looks upwards, expecting the leader to provide answers, direction, and to fulfil their needs.

The group hates learning from experiences, lacks development, does not want to digest, and sabotages the group. They expect the leader to solve everything. The leader protects the group and provides them with an illusion of grandeur.

This pattern is an unconscious coping mechanism for emotions. Facing real-world complexity creates psychological tension. This distracts the group from their purpose.

## The Leaders Trap

Most leaders fall into this trap because it flatters their competence and boosts their ego. Once they provide answers or direction, they become the "Parent".

This introduces a vicious cycle. The team can blame the "Parent" whenever something bad happens, completely disabling their own accountability.

Interestingly, whenever the leader steps out of this role — let's say, a new progressive leader enters the organisation and wants to change the culture — the group is going to fight the leader (Bion, 1961).

I have seen this behaviour before at a client. A new outside manager was appointed to a team in a conservative organisation with a micro-management culture. His leadership style was one based on vision and goals: "*Here is the mission. Do whatever you want. I do not care as long as it fulfils the mission.*" Many team members, unused to this style, had a hard time with this manager. They critiqued the manager, tried to force the manager into handholding, or listened selectively to get direction. In the end, the manager did have to fire two staff members to break the status quo (more on this in [Containment Over Abandonment](#containment-over-abandonment)).

When the new leader says "*I want to empower the team to take ownership!*", the team does not know how to do this — introducing anxiety about the risk of failure. To defend themselves from this anxiety, the team will unconsciously force the new leader back into the "Parent" role. If that does not work, the team will either reject the leader (as unhelpful or lacking direction), shift to fight-flight mode (fighting the new initiative or passive-aggressively fleeing), or shift to pairing (waiting for a new reorganisation).

## Temporal Memory

Because of the group's temporal memory, over time, these defence mechanisms become elements of the culture. It becomes an aspect of the external reality for old and new staff members (Menzies, 1960). Team members will force new hires into the same Parent-Child relationship.

## Fire Everyone Fallacy

In that case, the natural reaction would be to fire the staff because they keep the culture in place. However, it does not remove the structure. When hiring new staff, the same behaviour will come back, because of that group's temporal memory.

## Containment Over Abandonment

When asked for direction, the leader must resist providing the answer. Instead, leadership needs to contain the anxiety. The capacity to absorb and make sense of distress to ensure the team stays in the Work Group mode and does not digress to a basic assumption ("*I understand the outcomes of this migration are uncertain, but we can reduce the risks by running small experiments.*"). It requires setting up guardrails (using platforms, CI/CD pipelines, ...) and running blameless post-mortems.

Telling a team "*Figure it out yourselves, you're empowered now.*" is not empowerment. It is abandonment. Abandonment triggers panic and pushes the team straight into Fight-Flight or passive-aggressive Dependency.

However, we often do need to remove some key staff members. Basic Assumption Groups tend to appoint rigid members as informal leaders that maintain the status quo.

## Conclusion: the Apparent Paradox

Deming (1982) famously argued that systemic problems are created by leadership; therefore they must be solved by leadership. While Bion (1961) shows us that the Parent-Child dynamic is actually co-created by the entire workplace (staff *and* leadership together), Deming's conclusion remains valid: leadership still holds the lever to break the cycle by containing the team's anxiety so it can shift back into Work Group mode. Leaders have a responsibility to resist the ego boost of the [leadership trap](#the-leaders-trap). That is exactly what separates true servant-leaders from mere status-seeking managers.

## Related Articles

- [Beyond the Shades of Conway's Law - Scale: Conway's Corollary]({% post_url 2026-10-31-beyond-shades-of-conways-law-scale %})
- [Beyond the Shades of Conway's Law - Dynamics: Conway's Time Component]({% post_url 2026-11-05-beyond-shades-of-conways-law-dynamics %})

## Bibliography

- [A Case-Study in the Functioning of Social Systems as a Defence Against Anxiety](https://journals.sagepub.com/doi/10.1177/001872676001300201), Isabel E. P. Menzies, 1960
- [Experiences in Groups and Other Papers](https://app.thestorygraph.com/books/00a599d7-49d1-4b35-9d19-a67652910ed2), Wilfred R. Bion, 1961
- [Out of the Crisis](https://app.thestorygraph.com/books/b79ebdec-b267-4585-9af4-b5b68b30f5e5), W. Edwards Deming, 1982
- [When we talk about Parent-Child dynamics at work, it’s not a dig at parenting](https://www.linkedin.com/feed/update/urn:li:ugcPost:7521142361360416769/), Corporate Rebels, 2026

## Additional Sources

- [A psychologist's casual review: Experiences in groups by Wilfred Bion](https://www.youtube.com/watch?v=PcOqtLXcpOw), Talking Psychology
  
  A short, 22 min introduction to Bion's Experiences in Groups covering the essentials such as Work Group, Basic Assumption, and Valency. I found it helpful after reading the book as the book is notoriously difficult to digest. It is dense with 1940s Tavistock psychoanalytic jargon (Klein, Freud, and others).
