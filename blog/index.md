---
layout: default 
title: Georgios Gousios's blog
---

<div class="navmenu">
<div class="menuheader">
Tags
</div>
<div class="menuitem">
foo x 4
</div>
<div class="menuitem">
bar x 3
</div>
</div>

{% for post in site.posts limit:10 %}

 <div class="blog">
   <div class="blog-list-header">
     <span class="blog-list-title">{{ post.title}}</span>
     <span class="blog-list-date">{{ post.date | date: "%d %b %Y"}}</span>
   </div>
   <div class="blog-list-sum">
   {{ post.content |strip_html|truncatewords: 80 }}
   <span style="blog-read-more"><a href="{{ post.url }}">Read more...</a></span>
   </div>
 </div>

{% endfor %}

Archives:

{% for post in site.posts skip:10 %}
  
{% endfor %}
