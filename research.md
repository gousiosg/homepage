---
layout: page
title: Research
---
I am genuinely interested in any topic that has to do with systems and software,
and combinations thereof. Specifically my research interests are the following:

* Software engineering
* Software analytics
* Programming languages
* Systems software

### Software Engineering - Software Analytics

#### Current work

<i class="fa fa-project-diagram fa-2x"></i> In our
{% cite_details HDG18 --text latest work %}, we are exploring
how to create call graphs at the ecosystem scale. Our initial experiments
with the Rust Cargo ecosystem are very promising.

<i class="fas fa-chart-line fa-2x"></i>
We have stared working in the area of software analytics, in the context of the [CodeFeedr](http://codefeedr.github.io) project.
We describe our {% cite_details GSV16 --text vision here %} and present
a set of case studies we are working on {% cite_details VHKBG18 --text here %}.
Stay tuned for more!

<i class="fab fa-github-alt fa-2x"></i>
I actively develop and maintain a
[collection of tools](https://github.com/gousiosg/github-mirror) for {%
cite_details GS12 --text obtaining %} and {% cite_details G13 --text analysing
%} data from Github, through the [GHTorrent](https://ghtorrent.org) project. The
project has been awarded the [best data project
award](http://2014.msrconf.org/history.php) at MSR 2013, has received the
[foundational contribution award]() at MSR 2018, and has been selected as the
official dataset of the [MSR 2014 mining
challenge](http://2014.msrconf.org/challenge.php).  At the moment (Jun 2018)
[250 papers](https://scholar.google.gr/scholar?oi=bibs&hl=en&cites=11132126230347149781)
(40% of all GitHub-related papers according to [one
source](http://modeling-languages.com/believe-research-github-mining/)) [where
based on it](http://ghtorrent.org/halloffame.html), more that 450 researchers
are [using its data](http://github.com/ghtorrent/ghtorrent.org/keys.txt), GitHub
included it in its [2014 data
challenge](https://github.com/blog/1864-third-annual-github-data-challenge),
while [Microsoft chose it](/bibliography/Gousit16f.html) as a data source for
  monitoring their OSS projects.  Together with colleagues, we have documented
  the promises and pitfalls of doing research with GHTorrent ({% cite_details
  KGBSGD14 --text MSR14 %}, {% cite_details KGBSGD16 --text EMSE %}).

<i class="fas fa-code-branch fa-2x"></i>
I am exploring how
{% cite_details GPD14 --text pull-based distributed software development %} works
both [quantitatively](https://github.com/gousiosg/pullreqs) ({%cite_details GPD14 --text ICSE 2014 %}) and
[qualitatively](https://github.com/gousiosg/pullreqs-survey)
({%cite_details GZSD15 --text ICSE 2015 %},
{%cite_details GSB16 --text ICSE 2016 %}
[SIGSOFT best paper award](http://2016.icse.cs.txstate.edu/program/awards)).
{% cite_details GZ14 --text The dataset %} I developed as part of the
quantitative investigation, won the
[best dataset award](http://2014.msrconf.org/history.php) at MSR 2014.
Using the findings of the qualitative work, I have also co-proposed a service to help developers
{% cite_details VGZ15 --text prioritize pull request handling %} and a service
to {% cite_details HG15 --text match job advertisements to developer profiles %}.
We also {% cite_details RNG16 --text investigated %} whether
geographical and nationality biases exist among OSS developers.

<i class="fab fa-simplybuilt fa-2x"></i>
I also work on analysis of Continuous Integration logs. For that, we created the [TravisTorrent](http://travistorrent.testroots.org) project
to disseminate Travis build results in a way similar to GHTorrent. TravisTorrent
is the dataset for the 2017
[MSR mining challenge](http://2017.msrconf.org/#/challenge) (attracting
a record number of submissions).
Our initial results ({% cite_details BGZ16 --text PeerJ Preprint %})
show significant (order of magnitude) differences between testing habits among programming languages, including build breakage rates and number of tests run.

#### Past work

<i class="fas fa-flask fa-2x"></i>
In the context of the [TestRoots](http://testroots.org) project, I did research
on how developers use automated testing. Mostly working with [Moritz Beller](),
I co-implemented a [data collection and analysis
pipeline](https://github.com/Inventitech/watchdog-analysis) for the
[Watchdog](https://github.com/TestRoots/watchdog) framework and co-implemented a
similar pipeline for [Travis CI
data](https://github.com/TestRoots/travistorrent-tools.git). With those tools,
we have shown ({% cite_details BGZ15 --text ICSE-NIER15%}, {% cite_details
BLPGZ16 --text ICSE-SERIP16,%} {% cite_details BGPZ15 --text FSE15 %}) that
developers do not test as much as they think they do and do not follow TDD
approaches.

<i class="far chart-bar fa-2x"></i>
I led the design and development of [Alitheia Core](http://github.com/istlab/Alitheia-Core), a
{% cite_details GS14 --text high performance software analytics platform %}
that works with data from software repositories. I used the platform to develop models for the
{% cite_details KGSP09 --text evaluation %} of
{% cite_details GKS08 --text developer contribution %}, to investigate the evolution of
{% cite_details MGS12 --text software security issues %} and to
{% cite_details Gousi09-phdthesis --text process %}
and share data from more than
[700 open source software repositories](http://ikaria.dmst.aueb.gr/repositories/).

<i class="fas fa-stethoscope fa-2x"></i>
I also proposed a
{% cite_details GKAG06B --text platform %} for
{% cite_details SGKLASS09 --text analysing the quality of OSS projects %} and a
corresponding
{% cite_details SGSS08 --text hierarchical metrics-based software quality model %} for evaluating both the
process and the product quality. I have contributed to a
{% cite_details ASKG11 --text comprehensive survey %} of the literature in OSS research.

<img alt="Beautiful Architecture" align="left" src="img/ba.jpg" />
Together with [Diomidis Spinellis](http://spinellis.gr), I worked on editing the
{% cite_details SG09 --text Beautiful Architecture %} book.
You can find more information from the publisher's
<a href="http://oreilly.com/catalog/9780596517984/">book web site</a>. Beautiful Architecure has also
been translated to Chinese (<a href="http://oreilly.com.cn/book.php?bn=978-7-111-28356-0">架构之美</a>),
Japanese (<a href="http://www.oreilly.co.jp/books/9784873114309/">ビューティフルアーキテクチャ)</a> and
Russian (<a href="http://www.ozon.ru/context/detail/id/5430638/">Идеальная архитектура</a>).
If you buy it, you 're also helping a good cause, as the
royalties are donated to the <a href="http://www.msf.org/"><em>Medecins Sans Frontieres</em></a>.

### Systems Software and Security

I {% cite_details Gousi04-mscthesis --text ported %} [JikesRVM](http://jikesrvm.org),
a JVM written mostly in Java, to run on top of bare hardware, without support
from an operating system. Later, I contributed patches to the JikesRVM project
to enable support for Opensolaris, and in the context of the [Google Summer of
Code 2008](http://code.google.com/soc/2008/jikesrvm/about.html) program, to
compile and [run with OpenJDK](http://docs.codehaus.org/display/RVM/Acknowledgments). I also proposed
an architecture to make Java’s I/O subsystem faster by
{% cite_details G07 --text replacing the operating system with a hypervisor %}
and thus relieving it of
context switches and unnecessary data copies; an almost identical approach has
been independently developed into the JRockit virtual edition product.

On the systems performance front, I have studied the performance of then popular
dynamic content generation technologies for the Apache web server
({% cite_details GS02 --text my very first paper %}, which received a best paper award) and I
investigated ways for {% cite_details GKS06 --text optimally configuring %} the
garbage collection algorithms for the then two prevailing implementations of the
JVM. I have also {% cite_details GS08 --text implemented a library %}
that parses the output from the DTrace
provider for Java in order to reveal obscure problems in the co-operation of the
JVM with the operating system.

On the software security front, I co-developed a mechanism for identifying and
preventing cross-site scripting attacks through {% cite_details MSGS11 --text Javascript fingerprinting %},
I investigated the
{% cite_details MGS12 --text evolution of software security issues %}, an effort which
was then scaled to analyze the {% cite_details MKLGS13 --text entire Maven repository %}, and I analysed
the {% cite_details GAG04 --text security challenges and requirements %}
of (then) popular component software middleware.

## Grants
<i class="fas fa-euro-sign fa-2x"></i>
I have written the following research proposals which led to funding for
me or for the institution I was working for at the time. I have also authored
and co-authored several other proposals, obviously not as lucky ones :-)

CodeFeedr
: Next-gen software analytics. NWO Big Software. &euro;440,000. Host: TU Delft. Partners: [SIG](http://sig.eu). Funding agency: NWO. 2015

Pourquoi
: Pull request quality services. STW Take-off phase 1. &euro;40,000. Host: TU Delft. Funding agency: STW. 2014

SEFUNC
: Software Engineering Properties of Functionally Enabled
Languages. Marie Curie Intra European Fellowship grant. Duration 16 months.
Total budget &euro;130,000. Host: TU Delft. Funding agency: Research
Executive Agency (European Commission). 2012

STEREO
: Software Engineering Research Platform.
Collaborative research project. 3 partners. Duration 36 months. Total
budget: &euro;600,000. Host: Athens University of Economics and Business. Funding agency: Greek Secretariat of Research and Technology. 2010

CallGraphRank
: Pagerank on software graphs.  Basic research grant. 2
researchers. Duration 12 months. Total budget: &euro;10,000. Funding agency:
Athens University of Economics and Business. 2010

SQO-OSS
: Software Quality Observatory for Open Source Software. Collaborative research project. 6 partners. Duration 24 months.
Total budget &euro;1,638,000. Host: Athens University of Economics and Business. Funding agency: European Commission. 2006

## Projects

<i class="fas fa-cog fa-2x"></i>
A list of research projects I have been actively involved with, along with a description of my role
in them, in reverse chronological order:

[Testroots](http://testroots.org)
: The project investigates how developers use testing. The ultimate goal is to
learn from past behaviours to drive up testing quality and efficiency.

[Passive](http://ict-passive.eu/)
: The project investigated trust establishment frameworks in cloud computing and shared virtual machines environments. As part of the project management team, I oversaw and contributed to the mechanism design and software development.

[SQO-OSS](https://github.com/istlab/Alitheia-Core)
: The project developed a novel platform for software quality assessment. I was in charge of preparing the proposal, submitted it to the European Commission and handle the subsequent negotiations. As the project's manager, I oversaw its development. As member of the RTD team, I was the platform's chief designer and contributed the largest number of lines in its code base. After the end of the project, I maintain and expand its source code base. The project was the basis for my doctoral dissertation

[PENED](http://istlab.dmst.aueb.gr/content/projects/p_pened_b2b.html)
: The PENED series of projects were Greek state funded joint research projects for PhD students. Along with Stephanos Androutsellis Theotokis and Kostas Stroggylos, we investigated novel ways for doing secure business to business transactions, both at the architectural and at the implementation level. As a researcher, I oversaw the architectural design and optimised the developed platform.

[PRAXIS](http://istlab.dmst.aueb.gr/content/projects/p_praxis.html)
: The PRAXIS project looked into methods for performing automated document exchange in business to business and business to state scenarios. As a research assistant, I designed document schemas and a couple of exchange processes.

[Jamaica](http://apt.cs.man.ac.uk/projects/jamaica/)
: The project investigated chip multiprocessors and the accompanying parallel software. As part of my MSc research, I ported the JikesRVM Java virtual machine to run on top of bare hardware.

## Research software and data

* In our work {% cite_details GS13 --text Conducting Quantitative Software Engineering Studies with Alitheia Core %},
we used both the Alitheia Core dataset and a new, sorter dataset. Find
more details on how to replicate the case studies reported in this paper [here](/research/qsesac.html).

* *Alitheia Core* is a platform that enables researchers in the field of software
engineering to automate experiments and distribute the processing load on a
cluster of machines. I maintain the project in its own site. The project has
been the centerpiece of my [PhD work](phd.html), while it has been presented
individually in {% cite_details GS09a --text this work %}. A dump of the Alitheia Core
database as it was by the end of my PhD can be found from [this page](phd.html).
The data schema has changed a lot since then so if you are interested in a
recent version of those, please contact me directly.

* The *Java DTrace Toolkit (JDT)* is a series of Perl scripts that use the JVM DTrace providers on
<del>Open</del>Solaris to provide deep insights on how Java software executes and how it interacts
with the operating system. [More...](/sw/jdt.html)

### Scripts and Hacks

* *Whereami* is a Perl script along with a J2ME application that allows a user to
record his tracks and allows other users to view the current status, speed and
altitude of the data sharing user on a Google map. This hack was done back on
Dec 07, long before Google released its similarly functioning, but widely more
popular, Latitude service. You can find it here .

* *Thesis-o-meter*: Almost all computer science PhD students implement a tool to
monitor their thesis writing progress some time. I am [sharing mine here](/sw/tom.html) to help against
re-inventing the wheel (even though I am pretty sure this particular wheel will keep being re-invented
forever --- procrastination is much more enjoyable than writing).
