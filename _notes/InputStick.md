---
---

[InputStick](http://inputstick.com/) is a USB input device emulator that receives commands over Bluetooth from mobile devices. It nicely complements password managers on smartphones such as [[KeePass|KeePassDX (Android)]], making them into viable hardware credential managers, as long as you trust your smartphone.

### Usage

Apart from self-protection through encryption of the Bluetooth connection and password protection against other Bluetooth devices taking control of whatever the InputStick is plugged into, it does not come with any advanced authentication and key management features. It's just a mouse + keyboard with programmatic control.

Probably the handiest part of it is the use of standard USB HID protocol, meaning it does not require drivers in pretty much all environments that support USB input.

* This includes pre-boot environments, which are usually very limited with respect for where they can access data from, lacking even a clipboard with copy/paste operations.
* And OS installers & recovery environments, that often do have clipboards, but feature little to no potential data sources to copy *from*.

This makes InputStick a very handy tool for PC maintenance.

One of the simplest usage patterns with this device is using it as a "paste destination" on a different device, allowing you to copy text on one device and to paste it into the other.

### Downsides

At the time of writing, it does have a few downsides:

* Issues with recent Android versions. The device management utility works just fine, but USB Remote is very prone to failure, particularly with access to the clipboard. This, however, can be worked around, since the control API is open.
* Hardware and accompanying software are not open-source.
  * The device is simple enough that a DIY alternative is certainly possible, but it requires effort that the developer behind this project has already put in. And the control app does not have/request access to the internet, which eliminates the possibility of practically all remote attacks.
