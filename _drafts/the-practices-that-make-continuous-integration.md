---
layout: post
title: The Practices That Make Continuous Integration
author: Thierry de Pauw
meta: 
categories:
tags: [ Continuous Integration ]
---

Continuous Integration is not a tooling problem, it is a practice.

We say a team is in a state of Continuous Integration if ...

Well, in order to achieve a state of Continuous Integration, a team needs to 
adopt a set of practices.

- Incremental Software Development
  Break large changes into a series of small incremental changes.
- Always commit on green -> TDD
- Decoupled code base -> Hexagonal Architecture and Ports and Adapters + Single Responsibility and Open/Closed principles
- lots of fast tests -> fast build < 10min < 5min
- adopt expand-contract

What if it takes too long to implement a feature?

- hide unfinished functionality
- feature toggles
