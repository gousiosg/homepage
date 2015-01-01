---
layout: post
author: Georgios Gousios
title: How do project owners use pull requests on Github?
categories: pullrequest integrator
---

Pull-based development as a distributed development model is a distinct way of
collaborating in software development. In this model, the project’s main
repository is not shared among potential contributors; instead, contributors
fork (clone) the repository and make their changes independent of each other. In
the pull-based model, the role of the integrator is crucial. The integrator must
act as a guardian for the project’s quality while at the same time keeping
several (often, more than ten) contributions "in-flight" by communicating
modification requirements to the original contributors. Being a part of a
development team, the integrator must facilitate consensus-reaching discussions
and timely evaluation of the contributions. In Open Source Software (OSS)
projects, the integrator is additionally taxed with enforcing an online
discussion etiquette and ensuring the project’s longevity by on-boarding new
contributors.

In Apr 2014, we run a survey among Github users trying to understand how
integrators (also contributors; still analyzing the results) use pull requests
and to discover what challenges they may face. We got *750* responses.

We found three large themes in how integrators use pull requests: **code
reviews**, **soliciting contributions from the community** and **discussing new
features**. We also found that integrators are struggling with **maintaining
quality** and **prioritizing work**, while **social challenges** do not allow
them to be efficient.

### How do integrators use pull requests in their projects?

#### Overall use

Overwhelmingly, 80% of the integrators use the pull-based development model for
doing code reviews and 80% resolve issues. Half of the integrators use pull
requests to discuss new features. 60% of the integrators use pull requests to
solicit contributions from the community, which seems low given the open nature
of the GitHub platform. We examined this response quantitatively, using the
GHTorrent database: indeed for 39% percent of the projects that responded, no
pull request originated from the project community.

#### Types of contributions

When discussing software maintenance, we distinguish perfective (implementing
new features), corrective (fixing issues) and adaptive-preventive (refactoring)
maintenance. We asked integrators how often they receive contributions for these
types of maintenance activities. 73% percent of the projects receive bug fixes
as pull requests once a week, half of them receive new features once a week,
while only 33% of them receive a refactoring more often than once a week.

#### Code reviews

75% of the projects indicate that they do explicit code reviews on all
contributions on Github. Interestingly, 7% of of the integrators indicated that
they are using other tools for code reviewing.

50% of the integrators report that the project’s community (people with no
direct commit access to the repository) actively participates in code reviews;
this number is impressive and indicates very vibrant communities caring about
projects.

Projects have established processes for doing code reviews. One of them is
delegation; 42% of the integrators delegate a code review if they are not
familiar with the code under review. Another process is implicit sign-off: at
least 20 integrators reported that multiple developers are required to review a
pull request to ensure high quality.

#### Integrating changes

In 79% of the cases, integrators use the GitHub web interface “often or always”
to do a merge. Only in 8% and 1% of the cases do integrators resort to cherry
picking or textual patches respectively to do the merge. The remaining cases do
rebasing to maintain clean project history instead of simple merges.

**summary:** *Integrators successfully use the pull-based model to accommodate
code reviews, discuss new features and solicit external contributions. 75% of
the integrators conduct explicit code reviews on all contributions. Integrators
prefer commit metadata preserving merges.*

### How do integrators decide whether to accept a contribution?

#### Decision to accept
<div style="width: 60%;margin-left:auto;margin-right:auto;">
<p><a href="/files/pr-int-acceptance.png" rel="lightbox">
<img src="/files/pr-int-acceptance.png" class="img-polaroid" align="center"/></a></p>
</div>

The most important factor leading to acceptance of a contribution is its
quality. Quality has many manifestations in our response set; integrators
examine the *source code quality* and *code style* of incoming code, along with
its documentation and granularity. At a higher level, they also examine the
quality of the commit set and whether it adheres to the project *conventions* for
submitting pull requests.

A second signal that the integrators examine is *project fit*: does the pull
request fit the project roadmap? A variation is *technical fit*: does the code fit
the technical design of the project?

It is interesting to note that the *track record* of the contributors is ranked
low in the integrator check list. This is in line with our earlier analysis of
pull requests, in which we did not see a difference in treatment of pull
requests from the core team or from the project’s community.

Finally, technical factors such as whether the contribution is in a mergeable
state, its impact on the source code or its correctness are not very important
for the eventual decision to merge to the majority of respondents. In such
cases, integrators can simply postpone decisions until fixes are being
provided by the contributors.

#### Time to make the acceptance decision
<div style="width: 60%;margin-left:auto;margin-right:auto;">
<p><a href="/files/pr-int-time.png" rel="lightbox">
<img src="/files/pr-int-time.png" class="img-polaroid" align="center"/></a></p>
</div>

The factors that strongly affect the time to make a decision are mostly social
and, as expected, have timing characteristics as well. The most important one,
affecting 14% of the projects, is *reviewer availability*. The problem is more
pronounced in projects with small integrator teams (45%) and no full time paid
developers. Another social factor is *contributor responsiveness*; if the pull
request contributor does not come back to requests for action fast, the
evaluation process is stalled. *Long discussions* also affect negatively the time
to decide, but they are required for reaching consensus among core team members,
especially in case of controversial contributions. For changes that have not
been communicated before, discussions are also mandatory.

Technical factors, such as the complexity of the change, *code quality*, *code
style* and *mergeability* of the code also affect negatively the time to decide on
a pull request. The reason is that the code inspection reveals issues that need
to be addressed by the contributors.

**summary:** *Integrators decide to accept a contribution based on its quality
and its degree of fit to the project’s roadmap and technical design.*

### How do the integrators evaluate the quality of contributions?

<div style="width: 60%;margin-left:auto;margin-right:auto;">
<p><a href="/files/pr-int-quality.png" rel="lightbox">
<img src="/files/pr-int-quality.png" class="img-polaroid" align="center"/></a></p>
</div>

#### Perception

One of the top priorities for integrators when evaluating pull request quality
is *conformance*. Conformance can mean conformance to project style or to API
usage throughout the project. Many integrators also examine conformance against
the *programming language’s style idioms*.

Integrators often relate contribution quality to the quality of the source code
it contains. To evaluate source code quality, they mostly examine non-functional
characteristics of the changes. Source code that is *understandable* and
*elegant*, has good *documentation* and provides clear *added value* to the
project with minimal impact is preferred.

The quality (or even the existence) of *documentation* signifies an increased
attention to detail by the submitter. The integrators also examine the *commit
organization* in the pull request along with its *size*. In the later case, the
integrators value small pull requests as it is easier to *assess their impact*.

Testing plays an important role in evaluating submissions. The very
*existence of tests* in the pull request is perceived as a positive signal.

Finally, integrators use social signals to build trust for the examined
contribution. The most important one is the *contributor’s reputation*. The
integrators build a mental profile for the contributor by evaluating their track
record within the project or by searching information about the contributor’s
work in other projects. Some integrators also use *interpersonal relationships*
to make judgements for the contributor and, by proxy, for their work.

####Tools

The vast majority (75%) of projects use *continuous integration*, either in hosted
services or in standalone setups. On the other hand, few projects use more
dedicated software quality tools such as metric calculators (15%) or coverage
reports (18%). It is interesting to note that practically all (98%) projects
that use more advanced quality tools, run them through continuous integration.

**summary:** *Top priorities for integrators when evaluating contribution
quality include conformance to project style and architecture, source code
quality and test coverage. Integrators use few quality evaluation tools other
than continuous integration.*

### How do the integrators prioritize the application of contributions?

<div style="width: 60%;margin-left:auto;margin-right:auto;">
<p><a href="/files/pr-int-prioritization.png" rel="lightbox">
<img src="/files/pr-int-prioritization.png" class="img-polaroid" align="center"/></a></p>
</div>

Integrators prioritize contributions by examining their *criticality* (in case
of bug fixes), their *urgency* (in case of new features) and their *size* or
*complexity*. Bug fixes are commonly given higher priority. When prioritizing
contributions, integrators apply multiple criteria in a specific sequence. The
figure above depicts the frequencies of prioritization criteria usage for all
reported application sequences. What we can see is that criticality, urgency and
change size contribute to most prioritization criteria application sequences,
while most integrators report that they apply at most two prioritization
  criteria.

### What key challenges do integrators face when working with pull requests?

<div style="width: 60%;margin-left:auto;margin-right:auto;">
<p><a href="/files/pr-int-key-challenges.png" rel="lightbox">
<img src="/files/pr-int-key-challenges.png" class="img-polaroid" align="center"/></a></p>
</div>

####Technical challenges

At the project level, maintaining quality is what most integrators perceive as a
serious challenge. As incoming code contributions mostly originate from
non-trusted sources, adequate reviewing may be required by integrators familiar
with the project area affected by it. Reviewer availability is not guaranteed,
especially in projects with no funded developers. Often, integrators have to
deal with solutions tuned to a particular contributor requirement or an edge
case; asking the contributor to generalize them to fit the project goals is not
straightforward. A related issue is feature isolation; contributors submit pull
requests that contain multiple features and affect multiple areas of the
project.

Several issues are aggravated the bigger or more popular a project is.
Integrators of popular projects mentioned that the volume of incoming
contributions is just too big; consequently, they see triaging and work
prioritization as challenges. Additionally, as pull requests are kept on the
project queue, they age: the project moves ahead in terms of functionality or
architecture and then it is difficult to merge them without (real or logical)
conflicts. Moreover, it is not straightforward to assess the impact of stale
pull requests on the current state of the project or on each other.

Integrators note that aspiring contributors often ignore the project processes
for submitting pull requests leading to unnecessary communication rounds. When
less experienced developers or regular users attempt to submit a pull request,
they often lack basic git skills.

Lack of responsiveness on behalf of the contributor hurts the code review
process and, by extension, project flow. This especially pronounced in the case
of hit and run pull requests,5 as they place additional reviewing and
implementation burden on the integrator team. Integrators mention that the lack
of centralized co-ordination with respect to project goals can lead to chaos.

####Social challenges

On a more personal level, integrators find it difficult to handle the workload
imposed by the open submission process afforded by the pull-based development
model. For many of our respondents, managing contributions is not their main
job; consequently finding free time to devote on handling a pull request and
context switching between various tasks puts a burden on integrators.

Integrators often have to make decisions that affect the social dynamics of the
project. Integrators reported that explaining the reasons for rejection is one
of the most challenging parts of their job as hurting the contributor’s feelings
is something they seek to avoid. Similarly, integrators find that asking for
more work from the contributors (e.g. as a result of a code review) can be
difficult at times.

Reaching consensus through the pull request comment mechanism can be
challenging. Integrators often find themselves involved in a balancing act of
trying to maintainting their own vision of the project’s future and
incorporating (or rejecting) contributions that are tuned to the contributor's
needs.

**summary:** *Integrators are struggling to maintain quality and mention feature
isolation and total volume as key technical challenges. Social challenges
include motivating contrib- utors to keep working on the project, reaching
consensus through the pull request mechanism and explaining reasons for
rejection without discouraging contributors.*

### So what?

This study is one of the first to investigate how *people* use pull requests and
definitely the first to do it on this scale. It answered our questions, but it
generated more; we present some of them below. Researchers and aspiring
entrepreneurs are welcome to answer them by doing further research and/or by
developing new tools.

* How can we facilitate the quality evaluation process involved in pull requests?
* How can we help integrators in large projects cope with the
load of incoming pull requests?
* How can we raise the awareness of newcomers wrt what is happening in the project? How can we avoid duplicate work?
* What can projects or the Github platform do to streamline their contribution process?

Some advice:

* **Integrators**, invest in tools: Streamline your contribution process to
make it testable and verifiable, find creative ways to integrate quality
analysis tools in your CI process and demand tests along with contributions
(your test suite is good, right?). Don't let pull requests linger; if you
don't want a contribution it is better (for you, mostly) to be frank to
the contributor.

* **Contributors**, make sure you do your homework: see if there are
similar issues/pull requests open before you submit, try to comply to
the project's guidelines and learn your tools. After submitting, be
responsive and nice; think that you are working together with a
work-overloaded collegue, not a stranger in the other side of the world.

Last but not least, I would like to thank the participants for their time: this
research would not be possible if 750 people would not have each donated 15
minutes each (187 total hours!).

What do you think of the results? Do they reflect your personal experience? What
tools would you expect us researchers to provide you with to cope with pull
requests? Chime in below!


*This blog post is a brief account of our findings. An in-depth analysis,
including a description of our analysis methods and the original survey can be
found in our
[technical report](http://swerl.tudelft.nl/twiki/pub/Main/TechnicalReports/TUD-SERG-2014-013.pdf). This is joint work with
[Andy Zaidman](http://www.st.ewi.tudelft.nl/~zaidman/),
[Margaret-Anne Storey](http://margaretannestorey.wordpress.com/) and
[Arie van Deursen](http://avandeursen.com/). *

*If you liked this post, you will also like our previous work on [how projects
use pull requests](http://www.gousios.gr/blog/Exploration-pull-requests/).*

*Update 20/12/2014: The paper has been accepted at ICSE 2015!*
