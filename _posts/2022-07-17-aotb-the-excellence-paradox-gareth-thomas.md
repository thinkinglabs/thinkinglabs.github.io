---
layout: note
title: The Excellence Paradox
event:
  name: Agile on the Beach
  date: 2022-07-08
author:
  name: Gareth Thomas
  twitter: TheStub
created_at: 2022-07-08
category: notes
tags: [ Excellence, Technical Debt, Agile on the Beach ]
image: /images/aotb-the-excellence-paradox-gareth-thomas/accelerate-to-technical-excellence.jpeg
---

Great products come from great passion, not technical excellence. The products with the best market fit, beloved of users, will often be held together with love and damp string. In their murky codebases you'll find every example of bad practice. These products of passion grow quickly, but often fail when the technical limits of their poor implementation start biting. Exceptionally high running costs, high costs of change, and increasing fragility can damage the customer relationship.

With timely intervention we can steer these products onto a better path before they crash and burn. It's possible to take a passion project, shift it towards technical excellence and create room for growth, all whilst retaining those original users.

---

Software Engineering Director

from where comes this talk?

this remark -> But the system is really really popular

we built a system with monolith, but we couldn't sell it

The best products are built with awful technical practices.

[ScholarPack](https://scholarpack.com): built for schools

- built by a teacher who taught himself to code
- the worst kind of monolith
- technologies so misused that you would cry
- still beats the competition in functionality

[MyEnergi](https://myenergi.com):

- car charger manufacturer
- electronics engineer wanted to keep his own power from solar panels
- got a customer to design the firmware and servers, embedded software running on the bare metal, no OS
- another customer designed the initial app

but what they both did was: customer first!

they did not care about the perfect design

=> building with a laser focus on the customer

[Agile Manifesto principles](https://agilemanifesto.org/principles.html):

> Principle 9: Continuous attention to technical excellence and good design enhances agility

Am I saying the Manifesto was wrong?

The Manifesto was spot on ...

we had to rewrite to scale

=> This is where companies die

if they keep growing at the stage they grow, they will fall over because of the underlying crap

a laser focus on customers is right, these companies grew because of that

-> you cannot move away from that when improving

Accelerate to Technical Excellence

- do what doesn't scale: do what is needed for the next step, plan for your growth, do the things that needs fixing now and defer the rest to later
- don't fix what isn't broken: the easiest way to break a system is to fix the technical debt, be targeted in what you pay back
- respect the legacy: remember that the "awful" and "terrible" system you are working on is paying your wages
- focus on what the customer actually needs! and know who the customer is. always focus on supporting the customer
- never let the perfect be the enemy of the good: be focused on delivering what is needed, not making everything perfect
- have a plan: know what the issues are and the work needed to solve them, then you can build this into your future estimates

> A good software engineer is just a good software engineer. The programming language is irrelevant.
>
> Therefore when hiring, sell the vision of the company, not the technology you use. [@TheStub](https://twitter.com/TheStub) [#AOTB2022](https://twitter.com/hashtag/AOTB2022)
>
> -- Thierry de Pauw ([@tdpauw](https://twitter.com/tdpauw)), [Jul 8, 2022](https://twitter.com/tdpauw/status/1545413895585677315)

> Some great advice from [@TheStub](https://twitter.com/TheStub) on working with legacy systems (or working to replace them). Love how each of these triggers a story in your head of when these rules weren't followed. [#AOTB2022](https://twitter.com/hashtag/AOTB2022)
>
> ![Accelerate to Technical Excellence](/images/aotb-the-excellence-paradox-gareth-thomas/accelerate-to-technical-excellence.jpeg)
>
> -- Gwen Diagram ([@gwendiagram](https://twitter.com/gwendiagram)), [Jul 8, 2022](https://twitter.com/gwendiagram/status/1545409498080223235)
