---
layout: post
author: Georgios Gousios
title: The triumph of online collaboration 
categories: GHTorrent Github collaboration
---

For a research paper I am working on, we wanted to analyze the top 30 "most collaborative" projects on Github. Defining a quantitative metric of collaboration and sorting projects according to it is not an easy task, as collaboration is in many cases implicit and not recorded, while not all actions of collaboration are equal. As a proxy, we chose to measure the number of people that perform changes that mutate the state of a repository. On Github, we could identify the following:

* A: Create a commit to a repository
* B: Perform a code review on an individual commit
* C: Create/Update/Merge/Close a pull request
* D: Perform a code review on a pull request
* E: Comment on a pull request 
* F: Create/Close an issue
* G: Comment on an issue

Using [GHTorrent](http://ghtorrent.org) as a data source, I wrote a script to measure the individual persons that performed the actions above for all non-forked repositories and then sorted the repos according to the total number of individual contributors. The results can be seen in the table below:

<table class="table table-striped">
<thead>
<tr><td><b>repo</b></td><td><b>A</b></td><td><b>B</b></td><td><b>C</b></td><td><b>D</b></td><td><b>E</b></td><td><b>F</b></td><td><b>G</b></td><td><b>all</b></td></tr>
</thead>
<tbody>
<tr><td>isaacs/npm</td><td>100</td><td>21</td><td>167</td><td>23</td><td>247</td><td>2568</td><td>3302</td><td>6147</td></tr>
<tr><td>torvalds/linux</td><td>5968</td><td>14</td><td>67</td><td>3</td><td>161</td><td>0</td><td>0</td><td>6212</td></tr>
<tr><td>symfony/symfony</td><td>1021</td><td>52</td><td>1261</td><td>395</td><td>1305</td><td>1844</td><td>2160</td><td>6215</td></tr>
<tr><td>jquery/jquery-mobile</td><td>212</td><td>13</td><td>431</td><td>21</td><td>350</td><td>2888</td><td>3008</td><td>6391</td></tr>
<tr><td>joyent/node</td><td>657</td><td>52</td><td>833</td><td>132</td><td>943</td><td>2304</td><td>2805</td><td>6653</td></tr>
<tr><td>CocoaPods/Specs</td><td>2658</td><td>90</td><td>2584</td><td>39</td><td>1235</td><td>515</td><td>268</td><td>6674</td></tr>
<tr><td>gitlabhq/gitlabhq</td><td>605</td><td>89</td><td>871</td><td>138</td><td>915</td><td>2251</td><td>3608</td><td>7344</td></tr>
<tr><td>angular/angular.js</td><td>875</td><td>92</td><td>1306</td><td>139</td><td>1520</td><td>1540</td><td>3778</td><td>7919</td></tr>
<tr><td>rails/rails</td><td>2699</td><td>309</td><td>2315</td><td>607</td><td>3174</td><td>4746</td><td>4890</td><td>15339</td></tr>
<tr><td>mxcl/homebrew</td><td>3426</td><td>76</td><td>3125</td><td>528</td><td>3888</td><td>5157</td><td>7301</td><td>20510</td></tr>
</tbody>
</table>

The numbers are staggering. A project ([Homebrew](http://brew.sh/)) that is just 5 years old has attracted 20.5k --- <span class="label label-success">20,500</span>, the size of a small city! --- people to contribute to it. Ruby on Rails has been collaboratively developed by a community of 15k people and still works! To compare these numbers with other software engineering projects is futile: most projects, even ones with a very long lifeline are very small in comparison. Perhaps a more fare comparison is with other online collaborative initiatives: The [English Wikipedia](http://en.wikipedia.org/wiki/Wikipedia:Wikipedians) is being maintained by 130,800 people, while the effort of decoding the human genome has been carried out by [thousands of people](http://www.genome.gov/DNADay/q.cfm?aid=402&year=2007).

If nothing else, the above are an example the power of commons and certainly the usefulness of Github as a collaboration platform.
