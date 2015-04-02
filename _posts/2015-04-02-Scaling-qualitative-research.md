---
layout: post
author: Georgios Gousios
title: How to run a large scale survey
categories: survey qualitative
---

If you know me well, this blog post might seem strange. I have always been a  proponent of quantitative methods and big data.
Despite this, in April 2014, I run a survey that got filled in by 1,500 people.
One part of the survey analysis will be presented at [ICSE 2015](http://www.gousios.gr/bibliography/GZSD15.html) this year,
while we submitted the second part to [FSE 2015]() (still twiddling our thumbs about the results). In wake of the ICSE 2015 publication, many colleagues asked me how I managed to get so many responses.

Here is how I did it.

* **Target an audience:** The broader the audience, the more general the survey
will be and therefore the less deep insights you will get. With qualitative research, it usually pays off to go deep rather than broad. So, it is preferable
to target an audience. What worked for me was that I preselected my audience.
Using the [GHTorrent](htp://ghtorrent.org) database, I queried it for the types of projects that I wanted to examine. For many problems in software engineering
at least, Github is a very good source of massive amounts of potential respondents provided one targets the appropriate ones.

* **Make it lean:** No one has time to spend on someone else's problem. So when
asking for help (this is what a survey is about), make sure that the helping
party's time is time well spent. Limit the number of questions to the absolute
minimum. Put all questions in one page. Make non essential questions optional.
Limit free-text questions. Configure the size of free-text question boxes to
guide the expected input size (2-3 lines should be enough). Give a realistic
estimate on how much time you expect the survey taker to spend in the invitation
email.

* **Personalize the invitation:** No matter how honest the sender's intentions
are, it is usually not nice to receive generic email. What I did was to include
details such as the project's name, the correspondent's name and links
to my past work, just to assure people that I am not a robot.

* **Give something back:** Even if you only ask 10 mins of someone's time, it is
nice to offer something in return. Since my survey was about pull requests, I
created a [customized report](http://ghtorrent.org/pullreq-perf/) of how pull
requests work for the Github repository. I believe this made a huge difference
in the completion rate of my survey: while the pilot was filled in by 8% of the
people I sent emails to, the actual survey completion rate was > 20%!

* **Be responsive:** After I 've sent the initial invitations (all 3,500 of them :-)) my mailbox got flooded by emails. This is something I did not expect,
but many people asked for clarifications, while others congratulated or 
complained about the spamming. In any case, you need to act accordingly as fast as possible, otherwise you will loose your "clients". In my case, I answered 160 emails the first day; I estimate that around 100 responses lead to answers.

* **Automate processing of results** Getting lots of responses is one thing;
processing them is another. In surveys, we typically have three types of questions: i) Multiple (or single) choice, ii) Likert scale and iii) Open ended.
Multiple choice and Likert scale questions are easier to process en masse.
Open ended questions need to be [coded](http://en.wikipedia.org/wiki/Coding_(social_sciences)) first; then they can also be processed statistically.
Processing usually involves filtering, correlating and plotting. For all
those purposes a scripting language, such as R or Python, with support for datasets and plotting can be very handy; Excel or other GUI packages
are definitely not handy. Imagine that the last day before a deadline you
find a small error that affects all your plots and parts of the statistics.
With a scripting language, you just rerun the scripts. With a GUI tool, you
need to go through lots of painful point and clicking. You can find R code to process a CSV file with survey responses in the
GitHub repository: [gousiosg/pullreqs-integrators](https://github.com/gousiosg/pullreqs-integrators)

* **Offer an option to be notified about the results:** Finally, you should notify your respondents (the ones that want to be notified) about your results, when
they are available. While it is nice to send the paper itself, it is nicer for
busy people to read a blog post with the major findings. The benefit is mutual: developers learn about exiting results while our research is getting spread. My [blog post about the results](http://www.gousios.gr/blog/How-do-project-owners-use-pull-requests-on-Github/) of the ICSE 2015 paper is by far the most read one in my blog (around 8k views now). I really doubt that that many people read my paper.

Designing and running the survey was a great learning experience for me. First,
I understood the power of qualitative research: using the appropriate questions,
one can get tons of insight in very little time. Second, big data has its
limitations: while is relatively straightforward to quantitively analyze
mechanised processes (which have finite states), it is much more difficult to
get deep insights when people are involved, as people can act unpredictably and
have initiative. Third, I realised that despite my fears which were certainly
founded in my ignorance, it is actually possible (and sometimes preferable) to
turn qualitative research into quantitative research. 

Given the opportunity, I would like to thank the 1,500 developers that replied to
my survey. The combined effort, assuming that it took 10 minutes to fill the
survey in, amounts to 30 working days worth of time given out for free. If I
were to do the survey the traditional way, i.e. sending actual copies to
companies, going door to door to ask people to fill it in etc, it would have
taken me more than a year.

