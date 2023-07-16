---
featured: true
---

[Fediverse](https://fediverse.party/) is a *federated* social network comprised of a number of different software projects interoperating through the use of [[ActivityPub]] federation protocol.

Compared to some of the more widely adopted social networks it distributes ownership of the network across many parties (invididuals and organizations) and resists concentration of control in the hands of major players.

## Structure

It's federated, which means that it runs off of a fleet of different servers owned by different parties and in different jurisdictions, possibly not affiliated with each other and not even interacting.

This may sound strange. How is it a single network then? Well, it not necessarily is one. We recognize the global internet, but the exact same technologies and software can power completely separate local networks (look up Havana Street Network or SNET in Cuba, [or here's one decent source](https://restofworld.org/2020/the-life-and-death-of-snet-havanas-alternative-internet/)). Same here.

The easiest way to contrast this approach to that of centralized social networks is to compare "who hosts your content".

<small>Reference: [Mastodon: What is federation?](https://docs.joinmastodon.org/#federation)</small>

### Centralized

When using a centralized network you're trusting the operator of the **entire** network with your content, e. g. with keeping it online and with its removal when you delete it. You have no choice over who moderates your content and have no insight into what guarantees its deletion (e. g. that it's actually no longer recoverable when you click the respective button).

If the operator's moderator decides to delete your content, that content becomes inaccessible to all users of the network. It may be posted elsewhere, but you invariably will have to change the means you use to access that content again, possibly registering another account elsewhere.

### Federated

With a federated network you get to choose your operator the very moment you're registering. You can still choose to not immediately dive into the benefits of federation and pick one of the biggest servers. You'll have the same degree of personal trust in the operator behind hosting your content (almost none that is), won't have a say regarding moderation policies, but that still allows you access to content of those that chose differently, which is a new capability.

You can also choose differently and find a smaller server owned and operated by someone you know. This changes the picture dramatically!

### Open-source

[[Security advice]]

Some of the networks choose to open-source some of their products, be it servers or clients. Some do so from the start.

Open-source **clients** can improve the understanding of interactions with the server and as such the degree of required trust in order to use it. This is beneficial for any network. If a client does not have any code path that results in a certain piece of information being sent — it's reasonably solid proof the server will never get it because the client runs on _your_ hardware. Even if you suspect the original software distribution uses an altered version of that code, you can build the open version and compare the two. The risk that someone has the capability to do it helps keep the original distributors accountable. It's not a guarantee, but it's pretty close.

Open source code of the **server** software of centralized networks, on the other hand, isn't very useful, because there is no mechanism that enforces the use of the published code on actual servers. Nothing is stopping server operators from making subtle changes to the code that changes how user data is being processed. Server operators can arrange an audit by a third party, but all this does is shift the trust from one organization you know little about to another organization you know little about — not much of a change.

> In particular, endorsements of Signal put a huge emphasis on the fact that its server is open-source without clarifying why it's beneficial, if at all.

Open-source servers of federated networks _are_ useful, as they allow whoever wants to enforce the use of the published code to run it and use it themselves; and others can choose to trust the one who runs the code that they have made no changes to it.

This makes the trust requirements for the system much narrower, and as such makes the very notion of "trust" more meaningful.

Particularly, members of that "trust circle" are much less likely to conspire against you without a direct economic affiliation between them: a bad actor could be easily exposed for a reputation gain without a serious cost.

## Rules & moderation

The unusual decentralized structure does possibly result in some duplicate moderation work being done on different servers, but because every server processes only its own content and subscriptions, that increase in moderation effort is not so drastic and is easily compensated by the number of moderators smaller communities can afford to have.

Fediverse touts itself as **"censorship-free"**. This is as true as it probably technically can be: there are no global rules since everyone gets to choose where their content is originally hosted. However, others may choose to stop receiving content they consider inappropriate. The scope of such "stops" can span from individual accounts to, less frequently, entire communities.

I have seen someone accuse [Gargron (creator of Mastodon, the microblogging segment of Fediverse)](https://mastodon.social/@Gargron) of censorship on "his network". I'm not sure they were trying to badmouth the network or genuinely didn't understand how it works. Could be both!

> Public Service Announcement: **The Right to Free Speech** means the government can't arrest you for what you say. It doesn't mean that anyone else has to listen to your bullshit, or host you while you share it. The 1<sup>st</sup> Amendment doesn't shield you from criticism or consequences. If you're yelled at, boycotted, have your show canceled, or get banned from an Internet community, your free speech rights aren't being violated. It's just that the people listening think you're an asshole, And they're showing you the door.
>
> — [xkcd: Free Speech](https://xkcd.com/1357/)

This turned into a common accusation of Fediverse in general as a network where censorship is even stronger. There is _some_ truth to that, meaning that it _allows_ the existence of communities with extreme censorship.

But that's only a piece of the picture. Because there are other communities as well. Because it allows full range of gatekeeping, including the very extremes, it turns into a tool that _directly_ reflects the intent of the people running the show. The key is in _choosing_ said people. That's something you cannot do in centralized networks at all, and chances are you don't at all know the people "chosen" there.

And I especially find hilarious the attempts at building "censorship-resistant" networks (most recently, Nostr) with the intent to use that as a leverage to surpass Fediverse. One thing these projects seem to forget that censorship is a tool that, perhaps counterintuitively, has good uses. Consider spam, for instance. You'd prefer to not see it, right? Well, then it just happens to be the kind of censorship you **want**.

What I'm saying is that moderation and censorship ultimately rely on the exact same tools, so crippling or impeding one does the same to the other. The difference is in perspective. If you agree with something being taken out of your view, you'll consider that proper moderation. If you don't, you'll think it's censorship.

### Hybrids

There are some occurrences in the wild that somehow seem to combine the traits of centralized and federated networks in unexpected ways.

When [Bryan Lunduke suggested publishing his Twitter banlist](https://www.youtube.com/watch?v=mZrlEulss6Q&t=10m25s) I started to wonder what implications would such "crowdsourced moderation" have with proper support from the platform. Well, in Fediverse there is really no other way to do it without compromising the independence of federation's participants. In Twitter, however, this approach still assumes agreement with all of the Twitter moderators' decisions.

Google tried to make its own push for centralized moderation of federated networks by [threatening to force Fediverse clients out of its store](https://qoto.org/@freemo/104765288863293481) on grounds of them allegedly "promoting violence" (in reality, for not taking an active stance against it or ceasing to do so). It was rightfully ridiculed for doing so, most hilarious extension of this policy being the necessity to also take down Google Chrome and GMail (the apps), that allow access to unmoderated content, which would imply that Google has to moderate the entire World Wide Web and e-mail networks.

## Interoperability

Fediverse is powered by **different software projects that support different kinds of posts** (e. g. PeerTube handles video, Mastodon handles microblogging, PixelFed handles pictures), but thanks to [[ActivityPub]] handling subscriptions, users in any of them can follow the users of any other.

Say, a user of Mastodon, a microblogging segment of the Fediverse, can subscribe to a PeerTube channel. In more popular networks the equivalent would be the ability to subscribe to a YouTube channel from Twitter, needless to say, currently impossible.

The list of servers supporting ActivityPub and thus compatible with the Fediverse is open! Technically, if a mainstream social network ever decided to support [[ActivityPub]], they could just go ahead and do it. Then their users would be able to subscribe to users of the Fediverse and/or vice versa (depending on the implementation). And who knows, maybe [EU's Digital Markets Act](https://ec.europa.eu/info/strategy/priorities-2019-2024/europe-fit-digital-age/digital-markets-act-ensuring-fair-and-open-digital-markets_en) might compel some of them to start doing that? (Actually, is this already happening? Is Twitter's [BlueSky project](https://twitter.com/bluesky) exactly that? Guess we'll have to wait and see.)

## Critique

As with most popular things, Fediverse gets some criticism. Some of it is fair, some of it is manipulation by competitors in an attempt to attact attention to their projects instead, some of it is tech-headed perfectionists willing to give up the existing usebase for the sake of technical soundness here and now, essentially destroying the "society" of the social network. Sometimes all at once!

### Federated vs. distributed

Some say that going federated is not the solution to privacy issues that pertain to the use of traditional centralized social networks. That they still cannot fully preserve the user's intent to expose nothing by default, and merely replace faceless corporations with more defined individuals or organizations. And that's true. But there's more to it.

Even federated networks, as they are, are facing adoption issues. And federated solutions are very similar to the centralized solutions of today, in that after initial sign up they look largely the same to their users, short of a few novelties.  "A perfect solution" to the privacy problem will require breaking even more familiarities/habits for adoption. Enough to make it unrealistic in the present day.

Actually distributed (i. e. across all of the users, not just a network of nodes) requires much more processing on every single device, pretty much barring the use of such solutions on battery-powered hardware. This is in an era where most of the social media interactions happen on the move.

Okay, an obvious solution to that would be splitting up the service into client and server, but then we're getting into essentially the same model that federated services already use. Nothing is stopping a user from creating a node just for themselves. Sure, it's somewhat of an investment of both money (domain costs, hardware purchase/rental, internet connection) and time (setup, although it's getting easier) but it does get dangerously close to "perfect" without compromising any features the users are already accustomed to.

💭 An interesting approach is being taken by Ian Clarke's redesigned [Freenet](https://freenet.org/) that defines **delegates** that, at a glance, aim to solve that problem by having each user publish their own signed server software agent onto a distributed network of executors, one that acts o behalf of that user the way that user wants. The idea looks sound, but getting even the _developers_ to understand it, let alone _users_, is going to be a challenge, so I'm expecting serious adoption issues over the upcoming years.

### Protocol disparities

Communication on Fediverse can be somewhat lossy. There are usually no issues when communicating between instances running the same software (e. g. Mastodon to Mastodon), but different software can have some quirks. For instance, Pleroma and its forks implement "emoji reactions" via ActivityPub's `Like` object with an additional field. Mastodon ignores that field and records it as a "favorite" in its database (commonly referred to as "like"). It still makes the favorites counter work as a measure of engagement, only missing some finer details.

I'm not saying it should be like this though. This is fair criticism. And it should eventually be fixed as projects' userbases grow and the projects themselves attract more resources.

### Ownership of identity

Another common topic of criticism is a hard tie between the identity of the user and a server they reside on.

I believe this is either misconception or deliberate misdirection.

A Fediverse handle/URL/username is not an **identity**, it's a **location**, or **address**, if you will. One and the same person can have many of them and can even let others use it — it's not common, but technology often requires implementing hard unbreakable rules: meaning if something can happen and doesn't need to be prevented, the rules should allow it.

### Key management

Key management on Mastodon is very much a work in progress: the foundations are there (the ActivityPub protocol allows sensible key management practices), actual products (like Mastodon) are mostly not.

Across most (if not all) of the Fediverse each user has a signing key that all their posts are signed with. This protects against a domain name takeover: observers would notice that outgoing posts are signed with a different key and, normally, should reject them as impersonation attempts. In order to defeat that protection layer, an attacker would need to have access to the original server as well.

It's done using public key cryptography: where observers are given a public key for verification, but the private key stays in possession of… well, that's where we have a problem.

In theory, the design allows the private key to be in the user's sole possession. That's how it ideally should be, though it could be initially made optional to help newcomers adapt.

In practice however, [as of mid-2023](https://github.com/mastodon/mastodon/discussions/22315), Mastodon holds all of its inhabitants' private keys as well. The specified reason for this is that no reliable path so far was found around shoddy checks (same-server rather than same-account) in other implementations used in the wild.

This allows server administrators to post on behalf of their users.  
Consequently, one workaround for the issue is hosting your own instance and being your own administrator.

One horror story circling the network is [an FBI raid of Kolektiva](https://kolektiva.social/@admin/110637031574056150) where the unencrypted database presumably ended up in the hands of the FBI, including the signing keys. And yup, the signing keys of everyone there are pretty much in possession of the FBI. Not necessarily ready for impersonation, but pretty close. If any implementations do not double-check incoming content against the origin, they should. [Mastodon, to my knowledge, **does**.](https://github.com/mastodon/mastodon/blob/71db616fed817893d0efa363f0e7dbfcf23866a0/app/lib/activitypub/activity.rb#L114)

Make no mistake, I consider this a serious issue.  
But it's not with the protocol and doesn't justify inventing another protocol.
