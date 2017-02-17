---
layout: page
title: Streaming software security
---

The aggregation of both projects and deployment configurations on GitHub has
made those projects particularly vulnerable to sensitive data leaks.  For
reasons that have to do with ease of use or just pure negligence and mistakes,
it is quite common for GitHub users to push passwords, database connection
strings, cloud provider one-time passwords and environment variables and private
SSH keys to public repositories. Once this information is made public, it is
impossible to retract it as projects such as [GHTorrent](http://ghtorrent.org)
and [GitHub Archive](http://githubarchive.org) archive this information, while
GitHub's real-time event stream makes it easy for adversaries to _attack_ the
exposed systems almost immediately.

The aim of the proposed project is to explore this phenomenon and propose
effective counter-measures.
