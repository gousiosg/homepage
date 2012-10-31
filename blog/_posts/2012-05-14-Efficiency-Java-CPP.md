---
layout: post 
author: Georgios Gousios
title: The Efficiency of Java and C++ revised
categories: Performance Java JVM C++
---

During my first months as a PhD student (back in Feb 2005) at AUEB, we had
frequent technical arguments with my then supervisor, [Diomidis
Spinellis](http://www.spinellis.gr), regarding the execution speed of various
programming languages. Diomidis's argument was that the design of the Java
language and the JVM were inherently less efficient than that of natively
compiled languages, as they force upon us services that we may not want to use.
The prominent example was garbage collection. To prove his point, he setup a
simple experiment, which he documented in this [blog
post](http://www.spinellis.gr/blog/20050210/index.html). In the experiment,
he created random integers which he stored in an always-sorted container
([TreeSet](http://docs.oracle.com/javase/7/docs/api/java/util/TreeSet.html)
in Java, STL [set](http://www.cplusplus.com/reference/stl/set/) in C++).

Back then, the result came to me as a surprise. Despite my best efforts (I
did try a lot of VM options), I could not manage to bring the Java
implementation's performance anywhere near C++. During the 7 years in the
between, I occasionally run the code on any new system that I had at my hands,
and the result was, give or take, the same. 

Today, I decided to rerun the experiment. I compiled the C++ code with Clang 3
with all optimisations enabled (-O3 -march=corei7) and used the 1.6.0_31
version of the JVM to run the Java code. The result came to me as a surprise:

{% highlight shell %}
$ clang++ -O3 -march=corei7 sort.cpp
$ time ./a.out 
[...]
real	0m1.063s
user	0m1.026s
sys	0m0.035s
$ javac SortInt.java
$ time java SortInt
[...]
real	0m1.102s
user	0m2.325s
sys	0m0.137s
$ time java -server SortInt
[...]
real	0m0.866s
user	0m1.068s
sys	0m0.071s
{% endhighlight %}

The Java version was faster than C++! Why did this happen? It turns out
that between those 7 years JVM performance engineers did not sit idle: 

* Escape analysis [is turned on by
  default](http://weblogs.java.net/blog/forax/archive/2009/10/06/jdk7-do-escape-analysis-default)
  after version 17 of the server Hotspot compiler (I was running version 20.6).
  It allows the compiler to analyse whether objects escape the context of a
  method and, if not, to remove locks and allocate them on the stack.
  Consequently, this reduces the load to the garbage collector. The difference
  escape analysis presumambly makes can be seen by running the JVM in verbose
  GC mode using the `-verbose:gc -XX:+PrintGCDetails` options. In the case of
  the server VM, only one minor collection is required!

* There were significant improvements on the garbage collector section as well.
  The young generation collector is now parallel by default; this is one of the
  advantages of having multiple CPUs on modern machines. The full heap
  collector is also parallel by default in all collection phases, leading
  to shorted pauses.

* The compiler performs supposedely significantly better register allocation on
  machines with many registers.

The Java platform is a prime example of how research is being put into
practice. All features described above (and others: lock coarsening, biased
locking, thread local heaps) were published papers in major software
conferences (OOPSLA, PLDI etc). What is perhaps more interesting is
that it is not just Java that benefits from the work being done on the JVM;
Scala and Ruby, the two other languages mostly associated with the JVM benefit
too. For example, in Java 1.7, the new `invokedynamic` opcode allows JRuby to
optimize execution [various dynamic execution
aspects](http://www.drdobbs.com/jvm/231500287) delivers [significant
performance
improvements](http://blog.jruby.org/2011/12/getting_started_with_jruby_and_java_7/). In all, Java as a platform does seem like a healty 
development target; I am so sure about Java as a language.

To sum up: is Java inherently slower? Yes, it is, but hard optimization work
has lifted several performance hurdles. Does it matter? To some problem
domains, it does; I would never think writing the code that processes big
data in Java, expect if distribution could lead to significant speedups. Most of the problems I am trying to solve are better expressed in Ruby and Scala. I am happy as long as those two languages offer 80% of the performance of Java.
