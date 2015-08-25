---
layout: post
author: Georgios Gousios
title: How do project contributors use pull requests on Github?
categories: pullrequest integrator
---

*with [Alberto Bacchelli](http://sback.it)*

Distributed software development projects employ collaboration models and
patterns to streamline the process of integrating incoming contributions.
Classic forms of code contributions to collaborative projects include change
sets sent to development mailing lists or issue tracking systems and direct
access to the version control system. More recently however, a big portion
of open source development happens on GitHub. One of the main reasons for
this is the fact that contributing to a GitHub project is a relatively
pain-free experience. Or is it?

In Apr 2014, we run a survey among contibutors (also: [integrators](http://www.gousios.gr/blog/How-do-project-owners-use-pull-requests-on-Github/)) to Github projects
trying to understand how they use pull requests and what issues they face
while doing so. We got *760* responses, which after lots of preprocessing
were reduced to *650*.


### What motivates contributors?

The main motivation for contributing to a project is its usage. This usage can
be a dependency from another project the contributor is developing or fixing an
end user bug. Altruistic motives (still) play a role: 33% of the respondents
mentioned that they want to devote their time to a good cause. Developers also
contribute for natural interest and personal development reasons, for
example to *sharpen their programming skills* or for the *intellectually
stimulating* fun of it. Finally, approximately 35% of the respondents related contributions to career development, raging from enriching their profile to attraching new customers.
<blockquote>
  <p>
    <i>R121: Making contributions to [project] makes it easier for me to get new clients.</i>
  </p>
</blockquote>

### What does the pull request process look like for contributors?

Initially, most (76%) contributors look up for open issues related to their
changes or whether similar pull requests where submitted recently (59%).
Half of them try to communicate their changes to the core team. Moreover,
trying to be good citizens, they check for pull request guidelines in
the project. Only few (32%) check for similar open PRs; this might
explain the fact that we found
[in another study](/blog/Exploration-pull-requests/) that many PRs are closed due to being duplicate.

After coding the change, contributors (81%) expect tests to run, while they
try to honour the project guidelines (79%). Again, only very few check whether
other pull requests where opened in the mean time (37%).

To communicate with the project team, contributors prefer tools that are tied
to the GitHub process, namely issues and pull requests (>70%). Fewer than
50% will use email and even fewer means of synchronous communications such as
IRC and Skype/Hangouts. It looks like that developers value asynchrony rather
than immediacy at least when working with pull requests.

### How do contributors assess the quality of their contributions?

While our question was specific on how contributors evaluate the quality, the analysis of the results also revealed what contributors examine in their PRs.

One of the top priorities for contributors when examining PR quality is *compliance*,  which manifests as either compliance to the pull request guidelines
or to de facto code formatting and system architecture patterns that they implicitly extract by studying the code. *Code* and *commit quality* are
also other views of compliance: contributors try to deviate from the project norms as less as possible to increase their chances of acceptance.

It is interesting however that compliance is only checked manually; functionality
on the other hand is tested by means of *automated testing*. Contributors expect to find a test suite (see also above) and run those tests. Very few contributors actually run automated static analysis tools, and the majority that do try to lint code (e.g. using PEP8). Contributors also mentioned that they rely on explicit, *code reviews* (self done or by asking peers for help).

### What are the challenges of contributing with pull requests?

To find the pain-points emerging when contributing using the pull-based model, we  asked a mandatory open question, in which we ask respondents to state the biggest challenge they experience when contributing PRs. We found three broad categories of challenges: code related, tool and model related and social ones (which are the most common!).

WRT code, the contributor's biggest challenge is to *understand the code base*.
Contributors have trouble *assessing the impact* of a change and obtaining and
maintaining *awareness* of what happens in the project while coding their change. Apparently, Github's pull request interface is not perfect in that respect, which
is also what many contributors have been complaining about.

<blockquote>
  <p>
    <i>R564: (my biggest challenge is to) Read others code and get understanding of the project design.</i>
  </p>
</blockquote>

WRT tools, contributors have trouble in two fronts: using git and especially
doing (*conflict resolution*) in the face of multiple branches and, more importantly, creating the required setup to build a project and run its test suite (*infrastructure setup*).

Finally, many problems are social. The most prominent one is *responsiveness*:
more than 15% of the survey participants find that getting a timely feedback, if any, for their pull requests is hard and they mostly mention people-related causes.
Respondents specify that they would rather receive a clear reject than having no response for their PRs. If nothing else, prompt feedback reassures contributors
that their effort is not in vain and helps them predict future communication patterns.

*Communication* is also hard over Github's pull request mechanism (see also above).
It is therefore hard to *explain rationale* for a change. Typical issues prevalent in online forums are also prevalent in pull requests: *politics*, *divergent opinions*, *bikeshedding* and general *rudeness* have been reported by contributors, but admittedly not too often.

<blockquote>
  <p>
    <i>R526: (my biggest challenge is) Politics, or project owners not wanting a fix or change, or not actively maintaining it</i>
  </p>
</blockquote>

### Recommendations

After examining all aspects
([projects](http://www.gousios.gr/blog/Exploration-pull-requests/),
[integrators](http://www.gousios.gr/blog/How-do-project-owners-use-pull-requests-on-Github/)
and, now, contributors) of pull request work, I have the following to propose to
make the pull request process more streamlined and pleasant for everyone
involved.

#### Integrators
* Provide comprehensive contribution guidelines
* Invest in good tests and [run a](https://www.cloudbees.com) [CI](http://travis-ci.org)
* Automate everything: [development environment setup](https://puppetlabs.com), [deployment](http://www.docker.com) and [quality](http://scrutinizer-ci.com) evaluation
* Monitor the project's [pull request handling performance](http://ghtorrent.org/pullreq-perf/). Compare against the norms, promptly close dead pull requests.
* Be proactive: Establish a communication ettiquette, actively enforce it.

#### Contributors
* Minimize friction: make contributions small and isolated. Restrict them to one
subsystem. Adhere to code and programming style. Follow the contribution
process.
* Build your profile: Produce contributions that are accepted, engage in
project community activities (e.g. discussions)

*This blog post is a brief account of our findings. An in-depth analysis,
including a description of our analysis methods and the original survey can be
found in our [technical report](/bibliography/GB15.html).*

*If you liked this post, you will also like our previous work on:*

* [How projects use pull requests](http://www.gousios.gr/blog/Exploration-pull-requests/)
* [How do project owners use pull requests](http://www.gousios.gr/blog/How-do-project-owners-use-pull-requests-on-Github/)
