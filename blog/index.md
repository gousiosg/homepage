---
layout: default
title: Georgios Gousios blog
---

Welcome to my blog! Here are the latest posts:

<div class="row">
<div class="span9">

{% for post in site.posts limit:10 %}

 <div class="row">
   <div class="span2">
     <span class="label label-success">{{ post.date | date: "%d %b %Y"}}</span>
   </div>
   <div class="span7">
     <h4>{{post.title}}</h4>
     <p> {{ post.content |strip_html|truncatewords: 100 }}
     <span style="blog-read-more"><a href="{{ post.url }}">Read more</a></span>
     </p>
     <hr/>
   </div>
 </div>
{% endfor %}
  <a href="/blog/archive.html">Older posts</a>
</div>

<div class="span3">

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
    <td><a href="{{ BASE_PATH }}/blog/categories.html#{{ category[0] }}-ref"><span class="label">{{ category[0] }}</span></a></td>
    <td>x {{ category[1].size }} </td>
  </tr>
{% endfor %}
  </tbody>
</table>

</div>
</div>
