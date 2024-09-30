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
* [Nextcloud](https://nextcloud.com/), with a whole bunch of services inside:
  * File sync (core) replaces the likes of Dropbox and Google Drive, including sharing both with accounts on the same server and, if necessary, with the general public.
    * Also replicates my [[KeePass]] database.
  * Deck hosts kanban-like boards like Trello, although as I was moving my data, I somehow found myself using it instead of Google Keep. Plus, it allows exporting of cards with a due date set as tasks that need to be done. More on that later.
  * Contacts provide a nice editing experience in the browser with a proper keyboard.
  * Calendar displays the events, which include contact birthdays and Deck cards' due dates, neatly aggregating multiple sources into a single view.
  * [OnlyOffice Community](https://www.onlyoffice.com/) is effectively self-hosted Google Docs. It's surprisingly feature-rich for an open-source solution, supporting live collaborative editing of files hosted in Nextcloud, complete with view/edit permissions controlled via Nextcloud.
* [Nginx Proxy Manager](https://nginxproxymanager.com/) is almost as simple as it gets for exposing services from home via HTTPS.
  * [[Security advice]] Mind you, the services still have to be secure by themselves! HTTPS only makes sure the traffic to these services is not intercepted or tampered with. Yes, even for services only on the local network: VPN may be causing a device to accidentally connect to something else (if a malicious DNS server decides to have an imagination), and without it having to prove that it's *your* service, that device may accidentally leak your internal credentials. Which aren't very useful by themselves, but are a significant stepping stone for a larger attack.
* [[Node-RED]] stepped my automation game significantly at a point where I started finding Home Assistant's automations rather unwieldy.
* [[Syncthing]] — an always-online file synchronization node aimed at minimizing conflicts between devices that go online intermittently.
* [Rhasspy](https://rhasspy.readthedocs.io) — my voice assistant of choice. I'm not entirely comfortable about keeping an always-on microphone accessible to a very loosely defined list of third parties, which seem to be most popular solutions today due to their ease of use, so I resorted to this DIYish alternative, and found tinkering with it to bring *loads of fun*.

## I intend to run

* [Drone CI](https://www.drone.io/) for running builds or tests in Gitea repos. Possibly a fork, [Woodpecker CI](https://woodpecker-ci.org/), since Drone took a turn for a much less permissive license  after 0.x versions, and that's where the community continued further development.
* Image/package registries maybe? Not very likely to prove useful as a running system has no use for these, and I probably wouldn't attempt recovery or migration without access to upstream registries like Docker Hub.
* Something from the [[Fediverse]], like [Mastodon](https://joinmastodon.org/) or [Akkoma](https://akkoma.social/). Probably.
* [Network UPS Tools](https://networkupstools.org/) in order to expose my USB UPS to the local network, both to record power outages in Home Assistant and let other devices, like my <abbr title="Network Attached Storage">NAS</abbr>, know to protect against data loss by going into self-protection mode (not shutting down completely, but dumping all caches and ceasing all access to the spinning drives in order to safely restart even if power actually goes out).

## I tried but abandoned

* [Funkwhale](https://funkwhale.audio/) for Spotify-ish access to music my collection with the browser and using mobile apps, both native and Subsonic-compatible. I used it for a while but didn't feel any of the apps were stable enough to justify their use compared to downloading music for offline listening — the offline player I use is just so much better. So I shut Funkwhale down with no replacement.
	* **Ultrasonic** (for Android, via [F-Droid](https://f-droid.org/en/packages/org.moire.ultrasonic/) or [Google Play](https://play.google.com/store/apps/details?id=org.moire.ultrasonic)) managed a subset of my music collection in a designated amount of space without copying the entire thing, transparently fetching missing tracks when they're needed and purging "oldest listened" when it runs out of space.
	* It does require music to be at least **somewhat** tagged (artist & title?). But other than just the name and the artist nothing else seems to be required for comfortable usage, many other fields, most notably album art, can be added later using the browser ([Picard](https://picard.musicbrainz.org/) is still handy for initial import though).
* [HedgeDoc](https://hedgedoc.org/) — while its Markdown capabilities **are** cool, it's very clearly a tool for IT teams/companies, not everyday use by individuals. [Nextcloud Text](https://github.com/nextcloud/text) is a sufficient alternative most of the time, and LaTeX lovers would be better served by [Overleaf](https://www.overleaf.com/).
* [GitLab](https://about.gitlab.com/) — too damned heavy for hosting at home. As much as I love Ruby on Rails (which GitLab is based on) for being easy to pick up and decently easy to extend, I have to admit that its resource consumption is more in the realm of enterprises, not home users.
* [Grocy](https://grocy.info), the usefulness of which is very limited for just one person. I'm still consdering its chore tracking feature, paired with a voice interface to announce due chores and marking completion hands-free, but there's no timeline for this.
  * To read: [Intro to Grocy (Reddit)](https://www.reddit.com/r/grocy/comments/iz949b/intro_to_grocy_read_if_youre_new_to_grocy/).
- [Jellyfin](https://jellyfin.org/) for providing an interface to my video library and for tracking playback progress. Honestly, it's not bad, I just didn't use it much. It easily pulls in a lot of supplementary data about what I have, which I found fun initially, but never actually made use of. And on the clients I've always had to fight different sets of formats supported between devices, sometimes ending up with no sound, stuttery playback or nothing at all. The machine I run it on is unfortunately not powerful enough for live transcoding and I cannot be bothered to get a bigger one for that purpose.
  - It's still running, but the plan is in motion to replace it with just DLNA and Samba share for the local network — which is perfectly enough for my needs.
* [Misskey](https://misskey.io) for joining the [[Fediverse]]; its Docker image was just dead, complaining about a missing file that was not mentioned in documentation anywhere, so I didn't bother. I hear it's forked into a much more pleasant [Firefish](https://joinfirefish.org/) now, but I'm good where I'm at regarding social networking right now.
* [Navidrome](https://www.navidrome.org/) for Spotify-ish access to my music collection, which I would often prefer to stream rather than download and sync, since I update it frequently, but usually listen at home.
	* It's not for me. I respect its laser focus on being simple and lightweight, but when I can't even upload music to it with its own facilities, I'm not inspired by upcoming maintenance. Plus, it requires music to be correctly and fully tagged from the get-go.

---

This should not be considered a complete list.
