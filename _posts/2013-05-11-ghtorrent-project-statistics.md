---
layout: post
author: Georgios Gousios
title: Monitoring Github projects with GHTorrent
categories: Github GHTorrent MSR
---

GHTorrent started as an effort to bring the rich data offered by the Github API
to the hands of the [Mining Software Repositories](http://msrconf.org)
community. Recently, I have been working to make GHTorrent more accessible to
all Github users. As of version 0.7.2, [GHTorrent](http://ghtorrent.org) can
run in standalone mode, using SQLite as its main database, thus doing away with
the complicated setup required to mirror in a distributed fashion.

In this blog post, I describe how to setup GHTorrent in order to retrieve all
metadata for a relatively small, but non-trivial, repository:
[Netflix](https://github.com/Netflix)'s
[RxJava](https://github.com/Netflix/RxJava) (incidentally, this is also one of my
[favourite projects](https://gist.github.com/gousiosg/5264201)). Using the
data from this project, I also created a couple of plots
to give you an idea of what can be achieved with the data that GHTorrent
gathers.

#### Setup and running

GHTorrent is distributed as a Ruby gem, and runs on Ruby 1.9.3. If you have an
older version of Ruby, use [RVM](http://rvm.io) to install 1.9.3 (`rvm install
1.9.3`) and make it default (`rvm use 1.9.3`).  Installing GHTorrent is then
trivial:

```
gem install sqlite3 ghtorrent
```

Normally, GHTorrent is run in parallel on many machines, so it is convenient
that its configuration is file based. For our standalone setup, this might
be an annoyance, but we need to create a `config.yaml` file for GHTorrent to
run:

{% highlight yaml %}
sql:
  url: sqlite://github.db

mirror:
  persister: noop
  cache_mode: all
  username: github_username
  passwd: github_passwd
{% endhighlight %}

Make sure you change `username` and `password` to your Github credentials. The
configuration file instructs GHTorrent to create an SQLite database in the
local directory, using no persister (this is to avoid installing MongoDB)
and full caching, thus making each request only once. We can control more
parameters of how GHTorrent works using more [configuration options](https://github.com/gousiosg/github-mirror/blob/master/config.yaml.tmpl) but the above
should be enough to get us started.

Then, we need to run the following command:

```
ght-retrieve-repo -c config.yaml Netflix RxJava
```

We see GHTorrent going though commits, pull requests, issues, watchers and other
Github API entities. Lots of debug statements will be printed on the screen.
You will see lots of duplicate work being done as well; this is the price to pay
for not installing MongoDB as an intelligent caching layer. Nevertheless, half an
hour later or so, we have in our directory an SQLite database with lots of
interesting data representing the project's life time.

#### Project process monitoring

The [database schema](http://ghtorrent.org/relational.html) is rather
complicated, but the data that Github has is very rich as well.
Using this database, we can ask very complicated queries in order to create
interesting reports of our project's development process, including
some queries that were not possible without Github's data. Below, I
have tried a couple of such queries and used R and `ggplot2` to plot the
results. You can find the R script [here](https://gist.github.com/gousiosg/5563230#file-ghtorrent-project-stats-r).

<ul class="thumbnails">
  <li class="span4">
    <div class="thumbnail">
      <a href="/files/pull-req-stats.png" rel="lightbox">
        <img src="/files/pull-req-stats.png" alt="Pull request statistics per month">
      </a>
      <p>Pull request statistics per month (<a href="https://gist.github.com/gousiosg/5563230#file-pullreqs_opened_per_month-sql">opened</a>, <a href="https://gist.github.com/gousiosg/5563230#file-pullreqs_merged_per_month-sql">closed</a>)</p>
    </div>
  </li>
  <li class="span4">
    <div class="thumbnail">
      <a href="/files/issue-stats.png" rel="lightbox">
        <img src="/files/issue-stats.png" alt="Source of commits">
      </a>
      <p>Issue statistics per month (<a href="https://gist.github.com/gousiosg/5563230#file-issues_opened_per_month-sql">opened</a>,<a href="https://gist.github.com/gousiosg/5563230#file-issues_closed_per_month-sql">closed</a>)</p>
    </div>
  </li>
  <li class="span4">
    <div class="thumbnail">
      <a href="/files/commit-source.png" rel="lightbox">
        <img src="/files/commit-source.png" alt="Source of commits">
      </a>
      <p>Source of commits (<a href="https://gist.github.com/gousiosg/5563230#file-commit_source-sql">query</a>). The more commits come from
      pull requests, the more open the project process.</p>
    </div>
  </li>
  <li class="span4">
    <div class="thumbnail">
      <a href="/files/fork-stats.png" rel="lightbox">
        <img src="/files/fork-stats.png" alt="Fork statistics">
      </a>
      <p>Forks created(<a href="https://gist.github.com/gousiosg/5563230#file-forks_created-sql">query1</a>) vs forks actually contributing commits back to the main repo (<a href="https://gist.github.com/gousiosg/5563230#file-forks_contributing-sql">query2</a>). Ideally, all forks should contribute back.
      </p>
    </div>
  </li>
  <li class="span4">
    <div class="thumbnail">
      <a href="/files/comments-commenters-external.png" rel="lightbox">
        <img src="/files/comments-commenters-external.png" alt="Fork statistics">
      </a>
      <p>Percentage of issue comments and commenters coming from the project community (i.e. users with no commit rights to the main repo)(<a href="https://gist.github.com/gousiosg/5563230#file-monthly_comments_commenters-sql">query</a>)
      </p>
    </div>
  </li>
</ul>

That's it! Using a simple process, we can retrieve a very rich dataset to create
project specific reports from. What's more is that the database can be updated
(make sure that `cache: prod` in `config.yaml`), and the report generation process can be automated. More than one projects can share the same database,
so organizations can have a centralized way of retrieving process information
about their projects.

Do you have any ideas for more useful reports? Leave a comment and I 'll
promise to implement them!
