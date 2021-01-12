---
---

"Not trusting third parties with unencrypted data" in my mind includes parties that control the entire chain of software required to access it. Say, a company that both **stores** your passwords on its own servers (and can retrieve it at will) and distributes software that you use to **decrypt** it (so posesses the decryption key).

## Cloud password managers

So this, in my eyes, renders cloud password managers like LastPass and Bitwarden *inherently insecure*.

To be fair, even if they don't keep their promises, they are still a major step up in security compared to not having one, as it's very easy to a human being to slip into **reusing passwords**, which opens them up to attacks not just by the owner of their password manager, but waaaay more parties than that.

I recommend separating _storage_ and _access_ to parties that are vanishingly unlikely to cooperate to access your data.

You can use [[Syncthing]] to handle storage without any server storage at all, or your own instance of [[Nextcloud]] where server storage can be trusted. Just make sure that whatever software you use supports _conflict resolution_. Because this will be necessary. I myself recommend [[KeePass|KeePassXC]].

[[FAQ]] [[Security advice]]
