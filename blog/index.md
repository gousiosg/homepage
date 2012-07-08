---
layout: default 
title: Georgios Gousios's blog
categories: 
---

Welcome to my blog! Here are the latest posts:

{% for post in site.posts limit:5 %}

 <div class="blog">
   <div class="blog-list-header">
     <span class="blog-list-title">{{ post.title}}</span>
     <span class="blog-list-date">{{ post.date | date: "%d %b %Y"}}</span>
   </div>
   {{ post.content |strip_html|truncatewords: 100 }}
   <span style="blog-read-more"><a href="{{ post.url }}">Read more...</a></span>
 </div>

{% endfor %}


