---
featured: true
---

[Fediverse](https://fediverse.party/) is a federated social network comprised of a number of different software projects interoperating through the use of [[ActivityPub]].

Compared to some of the more widely adopted social networks it is highly unusual:

* It's federated, which means that it runs off of a fleet of different servers owned by different parties.
  * This has interesting implications regarding **ownership and moderation**: there is no central authority over pretty much anything, so every server's community decides on the rules all by itself.
    * This does possibly result in some duplicate moderation work being done on different servers, but because every server only processes its own content and subscriptions, that increase in moderation effort is not actually N² (where N is the number of posts being moderated) but significantly lower.
    * Of course, there are typically local laws that mandate what kind of content can be publicly hosted. And while big social networks have to adhere to policies throughout the world, looking for a common denominator and very reluctantly introducing region-specific rules; Fediverse communities' jurisdictions are very clearly defined.
  * It touts itself as **"censorship-free"**. This is as true as it probably technically can be: there are no global rules since everyone gets to choose where their content is originally hosted. However, others may choose to stop receiving it if they consider it inappropriate. The scope of such "stops" can span from individual accounts to entire communities.
    * I have seen someone accuse [Gargron (maintainer of Mastodon)](https://mastodon.social/@Gargron) of censorship on "his network". I'm not sure they were trying to badmouth the network or genuinely didn't understand how it works.
    * "As true as it can be" in a sense that it's possible to create an environment where nobody dictates to you what content is appropriate, but you don't get to push your content to recipients that aren't willing to get it.
    * When [Bryan Lunduke suggested publishing his Twitter banlist](https://www.youtube.com/watch?v=mZrlEulss6Q&t=10m25s) I started to wonder what implications would such "crowdsourced moderation" have with proper support from the platform. Well, in Fediverse there is really no other way to do it without compromising the independence of federation's participants.
      * Although, interestingly, Google did try to make its own push for "centralized moderation" by [threatening to force Fediverse clients out of its store](https://qoto.org/@freemo/104765288863293481) on grounds of them allegedly "promoting violence" (in reality, for not taking an active stance against it).
  * Of course, compatibility is a little complicated. Seems to be working most of the time though.
* It's powered by **different software projects that support different kinds of posts** (e. g. PeerTube handles video, Mastodon handles microblogging, PixelFed handles pictures), but thanks to [[ActivityPub]] handling subscriptions, users in any of them can follow the users of any other.
  * Ever tried following an Instagram account on Twitter? That is roughly what can happen on Fediverse.
  * The list of supporting servers is open! Technically, if a mainstream social network ever decided to support [[ActivityPub]], they could just go ahead and do it. Then their users would be able to subscribe to users of the Fediverse and vice versa. And who knows, maybe [EU's Digital Markets Act](https://ec.europa.eu/info/strategy/priorities-2019-2024/europe-fit-digital-age/digital-markets-act-ensuring-fair-and-open-digital-markets_en) might compel some of them to begin?
