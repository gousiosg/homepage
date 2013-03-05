---
layout: post
author: Georgios Gousios
title: New statistics language required 
categories: MachineLearning R
---

Lately, I have been using R heavily for my analysis of how Github pull requests
work (more on that in upcoming posts). It is not the first time I 've used R;
the data analysis work in my PhD thesis was also done with R, while I used
R for the occasional correlation or plot in other papers. However, I never had
to manipulate data and design code that will be re-used (hopefully) with it.

The experience has not been great.  The R language may be nice and fine for
statisticians (I believe; I really don't know any statistician), but from a
programmer's perspective, it is a nightmare. While other languages may feel like
they have designed by a committee, the R language seems to be designed by
no-one. In my eyes, it looks like that every time someone needed a feature to be
implemented it just did and it stuck. The main problem is inconsistency, for
example:

* There are several ways to access a column in a dataframe. There are even
more ways to select specific rows and columns.

* Functions do not maintain a consistent parameter order. For example, in
`lapply` the array to loop over is passed first while in the semantically equivalent `Map` (why the capital case?) it is second.

Moreover, R is extremely slow and inefficient. I have been using a data sample
of 40,000 data points, moderate by any account, to build classifiers based on
the Random Forest classification algorithm. The memory usage could easily reach
3-4 GBs (for just 5 MB of data and in-memory data structures), forcing me to run
my experiments on a server, rather than my laptop. It takes R 3 min 15 sec to
read a 35MB CSV file in memory and then it consumes more than 500MB of RAM.

I have never used other statistic tools. Closed source ones I would not use, as
my research could not be replicated without a license. From the open source
ones, I would not use Weka, because I find clicking around an inferior way of
providing input to a program, especially since I would like executions to be
scripted. Therefore, my choices are trimmed down to two: R and Octave. Octave
does not include a machine learning toolkit. So I am really left without
alternative.

#### What I would like in a sane data processing language

I would like a statistics language that is also a data manipulation and
exploration language. An ideal language, at least for the use cases I can think
of now would have:

* A uniform way to describe all (tabular) data. There is really no need for multiple `data.frame` like types (lists, vectors or matrices). A single
type with support for unboxing (to enable fast matrix operations) should
be enough.

* A few numeric data types (infinite precision integers and floats), along
data types for ordinal and categorical data. Memory efficient, UTF8-based
strings.

* Manipulation of data through higher order functions. LINQ has shown
how this can be done with any data structure.

* Optional typing. R and SciPy's lack of types are great for
prototyping and fast testing on the REPL loop, but when real data need
to be processed, types help a lot with consistency and optimization.
[Dart](http://www.dartlang.org/) has shown that it can be 
practical.

* It should be compilable to machine code or to an 
intermediate format able to produce efficient machine code (LLVM or JVM
bytecode). Big data cannot be processed by interpreters and
having to develop the same program twice (prototype with R, run in C++)
is suboptimal

* A library for interactive graphics. `ggplot` is great, but it is static. I am
sure that someone can design an editor that will allow people to explore data
graphically and then produce static descriptions of the generated plots.

Given the big data explosion we are facing these days, doing analysis using such
inefficient as R is a waste of time. I really hope that someone comes up
with a nice alternative to R. 
