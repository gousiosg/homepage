---
layout: default 
title: Georgios Gousios's blog
categories: 
---

Welcome to my blog! Here are the latest posts:

{% for post in site.posts limit:5 %}
 <p>{{ post.title}}</p>
 {{ post.content | truncatewords 50 }}
 [Read more...]({{ post.url }})
{% endfor %}

