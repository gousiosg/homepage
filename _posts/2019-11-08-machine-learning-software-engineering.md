---
layout: post
author: Georgios Gousios
title: IN4334 - Delft seminar on Machine Learning for Software Engineering
categories: research
---

__with Maurício Aniche__

One of the fun facts about teaching a master's level course is that you get to pick what to teach. In our faculty, there is almost unlimited freedom, and this leads to students being exposed to the latest and greatest research in each teacher's respective field. Exploiting this freedom, last year I 've taught a seminar on a topic that I was relatively familiar with: Software Analytics (read about my experiences [here](http://gousios.org/blog/a-seminar-on-software-analytics.html)).

This year, partnering with [Maurício](https://www.mauricioaniche.com), we
decided to stretch our topic to an upcoming and exciting sub-field: Machine Learning for Software Engineering.

Of course, anything related to Machine Learning is bound to raise the
interested of students. Indeed, we received 80+ subscriptions for a 40 seat
course. This led us to the interesting problem of having to select students;
we did so by asking the students to write a motivation letter explaining their
ML experience so far and their interest in the course. This trick motivated
students to apply self-selection, i.e. students that were not interested in the
course so much did not submit a reference letter. We ended up with 30+ students
with sufficient machine learning background.

Similarly to last year, we organized the students in groups of 4. Each group had
to discuss 2 papers in a 2 hour slot. The [paper reading protocol](http://gousios.org/courses/ml4se/discussing-papers.html) was again the
same: 5 mins of warm-up presentation and a list of questions to facilitate
discussion. What changed however this year is that we did not ask the students
to write a survey but to develop an end-to-end pipeline. We
provided an indicative [list of topics](http://gousios.org/courses/ml4se/projects.html) and corresponding papers, but we encouraged the students to come up with their own ideas.

In addition to our discussions in the class, we also invited people from the
industry to participate. We were lucky to have [Miltos Allamanis](https://miltos.allamanis.com) from Microsoft Research, [Vadim Varkovtsev](https://www.linkedin.com/in/vmarkovtsev/) from sourceD and our own [Vladimir Kovalenko](https://www.linkedin.com/in/vladimir-kovalenko-01416b88) (now at JetBrains) helping lead the discussions.

What follows below is the list of abstracts from the student papers (with minor
edits).

### The papers

__Replication Study of Tree-to-Tree Neural Networks for Program Translation__

Source code is written in a programming language specifically chosen to fit the
goal of the program. For example, Python or JavaScript can be used for scripting
and C or C++ can be used for high performance programs. Different reasons can
motivate a decision to migrate code to from one language to another, such as
performance, maintainability (e.g. deprecation) or other factors like business
decisions. While current state-of-the art performance on Machine Translation is
achieved using sequence-to-sequence networks, a study by Chen et al. has shown
promising results with Tree-to-Tree Neural Machine Translation. In this paper we
replicated their model to investigate whether we are we are able to achieve a
similar performance with the information provided.

We compare our results to the state-of-the-art results achieved by the tree2tree
model of Chen et al, and the results as described in Nguyen et al. While our
replication achieves a smaller accuracy than Chen et al, it still beats the
sequence-to-sequence benchmarks by up to 10 points.

__AutoComment: Comment Generation in Java Code__

Commenting large code databases is crucial for code comprehension and efficient
maintenance of a code base. Therefore, automatic code generation would be
incredibly beneficial for both programmer and future maintainer of the code. In
this paper, we propose a comment generator model using new state of the art
techniques developed in the previous years, based on code2seq for comment
generation in Java code. With the DeepCom as the baseline, the paper focuses on
replicating the code2seq model with added capabilities such as, predicting
natural language (Method-1) and modified ASTs (Method-2). The results show that,
Method-2, is capable of understanding the syntactic and semantic meaning of Java
code to generate comments automatically, but suffers from the incapability to
generate longer and complete comments, hence leading to a poor BLEU-4 score when
compared to the baseline.
([code](https://github.com/LRNavin/AutoComments))

__Generating Commit Messages from Git Diffs__

Commit messages help developers in their understanding of a continuously
evolving codebase. However, developers not always document code changes
properly. Automatically generating commit messages would relieve developer from
this burden. Recently, a number of different works have demonstrated the
feasibility of using methods from neural machine translation to generate commit
messages. This work aims to reproduce a prominent research paper in this field
(Jiang and McMillan), as well as attempt to improve upon their results by
proposing a novel preprocessing technique.  A reproduction of the reference
neural machine translation model was able to achieve slightly better results on
the same dataset. When applying more rigorous preprocessing, however, the
performance dropped significantly. This demonstrates the inherent shortcoming of
current commit message generation models, which perform well by memorizing
certain constructs.  Future research directions might include improving diff
embeddings and focusing on specific groups of commits.
([paper](https://arxiv.org/pdf/1911.11690.pdf))

__Using Distributed Representation of Code for Bug Detection__

Recent advances in neural modeling for bug detection have been very promising. Specifically, using snippets of code to create continuous vectors or embeddings has been shown to be very good at method name prediction and claimed to be efficient at other tasks, such as bug detection. However, to this end, the method has not been empirically tested for the latter.
In this work, we use the Code2Vec model of Alon et al. to evaluate it for detecting off-by-one errors in Java source code. We define bug detection as a binary classification problem and train our model on a large Java file corpus containing likely correct code. In order to properly classify incorrect code, the model needs to be trained on false examples as well. To achieve this, we create likely incorrect code by making simple mutations to the original corpus.

__Code completion using Byte Pair Encoding__

In this paper, we aim to do code completion based on implementing a Neural
Network from Li et. al. Our contribution is that we use an encoding that is
in-between character and word encoding called Byte Pair Encoding (BPE). We use
this on the source code files treating them as natural text without first going
through the abstract syntax tree (AST). We have implemented two models: an
attention-enhanced LSTM and a pointer network, where the pointer network was
originally introduced to solve out of vocabulary problems. We are interested to
see if BPE can replace the need for the pointer network for code completion.

__DLTPy: Deep Learning Type Inference Of Python Function Signatures Using Natural Language Context__

Due to the rise of machine learning, Python is an increasingly popular
programming language. Python, however, is dynamically typed. Dynamic typing has
shown to have drawbacks when a project grows, while at the same time it improves
developer productivity. To have the benefits of static typing, combined with
high developer productivity, types need to be inferred. In this paper, we
present DLTPy, a deep learning type inference solution for the prediction of
types in function signatures based on the natural language context (identifier
names, comments and return expressions) of a function. We found that DLTPy is
effective and has a top-3 F1-score of 91.6%. This means that in most of the
cases the correct type is within the top-3 predictions. We conclude that natural
language contained in comments and return expressions are beneficial to
predicting types more accurately. DLTPy does not significantly outperform or
underperform the previous work NL2Type for Javascript, but does show that
similar prediction is possible for Python.
([paper](https://arxiv.org/abs/1912.00680))

__Identifying Approaches to Detect Logging Opportunities in Java Source Code__

Sizeable modern software projects produce massive amounts of log data. Logging
the correct information is hard and doing it correctly can massively speed up
failure diagnosis. Due to the difficulty of logging correctly, a tool predicting
the necessity for log statements will assist developers and enhance development
productivity. Unfortunately, there is yet no single best solution. Therefore, in
this paper, we explore several approaches to identify the most promising ones.
These approaches are tested on Apache projects, as those comply to a high
quality logging standard. An approach to determine code meaning/context that has
been used is code2vec. We conclude that a custom trained code2vec combined with
a RFC or SVM is the most promising with a balanced accuracy of 0.71 and a recall
of 0.48. We also conclude that a pretrained code2vec model cannot always be
simply applied on different code context problems.

__Multi-label Classification for Automatic Tag Prediction in the Context of Programming Challenges__

One of the best ways for developers to test and improve their skills in a fun
and challenging way are programming challenges, offered by a plethora of
websites. For the inexperienced ones, some of the problems might appear too
challenging, requiring some suggestions to implement a solution. On the other
hand, tagging problems can be a tedious task for problem creators. In this
paper, we focus on automating the task of tagging a programming challenge
description using machine and deep learning methods. We observe that the deep
learning methods implemented outperform well-known IR approaches such as tf-idf,
thus providing a starting point for further research on the task.
([paper](https://arxiv.org/abs/1911.12224))

__Learning How to Mutate Python Source Code from Bug-Fixes__

The goal was to replicate an existing paper to a similar problem. This project
focuses on the topic of learning Python code mutants for mutation testing and
takes [9] as a blueprint, which has researched the same topic but for Java code.

### The experience

All in all, this was the most interesting course I 've ever taught, by far. I 've
learned a lot, mostly on the technical size. For example, having Miltos
explaining GGNNs to us was in invaluable experience! I 've also come to
appreciate the state of the art in the field, which is, let's just say, emerging 😉

But what I 've mostly come to admire is our students. What a group! It was
amazing to see that in less than 2 months students being able to fully replicate existing work, coming
up with great new ideas and even write almost publication quality papers. No
matter where they go after the course, I am sure that they will shine! I would
hire 90% of them on the spot, if I were in the industry.

As usual, you can find the course materials under a CC license [on my
homepage](http://gousios.org/courses/ml4se/). Feel free to reuse them for
your own courses!
