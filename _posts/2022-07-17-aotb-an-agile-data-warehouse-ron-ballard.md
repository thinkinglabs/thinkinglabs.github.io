---
layout: note
title: An Agile Data Warehouse
event:
  name: Agile on the Beach
  date: 2022-07-08
author:
  name: Ron Ballard
  linkedin: ronballard
created_at: 2022-07-08
category: notes
tags: [ Agile, Data, Agile on the Beach ]
---

Data Warehouses are normally seen as big, expensive, lengthy, waterfall projects, using complex and costly tools.  They don't need to be.  As someone who has helped several teams to build successful data warehouses, I know that an Agile approach is much better, and in this talk I will explain how we do this.  We can deliver incremental, useful reports and applications within weeks of starting the project and can continue to consolidate an organisation's data, improving its quality and the meaningful insights it can deliver.  At the same time we develop wider understanding of the data, often leading to improved business processes.

---

## What is a Data Warehouse? and Why should you want one?

you want a single view of what the customer is
-> application-neutral, organisation specific information

vs application-specific information

in the past, we were not allowed to query the production database because they were so slow -> born of Data Warehouses

more Data Warehouse assumptions:

- temporal data: keep data over a period of time, application already have that information also
- aggregated data: summary data only, to make it smaller ... nobody wants this any more, you want all the data

these days:

- contain all the data
- contain all the details

must be:

- as simple as possible
- very reliable
- fast

## Big Project, Big Vendor and why and how to avoid them

whatever the size of the org because they span most, if not all systems

you should avoid them:

- because they will drag all your money
- their solutions are more expensive, more complex and less efficient

how to avoid:

- trust your own developers, your own team, they know what they are doing
- if you can't understand what the implementation partner is saying, don't employ them

they will do a traditional approach:

armies of strategy consultants, data modellers, enterprise architects working for years to design the ultimate solution

## How an agile approach works well for Data Warehouse project?

- first talk to your users
- find out what they use most
- find out something they want but cannot do now
- find out where this data is
- copy it into your "staging" read
- profile it
- improve it
- build something that uses it
- repeat

we have a point on the horizon where we want to go

-> now we start to build the small bits and pieces one at a time to get their

=> Incremental Data Model

it will be better than one that is designed up-front

... as long as we refactor ruthlessly

most things will not change, but when they do, we must change the related data and model, it is not as bad as you might think

you start with a small data model, then you add more, and you add more, and you add more, ...

- common, "universal" data models do not work
- understanding your organisation's data, and how it is used, is hard
- when you understand it, then the data model is easy
- and you can change it easily -> don't worry about getting it right first

you need to understand how databases work

> DHH has always argued that if you are writing an application backed by a relational database you should damn well know how a relational database works.
>
> -- Martin Fowler

books:

- [Relational Database for Agile Developers](https://www.goodreads.com/book/show/39794811-relational-databases-for-agile-developers), Ron Ballard
- [SQL Antipatterns](https://www.goodreads.com/book/show/7959038-sql-antipatterns), Bill Karwin

## A simple architecture pattern that works

Source => SQL (extract data) => Staging (do joins, ...) => SQL (restructuring and cleaning) => Warehouse

repeat every night

big organisations reckon it takes 4 months what we do in 4 hours!

## Complete Refresh vs Changed-Data Capture

for most tables, it is feasible to drop and recreate every night

for very large tables:

- identify changes by timestamp, if reliable
- triggers in source to identify changes
- difference calculation -> flat files (see approval tests from Emily)

The ETL Tool Solution

- really complicated, inefficient

-> the equivalent SQL Version

- far simpler

why would you buy a tool that would do all of that?

=> Short Simple Script to populate target tables from source tables + a controlling script

-> no views, no stored procedures

Small Scripts

- 154 bytes to 440 bytes
- some scripts can get to 100 lines

Useful Tools

- data profiling: (Ben wrote one)
  
  shows column names, data types
  
  calculated data: what is the minimum, maximum value; how many distinct values; max actual length
  
  frequencies: most common values, common data patterns

- data quality monitoring: automated testing on all the data that has been loaded into the data warehouse -> dashboards, drill-down, charts

Book: [Small, Sharp, Software Tools](https://www.goodreads.com/book/show/43411783-small-sharp-software-tools), Brian Hogan

about the Linux command line

on the left are mandatory, on the right are personal choices

| Tool |      |
|------|------|
| wiki | Track, far better than most commercial wikis like Confluence |
| Linux |  non-negotiable, I will not build a data warehouse on a Windows Server |
| database | PostgreSQL, because it is free, rock-solid, it hosts one of the biggest datasets in the world |
| source-code control | SVN |
| plain text editor | |
| procedural language | Java |

Free Tools from thedatastudio.net:
<https://www.thedatastudio.net/download.htm>
