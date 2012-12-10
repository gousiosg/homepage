---
layout: page
title: Pagerank as a metric of code importance 
---

##Pagerank as a metric of code importance

Pagerank is a widely used measure of node importance in networks. It works by recursively assigning weights on nodes based on the number of incoming links to them and the Pagerank score of the linking nodes. Google famously used Pagerank to drive the results of its search engine. The purpose of the project is to evaluate the descriptive/predictive power of Pagerank on graphs resulting from software engineering activities. Some ideas are the following:

* *Optimisation*: Run Pagerank on function call graphs and estimate whether important nodes in static call graphs (as calculated by methods such as control flow analysis) can predict most executed nodes in dynamic call graphs (as calculated by actual) program runs.

* *Testing*: Run Pagerank on static program call graphs and compare the importance of nodes (functions/methods) to the degree of testing they receive.

* *Stability*: Check whether important nodes in static call graphs are changed often and how this affects system stability.

####References

