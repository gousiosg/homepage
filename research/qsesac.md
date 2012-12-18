---
layout: page
title: Conducting Quantitative Software Engineering Studies with Alitheia Core
---

In our work {% cite_details GS12, Conducting Quantitative Software Engineering Studies with Alitheia Core %}, we examine the benefits of conducting large
scale sofware engineering research with [Alitheia Core](http://www.sqo-oss.org).

In our work, we used Alitheia Core revision
[88a6fcc6d15aac911aba710ea8a30e2a9a166443](https://github.com/istlab/Alitheia-Core/commit/88a6fcc6d15aac911aba710ea8a30e2a9a166443). (Note that after this revision, Alitheia Core data schema changed, so the datasets we provide may not work.

We processed two data sets:

* A [four project](https://pithos.grnet.gr/pithos/rest/gousiosg@aueb.gr/files/datasets/four-projects.tar.gz) which includes both raw data and Alitheia Core metadata from running the first updater stage for the four projects we describe in our work (JConvert, Gnome-VFS, Evolution and FreeBSD).
* The data set from my [Phd work](phd.html). This dataset was used to conduct the  case study.

### Using the datasets

Both datasets are essentially MySQL dumps. To use them with Alitheia Core, do the following (the instructions assume a Unix-like OS):

* [Install](http://www.sqo-oss.org/quickstart) Alitheia Core
* Load either dump in the MySQL database. This can be done using the following command:

{% highlight bash %}
cat dump.sql |mysql -u alitheia -p alitheia
{% endhighlight %}

Note that the raw data for the four project dataset must be placed (or linked
to) `/home/data`

* Alitheia Core uses the machine's name to register it as a node in a cluster
installation. Projects are always assigned to a cluster node, through an entry
in the ``CLUSTERNODE_PROJECT`` table. This means that by default
Alitheia Core will not be able to use the imported data as the projects are
assigned to another (our) machine. To fix this, start Alitheia Core and open a
connection to MySQL. Then do:

{% highlight sql %}
mysql> select * from CLUSTERNODE;
+----------------+------------------+
| CLUSTERNODE_ID | CLUSTERNODE_NAME |
+----------------+------------------+
|              9 | alitheia         |
|              x | your.hostname    |
+----------------+------------------+
mysql> UPDATE CLUSTERNODE_PROJECT set CLUSTERNODE_ID=x;
Query OK, 511 rows affected (0.10 sec)
Rows matched: 538  Changed: 511  Warnings: 0
{% endhighlight %}

* Alitheia Core should now be able to process the data. To test the
installation, start Alitheia Core, install a plug-in in the plug-ins page, go to
the projects page, select a project and click Synchronize in the plug-in dialog.
Check whether the jobs number is reducing and whether the failed jobs count is 0
or at least very low.

### Replicating the case study

Instructions on how to replicate the experiments described in the paper using the provided datasets.

####Performance measurements

To measure the performance of Alitheia Core, we used the raw data from the first
dataset. To perform the measurements in your environment, in turn just
[add](http://www.sqo-oss.org/addproject) each project and start all
updaters at once. For more precise time keeping, one could set the
`eu.sqooss.log.perf` parameter (in the top level `pom.xml` file) to `true`
and recompile Alitheia Core. Detailed performance
measurements (per job) can then be found in the `runner/perf.log`
file.

####Development Teams and Maintainability

The second case study was performed on projects whose primary language (as can
be obtained by counting the number of files in their latest version) is C
(listed in [this file](mi-projects.txt)).  For each
project, we addded it to the Alitheia Core system, assigned it manually to the
most appropriate node in our cluster and started the source code metadata
updater. After the project data were imported, we run the required metrics. At
the time the experiment took place, Alitheia Core was not able to handle metric
dependencies, so the order of metric execution was preserved by manually
initiating metric runs. Later versions, such as the one linked above, will
automatically run metrics and their dependencies in the correct order.

To do the correlation analysis required in order to examine the two hypotheses,
we obtained results from both the maintainability index and the developer
metrics plug-ins, for each type of entity we were interested about
(specifically, project versions and modules). The query to obtain the results
at the module level for project `Gnome-VFS` is the following:

{% highlight sql%}
select MI.MODMI, EYEBALL.MODEYEBALL
from
(  select pfm.PROJECT_FILE_ID as ID, pfm.RESULT as MODMI
   from   STORED_PROJECT sp, PROJECT_VERSION pv, PROJECT_FILE pf,
          PROJECT_FILE_MEASUREMENT pfm, METRIC m
   where  pfm.METRIC_ID=m.METRIC_ID and pf.PROJECT_FILE_ID=pfm.PROJECT_FILE_ID
          and pv.PROJECT_VERSION_ID=pf.PROJECT_VERSION_ID
          and pv.STORED_PROJECT_ID=sp.PROJECT_ID
          and m.MNEMONIC="MODMI" and sp.PROJECT_NAME="Gnome-VFS"
) as MI,
(  select pfm.PROJECT_FILE_ID as ID, pfm.RESULT as MODEYEBALL
   from   STORED_PROJECT sp, PROJECT_VERSION pv, PROJECT_FILE pf,
          PROJECT_FILE_MEASUREMENT pfm, METRIC m
   where  pfm.METRIC_ID=m.METRIC_ID and pf.PROJECT_FILE_ID=pfm.PROJECT_FILE_ID
          and pv.PROJECT_VERSION_ID=pf.PROJECT_VERSION_ID
          and pv.STORED_PROJECT_ID=sp.PROJECT_ID
          and m.MNEMONIC="MODEYBALL"
          and exists (
              select pfm1.PROJECT_FILE_ID
              from PROJECT_FILE_MEASUREMENT pfm1, METRIC m1
              where  pfm1.METRIC_ID=m1.METRIC_ID and m1.MNEMONIC="ISSRCMOD"
                     and pfm.PROJECT_FILE_ID=pfm1.PROJECT_FILE_ID
                     and pfm1.RESULT="1"
              )
          and sp.PROJECT_NAME="Gnome-VFS"
) as EYEBALL
where
    MI.ID = EYEBALL.ID
{% endhighlight %}

The query to obtain the results at the project level using a 3 month time window
to determine team size (team size comprises of developers that have committed at
least once within this time window) for the same project is the following:

{% highlight sql%}
select MI.MI, TEAMSIZE.TEAMSIZE
from
(  select pvm.PROJECT_VERSION_ID as ID, pvm.RESULT as MODMI
   from   STORED_PROJECT sp, PROJECT_VERSION pv,
          PROJECT_VERSION_MEASUREMENT pvm, METRIC m
   where  pvm.METRIC_ID=m.METRIC_ID
          and pv.PROJECT_VERSION_ID=pvm.PROJECT_VERSION_ID
          and pv.STORED_PROJECT_ID=sp.PROJECT_ID
          and m.MNEMONIC="MI" and sp.PROJECT_NAME="Gnome-VFS"
) as MI,
(  select pvm.PROJECT_VERSION_ID as ID, pvm.RESULT as TEAMSIZE
   from   STORED_PROJECT sp, PROJECT_VERSION pv,
          PROJECT_VERSION_MEASUREMENT pvm, METRIC m
   where  pvm.METRIC_ID=m.METRIC_ID
          and pv.PROJECT_VERSION_ID=pvm.PROJECT_VERSION_ID
          and pv.STORED_PROJECT_ID=sp.PROJECT_ID
          and m.MNEMONIC="TEAMSIZE3"
          and sp.PROJECT_NAME="Gnome-VFS"
) as TEAMSIZE
where
    MI.ID = TEAMSIZE.ID
{% endhighlight %}

Results at the project and module level for all projects can be obtained by
means of simple shell scripts that execute the two queries for all projects in
the Then, importing the data in R and performing the correlation analysis is as
simple as the following script. As the dataset to be analyzed is very big, R
will need a machine with at least 4 gigabytes of memory to process it.

