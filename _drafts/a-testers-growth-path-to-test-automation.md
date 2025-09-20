---
layout: article
title: A Tester's Growth-Path to Test Automation
author: Thierry de Pauw
category: articles
tags: [Testing]
---

A client started with a QA/Testing [Community of Practice](https://communitiesofpractice.work/) (CoP), which is a splendid effort. During one session, they advanced the topic of a growth path for Testers in test automation. We need to understand that for that client, automated testing is in its infancy. Before, Testers performed manual regression testing as part of a QA department. So, in that case, test automation is certainly unfamiliar. As an IT delivery consultant, I have my opinions on team compositions and roles, but I wanted to hear from the test community about their thoughts on the subject. So, I reached out on [LinkedIn](https://www.linkedin.com/posts/tdpauw_reaching-out-to-my-testing-community-friends-activity-7335560629988040706-N04c).

---

> Reaching out to my Testing Community friends
>
> How do you see a growth plan for testers in test automation as a personal development plan? From novice to advanced.
>
> What would be measurable targets to achieve? What resources should they master?
>
> I have always questioned whether this is a good thing.
>
> Test automation is code. It should have production code levels of quality. If not, even better. Thus, it needs decent coding skills. Is this something testers should acquire? Obviously, it helps with creating a cross-functional team and t-shaped roles.
>
> Thoughts?
>
> Thierry de Pauw, [June 3th, 2025](https://www.linkedin.com/posts/tdpauw_reaching-out-to-my-testing-community-friends-activity-7335560629988040706-N04c)

As it unfortunately still happens, people have not learned from the early 2000s; certain Software Engineers still like to think we do not need Test Engineers as a specific role on the team. The Software Engineers can fulfil that with automated tests. Let me be clear, this does not work. Automated tests can only check the knowns. It is checking, not testing. Testing is about finding unknowns. Software Engineers are quite bad at this. Test Engineers excel at this, as well as many other activities, such as defining proper acceptance criteria to be implemented by automated tests. For more on this, I highly recommend [Continuous Testing in DevOps](https://danashby.co.uk/2016/10/19/continuous-testing-in-devops/) and the [Agile Testing book series](https://app.thestorygraph.com/books/7efb3659-1033-4222-9694-79c4444b02e8).

As an IT delivery consultant, I focus on flow. Anything that introduces silos in a team is a red flag. Test Automation and Software Development in Test (SDET) roles are such a signal. Whenever I hear Test Automation, I cringe. It indicates that some testing occurs after the fact, when the change has already been implemented. It goes against testability. Often, in these situations, testing is hard as the software was not designed with testability in mind. It is also a source of high Work in Progress (WIP) and consequently creates inventory. All things that reduce feedback and hence also quality. Lastly, it removes the responsibility from Software Engineers to test their feature.

Still, we may ask, how is a Test Engineer not a silo, but Test Automation is? Most often, Test Automation roles focus on creating an entirely parallel test automation framework. They are dedicated to maintaining, updating and evolving that framework, together with the tests which use the framework. Of course, when Software Engineers only write unit tests and no acceptance tests, assuming their work is done when ready for testing, and then throw it over the wall to the Test Engineer. Sure, the Test Engineer becomes a silo. Correspondingly, the Test Engineer also removes the quality responsibility from the Software Engineers. This is not what we want. However, if the sole purpose of the Test Engineer is to bring a quality mindset to the team, coach the team in quality and pair with Software Engineers, that is a totally different thing. The former requires a Mexican army of Testers with a ratio of three to one Software Engineer. Where the latter only requires a single Test Engineer for a team of six to ten.

Having said that, I do think it is beneficial for Test Engineers to learn to code, as it is favourable for Software Engineers to gain testing skills. Where do we start? Learning to code is such a vast topic, as is testing. This goes beyond only learning a test framework like [Selenium](https://www.selenium.dev/), [Cypress](https://www.cypress.io/) or the more recent [Playwright](https://playwright.dev/). It requires mastering a broad set of skills, such as domain knowledge, coding practices, code, version control, tools and test design, risk mitigation, ...

Automated tests are code. It should have production-like quality, if not better. Test code is the documentation of the production code. It describes what the production code should do. And we should be able to figure this out easily when reading the tests. Based on my experience (running technology due diligence, including reviewing many codebases), that is frequently not or poorly achieved. This requires skills in readable automated tests.

Above all, we ought to get people away from "Test Automation". It involves too much tooling. Too much tooling means there is too much technology to grasp for a limited context and applicability. When we push Test Engineers into Test Automation, they "learn coding" in that specific, limited context. But, they do not learn to code! Ultimately, the return on investment (ROI) is reasonably low. Moreover, because they do not learn to code, the resulting test automation code has poor quality, somewhat distant from the expected "above production" code quality level. Again, increasingly lowering the ROI. To be more hireable on the job market, we must move towards coding, not test automation.

To advance in coding skills, we need to develop software engineering core skills. This list is long. It is a lengthy journey that can undoubtedly extend over two to three years. Honestly, I think I only became proficient starting from year ten. I have also been a late adopter of the many lean ways of working. But with the right team and right mentors, this can be accelerated. However, it is not a given. These places are scarce in the industry.

First, it requires learning a programming language, and then another one and maybe more. The first will take time. The second and the third will involve less time as the concepts are similar; the syntax will differ a little (except between [Python](https://www.python.org/) and the curly-brace languages). But the core library will definitely defer. Yet, nowadays, with the prevalence of the Internet, smart IDEs and lately AI code completion, nobody knows the core library by heart anymore. Which programming language to learn first does not matter. What matters is understanding the concepts. They keep being the same regardless of the language.

A helpful initiative on that topic is the [Code Reading Club](https://codereading.club/) organised by [Marit van Dijk](https://maritvandijk.com/). It is a simple way to get familiar with code.

These days, we ought to understand web technology. Years ago, a certain Noah Sussman drafted an outline for a book on Test Automation. Unfortunately, I have no reference to that. It started with: Build a website using [PHP](https://www.php.net/). Followed by: Use [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS), [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) and developer tools while building the site; Use [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)); ... I fancy the underlying idea. Do we understand the fundamentals first, before trying to automate anything with this application?

In this regard, I am in favour of the idea of solving a problem multiple times using different technologies. This is not limited to Test Engineers. This is for everyone in the team. It is aligned with the ideas of the [Code Retreat](https://www.coderetreat.org/?seed=1390) to learn [*Test Driven Development*](https://en.wikipedia.org/wiki/Test-driven_development) (TDD) and [*Pair Programming*](https://en.wikipedia.org/wiki/Pair_programming). In 45-minute sessions, we solve the same problem again and again. Commonly, the dreaded [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). I am not a fan, as it generates too many discussions on how to attack the problem. I prefer the [Mars Rover Kata](https://codingdojo.org/kata/mars-rover/), simple, or the [FizzBuzz Kata](https://codingdojo.org/kata/FizzBuzz/), even simpler. I learned a couple of programming languages with FizzBuzz. Anyway, at the end of the 45 minutes, we throw away the code. In every new session, we change pairs. Generally, we also change programming language because the pair has different preferences.

Next, we need to acquire design skills. This is tough, but also important, to write meaningful tests. Reading books about design and architecture helps in gaining the vocabulary. However, from my experience, it does not bring the skills. Though I learned a lot from [Test Driven Development: by Example](https://app.thestorygraph.com/books/4a300d01-8a10-4e53-a60a-35b801d31e0f) and [Growing Object-Oriented Software, Guided by Tests](https://app.thestorygraph.com/books/21f7db6e-7ac5-4c30-947a-7a8c078269be). Those were real aha moments. I got my design skills from viewing many codebases and refactoring legacy codebases. Refactoring is a real joy. We discover concepts and domain models in the codebase as we refactor, and we come to many small classes, small methods that mean something and the right naming. It unfolds in front of us, little step by little step. It is almost poetic, plain art.

The design skills will support us in creating readable and maintainable automated tests.

As already referenced with the Code Retreat, the journey should include pairing. That will definitely help to accelerate the adoption of the software engineering skills. But ... that also works in the other direction. Software Engineers learn testing skills. Unquestionably, a truly wise investment. High ROI!

To succeed at automated tests, we have to master [*Exploratory Testing*](https://en.wikipedia.org/wiki/Exploratory_testing). That is why Software Engineers must pair with Test Engineers to master those skills, because we, Software Engineers, certainly lack the skills of Exploratory Testing. It is about highlighting the flow of testing, not the tool.

Other than that, we need to understand Version Control Systems, today, that would be [Git](https://git-scm.com/), or [Mercurial](https://www.mercurial-scm.org/), IDEs like [Visual Studio Code](https://code.visualstudio.com/) or the [JetBrains](https://www.jetbrains.com/) suite or [Vi](https://www.vim.org/) (if you dare, lovely editor [once you know how to quite](https://stackoverflow.com/questions/11828270/how-do-i-exit-vim)), the command line with [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) or [Zsh](https://en.wikipedia.org/wiki/Z_shell) or [Powershell](https://en.wikipedia.org/wiki/PowerShell) (if you have to use Windows, I feel you).

Lastly, understand the economics of software delivery. In all fairness, few engineers and IT leaders understand the economics. Focus on the first automated test instead of downright implementing a test framework. Nobody needs yet another framework based on thin air. Write a first test, a second, a third, and at the twentieth, we might consider a framework, but still. There is nothing wrong with duplicated code. Many engineers misunderstand the [Don't Repeat Yourself](https://wiki.c2.com/?DontRepeatYourself) (DRY) principle. It is about concepts, not code.

## Conclusion

It takes a wealth of skills to be proficient in automated tests. This is valuable for every role in the team, including Software Engineers and Test Engineers.

- It starts with testing skills.
- Followed by software engineering skills in design, readability and maintainability.
- Getting acquainted with code.
- Solve the same problem many times using different technologies.
- Understand the economics of software delivery.
- Learn certain tools that will facilitate our lives, like Version Control, IDEs, command line, ...

But! Nobody expects a Test Engineer to be proficient in coding and perform test automation. Test Engineers do not have to enjoy coding at all. They are not better Test Engineers if they can code. Testing is so much more! But the value of Test Engineers is remarkably unknown to leaders and Software Engineers. After the need for a Senior Product Manager, the second most recommended hiring is a Senior Test Engineer, which we mention in our reports to investors in Startups and Scaleups. Not to perform the testing, but to coach the team in testing.

> I once thought that I was not a good enough tester if I didn't know how to code. My mind was changed by my mentors, who gave me guidance so that I could chart my own path and speak to my strengths. I have learned some coding, but it's not a passion for me. I don't get the butterflies like I do when I'm performing a risk analysis, or looking at a data set to gain insight, or researching a product in preparation to test it, or coaching testers, or writing, or doing so many things where I am an expert because I LIKE IT. My best work was done alongside people who were expert coders and toolsmiths.
>
> -- Djuca Selendic, [June 3th, 2025](https://www.linkedin.com/feed/update/urn:li:activity:7335560629988040706?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7335560629988040706%2C7335647533819469824%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287335647533819469824%2Curn%3Ali%3Aactivity%3A7335560629988040706%29)

## Acknowledgement

[Lisi Hocke](https://mastodon.social/@lisihocke), [Kelsey M.](https://www.linkedin.com/in/kels-montzka/), [Joep Schuurkens](https://www.linkedin.com/in/joepschuurkes/), [Richard Bradshaw aka Friendly Tester](https://www.linkedin.com/in/friendlytester/) and [Vernon Richards](https://www.linkedin.com/in/vernonrichards/) for reviewing and providing valuable feedback on the article.

## Related Articles

- [The Fallacy of the 100% Code Coverage]({% post_url 2022-03-19-the-fallacy-of-the-100%-code-coverage %})

## References

- [My question on LinkedIn](https://www.linkedin.com/posts/tdpauw_reaching-out-to-my-testing-community-friends-activity-7335560629988040706-N04c)
- The Vernon Richard Podcast [Growth Plans for Technical Testers: Why Playwright Isn’t Enough](https://www.youtube.com/watch?v=Gl1Yz_RjFtc) with Richard Bradshaw and Vernon Richard
- [Continuous Testing in DevOps](https://danashby.co.uk/2016/10/19/continuous-testing-in-devops/) by Dan Ashby
- [Agile Testing Condensed: A Brief Introduction](https://app.thestorygraph.com/books/0fd72413-d6ae-4268-b3c4-12c23b881f12)  by Janet Gregory and Lisa Crispin
- [Agile Testing](https://app.thestorygraph.com/books/7efb3659-1033-4222-9694-79c4444b02e8) by Janet Gregory and Lisa Crispin
- [More Agile Testing](https://app.thestorygraph.com/books/89cb127b-88f0-4d98-8e9a-7e3db4d2efff) by Janet Gregory and Lisa Crispin
