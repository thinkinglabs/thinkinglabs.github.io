---
layout: note
title: Architecting for Testability
event:
  name: Agile on the Beach
  date: 2022-07-07
author:
  name: Emily Bache
  twitter: emilybache
created_at: 2022-07-07
category: notes
tags: [ Testing, Design, Agile on the Beach ]
image: /images/aotb-architecting-for-testability-emily-bache/legacy-code-as-an-old-cabinet.jpeg
---

If you are a developer you are probably working on a large and complicated codebase. Unfortunately a lot of existing code lacks automated tests and adding them can be challenging, particularly if the code is old or poorly structured. Testability has always been an aspect of architecture that people have said is important but all too often I see this aspect ignored. Approval testing is a technique that helps you to get a difficult codebase under test and begin to control your technical debt. Approval testing works best on larger pieces of code where you want to test for multiple things. Because of this, the architecture of the system is really important for success with this testing technique.

In my experience, investing in testability and setting up automated approval tests will make your testing cheaper and it will tell you more about any possible problems than other kinds of testing. In this talk you will learn about what Approval testing is and what architectural changes are needed for it to flourish.

Unfortunately, I had to leave this session early to prepare for my talk that was coming next 😓

---

Readable, Maintainable tests, even for legacy code

this is a talk about Approval Tests
and more about how to handle legacy code

Typical situation

> [#aotb2022](https://twitter.com/hashtag/aotb2022) [@Agileonthebeach](https://twitter.com/Agileonthebeach) [@emilybache](https://twitter.com/emilybache) legacy code is like an old cabinet. Everyone has one, it’s probably messy and you probably don’t know what’s in it
>
> ![Legacy Code as an old cabinet](/images/aotb-architecting-for-testability-emily-bache/legacy-code-as-an-old-cabinet.jpeg)
>
> -- ilan kirschenbaum ([@kirschi_](https://twitter.com/kirschi_)), [Jul 7, 2022](https://t.co/P0fJK4ZxQF)

- large complicated code base
- but it is really valuable: it works and generates money for the company
- and developers find it difficult

when I say it is a bit messy inside -> Technical Debt

> Deficiencies in internal quality that make it harder than it would ideally be to modify and extend the system further
>
> -- Martin Fowler

=> we need to keep that Technical Debt under control
=> re-structuring and re-architecting
=> but you want to know you haven't broken anything => automated tests

Typical Problems with Testing

- lack of automated tests
- low coverage
- codebase make it difficult to write unit tests
- ...

Typical Agile Testing advice
=> testing pyramid

- lots of unit tests
- some component tests: the thing in the middle that everyone gives another name because the first version of the pyramid was a bit vague about what Service Tests mean
- few end-to-end tests

Typical end-to-end testing challenges

- slow
- but they do find a lot of issues -> that's why many orgs invest a lot in end-to-end tests

That's why we need an architecture to allow testing that focuses on the middle of the pyramid

-> Approval Testing (characterisation testing, golden master testing)

Tools:

- [Approvals](https://approvaltests.com)
- [Touca](https://touca.io)
- [Verify](https://github.com/VerifyTests/Verify)
- [TextTest](https://www.texttest.org): better for larger things compared to Approvals

> Looking to get into Approval Testing? [@emilybache](https://twitter.com/emilybache) recommends these tools (approvals, touca, verify and TextTest) and strongly suggests you don't try and roll your own. [#AOTB2022](https://twitter.com/hashtag/AOTB2022)
>
> ![Approval Testing tools](/images/aotb-architecting-for-testability-emily-bache/approval-testing-tools.jpeg)
>
> -- Gwen Diagram ([@gwendiagram](https://twitter.com/gwendiagram)), [Jul 7, 2022](https://t.co/5KDoRrRiyr)

common advice for unit testing: you should only have one assert
when having multiple asserts -> you are writing a test in the middle of the pyramid (system tests)

=> replace by an approval test that checks a string output

Parts of Unit Test

- arrange
- act
- assert

Parts of Approval Test

- arrange
- act
- print: format results as a multiline string
- diff: makes the test failure really readable -> lower maintenance part

=> design a reusable Printer instead of assertions

- format complex domain objects as a multiline string
- format JSON and XML using indentation

=> test larger chunk of code: anything larger than a unit test

What's in it for me?

- lower test maintenance
- ...

Example: [restful-booker](https://github.com/mwinteringham/restful-booker) from [@2bittester](https://twitter.com/2bittester) (Mark Winteringham)

-> Emily's fork: <https://github.com/emilybache/restful-booker>

- `find_unique_port`: partitioning by port number to be able to run lots of tests in parallel
- `start_server`
- `do_request_response`
- `stop_server`

use TestText UI to manage tests (it has a cli, but the GUI is convenient)
