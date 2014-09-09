---
layout: post
author: Georgios Gousios
title: The computer scientist's guide to speech development
categories: speech
---

During the last 20 months, I 've been having fun with my daughter's (from now on: little λ) efforts to learn to speak. Up to now, the whole process can be split in 4 phases.

### The random noise phase

This starts at around 4 months. The baby mumbles random noises initially (aaa, usually) and, as the brain develops, more focused 2 letter syllables (ma-ma, pa-pa etc). Nothing interesting here, apart from the fact the baby can combine various stimuli (noise, vision etc) with oral expressions (say ma-ma when she listens mummy whispering at night), which computers are not very capable of yet.

### The grep phase

This starts at around 10 months and goes up to 13-14 months. The toddler ignores the context and can only respond to certain
sounds. Being desperate to communicate, he/she tries to participate to the discussion with an adult by linking patterns to specific responses. The naïveté of the approach leads to endless fun:

* Me: *λ, who's your daddy?*
* λ: *Zzzio-Zzzio!* (Giorgos in baby speech)
* Me: *Bravo! And who's daddy's daddy?*
* λ: *Zzzio-Zzzio!*
* Me: *This little lamp's daddy is this big ram with the curly horns.*
* λ: *Zzzio-Zzzio!*

I think you can simulate this behavior with the following simple script. The `mappings.txt` file contains a word and its baby speech equivalent. The baby updates it with new words and sounds every day.

{% highlight bash %}
cat /dev/microphone |
stt| #Your speech recognition package of choice
tr ' ' '\n'|
while read word; do
    found=`grep $word mappings.txt`
    if [ ! -z $found ]; then
        echo $found|
        cut -f2 -d' '|
        tts > /dev/dsp # Your text-to-speech package of choice
    fi
done
{% endhighlight %}

### The Prolog phase

The progression to the next stage marks the end of baby-hood and the beginning of the toddler phase. The toddler starts to build a knowledge base by assigning facts to items or persons ('daddy', 'coffee') or actions ('drink') and, later on, learns rules on how to infer facts from them. The rules are initially very simple (daddy and λ are people, people drink coffee -> λ drink coffee) but are soon reinforced with more complex ones (λ is toddler, toddlers not drink coffee -> λ not drink coffee).

If memory serves me right, this is very similar to how Prolog knowledge bases are build. And just as is the case of Prolog systems with missing rules, the inference engine in a toddler's brain can make funny inferences, e.g.

* Me: *λ, cats meow like: meow meow.*
* λ: *Nia-nio!* (λ's rendering of meow)
* Me: *Nice! So tigers are like cats. How do they sound?*
* λ: *Nia-nio!*
* Me: *Aha! Lions roar though like tigers: ROOOAR!*
* λ: *Nia-nio!*

The critical difference between this stage and the next one is that the toddler learns rules by the people around him/her, but cannot construct his/her own rules yet.

### The deep learning phase
I believe this stage starts when the toddler can make 2 letter sentences, i.e. at around 18 months. The brain is rapidly developing and the inference rule engine gives it place to more complex processes for infering generic rules from patterns.
This is where computers have already lost the race to the brain. The toddler has absorbed enough information and experience that it can do 2 tasks that are extremely difficult for computers:

* Fuzzy matching (cats in drawings, pictures and real life all meow).
* Construct rules from facts and behavioral patterns and generalize them along the way (daddy drinks coffee in the morning, and since grandpa visited and we love him, he should drink coffee in the morning as well).

The more knowledge the toddler absorbs, the more complex networks of rules it can create, which is akin to [deep machine learning](http://en.wikipedia.org/wiki/Deep_learning), only way more efficient.

*Disclaimer: Totaly unscientific stuff. If you are a linguist, speach therapist, deep learner etc please be gentle in your comments :-)*

