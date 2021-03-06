---
layout: page
title: Functional Programming
---

*taugh by [Erik Meijer](http://en.wikipedia.org/wiki/Erik_Meijer)*

I was teaching assistant for the TU Delft course IN2556. The course covered
functional programming basics and more advanced concepts such as monads,
functors and monoids.

## edition 2013

The course will take place from Oct 1 -- Oct 31. Stay tuned for updates!

## edition 2012

The course turned out to be a great success, both in terms of student involvment
and also in terms of student output. We reported our experience in
{% cite_details MG12, this paper %}.

In addition to assisting with the course, I
{% cite_details Gousit12a, presented an introduction %} to the
[Actor model](http://en.wikipedia.org/wiki/Actor_model)
using [Akka](http://akka.io) and Scala as reference implementations.

#### Teapots!

<img src="/files/teapot.png" width="30%"/>

The first week assignment consisted of rendering the
[Utah Teapot](http://en.wikipedia.org/wiki/Utah_teapot)
using any
graphics primitive of the student’s choice using only right triangles. In its
core, the exercise required students to decompose arbitrary triangles, which
comprised the input Utah Teapot model, to a series right triangles. The students
had to come up with the decomposition method (using an analytic geometry
method), a decomposition termination criterion to stop the decomposition when
triangles are too small to be rendered on screen and a method to recursively
apply the above mentioned transformations on the input data.

The students came up with very interesting solutions in various languages,
ranging from Scala to Javascript to Scheme.

I collected all solutions to the
[gousiosg/teapots](https://github.com/gousiosg/teapots) repository.

#### Student projects

The projects required from the students to come up with a functional
solution to a relatively complex problem. Students
[worked really hard](https://twitter.com/headinthebox/status/269537848154271745) on problems ranging from
[Github project relationship graphs](https://github.com/hendrikvanantwerpen/github-relations-viz)
to
[in browser Map/Reduce](https://github.com/dlhartveld/in4355-fp-project). 
More information about
student projects can be found from 
[this page](http://swerl.tudelft.nl/bin/view/Main/FunctionalProgrammingCourse).
