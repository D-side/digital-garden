---
title: Self-hosting
---

The practice of avoiding cloud services in favor of services hosted by individuals, typically available in person. These services are usually (but not always) based on open-source projects and are usually pursued due to them being much more privacy-friendly.

[[TOPUBLISH]] I'm considering open-sourcing the configurations I use once they become mature enough to actually recommend. Not before I arrange automated backups and automatic updates. I do have some essentials though: properly secured installations available via domain names through HTTPS with publicly trusted certificates by Let's Encrypt.

These are the services I currently run:

* [Nextcloud](https://nextcloud.com/), with a whole bunch of services inside:
  * File sync (core) replaces the likes of Dropbox and Google Drive, including sharing both with accounts on the same server and, if necessary, with the general public.
    * Also replicates my [[KeePass]] database.
  * Deck hosts kanban-like boards like Trello, although as I was moving my data, I somehow found myself using it instead of Google Keep. Plus, it allows exporting of cards with a due date set as tasks that need to be done. More on that later.
  * Phone sync uploads SMS messages from my smartphone for browsing/searching on desktop/laptop.
  * Contacts provide a nice editing experience in the browser with a proper keyboard.
  * Calendar displays the events, which include contact birthdays and Deck cards' due dates, neatly aggregating multiple sources into a single view.
  * OnlyOffice Community is effectively self-hosted Google Docs. It's surprisingly feature-rich for an open-source solution, supporting live collaborative editing of files hosted in Nextcloud.
* [Grocy](https://grocy.info), which I'm only learning to use right now for managing my meals and grocery shopping.
  * To read: [Intro to Grocy (Reddit)](https://www.reddit.com/r/grocy/comments/iz949b/intro_to_grocy_read_if_youre_new_to_grocy/).
* [Calibre-Web](https://github.com/janeczku/calibre-web) for convenient (OPDS and web) access to a rather vast library of books I've accumulated over the years.
* [Home Assistant](https://www.home-assistant.io/) for [[home automation]]
