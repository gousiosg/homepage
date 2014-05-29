---
layout: post
author: Georgios Gousios
title: What's new in GHTorrent land?
categories: GHTorrent Github collaboration
---

A lot of people (around 30 on last count) have been using GHTorrent lately as an easy to use source for accessing the wealth of data Github has. Portions of the dataset appear in the [MSR14](http://ghtorrent.org/msr14.html) and [VISSOFT14](http://ghtorrent.org/vissoft14.html) data challenges, while at least 15 papers at this year's MSR and ICSE conferences are based on it.

In this blog post, I summarize the long list of changes that happened in the GHTorrent land since Sep 2013.

#### Introducing Lean GHTorrent

Obtaining and restoring the full GHTorrent dataset is serious business: one has to download and restore more than 3TB of MongoDB data and 30GB of MySQL data. The time to do this may be prohibitive if just a selection of repositories is enough for the task at hand. For this reason, together with Bogdan Vasilescu and Alex Serebrenik of TU Eindhoven fame and our own Andy Zaidman, I
{% cite_details GVSZ14 --text implemented %} the Lean GHTorrent service. 
 
[Lean GHTorrent](http://ghtorrent.org/lean.html) allows researchers to request a specific slice of the full GHTorrent dataset, on a per repository basis. All a researcher has to do is compile a list of repository names (i.e. using the [MySQL query interface](http://ghtorrent.org/dblite/) to filter projects with specific characteristics) and feed them to Lean GHTorrent. Then, magic happens: Lean GHTorrent will reply with an email to provide a link where the submitter can view the job status and another email with a link to download the data from! In the mean time, Lean GHTorrent will get a fresh copy of the data for the specific repos from Github using our existing data downloading infrastructure.

We describe the Lean GHTorrent design in our {% cite_details GVSZ14 --text  MSR '14 data track paper %}. You can find Lean GHTorrent at [http://ghtorrent.org/lean.html](http://ghtorrent.org/lean.html).

#### MySQL schema modifications

* The `forks` table has been removed. Since early January 2013, the forks information had been moved in the `forked_from` field of the `projects` table and 
* The `merged` and `user_id` fields have been removed from the pull requests table, as they represent information already stored in the `pull_request_history` table.
* Deleted projects are now marked as such on a monthly basis. We run a script that continuously queries Github for the status of each repository in a loop.

A step backwards:

* Follow events are no longer reported by Github in public timelines. Therefore the corresponding table can only be updated when the `ght-retrieve-user` script has been run for a user. The last time we run this for all users in the GHTorrent database was in late March 2014. To compensate for that, we run a script that fetches the followers for all users in a loop. This means that
updates to followers might take a while, while the follow timestamp is not
accurate any more.

#### Fixes to the data retrieval code

* The code will process a repository in full upon addition. No more half retrieved repositories, even though this only applies to new repositories.

* The code that retrieves multi-page items (e.g. collections of commits, pull
requests etc) now works on a per page basis. Before, every time a new
entity could not be found in the retriever database, GHTorrent would retrieve
the *full* list of entities for this type (e.g. all pull requests if a 
pull request was missing). While this seems grossly inefficient, initially it worked surprisingly well, as the vast majority of projects only have a few commits or pull requests. However, the time had come to make things more efficient and so we did.

* Same as above, the commits for a new repository are now processed in a
loop, leading to significantly decreased memory pressure. 

The above changes mean that we can now run the GHTorrent retrieval process more efficiently at a bigger scale. The increased efficiency of the retrieval code however ({% cite_details GVSZ14 --text once again %}) led to increased pressure to the MySQL database, so not all benefits have been ripped yet.

#### Querying the GHTorrent MongoDB database

Since Sep 2013, researchers have been able to query both 
[MongoDB](http://ghtorrent.org/raw.html) and [MySQL](http://ghtorrent.org/dblite/) online on our servers. We have upgraded this functionality significantly: the MongoDB server is now a delayed replica of the live MongoDB database, while it runs on a much more powerful machine. Users should be able to run bigger queries, faster on an almost live version of the system.

#### Querying the MySQL database

* The MySQL server for the [DBLite](http://ghtorrent.org/dblite/) interface was moved to much faster, server grade hardware. Simple queries should fly now.

* Queries running in excess of 10 minutes will be killed. This is to protect the service from abuse and to make sure that other users get a fair share of CPU time. Think carefully before querying :-)

## Calling out for help

GHTorrent has been providing the research community with data for more than two
years with on own resources. Since day one, it was intended to be a community
effort, even though the help of the community was not requested immediately.
Unfortunately, the rapid growth of Github managed to outgrow our resources
and my personal time. For this reason, I would like to invite the
GHTorrent community to help. Here is how you can do it:

#### Helping with data collection

This is the easiest. Recently, GHTorrent gained the ability to use Github OAuth keys, in addition to user name/password pairs, for authenticating requests. This means that you can create an OAuth personal token and send it over to me to use for querying the API. To create a personal token, go to the following URL:

[https://github.com/settings/tokens/new](https://github.com/settings/tokens/new)

deselect ALL checkboxes EXCEPT from public_repo, add a token name and click on "Generate Token". Then copy the token and [send it to me](mailto:gousiosg@gmail.com).

Every token adds an extra 5k reqs/hour capacity to GHTorrent, which will allow us to retrieve more data for longer periods of time for more projects.

#### Dealing with data inconsistencies

Data inconsistencies do exist in GHTorrent. It would be nice if the community would work together to resolve them. A few low-hanging fruits are the following:

* Create a consistency checker: Write a script that will use GHTorrent to get all data for a given repo, then compare those with Github or the project's `git` repo. This will give us indications of where things are going wrong.
* Consistency checks for pull request/issue lifecycle: model the lifecycle as a
state machine, make sure that only the supported transitions are in the
database.
* Lots of people have been complaining about the lack of commit messages for commits, issues, pull requests and code reviews. I think it is worth to 
investigate the possibility of writing a script that will pull all such text from MongoDB and update MySQL with it.

#### Implementing services by analyzing the data

Are you a student and want to play around with real big data? Consider working
on one of the following topics using the GHTorrent datasets and infrastructure.

* Create a dynamic version of the [pull request performance reports](http://ghtorrent.org/pullreq-perf/).
* Create a project dashboard with rich analytics about the repository's life.
* Create a more feature rich version of the [Open Source Report Card](http://osrc.dfm.io/).
* Create a process to move the MongoDB database contents to Hadoop.
