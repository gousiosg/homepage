---
layout: page
title: Streaming cascading aggregations
---

Cascading aggregations work by specifying a set of key metrics, a set of
thresholds for those and a set of functions that can extract interesting pieces
of information or combine two other functions. To react efficiently on current
events, aggregation functions always work on data streams. Insights can be
generated by linking metric threshold violations to aggregation functions; this
creates a graph of aggregations, which, when topologically shorted, can lead to
generation of summarized information.

What we want to reach to is automated data summaries that read like the one
below.

----
Version 1.2.1 (commit `a223b`) of app Foo is receiving *negative
feedback* (sentiment ratio: 0.45%) on app store. Users are *complaining*
about *frequent crashes*.

Top exceptions in app crash log: `NullPointerException` (88%), increased 95% in version 1.2.1.

Static analysis on commit `a223b` indicates possible *uninitialised
variable* x in Bar.java, line 75.

Commit `a223b` is 85% bigger than *average*. Code review `passed` with no feedback.

----

What we need is an API that allows to build a high-level trickle of meaningful
alerts out of a torrent of low-level signal streams, and show how it scales.
