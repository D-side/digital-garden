---
title: Self-hosting
featured: true
---

The practice of avoiding cloud services in favor of services hosted by individuals, typically available in person. These services are usually (but not always) based on open-source projects and are usually pursued due to them being much more privacy-friendly. "Self" normally refers to oneself, but it's fairly common to defer the hosting to someone you know.

[[TOPUBLISH]] I'm considering open-sourcing the configurations I use once they become mature enough to actually recommend. Not before I arrange automated backups and automatic updates. I do have some essentials though: properly secured installations available via domain names through HTTPS with publicly trusted certificates by Let's Encrypt.

## I currently run

* [Calibre-Web](https://github.com/janeczku/calibre-web) for convenient (OPDS and web) access to a rather vast library of books I've accumulated over the years.
* [Forgejo](https://forgejo.org/) for keeping Git repositories without the server breaking a sweat (like it would with GitLab running alongside the rest). It was previously running Gitea, but after what the community saw as a potential commercial takeover Forgejo sprung up from the owner of probably the biggest installation of (back then) Gitea — [Codeberg](https://codeberg.org/).
* [Home Assistant](https://www.home-assistant.io/) for [[home automation]].
* [Kiwix (kiwix-serve, more specifically)](https://kiwix.org/en/) with mirrors of a bunch of major knowledge repositories — was launched in a panic move when continued access to the internet was no longer a certainty. But it stuck. And during outages it still serves as a nice supplementary source of reading material. _Absolutely_ excessive, but still lovely.
* [Matrix](https://matrix.org/) server, Synapse, for real-time messaging.
  * Having anyone on your server in a public room with hundreds of participants is really asking for trouble, but for private communications it's been all right.
* [Nextcloud](https://nextcloud.com/), with a whole bunch of services inside:
  * File sync (core) replaces the likes of Dropbox and Google Drive, including sharing both with accounts on the same server and, if necessary, with the general public.
  * Deck hosts kanban-like boards like Trello, although as I was moving my data, I somehow found myself using it instead of Google Keep. Plus, it allows exporting of cards with a due date set as CalDAV tasks. More on that later.
  * Contacts provide a nice editing experience in the browser with a proper keyboard and CardDAV access to mobile devices.
  * Calendar stores events of its own as well as exposes events from other sources such as birthdays from contacts, all of those also over CalDAV.
  * Tasks mostly exposes Deck cards' due dates over CalDAV. Tasks themselves seem fine too, but so far there hasn't been enough of a reason to switch (other than maybe reducing the number of moving parts).
  * [OnlyOffice Community](https://www.onlyoffice.com/) is effectively self-hosted Google Docs. It's surprisingly feature-rich for an open-source solution, supporting live collaborative editing of files hosted in Nextcloud, complete with view/edit permissions controlled via Nextcloud.
* [Nginx Proxy Manager](https://nginxproxymanager.com/) is almost as simple as it gets for exposing services from home via HTTPS.
  * [[Security advice]] Mind you, the services still have to be secure by themselves! HTTPS only makes sure the traffic to these services is not intercepted or tampered with. Yes, even for services only on the local network: VPN may be causing a device to accidentally connect to something else (if a malicious DNS server decides to have an imagination), and without it having to prove that it's *your* service, that device may accidentally leak your internal credentials. Which aren't very useful by themselves, but are a significant stepping stone for a larger attack.
* [[Node-RED]] stepped my automation game significantly at a point where I started finding Home Assistant's automations rather unwieldy.
* [[Syncthing]] — an always-online file synchronization node aimed at minimizing conflicts between devices that go online intermittently.

## I intend to run

* [Drone CI](https://www.drone.io/) for running builds or tests in Gitea repos. Possibly a fork, [Woodpecker CI](https://woodpecker-ci.org/), since Drone took a turn for a much less permissive license  after 0.x versions, and its community continued further development at Woodpecker.
  * Maybe not anymore, now that [Forgejo Actions](https://forgejo.org/docs/latest/admin/actions/) exist.
* Image/package registries maybe? Not very likely to prove useful as a running system has no use for these, and I probably wouldn't attempt recovery or migration without access to upstream registries like Docker Hub.
  * Forgejo once again might save the day with this one with its [Package Registry support](https://forgejo.org/docs/latest/user/packages/)
* A blogging platform within [[Fediverse]], though not sure which one:
  * [Mastodon](https://joinmastodon.org/) — most mature, but unreasonably heavy
  * [Akkoma](https://akkoma.social/) — somewhat lightweight, and issues with "database rot" of its predecessor, Pleroma, appear to be solved
  * [GoToSocial](https://gotosocial.org/) — very lightweight, with rather fast-paced development among peers, but some very unusual interpretations of ActivityPub's semantics (e. g. not showing unlisted posts at direct links to them)
* [Network UPS Tools](https://networkupstools.org/) in order to expose my USB UPS to the local network, both to record power outages in Home Assistant and let other devices, like my <abbr title="Network Attached Storage">NAS</abbr>, know to protect against data loss by going into self-protection mode (not shutting down completely, but dumping all caches and ceasing all access to the spinning drives in order to safely restart even if power actually goes out).
* [Navidrome](https://www.navidrome.org/) for Spotify-ish access to my music collection, which I would often prefer to stream rather than download and sync, since I update it frequently, but usually listen at home.
  * It used to be in the "abandoned" section, but it has since improved quite a bit. My main complaint was overreliance on metadata within music files, but I've since come to realize that faulty metadata causes a whole bunch of additional inconveniences. So maybe it was onto something!

## I tried but abandoned

* [Funkwhale](https://funkwhale.audio/) for steamable access to my music collection with the browser and using mobile apps, both native and Subsonic-compatible. I used it for a while but didn't feel any of the apps were stable enough to justify their use compared to downloading music for offline listening — the offline player I use is just so much better. So I shut Funkwhale down with no replacement.
	* **Ultrasonic** (for Android, via [F-Droid](https://f-droid.org/en/packages/org.moire.ultrasonic/) or [Google Play](https://play.google.com/store/apps/details?id=org.moire.ultrasonic)) managed a subset of my music collection in a designated amount of space without copying the entire thing, transparently fetching missing tracks when they're needed and purging "oldest listened" when it runs out of space.
	* It does require music to be at least **somewhat** tagged (artist & title?). But other than just the name and the artist nothing else seems to be required for comfortable usage, many other fields, most notably album art, can be added later using the browser ([Picard](https://picard.musicbrainz.org/) is still handy for initial import though).
	* Since the rise of Spotify and other streaming services I often hear the argument that you can't get music as files anymore for solutions like this and have to resort to piracy. That's not true. I purchase music on **Bandcamp** and, perhaps surprisingly, on **Steam** (almost exclusively game soundtracks, but that's the majority of my music library, I can't complain), both of these provide music as files. Selection is more limited, sure, but I'm getting enough.
* [HedgeDoc](https://hedgedoc.org/) — while its Markdown capabilities **are** cool, it's very clearly a tool for IT teams/companies, not everyday use by individuals. [Nextcloud Text](https://github.com/nextcloud/text) is a sufficient alternative most of the time, and LaTeX lovers would be better served by [Overleaf](https://www.overleaf.com/).
* [GitLab](https://about.gitlab.com/) — too damned heavy for hosting at home. As much as I love Ruby on Rails (which GitLab is based on) for being easy to pick up and decently easy to extend, I have to admit that its resource consumption is more in the realm of enterprises, not home users.
* [Grocy](https://grocy.info) — its usefulness is very limited for just one person. I'm still consdering its chore tracking feature, paired with a voice interface to announce due chores and marking completion hands-free, but there's no timeline for this.
  * To read: [Intro to Grocy (Reddit)](https://www.reddit.com/r/grocy/comments/iz949b/intro_to_grocy_read_if_youre_new_to_grocy/).
- [Jellyfin](https://jellyfin.org/) for providing an interface to my video library and for tracking playback progress. Honestly, it's not bad, I just didn't use it much. It easily pulls in a lot of supplementary data about what I have, which I found fun initially, but never actually made use of. And on the clients I've always had to fight different sets of formats supported between devices, sometimes ending up with no sound, stuttery playback or nothing at all. The machine I run it on is unfortunately not powerful enough for live transcoding and I cannot be bothered to get a bigger one for that purpose.
  - Replaced with just DLNA and a Samba share for the local network — lighter and perfectly enough for my needs.
* [Misskey](https://misskey.io) for joining the [[Fediverse]]; its Docker image was just dead, complaining about a missing file that was not mentioned in documentation anywhere, so I didn't bother. And I had to keep rewriting this section because its forks just kept dying. One recent fork I've been hearing about recently is Sharkey, here's hoping that it lasts.
* [Rhasspy](https://rhasspy.readthedocs.io) — my voice assistant of choice. I'm not entirely comfortable about keeping an always-on microphone accessible to a very loosely defined list of third parties, which seem to be most popular solutions today due to their ease of use, so I resorted to this DIYish alternative, and found tinkering with it to bring *loads of fun*.
  * The machine I set this up on unfortunately died back in 2024, and while the hardware has been since fixed, rearrangement of the host environment due to an OS swap left Rhasspy behind. And it might just no longer be the nicest option, seeing that Nabu Casa hired its author and has been hard at work on voice control within Home Assistant, which has amassed a lot of voice processing utilities over the years.

---

This is not a complete list.
