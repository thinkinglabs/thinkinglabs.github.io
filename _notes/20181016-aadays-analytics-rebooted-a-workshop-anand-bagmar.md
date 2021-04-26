---
layout: note
title: Analytics rebooted - a workshop
event:
  name: Agile & Automation Days
  date: 2018-10-16
author:
  name: Anand Bagmar
  twitter: BagmarAnand
date: 2021-04-13
meta: 7 min read
categories: 
tags: [ Testing, Analytics ]
---

My notes from the Anand Bagmar's Analytics workshop I followed at AADays 2018 in
Poland.

---

[Essence of Testing](https://essenceoftesting.blogspot.com/)

## What is Analytics?

from a products perspective
it's the air products breath
it's the blood flowing through the product

it is a way to capture data
collect it in a meaningful way
allowing you to analyse it
and create reports

not just for web, also for mobile, IoT

## Tools for Analytics

- Google Analytics: simplest free analytics tool
- SiteCatalyst
- Amplitude
- Open Source tools that can be used from an analytics perspective

it would be separate from your regular infrastructure
you don't want it to become a bottleneck

## Why is Analytics Important?

you want to know how the product works, how the true conversation is

the Business is only interested how the feature helps in converting customers, they are not interested in the technology
=> we are enablers

## How is this data useful?

it helps us to understand your users: who they really are, what are they doing
it helps for taking new decisions

## Analytics vs BI

analytics is a way to collect data
BI is applying intelligence on top of data

## Real Examples

startups

mobile apps: you cannot force the user to upgrade the app, it is still the user's choice to upgrade
(I always turn off auto-upgrade on mobile devices: I want to be in control when to upgrade an app.)

Maybe not a very good example:

Amazon: if the analytics is not working, it won't impact the business, they are still selling, they can still measure what the net revenue is

blogging: here also if the analytics break, the blog is still available

Good example where Analytics become a critical part of the Business:

Netflix: first company to move away from buying content towards producing content; they can do this because they have so much data on what their users want

vs

traditional movie producing house (like Sony Pictures, ...): there is still a risk, they only have the data about how many people went to the movie, they don't know how many times a person watched the movie, how many times they stopped, started over, ...

It is really, really important to understand the business impact!
how do I know if this feature will work or not, what do I need to measure
a lot of this work starts month before starting the implementation

## Implementing Analytics

it is part of the regular requirements

it goes through the same process

- requirements
- development
- testing
- release
- monitor

in case of Analytics you are not done when it is implemented and released, you need to monitor it too

## Techniques to Test Analytics

### Testing the End Report

I should be able to track feature A and feature B independently
what is the change that happened that lead to this behaviour

Pros:

- ensure report is setup correctly

Cons:

- licensing: additional infrastructure and licensing costs before you go into production

  you need to test it in a staging environment

- reports not yet setup

  in staging environment because there is no data available

- validate all requests are sent/captured

  how do I know all data is collected: all requests are coming in, no duplication, what if some requests are dropped

Biggest problem of this approach: it is TOO LATE
everything is already done: development is done, testing has been done
developers moved on to do something else

### Start testing at the Source

move the testing of Analytics earlier into the process

But, what is the Source?

two places:

- one during development
- and one during the testing cycle
- and last when everything is done right before releasing

using developer tools like: Chrome Developer Tools

- open the Network tab, click on a link and search for the Google Analytics requests

Google Analytics:

- you add a lightweight JavaScript library provided by Google
- based on the requirement of what I want to track I assign an event
- example: search + what is he searching for
- the other thing I would like to track is: what was the user doing on my site before this event

=> on the click of Search several requests need to happen:

- collect the context of what the user was doing and send it to Google Analytics
- once that is done, execute the search itself

when hitting Search: collect data (`utm##`) and add that as headers to the HTTP request

at this point I don't really care if the report is already setup or not

Search -> CDN requests
             -> requests to your backend
             -> requests to the analytics server

if the requests to the Analytics server fail, you don't want the rest to not work

for instance: ad-blockers blocking analytics requests
=> async approach to Analytics

- For web-based tools this works well.

- For mobile apps this does not work, you have to setup a proxy like [Charles Proxy](https://www.charlesproxy.com/)

  You configure your mobile device to route all requests to the IP address and port of Charles Proxy
  
  you can even configure Charles with SSL certificates to decrypt traffic
  
  you can even programmatically setup Charles using it web interface and include this in your regular testing automation

## Challenges

it all happens manually

repetition: it is testing manually all the time

with native apps (Android and iOS): batching

- Amplitude for instance is an SDK that is embedded into the mobile app. The SDK batches the analytics events and sends one request. If the user loose network access and only gets back one week later => your reports are skewed 

## Break Summary

we have seen 2 different ways to test Analytics:

via the report or at the source

there are challenges with them

after the break we'll see how to overcome these challenges

## The Automation Solution

the sources where you can introduce automation: development and testing

automation is a subset of testing, testing is a subset of quality

1. unit testing

   analytics is not necessarily only triggered from front-end, it can also be triggered from back-end

   if all the components using Analytics are sending there information individually, you run the risk of having inconsistency

   => have a central component sending analytics requests and have all the others call that one

   => unit test the analytics component works correctly and unit test the other components they are calling the analytics component right

   logcat: console log for native Android apps

   https://developer.android.com/studio/command-line/logcat

   => have a common way of logging

   limitation of unit testing: you are testing the detailed part, not the end-to-end business value

2. WAAT - Web Analytics Automation Testing

   - https://github.com/anandbagmar/waat (Java)
   - https://github.com/anandbagmar/waat-ruby (Ruby: lagging behind with the Java version)
   - https://essenceoftesting.blogspot.com/search/label/waat

   for analytics testing of web as well as native apps

   very agnostic of tools and analytics

   - plugs in existing test automation frameworks
   - web analytic tool independent
   - UI driver framework independent
   - Browser independent
   - never tested with commercial tools

   Ruby version is a wrapper around the Java version, uses rjb (Ruby Java Bridge)

   plugins:

   - Omniture-Debugger
   - HTTP-Sniffer
   - JS-Sniffer
   - Proxy-Debugger

   Omniture-Debugger (Adobe)

   pros:

   - OS independent
   - run using regular test-user

   cons:

   - browser dependent
   - web-analytics solution dependent

   Omniture captures the data and generates an HTML report that you can then start testing

   HTTP-Sniffer

   pros:

   - web-analytics, browser and UI-driver independent
   you are sniffing HTTP traffic

   cons:

   - 3rd library for capturing network traffic is OS dependent
   - HTTPS not supported out-of-the-box
   - you have to run as 'root': you have to enable the library as root to sniff the network

   Omniture and HTTP-Sniffer are of not much use anymore today. Not a lot of companies use only HTTP. Most use HTTPS

   JS-Sniffer

   pros:

   - web-analytic and browser independent
   - HTTPS supported 
   - no dependency on 3rd party library

   cons:

   - need to write JavaScript to get the URL from the browser: fetch the query string with analytics 
   - UI-driver dependent

   all analytics is send via query string parameters and utm## headers

   Proxy-Debugger: programmatically interact with a proxy

   pros:

   - web-analytics, browser, UI-driver independent
   - HTTPS supported
   - no dependency on 3rd party libraries

   cons:

   - for mobile apps you have to manually setup the proxy configuration

   Architecture:
  
   - controller: that is what you interact with
   - what input are we collecting
   - and which plugin do we want to use

## Next Generation

The new kids in town: Big Data and IoT

**side-note:** if you don't get the basics right from the startup, it becomes difficult to add these additional practices like analytics

Understand your Users

- profile
- location
- culture
- hobbies
- languages
- habits

In many cases: the user is the product itself (FB, WhatsApp, ...)

nothing in life is free!

Hypothesis: you first need lots of data before begin able to formulate a hypothesis, you need the baseline, that's why having analytics right from the start is very important

## Opportunities for Testing

have consistent logging, log also the analytics events

mobile apps: logcat: before running the tests, clear the logs, run the test, capture the logs programmatically and parse the logs

web apps: use javascript logging, use web driver to capture the logs

- what capabilities and tools are required to validate?

  - data collection is working reliably from all sources
  - analysing the data, capturing patterns and trends
    => optimises the business value and creates new opportunities and new value propositions

you are not only testing and building automation, you have a more holistic approach to business

how to "Testing" of these new integrations and its value propositions

- performance
- reliability
- security
- scale of collecting data

## Summary

the key of success to a product is analytics

you have to understand the bigger picture

it is shift left: you are testing analytics early

- specs are coming in early from Product, BI, Support, Ops
- test early
- automating as much as possible

it is also shift right

Tool selection

- what is the limitation: how many events per month can be captured
- what do you want to track
- you can add additional tools on top of that like Tableau for analysis
- data retention: how long are you going to keep the data
- where is the data stored? inside EU?

The importance of Analytics: look at how Netflix is producing an insane amount of quality content

- it's the air products breath
- it's the blood flowing through the product
