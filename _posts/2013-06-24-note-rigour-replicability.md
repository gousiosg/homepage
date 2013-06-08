---
layout: post
author: Georgios Gousios
title: A Note on Rigor and Replicability
categories: Research Java Scala
---

At ICSE 2012, [one of the presented papers]() caught my attention; the title
was provocative enough and the topic was very hot: functional vs imperative
programming. The paper presented a comparative study of programming a multicore
application in Java and Scala. The authors used a group of master
students to write a non-toy application in both languages and then compared
the results. They found no....

I remember leaving the paper presentation with mixed feelings; my suspicions
grew stronger when I actually read the paper. There were several errors in the
paper with respect to the methods used and the statistical treatment of the data.
Together with my friend and colleague [Panos Louridas](), we wrote a paper that
criticizes the methods used in the Pankratius et al. paper. Partially because
only the paper abstract was published in the print version of SigSoft Software
Engineering notes, our criticism went relatively unnoticed. Since today marks
the first anniversary of the writing of the paper, I am summarizing it here.
You can also [read the full version]().

#### Problems we found

* Wrong statistical tests being used or wrong naming of the statistical tests

* Liberal interpretation of p-values. While the authors use p < 0.05 as a
threshold for significance (in itself strange as the population size was just
13), they later claim significance (or support) for p-values of 0.078 and 0.094

* Subjects were classified as experts in Scala after 4 weeks of training while
other subjects were classified as novices in Java after 4 years of university
studies.

* The method used to identify imperative and functional parts of the code
classified as imperative an example created by Martin Odersky to showcase
the functional programming capabilities of the language.

#### How to fix them?

We would have encountered none of the problems outlined above if published papers included:

* All measurement data
* All interviews, questionnaire, research protocols, and other related data derived from subjects, anonymized if necessary
* Full details on the statistical methods used.
* Any other code that has been used in the publication’s research
* Documentation for all of the above

Conferences and journals should require from authors to open up their data and
their data manipulation tools under a license that enables everybody to use
them. Sharing of data should happen in an organized way; for example, conference
organization committees could create a shared repository where researchers can
upload their data and tools along with instructions to use them. To enable full
replication, researchers should provide virtual machine images with the full
environment and data they used. Moreover, conferences and journals can describe
a formal redress procedure; should an error is found in a paper, authors should
be required to reply to the error claim.

What we propose can be a best effort approach: by default, submissions should be
accompanied by datasets and tools; if these are not available due to *force
majeure*, it should be up to the editor/conference chair to decide on the
submission.

#### Conclusions

The purpose of this work was not to point fingers, but to raise the issue of the
dangers of inadequate reproducibility. We were drawn to this particular article
and use it as an example mostly because some of the findings contradict our own
experience. Other articles in the same conference are equally opaque with
regards to replication and verification. However, we believe that
publication-time availability of experimental data, tools and experiment
replication documentation should be a requirement for publication. Our proposal,
if adopted, might be a first step in this direction.


#### References
