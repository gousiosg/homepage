---
layout: post
author: Georgios Gousios
title: Teaching Software Analytics
categories: research
---

At the TU Delft CS master's program, students have to take at least one seminar
course. As opposed to normal courses, where a more traditional teaching method
is the norm, in seminar courses the students have to read papers – lots of
them. This makes the format ideal for courses that teach student topics at a
field's cutting edge.  In the previous quarter (Sep - Oct), I taught such a
course: Software Analytics.

It was the first time I taught both a seminar course and Software Analytics,
which also happens to be my [field of
expertise](https://se.ewi.tudelft.nl/softanalytics.html). I was therefore
relatively confident about the contents, but not so much about the format. After
lots of reading online, I 've come to the conclusion that seminars are all about
the students reading and discussing interesting papers, with minimal teacher
involvement. So I decided to have students in the lead. With the course's
teaching team ([Moritz](https://inventitech.com),
[Maria](https://mkechagia.github.io),
[Ayushi](https://ayushirastogi.github.io) and
[Joseph](https://jhejderup.github.io)), we identified 8 high-level
topics that we believed provide a broad coverage of the area, and came up with
10 papers per topic that acted as the seed to the student's investigations. For
each topic, a student group (or groups, we do not know in advance how many
students participate in our courses) would have to i) prepare a group discussion
of an interesting paper, ii) write a survey of the cutting edge work, and iii)
work on a limited replication of a paper.

### The format

The _discussions_ were scripted.  I compiled a list of guidelines on [how to run
a paper
discussion](http://gousios.org/courses/softwanal/discussing-papers.html),
partially
to help the students and partially to make sure we have a common format during our
discussions. The responsible group would announce the paper that everybody
would have to read one weak in advance. Each discussion started with a short
presentation (4-5 slides) of the main paper points (authors, motivation,
research method, results, implications). The moderator would kick-off the
discussion asking generic questions (e.g. "what did you like about the paper"),
but then he/she would have to dive into the paper contents.  At the appropriate
times, members of the teaching team were instructed to jump in to ask a
provoking question or to the discussion towards more fruitful paths.
Importantly, one person of the moderating team would have to keep notes of the
discussion.  This help us compile extensive documentation on what went on during
the course, which you can find in the [course's web
page](http://gousios.org/courses/softwanal/).

The paper discussions were meant to introduce all students to a particular
topic; then, each topic group would have to go deep in each corresponding topic
by reading the latest related work (no older than 5 years) and write a 4-5k word
survey. The _surveys_ were, again, scripted. The students were instructed to
follow Kitchenham's method for doing surveys in software engineering to answer 3
research questions, relating to the state-of-the-art in research and practice
and future directions about each particular field. The initial paper selection
was followed by an intermediate presentation per team/topic, to ensure that
everybody is on the same page.  Crucially, students had to peer-review each
other's chapters; per week, a pull request per group would have to be reviewed
by two more groups.  This ensured that all students would have at least read all
other chapters at least once, thereby obtaining a bird's eye view of the area.
All surveys were collected and [published as a book
here](https://saltudelft.github.io/software-analytics-book/); we intend to keep
this book updated through future runs of the course.

Reading, discussing and writing about existing work should theoretically suffice for a seminar course; but knowing our students, I knew that they would be
missing something if we stopped there: hacking! So during the last part of the
course, the students would have to _partially replicate_ existing work. I think
this is were the students excelled: in just 2-3 weeks, students that have not
done any repository mining before managed to produce high-quality reports,
sometimes by replicating the _whole_ data collection pipeline. I was impressed
with the results! On a second reading of the replication results however, had
we run the course as a normal repository mining course, the students would
have not learned as much.

### The experience

Running a seminar course was a learning experience both for me and for the
students. I learned about the value of such courses: within 8 weeks, through and
with my students, I got in touch with the latest and greatest of our field.  I
also hope that the students developed an intuition on what makes a research work
timeless: strong motivation, razor-sharp answers to the RQs and crystal-clear
discussion of implications. I did notice that the discussions during the end of
the course where more focused on those high-level concepts rather than details
about why the authors choose statistical test X or modelling method Y.
The course workload was a bit on the heavy side; this did not allow the
students to perfect their surveys.

Changes I would do next year:

- No laptops! I will ask the students to print the papers and hand annotate
  them. This will hopefully help to keep the discussion participants focused.

- I will be more silent. I felt that my urge to talk about all the wonderful
  things we are doing in software analytics was sometimes overwhelming to the
  student moderators.

- Most probably, I will drop the replication part. Our students are already
  pretty good at designing data pipelines, so I will devote the extra time to
  perfect the literature surveys.

As usual, you can find the course materials under a CC license [on my
homepage](http://gousios.org/courses/softwanal/).
