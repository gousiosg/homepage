---
layout: post
author: Georgios Gousios
title: The SEFUNC project final report
categories: GHTorrent report
---
*by Georgios Gousios and Arie van Deursen*

*This is the publishable version of the final report submitted as part of
my Marie Curie IEF project. It summarizes what I did during the 16 months I was funded by it.*

The advent of distributed version control systems has led to the development of a new paradigm for distributed software development; instead of pushing changes to a central repository, developers pull them from other repositories and merge them locally. Various code hosting sites, notably Github, have tapped on the opportunity to facilitate pull-based development by offering workflow support tools, such as code reviewing systems and integrated issue trackers. The SEFUNC project was focused on mining and analyzing distributed collaboration on social coding sites using functional as well as object-oriented programming paradigms. 

In the context of the project, we created a large scale repository mining operation to retrieve all data available from the Github hosting site, and
using it we analyzed distributed collaboration through pull-based development  and visualized language ecosystems.

## Large scale repository mining

A common requirement of many empirical software engineering studies is the acquisition and curation of data from software repositories. During the last few years, GitHub has emerged as a popular project hosting, mirroring and collaboration platform. GitHub provides an extensive web service, which enables researchers to retrieve both the commits to the projects’ repositories and events generated through user actions on project resources. GHTorrent aims to create a scalable off line mirror of GitHub’s event streams and persistent data, and offer it to the research community as a service. 

The primary challenge for the data collection process is the Github imposed requests per hour limit for authenticated requests, while the event generation rate is already higher; given that a single event can lead to several (even thousands) of dependent requests, it is not practical to assume that a single Github account will suffice to mirror the whole dataset. For this reason, GHTorrent was designed from the ground up to employ distributed data collection. The event and data retrieval process have been split in two components connected together through a queue; this way event retrieval is isolated from data retrieval and both can happen in parallel by multiple accounts. Shared databases keep track of the data on both ends of the retrieval. To acquire more Github accounts, we introduced the *workers for data* program, where interested researchers provided their account credentials to the project in exchange for direct access to the live databases.

After collection, the data is provided back to the community through the [project's web page](http://ghtorrent.org). Currently, more than 2 terabytes of data is on offer in two database formats. The wealth of data enables researchers for the first time to do *full population quantitative studies* in several domains, including software ecosystems, distributed collaboration and repository mining. The project has been awarded the *Best data showcase award* at the 2013 Mining Software Repositories conference, for its innovative use of distributed crawling and the sharing of valuable data with the community.

## Pull based development

Pull-based development is an emerging paradigm for distributed software
development. As more developers appreciate isolated development and branching, more projects, both closed source and, especially, open source, are being migrated to code hosting sites such as Github and Bitbucket with support for pull-based development. A unique characteristic of such sites is that they allow any user to clone any public repository. The clone creates a public project that belongs to the user that cloned it, so the user can modify the repository without being part of the development team. Furthermore, such sites automate the selective contribution of commits from the clone to the source through pull requests.

Pull requests as a distributed development model in general, and as implemented by Github in particular, form a new method for collaborating on distributed software development. The novelty lays in the decoupling of the development effort from the decision to incorporate the results of the development in the code base. By separating the concerns of building artifacts and integrating changes, work is cleanly distributed between a contributor team that submits, often occasional, changes to be considered for merging and a core team that oversees the merge process, providing feedback, conducting tests, requesting changes, and finally accepting the contributions.

Within the context of the project, we performed the first large scale quantitative analysis of how the pull-based development model works. Specifically, we extracted data from 300 large projects (170,000 pull requests) and using statistical and machine learning tools, we examined the factors that affect pull request acceptance, rejection and the time required
to do so. We found that the pull based development model offers fast turnaround, increased opportunities for community engagement and decreased time to incorporate contributions. We showed that a relatively small number of factors affect both the decision to merge a pull request and the time to process it. Our findings contain actionable items that can be exploited
by teams and individuals to improve the efficiency of distributed collaborative projects.

## Visualizing language-based project ecosystems

<img align="right" src="/files/communities.png" width=40%"></img>

In the context of software analysis, the term ecosystem means a collection of software systems, which are developed and co-evolve in the same environment. An interesting partitioning of projects in ecosystems is that of ecosystems created by projects developed in the same programming language, thus permitting the visual comparison of, e.g., functional and object-oriented languages. On the collaboration level, language ecosystems are created by sharing developers among projects. To investigate the existence and evolution of such ecosystems, we [created an interactive visualization](http://www.gousios.gr/blog/project-communities-visualization/) (seen in the adjacent screenshot). Using it interested parties can go through millions of collaborations of developers among projects of one or more programming languages, and also investigate those through time.

## Dissemination actions

The SEFUNC project followed an open access strategy to ensure broad and timely dissemination of project results. All source code, analysis tools
and datasets that were developed by the project were disseminated using open source and creative commons licenses from day one. We used social media (mostly blogs and Twitter) to disseminate the project's results, while
we closed monitored the reach and effect of our online dissemination strategy using social media analytics.

### Website

The project created a web site to host and disseminate the generated artifacts. The web site is mostly targeted to researchers, even though
interested users can find interactive visualizations of significant
parts of the dataset. Through the [GHTorrent.org](http://ghtorrent.org) site, one can find:

* Links to download the dataset (in two formats) along with documentation on
how to use it
* Online tools to query both datasets.
* Instructions on how to use the developed tools to recreate the dataset from scratch.
* Example interactive applications (project community graph-based visualization, programming language popularity metrics) developed using the dataset.

### Scientific dissemination

The scientific dissemination strategy for the project included publications
to conferences and journals. The project produced 2 conference and 2 journal
publications.
One of them won the [Best Data Showcase Award](http://2014.msrconf.org/history.php) at the 10th conference of Mining Software
Repositories. The following publications resulted from the project:

**Journals**

* Gousios, G., & Spinellis, D. (2013). [Conducting quantitative software engineering studies with Alitheia Core](http://www.gousios.gr/bibliography/GS13.html). Empirical Software Engineering, 1–41.
* Louridas, P., & Gousios, G. (2012). [A note on rigour and replicability.](http://www.gousios.gr/bibliography/LG12.html) SIGSOFT Softw. Eng. Notes, 37(5), 1–4.

**Conferences**

* Gousios, G. (2013). [The GHTorrent dataset and tool suite.](http://www.gousios.gr/bibliography/G13.html) In MSR ’13: Proceedings of the 9th Working Conference on Mining Software Repositories.

* Mitropoulos, D., Karakoidas, V., Louridas, P., Gousios, G., & Spinellis, D. (2013). [Dismal Code: Studying the Evolution of Security Bugs.](http://www.gousios.gr/bibliography/MKLGS13.html) In LASER ’13: Proceedings of the 2013 Workshop on Learning from Authoritative Security Experiment Results.

2 more works that resulted from the project 
([large scale analysis of the pull based development model](http://www.gousios.gr/bibliography/GPD14.html), 
[experiences of teaching functional programming at TU Delft](http://www.gousios.gr/bibliography/MG13.html)) are currently under review.

### Invited talks

Georgios Gousios has been invited to present his experience in building large scale, open access research data sets at the Panel on Open Access in the 29th International Conference on Software maintenance. He presented the project and its success at attracting external users almost immediately and attributed
it to the fact that it was open and well documented from the beginning ([blog post](http://www.gousios.gr/blog/On-open-access/), [presentation](http://www.gousios.gr/bibliography/Gousit13b.html)).

In addition, the project was presented after invitation at the following universities/research groups/companies:

* Software Technology Group, TU Darmstadt, Germany ([presentation](http://www.gousios.gr/bibliography/Gousit13a.html))
* Information Systems Laboratory, Athens University of Economics and Business, Greece ([presentation](http://www.gousios.gr/bibliography/Gousit13a.html))
* IHomer, Breda, The Netherlands. Presentation: "On Software Changes, Large and Small"

### Dissemination strategy effectiveness metrics

* The artifacts generated by the project are in active use by at least 7 institutions outside TU Delft. 4 external scientific publications have been submitted/accepted in field conferences.

* The dataset has been selected as the official dataset of the mining challenge at the 11th Conference on Mining Software Repositories. Currently, more than 40 downloads of the dataset from more than 30 universities have been recorded in our logs.

* The source code repository has been starred (is being followed) by 35 Github users, while the corresponding Ruby library has been downloaded 4,500 times.

* The [ghtorrent.org](http://ghtorrent.org) 40 unique visitors a day with a
return visitor rate of more that 50%. In total, it has been visited by 1,200 visitors, most from the US, Canada and Brazil. It has appeared in social media more in excess of 50 times.

* The blog posts by Georgios Gousios on topics about and related to GHTorrent have been viewed by more than 800 unique users while they appeared in social media more than 70 times.

## Impact and Availability

The project has generated a stream of follow up work. The dataset has been
selected for the mining challenge of the 11th Conference on Mining Software
Repositories, the flagship conference in the field. It is currently being actively analyzed by researchers in more than 7 Universities, while papers from independent researchers have been already published. Analysis and visualization results produced through the project have been used as examples of cutting edge research in conference keynotes (e.g by [Brian Doll at MSR13](https://twitter.com/avandeursen/status/336154714360139776)).

*You can find more about the project, including the datasets, links
to source code, visualizations and documentation through the project's website at http://ghtorrent.org*
