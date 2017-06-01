---
layout: post
author: Georgios Gousios
title: Report from ICSE 2017
categories: research ICSE MSR
---

On the week of May 18-27, I travelled to Argentina to attend MSR and ICSE. For
people not familiar with software engineering research, ICSE is the flagship
conference of the field and one of the few that receive an A* rating in the
[Core conference rankings](http://portal.core.edu.au/conf-ranks). All aspiring
software engineering researchers aim to publish there, which makes it very
competive (~16% acceptance rate). This year, ICSE took place in the beautiful
city of Buenos Aires, a place that reminded me of home (well, Athens) more than
any other city I have been to.

I really enjoyed ICSE this year. The main track content was quite technical,
while the software engineering in practice track was full of interesting tales
from the battlefront. I really wish I could be in more than one talks at the
same time!

For the first time in 3 years, I did not have anything to present; this
allowed me to relax and actually attend lots of talks. Moreover, I also forced
myself to take notes during the presentations. What follows is a list of brief
summaries of some of the papers whose presentations I attended, based on those
notes.

In [Transitive class immutability in Java](http://www.cs.cmu.edu/~aldrich/papers/icse17-glacier-immutability.pdf), the authors implement a plug-in type
system for Java (based on annotations and the Checker framework) that can
check and/or enforce immutability on object hierarchies, transitevely. The
authors applied it on existing programs and found bugs and also compared its
use with Java's own **final** keyword (they found Glacier supperior).

In [Clone refactoring with lambda expressions](https://users.encs.concordia.ca/~nikolaos/publications/ICSE_2017.pdf), the authors propose and formally
specify a simple refactoring to lambda expressions to eliminate certain types of clones. This paper stood out for its extensive evaluation: the authors
successfuly tried their refactoring on 12k (!) clones covered by tests,
while it can refactor away 58% of clones in a body of 46k (!!) clones.

In [Guided genetic Algorithm Automated crash reproduction](https://pure.tudelft.nl/portal/files/11926462/TUD_SERG_2017_006.pdf) my collegue Mozan presented
a method that can automatically generate test cases that reproduce
crashes, using clever applications of genetic algorithms in Evocrash.

In [General framework for dynamic stub injection](https://www.microsoft.com/en-us/research/publication/general-framework-dynamic-stub-injection/), the awesome Maria Christakis
created a framework that intercepts the Windows dynamic library loader and
inserts code that runs before and after method invocations (stubs). They also
constructed a DSL that allows the specification of stub locations. They used
this tool to find bugs to applications as well tested as Word and Excel.

In [To Type or Not to Type: Quantifying Detectable Bugs in JavaScript](http://www0.cs.ucl.ac.uk/staff/z.gao/doc/paper/type_study.pdf) attempted to quantify
the value of pluggable type systems, such as Flow and Typescript. The
authors empirically verify that pluggable typesystems can catch at least 15%
of public bugs at the cost of 2 tokens per bug! A major win for static typing and a fantastic result overall.

Moving on to user studies, in [Classifying developers into core and peripheral](http://www.infosun.fim.uni-passau.de/publications/docs/JAH+17.pdf)
the authors presented a graph-based method (basically, extract the fully
connected component of the code collaboration graph) that identifies core developers. They validated it by emailing projects and checking each project's
responses with their network based model. From now on, graphs it is then.

In [Understanding the Impressions, Motivations, and Barriers of One Time Code
Contributors to FLOSS
Projects](http://carver.cs.ua.edu/Papers/Conference/2017/ICSE_OTC.pdf), the
authors performed a study very similar to our {%cite_details GSB16 --text ICSE
2016 pull request contributor %} one and found more or less the same results,
albeit NOT on GitHub. This means that topics such as developer responsiveness
and entry barriers exist beyond GitHub and are therefore crucial to fix.

In [Do developers read compiler error
messages](http://static.barik.net/barik/publications/icse2017/PID4655707.pdf),
the authors explore the issue of compiler message comprehension. They did an
eyetracking study to identify what developers look for when reading error
messages and where their visual perception stumbles upon. Being one of the very
few studies that use eyetracking in our field, this is definetely worth a read.

On the SE in practice front, I 've attended a great talk about [CI at Google
scale](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/45794.pdf), a [quantitative overview of A/B experiments in Bing](http://www.ifi.uzh.ch/dam/jcr:bafebc0f-ac0c-46d9-934b-4a0d5e2aab14/Characterizing_Experimentation_SEIP2017.pdf) (did you know that 50% of them
are actually deployed?) and a talk about Mike de Jong's [QuantumDB
framework](http://quantumdb.io) for uninterupted schema evolution in continuous delivery environments.

The papers above are just a selection of all the talks I attended this year; I
did not cover MSR or various workshops. All in all, a very fulfilling week!
