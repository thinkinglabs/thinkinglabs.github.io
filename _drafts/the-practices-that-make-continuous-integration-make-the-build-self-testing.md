---
layout: article
title: The Practices That Make Continuous Integration - Make the Build Self-Testing
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
image: /images/the-practices-that-make-continuous-integration/the-practices-that-make-continuous-integration-building.jpg
---

To accomplish [Agree as a Team to Never Break the Build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build) we have to [Run a Local Build]({% post_url 2022-09-28-the-practices-that-make-continuous-integration-building %}#practice-12-run-a-local-build) and [Commit Only on Green]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-7-commit-only-on-green). In order to know we can *Commit on Green* after *Running the Local Build*, we have to *Make the Build Self-Testing*. As *Agree as a Team to Never Break the Build* is a cornerstone of Continuous Integration, Making the Build Self-Testing is therefore a necessary prerequisite to realise Continuous Integration.

---

At a minimum a Build means compiling the code, eventually [linking](https://www.cprogramming.com/compilingandlinking.html) and producing a binary build artefact. That binary artefact is then promoted from stage to stage inside the Deployment Pipeline. If we only compile and produce a binary artefact, that will not be enough. Functional regressions will slip through. If we want to [Commit Frequently]({% post_url 2022-09-25-the-practices-that-make-continuous-integration-coding %}#practice-6-commit-frequently) to integrate more often, as is required by Continuous Integration, we cannot rely on manual regression testing any more on a rapidly changing code base. Manual regression testing will slow us down. Therefore, it is imperative that our Build is Self-Testing.

What does it mean to Make a Build Self-Testing? It means we need to augment the build with additional testing tasks on top of the compilation.

With statically typed languages, the compiler is already a simple test suite for free. It will catch the most common type errors. In the case of dynamically typed languages, engineers will have to implement type checking tests themselves. Again, this will not be enough.

On top of that we should make use of [Linters](https://en.wikipedia.org/wiki/Lint_(software)) to satisfy code formatting and team coding standards, check for syntax errors in the case of interpreted languages; [Static Code Analysis](https://en.wikipedia.org/wiki/Static_program_analysis) to detect common programming errors and code smells, and [Security Application Security Testing](https://en.wikipedia.org/wiki/Static_application_security_testing) to catch common security problems.

Tests do not prove the absence of bugs.

Self-Testing build is required to Run a Local Build.

## Bibliography

- [Compiling and Linking](https://www.cprogramming.com/compilingandlinking.html)
- [The differences between static analysis and linting](https://www.imperfectdev.com/static-analysis-vs-linting/)
- [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html), Martin Fowler
