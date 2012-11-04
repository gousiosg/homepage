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
     <span class="blog-list-date">{{ post.date | date: "%d %b %Y"}}</span>
   </div>
   <div class="span7">
     <div class="blog-list-title">{{post.title}}</div>
   {{ post.content |strip_html|truncatewords: 100 }}
     <span style="blog-read-more"><a href="{{ post.url }}">Read more...</a></span>
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
    <td><b>Tags</b></td>
    <td></td>
  </tr>
  </thead>
  <tbody>
{% for category in site.categories|sort %}
  <tr>
    <td><a href="{{ BASE_PATH }}{{ site.JB.categories_path }}#{{ category[0] }}-ref"><span class="label">{{ category[0] }}</span></a></td>
    <td>x {{ category[1].size }} </td>
  </tr>
{% endfor %}
  </tbody>
</table>

</div>
</div>

