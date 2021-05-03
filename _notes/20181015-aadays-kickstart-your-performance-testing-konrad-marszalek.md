---
layout: note
title: Kickstart your Performance Testing
event:
  name: Agile & Automation Days
  date: 2018-10-16
author:
  name: Konrad Marszalek
  linkedin: konradmarszalek
created_at: 2018-10-16
date: 2021-04-13
meta: 4 min read
categories: 
tags: [ Testing, Performance ]
---

My notes from a performance testing workshop I followed at AADays 2018 in
Poland. It was my very first encounter with performance testing.

---

Spartez, Atlassian partner

Senior Quality Engineer

If you are a cloud company:
"*Monitor performance on production*"

## Workshop Manifesto

Focus on this workshop:

1. **learn doing** over theoretical study
2. **test feature under current development** over test regression of key features
3. **test application** over environment configuration

That is, while things you learn will be helpful in items on the right, we concentrate on the items on the left more this time.

## Meet our SuT (System under Test)

JIRA: http://18.184.154.65:8080

## Performance checks during exploratory testing

Trick: Charles proxy

- web debugging proxy
- can repeat requests even simultaneously

Google Chrome <-> Charles <-> Jira Software
remove cache

## What is good performance?

- between 10 and 300ms: you can be proud
- between 300ms and 1000ms: you know something is wrong, but it still feels natural to the user
- above 1000ms: users loose focus and you can start loosing money

source: google performance testing

Typical results:

- All response codes 2**. Duration +/- the same when increasing the number of users.
- All response codes 2**. Long durations of 1-2s.
- All response codes 2**. Timeout errors.
- Not all response codes 2**. Errors occur: 500.

## What metric describes application performance?

**Response Code** and **Duration**.

in real world you will have 1000 of these numbers

=> **Median** vs **Average**

median is primarily used for skewed distributions

**99th percentile**: the value below which 99% of the observations may be found

```plain
{1, 2, 2, 2, ,3, 14}
```

- mean: 2
- average (arithmetic mean): 4
- 99th percentile: 14

**Apdex** - application performance index

- 0 = no users satisfied
- 1 = all users satisfied

apdext = (satisfiedcount + tolerating count/2)/totalsamples

=> apdex3 = (60 + 30/2)/100 = .75

tolerable time = 4 x satisfied time

sources: newrelic and wikipedia

## Load Generation

JMeter:

- load test functional behaviour
- measure performance

design your test plan in GUI

Thread Group: configures the number of users (number of threads)

HTTPRequest: request to send

To get Reports: add listeners

## Exercise

JMeter simple request

find out how many concurrent requests our application can handle so that response time stays below <1s

## Load Shaping

How many concurrent users were there really?

use the JMeter Listener plugin: jp@gc - Active users over time

there were only 2 concurrent users instead of 10
=> ramp up time

not very intuitive
=> thread group: jp@gc - Ultimate Thread Group

## Different types of performance tests

what we have done up until now is: **Load Tests**

so many users, for that amount of time

```plain
   /--------------\
  /                \
 /                  \
/                    \
```

**Stress Tests**:looking for a break point - there are so many users, the application breaks

increasing the number of users over time

we are putting more load than the requirements of the application defined

what if the response time is already in the frustrating range: that is already a break point

```plain
          |----
     |----|
|----|
|
```

**Spike Tests**: big amount of users starting to use the application at a specific time

how good can our application handle spikes

there is no behaviour in our system that creates instability in the system

```plain
     |     |
_____|_____|_____
```

**Soak Tests** or **Endurance Tests**: testing for a long period of time (like 10 users for 8 hours)

your application works fine for 1h, but all of a sudden it dies after 1h due to a memory leak

```plain
|-------------------------|
|                         |
```

## What should be the load test duration?

most people would say: around 1h

there is no book that says how long the load test should be

use the real time performance monitoring to identify what is an acceptable load test duration

Listener: jp@gc - Response Time over Time

## Is this thread a real user?

No!

don't worry, we'll fix it (after the break)

people don't throw the same request immediately after the other

people have thinking time, send different requests: open a page, create an issue, go to another issue, ...

=> Blazemeter for Chrome: records interactions with the browser and download as JMeter test plan (needs creation of a user at Blazemeter)

- JMeter
- Selenium
- Taurus JMeter

Exercise:

refresh JIRA Kanban board with Blazemeter => 100% error rate in JMeter: problems with authentication
=> record JIRA login and add that step to the JMeter test plan

cookie based authentication using `JSESSIONID` cookie

it works in JMeter because we have this HTTP Cookie Manager in the Test Plan
(most difficult in JMeter is cross site authentication)

Our measurement now measures: send request, network latency, server response time, network latency

Doesn't measure: JS execution, DOM tree, rendering, painting in browser

can you measure the latter part: yes, JMeter can work with web drivers

## What are we measuring (test data)?

we are using the same user 10 times

opening the same kanban board 10 times

=> Data diversity

use a CSV file with the data that needs to dynamically change in the test plan

JMeter test plan and Git and CI:

can be stored in version control, but files are so big, they are not that repo friendly

can be run from CI using the command line tool

## Assertions

the kanban board should have at least 10 issues

How did we stress JIRA during the workshop?

New Relic: performance monitoring in production

(less) Typical Results:
fast responses => functional errors

## Testing gotchas we've seen

- discard Response Time measurements with errors
- measure all relevant requests
- use representative test data
- assertions to make sure you get what you expect
- jmeter should be close in the network to application. Good bandwidth.

real measurement: don't run in GUI mode, disable listeners
=> collect the raw results and analyse in JMeter

## JMeter drawback

- it is not a browser: it does not execute JS
- single instance of JMeter can spawn couple of hundreds of threads (users)
- => more users: use distributed JMeter 
- hard to track .jmx files in version control: Taurus helps here a bit

## Signal to Noise

repeat 3 times and see if you have the same results

## Store performance testing data

JMeter has the option to write data to InfluxDB

use Grafana to read from InfluxDB
