---
featured: true
---

[Fediverse](https://fediverse.party/) is a *federated* social network comprised of a number of different software projects interoperating through the use of [[ActivityPub]] protocol.

Compared to some of the more widely adopted social networks it's highly unusual.

## Structure

It's federated, which means that it runs off of a fleet of different servers owned by different parties and in different jurisdictions, possibly not affiliated with each other and not even interacting.

This may sound strange. How is it a single network then? Well, it not necessarily is one. We recognize the global internet, but the exact same technologies and software can power completely separate environments. Same here.

The easiest way to contrast this approach to that of centralized social networks is to compare "who hosts your content". 

### Centralized

When using a centralized network you're trusting the operator of the **entire** network with your content, e. g. with keeping it online and with its removal when you delete it. You have no choice over who moderates your content and have no insight into what guarantees its deletion (e. g. that it's actually no longer recoverable when you click the respective button).

If the operator's moderator decides to delete your content, that content becomes inaccessible to all users of the network. It may be posted elsewhere, but you invariably will have to change the means you use to access that content again, possibly registering another account elsewhere.

### Federated

With a federated network you get to choose your operator the very moment you're registering. You can still choose to not immediately dive into the benefits of federation and pick one of the biggest servers. You'll have the same degree of personal trust in the operator behind hosting your content (almost none that is), won't have a say regarding moderation policies, but that still allows you access to content of those that chose differently, which is a new capability.

You can also choose differently and find a smaller server owned and operated by someone you know. This changes the picture dramatically!

### Open-source

[[Security advice]]

Some of the networks choose to open-source some of their products, be it servers or clients. Some do so from the start.

Open-source clients can improve the understanding of interactions with the server and as such the degree of required trust in order to use it. This is beneficial for any network.

Open-source servers of centralized networks are, sadly, useless, because there is no mechanism that enforces the use of the published code on actual servers. Nothing is stopping the operators from making subtle changes to the code that changes how user data is being processed and what degree of trust for the server is actually required.

> In particular, recent endorsements of Signal put a huge emphasis on the fact that its server is open-source without clarifying why it's beneficial, if at all.

Open-source servers of federated networks are useful, as they allow whoever wants to enforce the use of the published code to run it and use it themselves; and others can choose to trust the one who runs the code that they have made no changes to it. This makes the "trust circle" much narrower, and as such makes the very notion of "trust" more meaningful.

## Rules & moderation

The unusual decentralized structure does possibly result in some duplicate moderation work being done on different servers, but because every server processes only its own content and subscriptions, that increase in moderation effort is not so drastic and is easily compensated by the number of moderators smaller communities can afford to have.

Fediverse touts itself as **"censorship-free"**. This is as true as it probably technically can be: there are no global rules since everyone gets to choose where their content is originally hosted. However, others may choose to stop receiving content they consider inappropriate. The scope of such "stops" can span from individual accounts to, less frequently, entire communities.

I have seen someone accuse [Gargron (creator of Mastodon, the microblogging segment of Fediverse)](https://mastodon.social/@Gargron) of censorship on "his network". I'm not sure they were trying to badmouth the network or genuinely didn't understand how it works. Could be both!

> Public Service Announcement: **The Right to Free Speech** means the government can't arrest you for what you say. It doesn't mean that anyone else has to listen to your bullshit, or host you while you share it. The 1<sup>st</sup> Amendment doesn't shield you from criticism or consequences. If you're yelled at, boycotted, have your show canceled, or get banned from an Internet community, your free speech rights aren't being violated. It's just that the people listening think you're an asshole, And they're showing you the door.
>
> — [xkcd: Free Speech](https://xkcd.com/1357/)

### Hybrids

There are singular occurrences in the wild that somehow seem to combine the traits of centralized and federated networks in unexpected ways.

When [Bryan Lunduke suggested publishing his Twitter banlist](https://www.youtube.com/watch?v=mZrlEulss6Q&t=10m25s) I started to wonder what implications would such "crowdsourced moderation" have with proper support from the platform. Well, in Fediverse there is really no other way to do it without compromising the independence of federation's participants. In Twitter, however, this approach still assumes agreement with all of the Twitter moderators' decisions.

Google tried to make its own push for centralized moderation of federated networks by [threatening to force Fediverse clients out of its store](https://qoto.org/@freemo/104765288863293481) on grounds of them allegedly "promoting violence" (in reality, for not taking an active stance against it or ceasing to do so). It was rightfully ridiculed for doing so, most hilarious extension of this policy being the necessity to also take down Google Chrome and GMail, that allow access to unmoderated content, which would imply that Google has to moderate the entire World Wide Web and e-mail networks.

## Interoperability

Fediverse is powered by **different software projects that support different kinds of posts** (e. g. PeerTube handles video, Mastodon handles microblogging, PixelFed handles pictures), but thanks to [[ActivityPub]] handling subscriptions, users in any of them can follow the users of any other.

Say, a user of Mastodon, a microblogging segment of the Fediverse, can subscribe to a PeerTube channel. In more popular networks the equivalent would be the ability to subscribe to a YouTube channel from Twitter, needless to say, currently impossible.

The list of servers supporting ActivityPub and thus compatible with the Fediverse is open! Technically, if a mainstream social network ever decided to support [[ActivityPub]], they could just go ahead and do it. Then their users would be able to subscribe to users of the Fediverse and/or vice versa (depending on the implementation). And who knows, maybe [EU's Digital Markets Act](https://ec.europa.eu/info/strategy/priorities-2019-2024/europe-fit-digital-age/digital-markets-act-ensuring-fair-and-open-digital-markets_en) might compel some of them to start doing that? (Actually, is this already happening? Is Twitter's [BlueSky project](https://twitter.com/bluesky) exactly that? Guess we'll have to wait and see.)

## Critique

### Federated vs. distributed

Some say that going federated is not the solution to privacy issues that pertain to the use of traditional centralized social networks. That they still cannot fully preserve the user's intent to expose nothing by default, and merely replace faceless corporations with more defined individuals or organizations. And that's true. But there's more to it.

Even federated networks, as they are, are facing adoption issues. And federated solutions are very similar to the centralized solutions of today, in that after initial sign up they look largely the same to their users, short of a few novelties.  "A perfect solution" to the privacy problem will require breaking even more familiarities/habits for adoption. Enough to make it unrealistic in the present day.

Actually distributed (i. e. across all of the users, not just a network of nodes) requires much more processing on every single device, pretty much barring the use of such solutions on battery-powered hardware. This is in an era where most of the social media interactions happen on the move.

Okay, an obvious solution to that would be splitting up the service into client and server, but then we're getting into essentially the same model that federated services already use. Nothing is stopping a user from creating a node just for themselves. Sure, it's somewhat of an investment of both money (domain costs, hardware purchase/rental, internet connection) and time (setup, although it's getting easier) but it does get dangerously close to "perfect" without compromising any features the users are already accustomed to.