---
layout: post 
author: Georgios Gousios
title: How I lost the war on spam 
categories: spam security
---

In late 2009, I decided to replace the aging XWiki installation for the
[Alitheia Core](http://www.sqo-oss.org) web page with Drupal. I always had a
very good impression of Drupal, so I decided to go for it instead of its main
competitor, Wordpress. The initial impression was quite good, with several of the desired
features (comments, accounts, etc) being already in the default installation,
while plug-ins enabled more advanced functionality (code highlighting, citation
  management).  One particular plug-in that I installed was
  [Mollom](http://mollom.com/), that uses machine learning to
  automatically filter out spam messages. 

During those 3 years, the installation was kept relatively secure, but required
constant updates. The updates were not exactly of the click and button and wait
type either, as most of them required modifications to the database schema. Now
perhaps being more pedantic than I should, I always backed up the Drupal
database and applied updates one by one, which costed me quite some time.

Last week, I noticed that the number of visits to the site has increased sharply
during the last few months. While my first reaction was along the lines of "we
must be doing something right!", further examination revealed that I was
definitely doing something wrong:

1. I had been running the site with comments enabled for authenticated users, to
encourage user communication and participation. Registered users did not
require any administrative action to enable their accounts and post comments.
2. From the HTTP logs, I noticed several new users had been created and they
appeared in Drupal's administration console. As the user registration page included a relatively strong CAPTCHA test, courtesy of Mollom, I wondered why this happened, so I visited it. There was no CAPTCHA at all in place!
3. Then I remembered that a couple of months ago I had updated Mollom, so I 
visited its administration console page. The page listed the correct settings. When I went back I saw the Drupal reported a required database
upgrade, which I never saw before.
I suspect that visiting the Mollom web page triggered the notification.
4. I checked the comment sections of several web pages. No filtering was active 
and several thousand comments were created.
5. I realized that this war was lost. I 've disabled comments and user accounts altogether.

For me, the moral of the story is that for such simple, mostly static sites CMSs
add more burden that convenience. I don't think most research sites need
anything more than a few easily updatable web pages. Therefore, from now on, I
will use exclusively the same tool I use for creating this blog and website:
[Jekyll](https://github.com/mojombo/jekyll)

