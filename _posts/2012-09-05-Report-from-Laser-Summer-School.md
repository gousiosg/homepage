---
layout: post 
author: Georgios Gousios
title: Report from the Laser 2012 summer school 
---

In Sep 2012, I had the chance to participate to the Laser summer school,
organised every year at the beautiful island of Elba, Italy by Bertrand Meyer
and his research group at ETH, Zurich. Its topic varies every year, but as
expected rotates around software engineering. This year, the topic was
programming languages; as I have written on Twitter, the line-up consisted
(with a couple of ommissions) of what I consider the current dream team of
programming language design: Martin Odersky (Scala), Simon Peyton Jones
(Haskell), Erik Meijer (C#, Haskell in a previous life), Andrei Alexandrescu
(C++, D), Guido van Rossum (Python), Roberto Ierusalimscy (Lua) and of course
Bertrand himself (Eiffel) promised an exiting week. And they more than 
delivered it! What follows is a post mortem account of my experience at
Laser. Not all speakers are represented equally, as I am finishing this
3 months after the actual event.

Erik's talk, was about monads, co-monads and their application on real life
programs. While being hard to understand theoretical concepts, monads can
encapsulate state and be composed to chains of calls.  Most modern functionality
in C# has its theoretical underpinings on monads(LINQ) and co-monads (tasks,
async). Using the latter, he presented an example of converting continuation
passing style programming (in my opinion, a really horrible paradigm) to series
of composable asynchronous tasks. Erik's colorful style was reflected on his
presentations too; apparently, blenders are monads while gum ball machines are
co-monads. Also C#'s BigIntegers are bigger than your favourite language's ones.

Andrei showed to everyone what programming in the trenches can be about.
Already a renown expert in C++ (his brilliant book Modern C++ design should be
part of every good programmer's library) he started working on the D language
some years ago, with an aim to create a better C++. His lecture started with a
motivating example of how string representation optimization done expertly
saved thousands (he mentioned 10k) servers for his employer (Facebook). He
then proceeded to praise the standard template library (STL), providing
motivating examples of how the C++ compiler and template system can optimize
away the language's abstraction mechanisms.  The pinacle of his talk was
however the D programming language. D is a modern systems language, with
several interesting properties: advanced type-based computations at compile
time, support for compiled DSLs (see the regexp library), higher order
functions on collections, STL style container libraries, thread-local
variables by default, message-passing intra-thread communication, garbage
collection, provable pure functions, smart pointer based arrays and, finally, a
nifty context aware error handling mechanism. To me, this was the seminar's
apocalypse and is definitely the next language I will be learning.

Martin's theme was, as expected, Scala. He went through what makes Scala an
interesting language to learn, and presented real coding examples (in my
opinion, the essense of any hacker talk worth its money). Simon's topic was the
advanced typesystem in Haskell and all the cool tricks you can do with it. He
covered type classes, generic algebraic datatypes and several other
trickerry that make Haskell an interesting language to study, but a very 
hard one to use for practical applications.

Guido and Roberto walked us through the development of two simingly similar, but
practically really different programming languages. Python stemmed from Guido's
work on ABC, an earlier unsuccesful language, that taught guide and his CWI
collegues several important lessons. Similarily, Lua stemmed from efforts to
script embedded systems. Being both dynamically and weakly typed, they offer
significant productivity enhancements for their domains: Python as the new
generation glue that keeps the interenet together (the first one was Perl) and
Lua as an embedded scripting environments for games (WoW anyone?) and other
applications (e.g. a new version of Latex).

Participating in an event with such accomplished participants turned out to be
an overwhelming experience. To be honest, given the location, timing and summer
mood, I was expecting hour-long philosophical discussions on the beach. It was
nothing like that. The program was strict 8 hours of lectures per day, with lots
of informal discussion on technical matters, with little time to relax. Formal
dinners where followed by pool-side "therapy sessions", where you got the chance
to drink Bertrand Meyer's reserved grappa bottle payed for you by Erik Meijer.

Next year, the topic is going to be software engineering for cloud computing.
I would wholeheartedly recommend it to anyone.
