---
layout: page
title: The Java DTrace Toolkit 
---

[DTrace](http://en.wikipedia.org/wiki/DTrace) is a dynamic tracing framework, initially developed by Sun for the Solaris 10 OS. Since some early beta version of the Java 1.6 JDK, the JVM (at least on Solaris) has incorporated a number of [DTrace probes](http://docs.oracle.com/javase/6/docs/technotes/guides/vm/dtrace.html) that allow DTrace to extract data from a program running within the JVM at runtime.

I initially used DTrace for Java to study the interaction of the OS with the JVM on the I/O front. I then understood that my scripts might be useful to a number of people doing low level performance analysis so I spent some time to make them a bit more generic and easy to use.

You can download the Java DTrace Toolkit from [here](http://istlab.dmst.aueb.gr/~george/files/jdt.tar.gz)

The JDT has been presented in the following short paper:

{% reference GS08 %} {% cite_details GS08 %}

###The scripts

<table>
<tr>
<td><b>Script</b></td>
<td><b>Function</b></td>
</tr>
<tr>
<td>jprofiler</td>
<td>Reports the methods and classes that consume most execution time. Can aggregate results by package name.</td>
</tr>
<tr>
<td>jmemstats</td>
<td>Report object allocation statistics. Can aggregate results by package name and filter results by specific package names.</td>
</tr>
<tr>
<td>jlockstat</td>
<td>Reports methods initiating locking opera- tions in native code.</td>
</tr>
<tr>
<td>jiosnoop</td>
<td>File management statistics: which classes cause I/O traffic?</td>
</tr>
<tr>
<td>jcallgraph</td>
<td>Display a Java function call graph from Java to the OS kernel.</td>
</tr>
<tr>
<td>jgcsnoop</td>
<td>Reports garbage collection statistics: frequency, duration.</td>
</tr>
</table>

###Output examples

####jmemstats

{% highlight tex %}

Java Method                            objects alloc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
java/lang/StringCoding$StringEncoder.encode      486
java/util/HashMap.newKeyIterator                 221
org/[...]/buf/CharChunk.toStringInternal         142 
java/io/UnixFileSystem.resolve                   131 
java/lang/String.substring                       122 
java/lang/StringCoding$StringDecoder.decode      108 
java/net/Socket.getInputStream                   100 
java/lang/AbstractStringBuilder.expandCapacity   99
java/lang/Object.clone                           91
java/io/UnixFileSystem.list                      74
{% endhighlight %}

####jlockstat

{% highlight tex %}

Java Method                                  Native      cnt
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
java/io/UnixFileSystem.getBooleanAttributes0 malloc      367
java/io/UnixFileSystem.getBooleanAttributes0 free        363   
java/lang/ClassLoader.defineClass1           free        288 
java/lang/ClassLoader.defineClass1           malloc      290
java/io/UnixFileSystem.getLastModifiedTime   free        136 
java/io/UnixFileSystem.getLastModifiedTime   malloc      136 
java/io/UnixFileSystem.list                  readdir64_r 134
{% endhighlight %}

####jiosnoop

{% highlight tex %}

Java Method                                     syscall  cnt  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
org/apache/coyote/Response.action               _so_send  7
org[...]Http11Processor.action                  _read     7
org/[...]OutputStreamOutputBuffer.doWrite       _so_send  2
org/[...]Http11ConnectionHandler.processConnect _read     1
org[...]/mapper/Mapper.internalMapWrapper       _read     1
{% endhighlight %}
