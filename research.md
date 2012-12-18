---
layout: page 
title: Research
---
{% include JB/setup %}

##Interests

I am genuinely interested in any topic that has to do with systems, software and security, and combinations thereof. Specifically my research interests are
the following:

* Software engineering
* Programming languages
* Systems software and security

###Software Engineering

I am currently working on {% cite_details GS12, obtaining %}
and analysing data from Github, throught the [GHTorrent](https://github.com/gousiosg/github-mirror) project.

I lead the design and development of [Alitheia Core](http://www.sqo-oss.org)
(also on [Github](https://github.com/istlab/Alitheia-Core)),
a high performance research platform
that works with data from software repositories. I used the platform to develop models for the {% cite_details KGSP09, evaluation %} of
{% cite_details GKS08, developer contribution %}, to investigate the evolution of {% cite_details MGS12, software security issues %} and to
{% cite_details Gousi09-phdthesis, process %}
and [share](http://demo.sqo-oss.org) data from more than
[600 open source software repositories](http://ikaria.dmst.aueb.gr/repositories/).

I also proposed a
{% cite_details GKAG06B, platform %} for
{% cite_details SGKLASS09, analysing the quality of OSS projects %} and a
corresponding
{% cite_details SGSS08, hierarchical metrics-based software quality model %} for evaluating both the
process and the product quality. I have also contributed to a
{% cite_details ASKG11, comprehensive survey %} of the literature in OSS research.

###Systems Software and Security

I {% cite_details Gousi04-mscthesis, ported %} [JikesRVM](http://jikesrvm.org),
a JVM written mostly in Java, to run on top of bare hardware, without support
from an operating system. Later, I contributed patches to the JikesRVM project
to enable support for Opensolaris, and in the context of the [Google Summer of
Code 2008](http://code.google.com/soc/2008/jikesrvm/about.html) program, to
compile and [run with OpenJDK](http://docs.codehaus.org/display/RVM/Acknowledgments). I also proposed
an architecture to make Java’s I/O subsystem faster by
{% cite_details G07, replacing the operating system with a hypervisor %}
and thus relieving it of
context switches and unnecessary data copies; an almost identical approach has
been independently developed into the JRockit virtual edition product.

On the systems performance front, I have studied the performance of then popular
dynamic content generation technologies for the Apache web server
({% cite_details GS02, my first paper %}, which received a best paper award) and I
investigated ways for {% cite_details GKS06, optimally configuring %} the
garbage collection algorithms for the then two prevailing implementations of the
JVM. I have also {% cite_details GS08, implemented a library %}
that parses the output from the DTrace
provider for Java in order to reveal obscure problems in the co-operation of the
JVM with the operating system.

On the software security front, I co-developed a mechanism for identifying and
preventing cross-site scripting attacks through {% cite_details MSGS11, Javascript fingerprinting %},
I investigated the
{% cite_details MGS12, evolution of software security issues %}, and I analysed
the {% cite_details GAG04, security challenges and requirements %}
of (then) popular component software middleware.

##Grants Obtained
I have written the following research proposals which led to funding for
me or for the institution I was working for at the time. I have also authored
and co-authored several other proposals, obviously not as lucky ones :-)

SEFUNC
: Software Engineering Properties of Functionally Enabled
Languages. Marie Curie Intra European Fellowship grant. Duration 16 months.
Total budget &euro;130,000. Host: TU Delft. Funding agency: Research
Executive Agency (European Commission).

STEREO
: Software Engineering Research Platform.
Collaborative research project. 3 partners. Duration 36 months. Total
budget: &euro;600,000. Host: Athens University of Economics and Business. Funding agency: Greek Secretariat of Research and Technology.

CallGraphRank
: Pagerank on software graphs.  Basic research grant. 2
researchers. Duration 12 months. Total budget: &euro;10,000. Funding agency:
Athens University of Economics and Business.

SQO-OSS
: Software Quality Observatory for Open Source Software. Collaborative research project. 6 partners. Duration 24 months.
Total budget &euro;1,638,000. Host: Athens University of Economics and Business. Funding agency: European Commission.


##Projects

A list of research projects I have been actively involved with, along with a description of my role in them, in reverse chronological order:

[Passive](http://ict-passive.eu/)
: The project investigated trust establishment frameworks in cloud computing and shared virtual machines environments. As part of the project management team, I oversaw and contributed to the mechanism design and software development.

[SQO-OSS](http://www.sqo-oss.org)
: The project developed a novel platform for software quality assessment. I was in charge of preparing the proposal, submitted it to the European Commission and handle the subsequent negotiations. As the project's manager, I oversaw its development. As member of the RTD team, I was the platform's chief designer and contributed the largest number of lines in its code base. After the end of the project, I maintain and expand its source code base. The project was the basis for my doctoral dissertation

[PENED](http://istlab.dmst.aueb.gr/content/projects/p_pened_b2b.html)
: The PENED series of projects were Greek state funded joint research projects for PhD students. Along with Stephanos Androutsellis Theotokis and Kostas Stroggylos, we investigated novel ways for doing secure business to business transactions, both at the architectural and at the implementation level. As a researcher, I oversaw the architectural design and optimised the developed platform.

[PRAXIS](http://istlab.dmst.aueb.gr/content/projects/p_praxis.html)
: The PRAXIS project looked into methods for performing automated document exchange in business to business and business to state scenarios. As a research assistant, I designed document schemas and a couple of exchange processes.

[Jamaica](http://apt.cs.man.ac.uk/projects/jamaica/)
: The project investigated chip multiprocessors and the accompanying parallel software. As part of my MSc research, I ported the JikesRVM Java virtual machine to run on top of bare hardware.

