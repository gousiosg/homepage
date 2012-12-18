---
layout: default
title: Georgios Gousios home page
---
{% include JB/setup %}

<div class="row">
  <div class="span2" align="center">

<a href="http://www.linkedin.com/in/georgiosgousios"><img alt="linkedin profile" src="img/linkedin.gif" width='23px' border='0'/></a>
  <a href="http://www.facebook.com/gousiosg"><img alt="facebook profile" src="img/fb.jpg"  width='23px' border='0'/></a>
  <a href="http://twitter.com/gousiosg"><img alt="twitter feed" src="img/twitter.gif" width='23px' border='0'/></a>
<a href='atom.xml'><img alt="rss feed" src="img/rss.png" height='23px' width='23px' border='0'/></a>

  <a href='http://scholar.google.gr/citations?hl=el&amp;user=-NI5S50AAAAJ&amp;oi=sra'><img alt='Google scholar' src="img/gscholar.gif" width='95'  border='0'/></a>

<br/>
 <a href="http://dl.acm.org/author_page.cfm?id=81351592431"><img alt="ACM digital library" src="img/acm.jpg" width='23px' /></a>

  <a href="http://www.informatik.uni-trier.de/~ley/db/indices/a-tree/g/Gousios:Georgios.html"><img alt="DBLP" src="img/dblp.gif" /></a>

<br/>

<a href="https://github.com/gousiosg"><img alt="Georgios Gousios Github
    account" src="img/github.png" width="80px"/></a>
  <a href="http://www.ohloh.net/accounts/21690?ref=Detailed"><img alt='Ohloh profile for gousiosg' src="http://www.ohloh.net/accounts/21690/widgets/account_detailed.gif" width="115px" border='0'/></a>

  </div>
  <div class="span10">
    <div class="row">
    <div class="span8">
    <p>Welcome to my home page.</p>

    <p>I am a researcher at the <a href="http://swerl.tudelft.nl/bin/view/Main/WebHome"> Software Engineering Research group </a>, <a href="http://www.tudelft.nl">TU Delft</a>.
            Before that, I got my PhD from the
            <a href="http://istlab.dmst.aueb.gr/sense">
              Software Engineering and Security laboratory</a>, at the
            <a href="http://www.aueb.gr">
              Athens University of Economics and Business</a>.</p>

            <p>My primary research interests include:</p>
            <ul>
              <li>Software engineering</li>
              <li>Programming languages</li>
              <li>Systems software</li>
            </ul>

            <p>Projects I am working on</p>
            <ul>
              <li><a href="https://github.com/gousiosg/github-mirror">Github-mirror</a>: A suite of tools to process Github REST API data</li>
              <li><a href="http://www.sqo-oss.org">Alitheia Core</a>: A platform for software engineering research</li>
            </ul>
      </div>
      <div class="span2">
            <img alt="Picture of Georgios Gousios" align="right" width="150px" src="img/moi.jpg"/>
      </div>
    </div>
    <div class="row">
      <div class="span8">
            Together with Diomidis Spinellis, I worked on editing the
             {% cite_details SG09, Beautiful Architecture %} book.
            You can find more information from the publisher's
            <a href="http://oreilly.com/catalog/9780596517984/">book web site</a>. Beautiful Architecure has also been translated to Chinese (<a href="http://oreilly.com.cn/book.php?bn=978-7-111-28356-0">架构之美</a>), Japanese (<a href="http://www.oreilly.co.jp/books/9784873114309/">ビューティフルアーキテクチャ)</a> and Russian (<a href="http://www.ozon.ru/context/detail/id/5430638/">Идеальная архитектура</a>).
            If you buy it, you 're also helping a good cause, as the
            royalties as the royalties are donated to the <a href="http://www.msf.org/"><em>Medecins Sans Frontieres</em></a>.
      </div>
      <div class="span2">
        <img alt="Beautiful Architecture" align="right" src="img/ba.jpg"/>
      </div>
      </div>
  </div>
</div>

#### Latest blog posts
<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>



