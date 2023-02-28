---
layout: article
title: Pull Requests Cannot Supersede Do Not Break the Build
author: Thierry de Pauw
category: articles
tags: [ Continuous Integration, Extreme Programming ]
---

Recently someone suggested the Pull Request approach without reviews could supersede [Agree as a Team to Never Break the Build]({% post_url 2022-09-17-the-practices-that-make-continuous-integration-team-working %}#practice-2-agree-as-a-team-to-never-break-the-build). As much as this looks attractive from an engineering point of view. We try to make clever use of tooling. It bypasses the relation this has with other [Practices that make Continuous Integration]({% post_url 2022-06-14-the-practices-that-make-continuous-integration %}) resulting in disabling Continuous Integration.

<https://www.linkedin.com/feed/update/urn:li:activity:7035345874251567104?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A7035345874251567104%2C7035742403227480064%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287035742403227480064%2Curn%3Ali%3Aactivity%3A7035345874251567104%29>

---

enable fire and forget => context switching, hoping the build will pass

as a result no local builds

=> no pressure to have a fast build

no need any more to only commit on green -> disables TDD, disables commit frequently

=> no need any more to make all changes in small increments

=> no need for a decoupled code base

=> no need to hide unfinished functionality
