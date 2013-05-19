---
layout: post
author: Georgios Gousios
title: Analyzing pull requests on Github
categories: Github PullRequest
---

Pull requests as a distributed development model in general, and as implemented
by Github in particular, form a new method for collaborating on distributed
software development. The novelty lays on the decoupling of the development
effort from the decision to incorporate the results of the development in the
code base. To conduct a first evaluation of this exciting new way of distributed
software development, together with [Martin Pinzger](http://serg.aau.at/bin/view/MartinPinzger) and [Arie van Deursen](http://www.st.ewi.tudelft.nl/~arie/), I
analyzed statistically data from Github projects to determine what are the
factors that affect the decision to merge a pull request and the time required
to do it.

#### Approach

We used the [GHTorrent dataset](http://ghtorrent.org) in two ways:

* We first explored the usage of pull requests across all projects on Github
* We then focused on a set of 100 projects (50 handpicked, 50 random) to see how
pull requests are being used in real projects. To include a project in our
examination set it should have more than 10 pull requests in 2012, should
include tests and should have a committer count larger than the core team member
size. The list of projects we selected can be seen in the following figure (size
signifies number of pull requests examined for project). 

 <a href="/files/wordcloud.png" rel="lightbox">
  <img style="width: 70%;margin-left: auto; margin-right:auto;" src="/files/wordcloud.png" alt="Projects used in the pull request study">
</a>

The project selection process left us with 37.5k pull requests. We extracted
more than 20 measurements for each one, which we then trimmed down to 12 through
cross correlation analysis. The variables are split in 3 large categories
namely pull request impact, project characteristics and developer
characteristics. We then analyzed the dataset statistically.

To evaluate the combined effect of factors on pull request acceptance and
processing speed, we resorted to machine learning: we constructed
prediction models using four well known machine learning algorithms (Random
Forests, Support Vector Machines, binary logistic regression, Naive Bayes)
and chose the one with the best prediction results to extract the factor
importance. For both questions Random Forests worked best, so we used the
algorithm's integrated importance calculation metric (Mean Decrease in Accuracy)
to determine the most important factor for each research question.

#### Findings

Here are the main findings of this work:

* 80% of pull requests are merged in less than 3 days, while 30% are merged within one hour. 70% of all pull requests are merged.

* Training doesn't help: projects are not getting faster at pull request processing by processing more pull requests

* Including test code does not help pull requests to be processed faster.

* Pull requests democratize development: We found no statistical difference in how fast pull requests are being processed based on their origin (project team or community).

* The three main factors that affect the decision to merge a pull request are: i) How active the area affect by the pull request has been recently ii) The size of the project iii) The number of files changed by the pull request. It is possible to predict whether a pull request will be merged with an accuracy of 90%.

* The three main factors that affect the time (faster or slower than the mean
time in the dataset) to merge a pull request are: i) The number of discussion comments ii) The size of the project iii) The project’s test coverage. It is possible to predict the time to merge a pull request with an accuracy of 70%.

* Pull requests are much faster to merge than email-based patches. Projects can tune their reviewing and testing processes for faster turnover.

* Pull requests can help involve project community to the code review process.

#### Availability

The technical report for this work (entitled An Exploratory Study of the Pull-based Software Development Model) can be found [here](http://swerl.tudelft.nl/bin/view/Main/TechnicalReports) ([TUD-SERG-2013-010](http://swerl.tudelft.nl/twiki/pub/Main/TechnicalReports/TUD-SERG-2013-010.pdf)). The corresponding paper is still under evaluation.

See [here](/bibliography/GPD13.html) for a Bibtex record.
