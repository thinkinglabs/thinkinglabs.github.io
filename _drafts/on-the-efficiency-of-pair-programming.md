---
layout: article
title: On the Efficiency of Pair Programming
author: Thierry de Pauw
category: articles
tags: [ Extreme Programming, Pair Programming, Flow ]
---

A while back, [Matt Rickard](https://twitter.com/mattrickard) [tried to make a point for code reviews](https://twitter.com/mattrickard/status/1492548554426048514) being a better alternative to share knowledge over [Pair Programming](http://www.extremeprogramming.org/rules/pair.html). The main arguments pushed forward were economics, poor feedback and least-common-denominator performance. Let me debunk that.

> Hire drivers, not passengers. No more pair programming.
>
> ![Against Pair Programming, Matt Rickard](/images/pair-programming/matt-rickard-against-pair-programming.jpg)
>
> -- Matt Rickard ([@mattrickard](https://twitter.com/mattrickard)), [Feb 12, 2022](https://twitter.com/mattrickard/status/1492548554426048514)

---

The thinking is [Taylorist](https://en.wikipedia.org/wiki/Scientific_management) and based on the idea of efficiency over effectiveness.

It is Taylorism because the arguments focus on improving economic efficiency, and more specifically labour productivity. With the advent of Toyota and Lean Manufacturing, we now know that this had its limitations in producing the right thing in a cost efficient way. This is where the difference between efficiency and effectiveness comes in.

Efficiency and Effectiveness are two different things and they cannot have the same priority.

> **Efficient**: performing or functioning in the best possible manner with the least waste of time and effort
>
> -- [Oxford Dictionaries](https://www.dictionary.com/browse/efficient)

> **Effective**: producing the intended or expected result
>
> --[Oxford Dictionaries](https://www.dictionary.com/browse/effective)

When only focusing on going fast, we prioritise efficiency. With the risk of producing the wrong thing. Which comes at a non-negligible cost. If on the other hand we focus on innovation, creativity and making sure we produce the right thing, we need to focus on effectiveness at the cost of efficiency. That said, when taking the opportunity cost and cost of delay into consideration, being effective will straight outperform being efficient in cost performance.

Let's start with the economics ;)
The idea that because 2 devs work on one task they should be twice as fast in order to be acceptable is simplistic and reductionistic. It ignores the benefits that surpass the initial cost or better the initial investment.

Experiments have shown that a pair spend in an initial adjustment period 60% more person-hours, afterwards on average only 15% more time than a single dev. Which is statistically insignificant. (

Why would you invest an additional 15% on implementing a feature or fixing a bug?
Higher quality!
Which reduces future testing and support and as such reduces rework. It's a flow enabling activity.

Because of that, flow improves.
The goal of any org is to actually make money.
To make money, orgs need to streamline their delivery (flow), reduce inventory and reduce time-to-market to increase production feedback.
Pair Programming reduces time-to-market by half.

Therefore, Pair Programming accelerates production feedback, allowing us to take new decisions, and find new ways to delight the customers. As such creating an exponential increase in customer satisfaction

Not only does Pair Programming produce higher quality, but it also produces code that is 20% more concise than code produced by a single dev. It shows more encapsulation and more cohesiveness.
Means less code to maintain that is easier to maintain. Again a cost reduction.

Code Reviews on the other hand is a bloody flow-blocking activity that increases time-to-market and adds very little to quality. In addition, it comes too late and introduces rework that easily exceeds the assumed 100% increase of workload introduced by Pair Programming.

Not to mention the high cost introduced by constant context switching introduced by code reviews for both reviewee and reviewer.

Code Reviews are also a source of communication overhead. Brooks (yes Brooks Law) believes communication costs are the major driver leading to Brooks Law "Adding manpower to a late project makes it later".

Pretending the feedback given by pairs limits to style and bikeshedding is reductionistic and an expression of a lack of Pair Programming experience.

The role of the navigator is to think ahead. "What is the next problem?". Making sure the driver is never blocked. Remember, flow!
Also, the thinking ahead, allows the Driver to pick the idea and evolve it. Collaborative design.

Collaborative design outperforms designs done by a single person. The sum of the parts is bigger than the whole.

From a training perspective, in Pair Programming the senior trains by doing (not showing) which is far more effective. The trainee absorbs faster. Also, the trainee contributes directly from the start. Which also increases the confidence and wellbeing of the trainee.

> Also my hot take of the day: if you, as a senior team member refuse to pair with more junior team members, you’re not only missing out on a learning opportunity yourself but you shouldn’t be in a leadership position.
>
> -- Emma Bostian ([@EmmaBostian](https://twitter.com/EmmaBostian)), [Feb 15, 2022](https://twitter.com/EmmaBostian/status/1493511128466526215)

Lastly, and most importantly, Pair Programming makes happier team members. They know each other better. It increases trust which gives the courage to ask for advice and guidance.
Psychological safety!
Reported by Google, former employer of OP, to enable high performance.

To sum it up, Pair Programming is far more cost-effective than Code Reviews.
It streamlines flow of delivery, reduces lead time and time-to-market.
It increases quality.
It increases team members happiness and trust.
All things that positively impact org performance.

I wouldn't say, they do not understand how development works.
I would say, they do not understand the economics of software delivery.
They only see the obvious costs of the new thing and do not see the hidden costs of what is common to them.



## Bibliography

- [Pair Programming Illuminated](https://www.goodreads.com/en/book/show/1762375), Laurie Williams and Robert Kessler
- [Each day ~~his~~ its fair share of bullshit](https://twitter.com/tdpauw/status/1493234376217354242?s=20), Thierry de Pauw on Twitter
- [Effectiveness or Efficiency: Agile Shouldn't Feel Like a Fight](https://www.infoq.com/news/2019/09/agile-effectiveness-efficiency/), Ben Linders interviewing Tony O’Halloran
- [The effectiveness of pair programming: A meta-analysis](https://www.sciencedirect.com/science/article/abs/pii/S0950584909000123)
