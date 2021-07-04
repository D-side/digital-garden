---
---

## TODO fatigue

There may be a better term for this, but it refers to the type of fatigue that arises from frequently remembering items you *should* do, but *haven't*. To tackle mine, I started to introduce tiers of tasks. I'm listing these in order of introduction as time went on:

### Tier 0: N-minute rule

The exact value for N may vary by individual, commonly 2 to 10, but it's a practice of getting small enough tasks done as they show up without involving any of the organization techniques, because involving those requires effort comparable to the amount required to do the task itself.

This tier usually forms naturally and unconsciously during childhood, but it's useful to acknowledge it and set its scope more firmly.

### Tier 1: in-memory

A person may initially have a small enough number of tasks to remember everything.

It's very easy to miss the moment when memory alone is no longer sufficient or as effective as other means of tracking chores and other tasks. Past that moment TODOs turn into stressors.

This tier, like the previous one, forms naturally.

### Tier 3: archive

Yes, 3. I'll get to why in a bit. But this is the first tier that has to be constructed _artificially_.

Most means of external storage tend to be substantially more reliable than our minds. Our minds are known to distort ideas far enough in the past, and aren't great with moments in time.

So **before** the amount of tasks gets overwhelming (**not *when*** it happens!) it's a good idea to set up some means of external storage to write things down. Tasks that are written down tend to show up from the depths of memory a lot less often, out of confidence they're there somewhere and aren't forgotten, which makes them much weaker stressors.

My opinion is that digital mediums by far exceed everything physical (like notebooks, paper planners, etc.) in terms of capability, because digital media are, usually:

* Easier to replicate, to the point of automation, making it easier to keep accessible in every situation, at least to jot down something new as it appears
* Richer in content, e. g. can have links to relevant sources of information right beside, and can have pictures (although I haven't had any use for that)
* Can be searched through much more effectively (machines are much better at that), and thanks to that can have significantly more structure without becoming unwieldy (to a point though)
  * It **is** possible to replicate the structure in physical mediums to some extent, techniques like Zettelkasten and Bullet Journal are some of the well-known examples, but it requires firm discipline (because it involves keeping some redundancy by hand) and/or significant amount of physical space which isn't always available in the modern world

Writing down tasks at this stage can be a form of a stress reliever, but depending on at what stage the process was started, might make even well-structured lists so big that they become hard to navigate.

I've previously used [Google Keep](https://keep.google.com) for this purpose, but as I started moving towards the practice of [[self hosting]], I've started using [Nextcloud Deck](https://apps.nextcloud.com/apps/deck) instead.

### Tier 2: agenda

When the main external storage has become too big to navigate effectively, it might make sense to introduce another tier of external storage, most likely as a buffer between the head and the current "large" external storage. Some introduce separate "inbox" (for unrefined tasks/ideas) and "outbox" (for tasks to do in the near future), I combine them.

In my case it's a simple checklist that I put on my smartphone's desktop in order to see it frequently and access with a single tap, and a weekly routine to renew it, putting the tasks that are too far out or too infrequent — into the archive, and pulling tasks that are approaching their due date or that I have some spare time for — out into the agenda.

I have previously tried deriving the agenda from the archive programmatically, but none of the approaches worked reliably for me to actually pay attention to the agenda, it just seemed too random at all times. So I resorted to building it by hand.

## Enterprise data storage?

This tier list is very reminiscent of enterprise storage solutions, which, to remain effective, have to evolve as the volume of data they store increases.

* As the organization is born, it usually doesn't exist yet
* As the organization grows beyond one person, some means of **coordination** are usually introduced
* Means of coordination are often turned into software that does a part of the job, backed by a single database
* As the main database grows, it usually becomes rather hard to maintain and evolve, at which point it may be a good idea to split off parts of it into other kinds of storage, although this can happen in several different ways:
  * "Hot" out: the main database can keep storing canonical data and confirm or deny incoming changes, but a separate "read layer" of "hotter" storage can be built on top of it to make the data easier to search or analyze without bothering the main database too much (which is what I did for my TODO lists)
  * "Cold" out: some canonical data that's accessed less frequently than the rest can be offloaded into "colder" storage that's longer to access, but cheaper on the resources (this might not make much sense in scope of TODOs, as this would likely be the process for TODOs that are **done**, but most of them need not be kept _at all_, but it might still happen, I dunno)
  * Separation of concerns: a subset of canonical data linked to a certain domain may be moved into another medium that can process it more effectively, if it's only loosely related to the rest of the data in the main database, or if its structure calls for another solution (e. g. schemaless for changing structures that the main database is bad at adapting to, distributed write-heavy databases for dense streams of data that the main database has trouble handling while maintaining consistency)

---

> [[Mental health]]
