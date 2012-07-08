--- 
layout: post 
author: Georgios Gousios 
title: On the importance of tools in software engineering research
--- 

On the first weekend of July, I was at the Mining Software Repositories (MSR)
2012 conference. For those not familiar with MSR, it is a venue where software
engineering meets information extraction and data mining. Researchers present
the tools and methods that they applied on software repositories (source code
repositories, but also bug databases, mailing lists and wikis) to understand
how software is written and how its quality is affected by certain events in
the project's history. Due to its wide scope, MSR is always a bit unbalanced
with respect to the quality of the papers presented. This year however, there
were some really great submissions.

One of the most interesting talks, was Dogmei's keynote address on the first day.
Dogmei is a senior researcher at Microsoft Research Asia, where she leads the
development analytics project. During her presentation, she told some great
tales from the research vs practice battlefield. One of them, concerned a code
cloning detection tool, that has successfully graduated from Microsoft Research
to internal Microsoft teams and finally to a Visual Studio 2012 plug-in. Dogmei
explained that the most important reason this tool was successful was not that
the research upon which it was based, but the fact that it was a TOOL.
Imperfect in the beginning, its speed and accuracy was improved after
suggestions from users started pouring in. What she learned from this
experience was the importance of producing reusable tools out of the research
was greater than doing the research itself. 'Make tools. It works on my
computer is no longer enough', as she put it.

Several researchers have advocated the importance of publishing tools 

I was curious as to whether the above apply to the papers presented the very
same day (and the next) to the very same conference that Dogmei gave the
keynote talk to. To do so, I went through each paper and looked for pointers to
the tools or datasets used. I also Googled the paper titles, hoping that the
authors had put together a page containing the paper's data or tools, as it
is often the case.

The following table summarizes what I have found:

<table>
  <tr><td>Paper </td><td> Data </td><td> Tools </td><td> Documentation</td><td>Comment</td></tr>
  <tr><td>Towards Improving Bug Tracking Systems with Game Mechanisms </td><td> Partial </td><td> No </td><td> No</td></tr>
  <tr><td>GHTorrent: Github's Data from a Firehose </td><td> Yes </td><td> Yes </td><td> Partial</td></tr>
  <tr><td>MIC Check: A Correlation Tactic for ESE Data </td><td> No </td><td> No </td><td> No</td></tr>
  <tr><td>An Empirical Study of Supplementary Bug Fixes </td><td> No </td><td> No </td><td> No</td></tr>
  <tr><td>Incorporating Version Histories in Information Retrieval Based Bug Localization </td><td> Yes </td><td> No </td><td> Yes </td><td> Uses existing documented dataset</td></tr>
  <tr><td>Think Locally, Act Globally: Improving Defect and Effort Prediction Models </td><td> No </td><td> No </td><td> No </td><td> Promise to upload data</td></tr>
  <tr><td>Green Mining: A Methodology of Relating Software Change to Power Consumption </td><td> No </td><td> No </td><td> No </td><td> Best paper award</td></tr>
  <tr><td>Analysis of Customer Satisfaction Survey Data </td><td> No </td><td> No </td><td> No </td><td> Not based on open data</td></tr>
  <tr><td>Mining Usage Data and Development Artifacts </td><td> No </td><td> No </td><td> No </td><td> </td></tr>
  <tr><td>Why Do Software Packages Conflict? </td><td> No </td><td> No </td><td> No </td><td> Original data in Debian repository</td></tr>
  <tr><td>Discovering Complete API Rules with Mutation Testing </td><td> Yes </td><td> Yes </td><td> Yes </td><td> Not open source</td></tr>
  <tr><td>Inferring Semantically Related Words from Software Context </td><td> No </td><td> No </td><td> No </td><td></td></tr>
  <tr><td>Do Faster Releases Improve Software Quality? An Empirical Case Study of Mozilla Firefox </td><td> No </td><td> No </td><td> No </td><td> </td></tr>
  <tr><td>Explaining Software Defects Using Topic Models </td><td> No </td><td> No </td><td> No </td><td> </td></tr>
  <tr><td>A Qualitative Study on Performance Bugs </td><td> No </td><td> No </td><td> No </td><td></td></tr>
  <tr><td>Can We Predict Types of Code Changes? An Empirical Analysis </td><td> No </td><td> Yes (most) </td><td> No </td><td></td></tr>
  <tr><td>An Empirical Investigation of Changes in Some Software Properties Over Time </td><td> Yes </td><td> No </td><td> Yes </td><td> Uses existing dataset</td></tr>
  <tr><td>Who? Where? What? Examining Distributed Development in Two Large Open Source Projects </td><td> Yes(partially) </td><td> No </td><td> No </td><td> Paper mentions that data is on the PROMISE dataset, could not be retrieved at  the date of the conference.</td></tr>
</table>

As you can see, the results are not particularly encouraging. In one of the
most prominent empirical software engineering conferences, only two out of
18 papers provide really reusable tools (I have not investigated
the degree of reusability). Even papers that 

In my opinion, what applies in practice should also apply in research. As
researchers, we are often hesitant to provide reusable tools. Many times, this
is due to the fact that going the extra mile to convert our 'works on my
computer' scripts to tools is very time consuming and lacking any direct
scientific value (i.e. does not lead to papers). Some of us might even be
afraid of competing teams; if a tool is published this might allow others to
find flaws in our research or that a more resourceful team will leap ahead of
us using our effort.

Publishing a tool along with a paper has several advantages to research as a 
whole:

* It enables research to become repeatable, facilitating both horizontal (more
hypotheses) and vertical (more data) scaling of research efforts.
* It enables research to become reproducible, leading to more credible results.
* It enables people to become creative with someone else's effort. This is
precisely the reason that made open source software successful, and also applies
with research tools too (see for example LLVM or JikesRVM).
 
I believe that publishing reusable tools (plus data and documentation) should
be a prerequisite to publishing papers, especially so in empirical venues.
Thereby, I hope that efforts such as the 
[RESER](http://sequoia.cs.byu.edu/reser2013) workshop and the  
the will raise the awareness of the importance of tools in software engineering research.

Why do you think that people are not investing time to create tools?
