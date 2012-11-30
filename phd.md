---
layout: default
title: PhD Thesis
---

##PhD Thesis Page

On Jul 4, 2009, I succesfully defended my PhD thesis, entitled Tools and Methods for Large Scale Software Engineering Reseach. [Diomidis Spinellis](http://www.dmst.aueb.gr/dds) was my PhD supervisor.

In a nutshell, my thesis examined how research in software engineering is done today and proposed and evaluated a system for large scale research studies that presumably addresses the discovered shortcomings.

You can find out more about my thesis, by downloading it from the following link:

* [Download thesis](pubs/gousiosg-thesis.pdf)

If you find it useful, you can use the following Bibtex record to cite it.

{% highlight tex %}
@phdthesis{Gousi09-phdthesis,
  Author = {Georgios Gousios},
  School = {Athens University of Economics and Business}, 
  Title = {Tools and Methods for Large Scale Software Engineering Research},
  Month = {July},
  Year = {2009}
}
{% endhighlight %}

While writing the thesis, I found very useful to monitor my progress using automated tools. You can see the results in the [Thesis-o-meter](tom.html) page.

###Software and Research Data

My reseach produced a significant amount of software, which forms part of the
[SQO-OSS](http://www.sqo-oss.org) project. Bundling my specific contributions as
a downloadable package is impossible without breaking its functinality and
therefore I would like to redirect interested readers to the SQO-OSS project
software repository ([Github](http://github.com/istlab/Alitheia-Core)).

For conducting the case studies presented in the thesis, I have analysed, using
Alitheia Core, the data repositories from about 230 OSS projects. The result is
a database with more than 100 million records, the [compressed
dump](https://pithos.grnet.gr/pithos/rest/gousiosg@aueb.gr/files/datasets/alitheia.mysql.dump.gz)
of which weights about 1.4GB. The dump has been confirmed to work with the MySQL
database and Alitheia Core revision
[88a6fcc6d15aac911a](https://github.com/istlab/Alitheia-Core/commit/88a6fcc6d15aac911aba710ea8a30e2a9a166443).
The processing of the data was done using very simple shell script one-liners
and the R statistics package.

The depending on the kind of analysis you might want to do, the provided data might not be helpful. The reason is that Alitheia Core defaults to use the real project repository data in several ocassions. Here are the [full mirrors](http://ikaria.dmst.aueb.gr/repositories/).


###Long abstract

Software engineering is concerned with the study of systematic approaches towards software development and maintenance. According to many authors, software engineering is an empirical science as it strives to produce models that capture the characteristics of the development process or to predict its behaviour. Being an empirical science, software engineering is in a constant need for data.

The emergence of the Open Source Software (OSS) movement has provided software engineering researchers with rich process and product data. OSS projects make their source configuration management, mailing lists and issue tracking database systems publicly available. Although they are free to use, OSS data come with a cost for the researcher. During a lifetime spanning multiple decades, several OSS projects have amassed gigabytes of data worth studying. The computational cost for processing such large volumes of data is not trivial and lays beyond the capabilities of single workstation setups. Moreover, each project uses its own combination of the aforementioned and other project management systems management tools, such as Wikis and documentation generators. Without the appropriate abstractions, it is challenging to build tools that can process data from various projects at the same time.

In the recent years, software engineering research benefited from the availability of OSS repositories and a new stream of research that takes advantage of the rich process data residing in those repositories emerged. To evaluate the extend and use of OSS data in empirical software engineering studies, we conducted a systematic literature review. Specifically, we constructed a classification framework which we then applied on 70 randomly selected studies published in various software engineering publication outlets from 2003 onwards. The classification provided interesting insights:

Studies are being performed almost exclusively on data originating from OSS projects.
The vast majority of studies use data from less than 5 projects.
There is no cross validation of the results of published works.
We attribute the obtained results to the inherent complexity of experimenting with OSS data. To remedy the situation, we propose performing large scale software engineering research studies on an integrated platform, that combines easy to use and extend tools and readily analysed data. Drawing from the experiences of other mature empirical fields, we believe that shared research infrastructures are crucial for advancing the state of the art in research, as they enable rigourous evaluation, experiment replication, sharing tool, results and raw data and, more importantly, allow researchers to focus on their research questions instead of spending time to re-implement tools or pre-process data.

In this thesis, we investigate novel ways to integrate process and product data from various OSS repositories in an effort to build an open Software Engineering Research Platform (SERP) consisting of both software tools and shared data. We base our work on SQO-OSS, a tool designed to perform software quality analysis. We analyse the design of the raw data and metadata storage formats and as part of its implementation, we develop novel solutions to the problems of: (i) representing distributed and centralised source configuration management data in relational format (ii) identifying and resolving developer identities across data sources, and (iii) efficiently representing and distributing processing workload towards fully exploiting the available hardware.

To demonstrate the validity of our approach, and the effectiveness of the proposed platform in conducting large scale empirical research, we perform two case studies using it. The first one examines the effect of intense email discussions on the short-term evolution of a project. The hypothesis under investigation is that since OSS projects have limited human resources, intense discussions on mailing lists will have a measurable effect on the source code line intake rate. After examining the characteristics of intense communications, we construct a model to calculate the effect of discussions and implemented it as an extension to our platform. We run the study on about 70 projects and we find that there is no clear impact of intense discussions in short term evolution.

In the second case, we correlate maintainability metrics with key development process characteristics to study their effect on project maintenance. Specifically, we study whether the number of developers that have worked on a project or on a specific source module is indicative of how maintainable the project as a whole or the module is. Using the SERP platform, we run the study on 210 C and Java projects. We find no correlation between the number of developers that have worked on a project or a source code module and its maintainability, as this is measured by the maintainability index metric.

One of our findings is that in both case studies, the application of bias on the selection of the examined sample, would lead to completely different results. In fact, we show that there are more hypothesis validating cases (even though the hypotheses have been overall invalidated) for each case study than the average number of cases evaluated per case study in currently published studies, which we derived from the systematic literature review. We consider this result as a strong indication of the value of large scale experimentation we advocate in this thesis.

Overall, our contribution has both a scientific and a practical aspect. More specifically:

* We describe a framework for classifying empirical software engineering research works and we use it to analyse the shortcomings of the current state of the art.
* We analyse the requirements and describe the design of a platform for large scale empirical software engineering studies.
* We introduce a relational schema for storing metadata from software repositories, which provides our platform with enough abstractions to retrieve software process metadata across projects and across software repositories.
* We introduce an algorithm for mapping semi-structured data from software configuration management repositories in a relational format.
* We introduce algorithms for resolving developer identities across data sources and for distributing the load of computation across nodes in a cluster environment.
* We validate our platform by conducting two case studies using it. We find that intense email discussions do not affect short term project evolution and that development team size does not affect software maintainability at the module or project level.
* We show that the results of the aforementioned case studies could be radically different if bias is applied on the selected experimentation dataset, thereby validating our thesis on the importance of conducting experiments on large scale datasets.

###Acknoweledgements
The work on my thesis was funded by the Greek Secretariat of Research and Technology and by the [FP6-funded](http://cordis.europa.eu/fetch?CALLER=FP6_PROJ&ACTION=D&DOC=1&CAT=PROJ&QUERY=01248c46be97:50b0:2b51e482&RCN=79362) SQO-OSS project.

