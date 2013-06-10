---
layout: page
title: A metric of code functionalness
---

Functional programming has long been known to enable economy in programming
expression. The use of higher order functions for processing data in collections
(using clojures for data transformations) and immutability enable a very
terse way of writing code. Less code usually leads to less bugs and better
understandability.

But how much does a method use techniques originating from functional
programming? Is a method immutable? Does a method use higher order functions for
all data processing? Does a method rely on immutable or mutable data structures?
Does a method use advanced features such as monadic comprehensions? Does a
method use functional-like constructs such as anonymous inner classes?

The purpose of this study is to come up with a metric of code functionalness
by statically analyzing code for the presence of functional programming
patterns. The analysis should initially target Scala, but should be generic
enough to be ported to any other language. Then, the metric will be used
to empirically study whether more functional code has less bugs or is
easier to test.

####References

1. (a particularily bad similar effort) {% reference Pankr12 %}
