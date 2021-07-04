---
title: Self-hosting
featured: true
---

The practice of avoiding cloud services in favor of services hosted by individuals, typically available in person. These services are usually (but not always) based on open-source projects and are usually pursued due to them being much more privacy-friendly. "Self" normally refers to oneself, but it's fairly common to defer the hosting to someone you know.

[[TOPUBLISH]] I'm considering open-sourcing the configurations I use once they become mature enough to actually recommend. Not before I arrange automated backups and automatic updates. I do have some essentials though: properly secured installations available via domain names through HTTPS with publicly trusted certificates by Let's Encrypt.

## I currently run

* [Nextcloud](https://nextcloud.com/), with a whole bunch of services inside:
  * File sync (core) replaces the likes of Dropbox and Google Drive, including sharing both with accounts on the same server and, if necessary, with the general public.
    * Also replicates my [[KeePass]] database.
  * Deck hosts kanban-like boards like Trello, although as I was moving my data, I somehow found myself using it instead of Google Keep. Plus, it allows exporting of cards with a due date set as tasks that need to be done. More on that later.
  * Phone sync uploads SMS messages from my smartphone for browsing/searching on desktop/laptop.
  * Contacts provide a nice editing experience in the browser with a proper keyboard.
  * Calendar displays the events, which include contact birthdays and Deck cards' due dates, neatly aggregating multiple sources into a single view.
  * [OnlyOffice](https://www.onlyoffice.com/) Community is effectively self-hosted Google Docs. It's surprisingly feature-rich for an open-source solution, supporting live collaborative editing of files hosted in Nextcloud, complete with restrictions controlled in Nextcloud.
* [Grocy](https://grocy.info), which I'm only learning to use right now for managing my meals and grocery shopping.
  * To read: [Intro to Grocy (Reddit)](https://www.reddit.com/r/grocy/comments/iz949b/intro_to_grocy_read_if_youre_new_to_grocy/).
* [Calibre-Web](https://github.com/janeczku/calibre-web) for convenient (OPDS and web) access to a rather vast library of books I've accumulated over the years.
* [Home Assistant](https://www.home-assistant.io/) for [[home automation]]
  * Grocy is currently managed by its supervisor.
* [Nginx Proxy Manager](https://nginxproxymanager.com/) is almost as simple as it gets for exposing services from home via HTTPS.
  * [[Security advice]] Mind you, the services still have to be secure by themselves! HTTPS only makes sure the traffic to these services is not intercepted or tampered with. Yes, even for services only on the local network: VPN may be causing a device to accidentally connect to something else (if a malicious DNS server decides to have an imagination), and without it having to prove that it's *your* service, that device may accidentally leak your internal credentials. Which aren't very useful by themselves, but are a significant stepping stone for a larger attack.
* [Rhasspy](https://rhasspy.readthedocs.io) — my voice assistant of choice. I'm not entirely comfortable about keeping an always-on microphone accessible to a very loosely defined list of third parties, which seem to be most popular solutions today due to their ease of use, so I resorted to this DIYish alternative, and found tinkering with it to bring *loads of fun*.
* [Funkwhale](https://funkwhale.audio/) for Spotify-ish access to music my collection with the browser and using mobile apps, both native and Subsonic-compatible.
	* **Ultrasonic** (for Android, via [F-Droid](https://f-droid.org/en/packages/org.moire.ultrasonic/) or [Google Play](https://play.google.com/store/apps/details?id=org.moire.ultrasonic)) manages a subset of my music collection in a designated amount of space without copying the entire thing, transparently fetching missing tracks when they're needed and purging "oldest listened" when it runs out of space.
	* I do not currently use any of its federation features because I don't have anyone to federate with. But it might happen later.
	* Its ability to allow others to host their libraries is handy. An additional avenue for exploring new genres of music and artists. I have a few other users on my pod, and we have something like a community radio.
	* It does require music to be at least **somewhat** tagged (artist & title?). But other than just the name and the artist nothing else seems to be required for comfortable usage, many other fields, most notably album art, can be added later using the browser ([Picard](https://picard.musicbrainz.org/) is still handy for initial import though). _([[TODO]] Using Picard took some learning.)_

## I intend to run

* A largely self-sufficient development setup:
  * [Gitea](https://gitea.io/) for keeping Git repositories without the server breaking a sweat (like it would with GitLab running alongside the rest).
  * [Drone CI](https://www.drone.io/) for running builds or tests in Gitea repos. May consider Jenkins, but it's unlikely.
  * Image/package registries maybe? Not very likely to prove useful as a running system has no use for these, and I probably wouldn't attempt recovery or migration without access to upstream registries like Docker Hub.
* Something from the [[Fediverse]], like [Mastodon](https://joinmastodon.org/) or [Pleroma](https://pleroma.social/). Probably.
* [Network UPS Tools](https://networkupstools.org/) in order to expose my USB UPS to the local network, both to record power outages in Home Assistant and let other devices, like my <abbr title="Network Attached Storage">NAS</abbr>, know to protect against data loss by going into self-protection mode (not shutting down completely, but dumping all caches and ceasing all access to the spinning drives in order to safely restart even if power actually goes out).
* [NocoDB](https://www.nocodb.com/) — as a simple data provider and editor for some of my smart home components. Think Google Spreadsheet, but on top of a relational database and with a simple API. I gave it a whirl on one of my machines and found it... serviceable. A little rough around the edges, and its README straight up **lies** about the feature set, but what's already there is enough for my uses.

## I tried and rejected

* [Navidrome](https://www.navidrome.org/) for Spotify-ish access to my music collection, which I would often prefer to stream rather than download and sync, since I update it frequently, but usually listen at home.
	* It's not for me. I respect its laser focus on being simple and lightweight, but when I can't even upload music to it with its own facilities, I'm not inspired by upcoming maintenance. Plus, it requires music to be correctly and fully tagged from the get-go.
* [GitLab](https://about.gitlab.com/) — too damned heavy for hosting at home. As much as I love Ruby on Rails (which GitLab is based on) for being easy to pick up and decently easy to extend, I have to admit that its resource consumption is more in the realm of enterprises, not home users.
* [Misskey](https://misskey.io) — its Docker image was just dead, complaining about a missing file that was not mentioned in documentation anywhere, so I didn't bother.
* [HedgeDoc](https://hedgedoc.org/) — while its Markdown capabilities **are** cool, it's very clearly a tool for teams/companies, not individuals. _Nextcloud Notes_ tend to be a sufficient alternative most of the time.

---

This should not be considered a complete list.
