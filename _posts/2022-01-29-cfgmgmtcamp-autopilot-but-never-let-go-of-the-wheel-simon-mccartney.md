---
layout: note
title: Autopilot, but never let go of the wheel
event:
  name: Config Mgmt Camp
  date: 2021-02-03
author:
  name: Simon McCartney
  twitter: simonmcc
slides: https://speakerdeck.com/simonmcc/autopilot-but-never-let-go-of-the-wheel
created_at: 2020-02-03
category: notes
tags: [ Infrastructure as Code ]
---

From TOIL to Continuous Delivery of Infrastructure, our tail of migrating our existing Infrastructure as code tools & wrappers so that they can be used in a CD system, but with all of the control grey-beards, enterprises & governments expect.

A tail of how we took our terraform tooling from being human focussed (and thus causing much more TOIL than was reasonable) and adapted it work within a sane set of pipelines, enabling drift checking, automated deployments & approved deployments that fit with in a multi-environment, sovereign-control organisation, while still retaining the ability to "run from your laptop" in an emergency or in bootstrap mode. We'll also cover the patterns that emerged for building tools that are both human & tool friendly, for progressive roll-out of changes & why CI/CD for VM based infrastructure requires better techniques than "fixing the build".

---

Works for AXON: body camera's, medical stuff

In the beginning ...

wrapper script for Terraform

```
./tf.sh -c aws -e dev -a plan
```

Evolved too ...

- `git checkout -b JIRA-001`
- `vi aws/foo.tf`
- PR
- ...

which then resulted in ...

## Lesson 1: pin the versions of your tools

`function checkTerraformVersion` in the wrapper script

## Lesson 2: understand why your wrapper exists

- to make workflow easier
- authentication ...
- always run command (`terraform init`)

## Lesson 3: Cloud authentication techniques

- HashiCorp Packer Azure RM builder requires different parameters in the JSON depending on authentication type in use
- use `jq` to filter out part of the packer template

=> BONUS: Comments in Packer JSON!

## Lesson 4: enforce non-interactive modes

- most people `terraform apply` "yes" in interactive mode
- non-interactive: plan/apply

  `-out=path`

  automation tool needs to store & retrieve for approving workflows

## Sidebar: never start in Bash
- it's my default starting point, it shouldn't be
- when at line 5 I already complain about the choice
=> Python & Go are better options

## Lesson 5: start with low privileges API creds
- all of our interactive users had root-mode everywhere
- this cause pain:
  - when adding team members who still had training wheels
  - when we correctly refused to give automation services root privileges

## Sidebar: secrets management
- in terraform it is problematic, everything is public
- git-crypt: because we didn't use remote state, it was in version control
- invest as early as possible in a vault

