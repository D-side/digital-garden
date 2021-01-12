---
title: Self-hosting
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
  * [[Security advice]] Mind you, the services still have to be secure by themselves! HTTPS only makes sure the traffic to these services is not intercepted or tampered with. Yes, even for services only on the local network: VPN may be causing a device to accidentally connect to something else (if a malicious DNS server decides to have an imagination), and without it having to prove that it's *your* service, that device may accidentally leak your internal credentials. Which aren't useful by themselves, but are a significant stepping stone for a larger attack.

## I intend to run

* A largely self-sufficient development setup:
  * [Gitea](https://gitea.io/) for keeping Git repositories without the server breaking a sweat (like it would with GitLab running alongside the rest).
  * [Drone CI](https://www.drone.io/) for running builds or tests in Gitea repos. May consider Jenkins, but it's unlikely.
  * Image/package registries maybe? Not very likely to prove useful as a running system has no use for these, and I probably wouldn't attempt recovery or migration without access to upstream registries like Docker Hub.
* [Navidrome](https://www.navidrome.org/) for Spotify-ish access to my music collection, which I would often prefer to stream rather than download and sync, since I update it frequently, but usually listen at home.
* Something from the [[Fediverse]], like [Mastodon](https://joinmastodon.org/) or [Pleroma](https://pleroma.social/).
* [Network UPS Tools](https://networkupstools.org/) in order to expose my USB UPS to the network, both to record power outages in Home Assistant and let other devices, like my <abbr title="Network Attached Storage">NAS</abbr>, know to protect against data loss.

There are a few things I didn't mention here.
