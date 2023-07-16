---
title: KeePass
---

KeePass is a piece of software for password management, which is not very interesting by itself, but its successors *very much* are. It can handle passwords, two-factor authentication, SSH keys, file attachments and pretty much any data where you only want to access one individual entry at a time.

## KeePassXC (desktop)

[Project website](https://keepassxc.org/) | [Manual](https://keepassxc.org/docs/KeePassXC_UserGuide.html)

The main powerhouse of KeePass database management. It opens KeePass databases, allows protected access to data therein and provides a few operations for database files such as merging.

### Browser integration

It has an accompanying browser extension for major browsers that allows automatic use of credentials on websites, rendering in-browser password management... obsolete? And I've never felt comfortable about my password vault being handled by servers outside of my control, which is the convenient solution that major browsers keep suggesting.

### Organization

A particularly handy chunk of features is around *presentation* of your database of credentials. Entries can be grouped into folders and subfolders of any nesting level, icons allow for quick visual [[grepping]], and of course there's search. Icons can also be downloaded for respective URLs automatically, although that bit doesn't always work, and using DuckDuckGo for this (disabled in settings by default) is slightly more reliable.

### Two-factor authentication

It handles two-factor authentication based on time-based one-time passwords (TOTP).

[[Security advice]] One could argue that this defeats the purpose of two-factor authentication, when passwords are stored alongside TOTP.

While I agree, I still consider this a major improvement over just password: it still prevents most attacks based on credential reuse because of TOTP changing over time, adds to complexity of passwords making even rather simple passwords much more robust. Plus, just the use of password manager on its own makes maintaining of **unique** passwords across services markedly easier. The impact that "true 2FA" brings to the table is negligible compared to using a password manager that also handles 2FA.

That said, there are a few accounts where I still use "true 2FA", where a secret is actually stored in a separate place which is not directly connected to where I input the code. I log into these accounts so rarely that I can go through the trouble of obtaining the secret from another place.

### Not just passwords

In addition to service addresses, usernames and passwords, it allows storage of other kinds of information.

#### Notes

Basically anything that is still intended for you to read, but doesn't seem to fit into the main fields.

#### Files

They are embedded into the database and share its encryption scheme, so you probably don't want to keep files that you frequently change in there. Keys are usually a good candidate. Sensitive documents are probably alright as well.

#### Attributes

These are typically machine-readable and provide additional capabilities to core KeePass features without breaking the format. What doesn't support particular attributes just ignores them, or allows reading them manually if you can make sense of the values. [2FA](#two-factor-authentication) stores data in an `otp` attribute, allowing TOTP to be configured **in addition to** the password, which is usually how things actually work.

#### SSH keys


In a nutshell, SSH agents allow you to keep an SSH key **encrypted** on-disk without descrypting it (via entering a password) _on every use_, allowing instead to unlock the key once per system start and locking on-demand (e. g. when the system itself is locked).

KeePassXC can add and remove keys with an SSH agent running on a system whenever the respective KP database is unlocked or locked. It can do so in two ways:

* When the key is an external password-protected file located somewhere near the database, KeePass can unlock it using a password of the same entry.
* When the key is an [attachment](#files), it can even be kept unprotected, but can be protected too, in which case it will be unlocked using the password of the same entry.
  * [[Security advice]] I would generally recommend protecting the attachment anyway, even if the file doesn't normally leave the database. Because you may need to export it outside for use without an SSH agent, and rescinding decryption unconditionally is a drastic step down in security; even if you later password-protect the file, the unprotected version may stay on-disk indefinitely, even if no longer referenced by the file system. If you trust a system enough, you can strip protection manually afterwards, understanding the risks.

See also [[KeePassXC in WSL2]] for a story on getting it to work in an unusual environment.

### Limited responsibility

KeePassXC doesn't care where the file comes from. It does not handle synchronization. You can do that yourself in a way you prefer. See [[Secure cloud data]] on why that's a good thing.

But whatever file synchronization solution you use, you will eventually face a situation where you changed an old version of the file, and sync software gets a new version. Some software only presents you with a hard choice of keeping one version. Toss such software into the recycle bin until it stops doing that. Use software that places both copies on disk, allowing you to handle conflicts by yourself.

KeePassXC in particular features a "Merge databases" option in the "Database" menu which allows you to, well, merge databases.

This is possible **without losses** because of the rather clever file structure, that generates unique IDs for each entry, only shows the latest revision for each, only stores a limited amount of revisions (so that the database doesn't get bloated) and deletes entries by putting them into the recycle bin (the concept of recycle bin isn't very useful for my files, because most of the files I work with are under version control anyway, but for KeePass entries you never know! and they don't take up much space anyway).

## KeePassDX (Android)

Also opens KeePass databases and allows access to data therein, but has a slightly different feature set.

It displays default icons differently (fixable in settings) and cannot download custom ones (but can display) and doesn't have SSH agent integration. However, it does have form autofill, allowing you to sign in not just into websites, but into apps as well.

It _does_ support attachments, TOTP and can restrict access to the database with Android's built-in security facilities, like [[Biometric authentication|fingerprint readers or face unlock]], so that you don't have to input the password every time.
