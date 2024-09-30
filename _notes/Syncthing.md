---
---

Syncthing is possibly the greatest file synchronization app currently in existence. I'm not exaggerating and will happily elaborate.

It's free, has no accounts (each device generates a key for itself) and, unlike most "cloud sync" services that *store* your data (and may read it "for analytics, ad targeting and possibly training AIs") and keep pressuring you into purchasing more space, Syncthing's servers are only responsible for establishing *communication* between your devices, allowing you to use however much space you have.

Devices also try to establish a direct line of communication over local networks, so synchronization speeds aren't limited by your <abbr title="internet service provider">ISP</abbr> when participating devices see each other directly. So a shared Wi-Fi hotspot or another kind of network even *without internet* is enough for synchronization to happen.

It works on many platforms, interfaces on each are done in slightly different ways. But the basics are the same in all of them, as underneath them all is the same core Syncthing code.

## Notable features

- Synchronization of any number of folders anywhere on the system
- A send-only or receive-only folder for file *transfers*, rather than synchronization
- Conflict detection: when one and the same file are modified from two (or more) different devices seemingly independently, Syncthing places a conflicting version from another device next to it with a slightly different name; and this is replicated across devices as part of normal synchronization process
- Several strategies for file versioning
- (Beta, potentially unstable) Synchronization to untrusted devices with password encryption: devices marked as untrusted will only synchronize versions of the files *encrypted* with the specified password and thus won't see their actual contents

## Downsides

- Especially aggressive firewalls may block Syncthing's communication

## References

- [Project Website](https://syncthing.net/)
- [Nikita Prokopov: Computers as I used to love them](https://tonsky.me/blog/syncthing/), where Dropbox is completely and utterly destroyed by Syncthing from the UX and capability perspective