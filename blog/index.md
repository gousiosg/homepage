--- 
layout: default
title: Georgios Gousios blog 
---

<div class="page-header">
  <h1>Blog</h1>
</div>

<div class="row">
  <div class="col-md-9">

    {% for post in site.posts limit:10 %}

    <div class="row">
      <div class="col-md-2">
        <span class="label label-success">{{ post.date | date: "%d %b %Y"}}</span>
      </div>
      <div class="col-md-10">
        {{post.title}}
        <p> {{ post.content |strip_html|truncatewords: 100 }}
          <span style="blog-read-more"><a href="{{ post.url }}">Read more</a></span>
        </p>
        <hr/>
      </div>
    </div>
    {% endfor %}
    <a href="/blog/archive.html">Older posts</a>
  </div>

  <div class="col-md-3">

    <table class="table table-hover table-condensed">
      <thead>
        <tr>
          <td><b>Syndication</b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><span class="">RSS</span></td>
          <td><a href='atom.xml'><i class="fa fa-rss" aria-hidden="true"></i></a></td>
        </tr>
      </tbody>
    </table>

    <table class="table table-hover table-condensed">
      <thead>
        <tr>
          <td><b>Tags</b></td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        {% for category in site.categories %}
        <tr>
          <td><a href="{{ BASE_PATH }}/blog/categories.html#{{ category[0] }}-ref"><span class="label label-info">{{ category[0] }}</span></a></td>
          <td>x {{ category[1].size }} </td>
        </tr>
        {% endfor %}
      </tbody>
    </table>

  </div>
</div>