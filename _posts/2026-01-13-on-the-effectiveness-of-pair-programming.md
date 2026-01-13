---
layout: article
title: On the Effectiveness of Pair Programming
author: Thierry de Pauw
category: articles
tags: [ Extreme Programming, Pair Programming, Flow ]
---

A while back, when Twitter was still a thing, someone tried to make a point for code reviews being a better alternative to share knowledge over [Pair Programming](http://www.extremeprogramming.org/rules/pair.html). The main arguments put forward were economics, poor feedback and least-common-denominator performance. Let me debunk that.

---

> Hire drivers, not passengers. No more pair programming.
>
> ![Against Pair Programming, Matt Rickard](/images/pair-programming/matt-rickard-against-pair-programming.jpg)
>
> -- Matt Rickard (@mattrickard), Feb 12, 2022

What follows is a write-up of an old Twitter thread, where I dismantled the misconceptions around Pair Programming.

---

The thinking is [Taylorist](https://en.wikipedia.org/wiki/Scientific_management). It is based on the idea of efficiency over effectiveness.

It is Taylorist because the argumentation focuses on improving economic efficiency, and specifically, labour productivity. With the advent of Toyota and Lean Manufacturing, we comprehend that it has had its limitations in producing the right thing in a cost-efficient way. That is where the difference between efficiency and effectiveness comes in.

Not to say, it is a strong factory, production line mindset that is the antithesis of knowledge work. In IT, the factory metaphor only applies to the technology value stream, all the steps between Version Control and the user in production. Closing the parenthesis.

Efficiency and Effectiveness are two different things, and they cannot have the same priority.

> **Efficient**: performing or functioning in the best possible manner with the least waste of time and effort
>
> -- [Oxford Dictionaries](https://www.dictionary.com/browse/efficient)

> **Effective**: producing the intended or expected result
>
> --[Oxford Dictionaries](https://www.dictionary.com/browse/effective)

When we only focus on going fast, we prioritise efficiency. With the risk of producing the wrong thing. Which comes at a non-negligible cost. If, on the other hand, we focus on innovation, creativity and ensuring we build the right thing, we need to focus on effectiveness at the cost of efficiency. That said, when taking the [Opportunity Cost](https://en.wikipedia.org/wiki/Opportunity_cost) and the [Cost of Delay](https://blackswanfarming.com/cost-of-delay/) into consideration, effectiveness will downright outperform efficiency in cost performance.

In essence, we do not want to produce output but want to achieve outcomes. Effectiveness is about outcomes.

So, let us start with the economics ;)

The idea that when two engineers work on one task, they should be twice as fast to be acceptable is simplistic and reductionist. It ignores the benefits that surpass the initial cost or better the initial investment.

> If I may suggest it, if you divide up work for individuals and then put two people on it, then you would have two people doing the work of (specifically) one of them.
>
> It would be inefficient.
>
> Give a pair a less-pre-digested 2-person task.
>
> Save up-front costs.
>
> -- "Agile Otter" Tim Ottinger, Feb 14, 2022

The two people executing a well-known pre-digested one-person task are inefficient in a Taylorist way of working.

The efficiency gain lies in the two people designing and discovering an unknown, not-well-formulated problem. That is co-creation.

> Absolutely agree. This whole hire drivers not passengers BS stems from optimising for time to PR and not time to deliver value to customer. The flow interruptions caused due to this thinking have given rise to the monstrosity now known as ‘stacked PRs’.
>
> -- Swarup Karavadi, Feb 14, 2022

Experiments have shown that a pair spend in an initial adjustment period 60% more person-hours, and afterwards, on average, only 15% more time than a single engineer. Which is statistically insignificant.

Why would we invest an additional 15% on implementing a feature or fixing a bug? Because of higher quality! It reduces future testing and support. As such, it limits rework. Hence, it is a flow-enabling activity. It improves the flow of delivery.

The goal of any organisation is, in all honesty, to make money. To make money, organisations need to streamline their delivery (i.e. to create flow), reduce inventory and reduce time-to-market to increase feedback from users in production.

Pair Programming reduces time-to-market by half.

Therefore, Pair Programming accelerates production feedback, allowing us to make new decisions and find new ways to delight the customers. Consequently, it creates an exponential increase in customer satisfaction. This is such a grand competitive advantage.

Not only does Pair Programming results in better quality, but it also produces code that is 20% more concise than code written by a single engineer in isolation. It exhibits more encapsulation and more cohesiveness. That means, less code to maintain, which is even easier to maintain. Once more, a cost reduction.

> The argument for reduced Time-to-market may trigger the fallacy that pairing is only worth it in a product context, where TTM is important. Not true! The higher quality and streamlined code style will quickly pay off, despite hitting the market years later.
>
> -- Gregor Riegler, Feb 14, 2022

Code Reviews, on the other hand, absolutely block the flow of activity. It increases time-to-market while adding so little to quality. Additionally, it comes too late and introduces rework that easily exceeds the assumed 100% increase of workload introduced by Pair Programming.

Handovers are flow blockers. Not to mention the high cost introduced by constant context switching, which is introduced by code reviews for both the reviewee and the reviewer.

Code Reviews are also a source of communication overhead. Brooks believes communication costs are the major driver leading to [Brooks Law](https://en.wikipedia.org/wiki/Brooks%27s_law): "*Adding manpower to a late project makes it later.*"

> Code reviews are great to compare and/or learn about patterns, common pitfalls and challenges among a larger group. They’re a learning tool. That’s just not what they’re typically used for.
>
> -- Tobias Goeschel, Feb 14, 2022

Pretending the feedback given by pairs is limited to style and bikeshedding is reductionistic. As well as an expression of a lack of Pair Programming experience.

The role of the *Navigator* is to think ahead. "*What is the next problem?*". Making sure the *Driver* is never blocked. Remember, again, flow!
Moreover, thinking ahead allows the *Driver* to pick the idea and evolve it, enabling collaborative design.

Collaborative design outperforms designs done by a single person, in isolation. The sum of the parts is bigger than the whole.

From a training perspective, with Pair Programming, the senior trains by doing (not showing), which is far more effective. The trainee absorbs faster. Also, the trainee contributes directly from the start. This also increases the confidence and well-being of the trainee.

> Also my hot take of the day: if you, as a senior team member refuse to pair with more junior team members, you’re not only missing out on a learning opportunity yourself but you shouldn’t be in a leadership position.
>
> -- Emma Bostian ([@EmmaBostian](https://twitter.com/EmmaBostian)), [Feb 15, 2022](https://twitter.com/EmmaBostian/status/1493511128466526215)

Lastly, and most importantly, Pair Programming makes happier team members. They know each other better. It increases trust, which gives the courage to ask for advice and guidance. Yes, psychological safety! As reported by Google, the former employer of OP, to enable high performance.

## Conclusion

To sum it up, Pair Programming is far more cost-effective than Code Reviews.
It streamlines the delivery flow, minimises lead time and time-to-market, and accelerates feedback leading to even better quality.
It increases team members' happiness, trust and engagement.
All things that positively impact organisational performance.

I would not conclude that they do not understand how development works (and by extension, knowledge work). I would say they do not understand the economics of software delivery. They only see the obvious costs of the new thing and do not see the hidden costs of what has been commonly accepted by an industry. This says a lot about an industry and its leaders, regarding their lack of understanding of economics.

> It's the economy, stupid!
>
> -- James Carville

One last word, despite all the positives about Pair Programming, nowadays, I believe Software Teaming is a superior delivery model for all the mentioned reasons because more people design together, i.e. more backgrounds, more diversity, better products.

> All the brilliant minds working together on the same thing, at the same time, in the same space, and at the same computer."
>
> -- Woody Zuill

## Bibliography

- [Pair Programming Illuminated](https://www.goodreads.com/en/book/show/1762375), Laurie Williams and Robert Kessler
- Each day ~~his~~ its fair share of bullshit, Thierry de Pauw on Twitter
- [Effectiveness or Efficiency: Agile Shouldn't Feel Like a Fight](https://www.infoq.com/news/2019/09/agile-effectiveness-efficiency/), Ben Linders interviewing Tony O’Halloran
- [The effectiveness of pair programming: A meta-analysis](https://www.sciencedirect.com/science/article/abs/pii/S0950584909000123)
- [Pro Pair Programming](https://medium.com/@TonyBologni/pro-pair-programming-763622b2bb7), Anton Stöckl
- [What Google Learned From Its Quest to Build the Perfect Team](https://www.nytimes.com/2016/02/28/magazine/what-google-learned-from-its-quest-to-build-the-perfect-team.html)
