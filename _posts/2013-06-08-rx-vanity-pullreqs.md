---
layout: post
author: Georgios Gousios
title: Reactive programming
categories: Rx Hacking
---

*tl;dr summary: Reactive programming is a great way for consuming and combining
web APIs. C# is very cool.*

#### Reactive programming basics

Lately, I have been (being) introduced to reactive programming in general and Rx
in particular by [@headinthebox](https://twitter.com/headinthebox). Reactive programming is a set of techniques to
perform computations on *streams* of values rather than on just values.  What is
the difference? Streams represent the state of a structure in a specific point
in time. Thus they are, by definition, unbounded. This leads to interesting
problems that need to be solved; for example, when we want to sum the results of
a list we can do a `fold` or a `while` loop; this is only possible because we
know in advance the length of the list.

But how can we construct streams? This is easy: every time a program receives
and processes asynchronous events, it is basically reading a stream of events.
As most programs we write (from GUI applications, to servers, to operating
system kernels) do receive stimuli from their environment, most of us have
already done reactive programming, one way or another! The basic trickery behind
reactive programming and Rx is formulating asynchronous event streams as data
structures and then running higher order functions on them. Erik, of course,
explains all these much better in his brilliant paper [Your Mouse is a
Database](http://queue.acm.org/detail.cfm?id=2169076).

The discussion on streams (or signals, as known in other contexts) however blurs
the practicality of reactive programming. The practice boils down to creating
`Observable` sequences of events (e.g. by poling an API or waiting on a socket)
and then assigning actions to incoming events.  The interesting situations start
when we combine several streams, in a time-dependent fashion: say that we want
an action to occur as a result of polling two APIs and combining the responses
based on a common attribute.  Luckily, the complicated interactions are hidden
quite well behind the Rx API; powerful operators such as `Merge` that merges
events from two streams in one or `Buffer` that creates a time window of events
before firing the event processors are available.

#### A working example

To make sure I understand the basic concepts, I decided to write a program that
identifies "vanity pull requests", that is Github pull requests whose URLs are
then tweeted by their creators. The process to retrieve those is
straightforward: for each new pull request, as exposed by the
[Github event API](https://api.github.com/events), I get the user that created
it and look for the pull request URL in his/her Tweeter steam (which I obtain
through the [Twitter search
API](http://search.twitter.com/search.json?q=@gousiosg)) for 10 minutes. For
simplicity, I am making assumption is that the user's Github and Twitter
accounts have the same user name, while no URL shortening happens on the Github
URL (both relatively fishy). I had written some initial code myself
(in C# even!) and on (Catholic) Easter eve (6th Apr 2013) we sat together with Erik to make it actually work.

##### Creating collections out of API calls

The first thing the code needs to do is to retrieve the
Github event stream and process it. Here is the code:

{% highlight csharp %}

public static async Task<IEnumerable<string>> ReadGithubAsync(string user, string password) {

    var header = new AuthenticationHeaderValue(
        "Basic",
        Convert.ToBase64String(System.Text.UTF8Encoding.UTF8.GetBytes(string.Format("{0}:{1}", user, password)))
    );
    var client = new HttpClient{
            BaseAddress = new Uri("https://api.github.com/"),
            DefaultRequestHeaders = {Authorization = header}
        };
    client.DefaultRequestHeaders.Add("user-agent", "rx-example");
    var response = await client.GetAsync("/events");
    var json = await response.Content.ReadAsStringAsync();

    return (from e in JArray.Parse(json).Children()
            where (string)e["type"] == "PullRequestEvent" &&
                  (string)e["payload"]["action"] == "opened"
            select (string)e["actor"]["login"]);
}

{% endhighlight %}

The code sets up a basic authentication header
and then creates an HTTP client to query Github with.
The method then reads the stream, parses the returned JSON object and, using
LINQ, it filters out pull requests which have more than one commits and returns
the Github user names of the pull requesters.

Notice that the method has been marked as `async`. When a method is `async` the
C# compiler looks in the body of the method for a corresponding `await` call;
it then converts the remaining body of the method to a continuation function
which is to be called after the awaited method returns! Yes, this is
[continuation passing style](http://en.wikipedia.org/wiki/Continuation-passing_style) hidden by a very clever compiler trick. The
`ReadGithubAsync` method is fully event based and asynchronous and can
perform non-blocking multi-threaded I/O, which apparently is the holy grail
of modern web frameworks. What's more is that the simplicity of this approach
makes event-based frameworks such as Node.js, EventMachine and Gevent look
naive and awkward.

The method that reads the user's Twitter stream is similar but simpler: it
sets up an HTTP client for the Tweeter search API, filters the returned
tweets for the string `github.com/.*/pulls/` and returns the
tweet text:

{% highlight csharp %}
public static async Task<IEnumerable<string>> ReadTwitterAsync(string user)
{
    var client = new HttpClient{ BaseAddress = new Uri("http://search.twitter.com/search.json")};
    var response = await client.GetAsync(String.Format("?q={0}", user));
    var json = await response.Content.ReadAsStringAsync();

    var tweets = from e in JValue.Parse(json)["results"]
                 where (string)e["from_user"] == user &&
                    Regex.Match((string)e["text"], "github.com/.*/pulls/").Success
                 select new{ Text = (string)e["text"], From = (string)e["from_user"] };

    return tweets.Select(x => x.Text);
}

{% endhighlight %}

##### Timing matters

What we have now is two asynchronous methods that read data from the
corresponding APIs; what we need to do is combine them. Intuitively, we *first*
need to read the Github event API *periodically* and *for each* returned pull
requester, read his/her Tweeter stream for *some time* and return all tweets that
contain pull request URLs. There emphasized terms highlight the several time
dependencies this very simple example has. Time dependencies can be quite tricky
to understand; what Erik and the Rx team usually do is draw [marble diagrams](
http://channel9.msdn.com/Blogs/J.Van.Gogh/Reactive-Extensions-API-in-depth-marble-diagrams-select--where).
Marble diagrams present events as marbles (hence the name), colour coded by a
specific event property, on an abstract timeline. A timeline can be owned. In
our case, the colouring represents the user that initiated the event. Here is a
hypothetical timeline of Github pull requests as returned by `ReadGithubAsync`:

<a href="/files/rx-blog-pullreqs.png" rel="lightbox">
  <img style="width: 70%;margin-left: auto; margin-right:auto;" src="/files/rx-blog-pullreqs.png" alt="Github marble diagram">
</a>

We see that the timeline is not owned by any entity; we also observe (pun
intented) that a user might have more that one pull requests, while those might
not come in regular intervals.  To retrieve the tweets, we need to filter the
pull requester login names and feed them to our `ReadTwitterAsync` method,
effectively creating a timeline of tweet events per user, as shown below:

<a href="/files/rx-blog-tweets.png" rel="lightbox">
  <img style="width: 70%;margin-left: auto; margin-right:auto;" src="/files/rx-blog-tweets.png" alt="Github marble diagram">
</a>

The question now is how we go from one the first timeline to the second.  LINQ
to the resque (*warning: query for demo purposes only*)!

{% highlight csharp %}
from u in ReadGithubAsync().Result
from t in ReadTwitterAsync(u.User).Result
select new {User = u.User, Tweet = t};
{% endhighlight %}

##### Making collections reactive

Alright! Now we have combined the two streams, but if we call the LINQ query
presented above, we will only get a single result, which will represent a
single snapshot in marble diagram terms. How can we extend the marble diagram
timelines to include multiple snaphots? Here is where reactive programming
and Rx come into play. The first thing we have to do is convert our API
calls to streams; in Rx terms, we need to convert the `IEnumerables` returned
by our `Read*Async` methods to `IObservables`. The canonical way of doing
that is use the static methods of the `Observable` class as follows:

{% highlight csharp %}

public static IObservable<IEnumerable<String>> PullRequesters(TimeSpan interval)
{
    return Observable.Timer(TimeSpan.Zero, interval).SelectMany( _ =>
        ReadGithubAsync("foo", "bar")
    ).DistinctUntilChanged();
}
public static IObservable<string> Tweets(string user)
{
    return Observable.Timer(TimeSpan.Zero, TimeSpan.FromSeconds(10))
        .SelectMany(_ => ReadTwitterAsync(user))
        .Scan(new string[]{}, (a,v) =>
        {
            var diff = v.Except(a).ToArray();
            if(diff.Length == 0) return a;
            return diff;
        })
        .DistinctUntilChanged()
        .SelectMany(ts => ts);
}
{% endhighlight %}

Both methods setup a timer to call the corresponding backup method every
6 (Github) and 10 (Twitter) seconds. The Twitter case is slightly more
complicated as Twitter's search window is much longer (30 mins IIRC) than
the polling interval. This means that we will get the same tweets (events)
every time we call `ReadTwitterAsync` for a single user. We are obviously
interested for an event only when we observe a new tweet; this is what
`DistinctUntilChanged` does.

What we have now is two `Observable` streams; theoretically, we could just
combine them using LINQ as we did with the `Enumerable` versions above. However,
if we did that, we would loose all new users creating pull requests after the
first call to `PullRequesters`. What we need to do is to come up with an updatable
version of the static Tweeter marble diagram, where each new pull requester
automatically creates a new Tweeter event timeline. To do so, we insert
an intermediate step between polling Github and Tweeter for a specific user:

{% highlight csharp %}
public static IObservable<IGroupedObservable<String, String>> PullRequestersInfo()
{
    var u = from users in PullRequesters()
        from user in users select user;

    var groups = from user in u
        group user by user;

    return groups;
}
{% endhighlight %}

Notice the method signature: it will return an `Observable` of
`GroupedObservable`s, where each group is identified by a user.
This way we both
solve the problem of users issuing multiple user pull requests in the same
polling period and create an observable group (and therefore list, if we just
get the group keys) of users to read tweets from. Neat, eh?

Finally, combining the two streams (groups of users, and tweets for a user) is
again a job for LINQ:

{% highlight csharp%}
from prinfo in PullRequestersInfo()
from u in prinfo
from t in Tweets(u).TakeUntil(Observable.Timer(TimeSpan.FromMinutes(5)))
select new {User = u, Tweet = t};
{% endhighlight %}

The only difference to the static version is the fact that we stop scanning for
new user tweets after 5 minutes. To sum up, our example will poll Github every 6
seconds for new pull requesters asynchronously, create observable sequences of
pull requesters grouped by username, create observable sequences of tweets by
polling Tweeter asynchronously every 10 seconds using the observable user groups
as source per user name and return an observable stream of user names and tweets
that refer to pull requests. The code is fully asynchronous and in fact executed
using a thread pool for running the async tasks, so automatically
parallelizable.

All this, [in just 82 lines of code](https://gist.github.com/gousiosg/5290793)
of unpolished code. Amazing, right?

