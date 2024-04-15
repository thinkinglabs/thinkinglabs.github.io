---
layout: article
title: A Cost-Savings Case for Team Topologies
author: Thierry de Pauw
category: articles
tags: [ Conway's Law, Team Topologies ]
---

Occasionally, I am asked to help out with technology due diligence. Recently, I was involved in a different kind of due diligence. We were asked how the technology organisation can save on costs. After some analysis and many interviews, we suggested a [Team Topologies](https://teamtopologies.com/) approach to organising teams that came with an impressive estimated cost reduction.

---

The CEO had a problem. His investors were pushing him to reduce costs, but multiple attempts by his tech team to slash expenses had not worked. Board members suggested that he bring in outside advice to unblock the cost-savings effort. Soon enough a colleague and I were embarking on a savings review, a more focussed version of our usual technical due diligence investigations.

At the time, the technology team had already drafted a plan to reduce costs and improve the team's effectiveness. But, unfortunately, many of the proposed improvements could not be implemented. The organisation experienced a cash-flow problem. The suggested advancements required upfront investments that would only pay back later. They had to pay more now to reduce costs later. Yet, the organisation could simply not execute the upfront investments. As a result, many of the enhancements could not be carried out and were parked.

When analysing the technology organisation, we noticed a fairly classic, project-oriented, silo-ed organisation. The technology organisation under the CTO consists of a Project Management Office (PMO) with project managers and business analysts; an IT Development Department with software and test engineers, DBA and IT architects; a Service Center with service desk engineers running support and helpdesk; an Infrastructure Team, a Security and Operations Team and finally a Data and Business Intelligence (BI) Team with data engineers and data architects.  Every department comes with its leaders and a fair share of line managers.

![Organisation Chart](/images/a-cost-savings-case-for-team-topologies/org-chart.jpg)

The resulting tech organisation comprised over 90 staff members. That is already a fairly large technology organisation for a reasonably standard product requiring low IT demand. The company spent over 6 million EUR on IT staff salaries.

Because of a history of acquisitions, the technology organisation is responsible for hundreds of IT systems. Any change to any of these systems was handled as a project. IT Development staff were assigned to projects together with a project manager and a business analyst from the PMO. Once projects were finalised they were handed over to the Service Center that maintained the support. Classic!

Not surprisingly, as the company is organised around specialities, there is a big need for coordination requiring many project managers. As it goes, the software development lifecycle (SDLC) also comes with lots of communication overhead due to the coordination, many gatings, handovers, signoffs and approvals, and finally a multitude of cascading daily standup meetings: standup for the project, standup within the PMO, standup within the IT development department. This all comes with a considerable cost in money and one would expect many delays. Surprisingly, estimations were adequately accurate, deliveries were on time, and lead times matched predictions. We suspect the organisation became relatively good at incorporating possible delays into the estimations.

After a short investigation, we recommended several cost-saving options. One of them consisted of focusing the activities around three critical core business IT systems, the key IT systems that support the organisation's value proposition. Maintenance for the remaining IT systems would, in that case, be off-shored as much as possible. Consequently, the technology organisation would be reorganised around these three key IT systems using [Team Topologies](https://teamtopologies.com/) to better satisfy [Conway's Law]({% post_url 2021-05-07-shades-of-conways-law %}). Of course, we advise the organisation to amend the recommendation where appropriate to come to a suitable plan. Still, we believe that our suggestion is achievable and desirable.

The resulting technology organisation would now consist of the following teams:

- Three [Stream-Aligned Teams](https://itrevolution.com/articles/four-team-types/). One per core IT system. Each team consists of a product manager, a senior software engineer, three software engineers and a senior test engineer. For one of the teams, responsible for an end-user-facing system, we advocated to include a UX designer in the team. On average, every team would have an annual salary cost of about 360.000 EUR.
- One more [Stream-Aligned Team](https://itrevolution.com/articles/four-team-types/) for data and business intelligence. The organisation collects a striking amount of valuable data. In their industry, they are sitting on the biggest amount of data allowing them to make a difference business-wise. Therefore, focusing a team on data and business intelligence and developing offerings around that data makes total sense. The team includes again a product manager, a senior data scientist, two data engineers and a senior test engineer. The annual salary cost would be around 360.000 EUR.
- A [Platform Team](https://itrevolution.com/articles/four-team-types/) responsible for everything infrastructure, operations and security. The team involves a product manager, a senior systems engineer, three systems engineers, a security engineer and again a senior test engineer. Here, the annual salary cost is likely 390.000 EUR.
- A DBA [Enabling Team](https://itrevolution.com/articles/four-team-types/) consisting of the only DBA the organisation had at the moment. There were plans to hire an additional DBA to disable the bottleneck. That is certainly a good decision.
- Conservatively, we kept the Service Center team as it was with a head count of 15, which is big. The annual cost is 740.000 EUR. The Service Center is responsible for all support and helpdesk activities.

| Team                       |  # | Annual Cost       |
|----------------------------|------------------------|
| Stream Aligned Team 1      |  6 |       350.000 EUR |
| Stream Aligned Team 2      |  6 |       360.000 EUR |
| Stream Aligned Team 3      |  7 |       380.000 EUR |
| Data Stream Aligned Team   |  5 |       360.000 EUR |
| Platform Team              |  7 |       390.000 EUR |
| DBA Enabling Team          |  1 |        70.000 EUR |
| Service Center             | 19 |       740.000 EUR |
|                            |    |                   |
| **Total**                  | 51 | **2.650.000 EUR** |

This proposed technology team organisation involves only 51 staff with a total cost of 2,65 million EUR. Compared to the current over 6 million EUR spent on IT staff salaries, this is half of the current spending. That is already a splendid cost reduction. But we are not there yet. Remember, we also advised to offshore all maintenance to the remainder of the IT systems. We need to also take that extra cost into account.

We roughly estimated the offshoring cost for maintenance at about 1,1 million EUR per year, for a team of ten engineers comprised of two senior software engineers, seven software engineers and one senior test engineer. This brings the total IT staff cost to 3,75 million EUR.

| Team                       |  # | Annual Cost       |
|----------------------------|----|-------------------|
| Offshore Maintenance Team  | 10 |     1.100.000 EUR |
| Onshore Teams              | 51 |     2.650.000 EUR |
|                            |    |                   |
| **Total**                  |    | **3.750.000 EUR** |

Be aware that, the stream-aligned teams are fully responsible for defining the product direction, planning, testing and running the helpdesk activities. This removes any handover activities and the need for business analysts, project managers and the service centre. The team has complete authority from ideation till release in production and operating the system. That being so, it might be we can reduce the headcount for the Service Center. Our approach is still conservative in that regard.

This plan introduced two new roles unknown to the present tech organisation:

- Product Managers.
- a UX Designer.

The need for a Senior Product Manager, a Senior Test Engineer and/or a UX Designer is a recurrent recommendation in our technology due diligence.

Generally, we are convinced that architecture and design activities should be the responsibility of the Stream-Aligned Teams. But, this requires enough seniority in the teams. Despite that, we still believe there is room for an Architecture Enabling Team involving one or more Enterprise Architects. Their role is to keep an overview of the organisation's IT landscape.

| Team                       |  # | Annual Cost       |
|----------------------------|------------------------|
| Architecture Enabling Team |  1 |       100.000 EUR |
| Offshore Maintenance Team  | 10 |     1.100.000 EUR |
| Onshore Teams              | 51 |     2.650.000 EUR |
|                            |    |                   |
| **Total**                  |    | **3.850.000 EUR** |

This brings the total IT staff cost to 3,85 million EUR. Compared to the presently over 6 million EUR spent on IT staff, that is still a comparative cost reduction of roughly 2,5 million EUR.

Regarding testing, we proposed two options:

- Either testers are embedded in the Stream-Aligned Teams, as suggested in our indicative plan.
- Or testers are part of a Test [Enabling Team](https://itrevolution.com/articles/four-team-types/) focussed on enabling teams with testing. In that case, the team embodies a test manager and three senior test engineers.

| Team                       |  # | Annual Cost       |
|----------------------------|------------------------|
| Test Enabling Team         |  4 |       260.000 EUR |
|                            |    |                   |
| Embedded testers           |  5 |       310.000 EUR |

In both cases, the role of the testers is not to execute tests. It is the responsibility of everyone in the Stream-Aligned and Platform Teams to deliver quality. The role of the Test Engineers is to coach and enable the Stream-Aligned Teams and Platform Teams with quality, testing and a risk-management mindset.

With only three Testers and a Test Manager compared to five Testers, the Test Enabling Team is more cost-effective compared to having the testers embedded in the Stream-Aligned Teams. From a cost perspective, embedding testers in Stream-Aligned Teams will not scale. The same is true for DBAs and Architects. On the other hand, going for a Test Enabling Team requires enough QA maturity inside the Stream-Aligned Teams. Nevertheless, choosing one over the other will, at the moment, nearly not affect the total IT staff budget.

Although our cost estimations are not precise and probably lack nuance, they still give an impression of what might be possible as a cost-saving merely by adopting a different way of working, organising work differently, being aligned with Conway's Law, and focusing on a flow of delivery.

Bear in mind, that the projected cost savings only take IT staff costs into account. We expect the advised organisation structure will lead to more cost savings due to shorter lead times and considerably fewer coordination overhead. The focus on product teams will also come with reduced support costs, faster feedback and intrinsically reduced cost of delay and opportunity costs.

## Acknowledgement

[Douglas Squirrel](https://douglassquirrel.com/) for reviewing this article and the insightful collaboration.

Bunnahabhain for the creative support.
