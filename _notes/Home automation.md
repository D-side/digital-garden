---
featured: true
---

Most of the time home automation involves the use of computer-controlled hardware to do things around the house. How exactly this control happens is entirely up to the user.

As small as my apartment may be, I still find things to automate in there. And in the process I usually end up enhancing the capabilities of the hardware that I own.

I also try to maintain the capabilities of "dumb hardware" in case some of the "smart" hardware goes offline and turns "dumb". As such, anything that requires an internet connection to function is a no-go. I [[Self hosting|self-host]] as much as I can.

My apartment is controlled by [Home Assistant](https://home-assistant.io/).

---

Also, I have to say I dislike the use of the term "smart" when it comes to electronics for the smart home. A device doesn't have to be smart, it just needs a digital interface that something **actually** smart can connect to, which is usually the control plane.

---

# Hardware

*[[TODO]]: ~~list some hardware I'm using and how I set it up~~ that's a good start, keep going*

## Router

Practically all communication goes through it, so it deserves being first on this list. Having experienced a bunch of models I have finally settled on **Mikrotik hAP ac²**.

As far as consumer routers go, this one is a bit unusual because it doesn't seem to offer high-level configuration, practically **forcing** you to learn a bit about the ins and outs of computer networking. I already had bits and pieces of knowledge, but had to quickly plug a few gaps I had.

What's great about its OS is that is operates largely on network-level rather than user-level concepts. While this makes everyday goals harder to accomplish (though that's a stretch, I do not reconfigure my router every day obviously), it doesn't really need a manual for itself, understanding the underlying concepts is enough to produce what you need.

The core capabilities required of the router to drive a home automation system, aside from its primary purpose of driving the network, is the ability to forward external ports 443 and 80 to [the hub](#Hub), attaching static IP addresses to certain devices (should be unnecessary, but makes things easier) and preventing some of the devices on the network from reaching out to the internet (aka "phoning home, be it for the purpose of obtaining updates or establishing a control mechanism using the vendor's mobile app, it's designed to make the devices more accessible, but puts a lot of trust on the vendor).

💡 I intend to conduct an experiment and transfer the Wi-Fi-enabled peripherals from the main router to a hotspot running on the hub. Curious whether this'll make things more stable.

## Hub

I run the controlling software on an Intel NUC. It just seemed to be the right combination of versatility (x64, quite a bit of RAM, SATA and M.2) and size (it's tiny!). It's essentially my "personal data center".

## Light bulbs

"Xiaomi"ish Yeelight bulbs: RGBW in the living room, W everywhere else. Most of them are hooked up to motion sensors and shut off automatically when the system thinks they're no longer needed. Tuning this to root out the false positives took a while.

When on, they automatically adjust their light temperatures throughout the day using [Circadian Lighting](https://github.com/claytonjn/hass-circadian_lighting) integration.

And I'm not perfectly satisfied by their stability. Every once in a while some of them become "unavailable" and require a power cycle to show up again.

## Sensors

* ZigBee is in the process of transition
  * Aqara ZigBee<->Wi-Fi hub — phasing out because it's unnecessary and may be a danger to the network
  * CC2531 stick — very limited in terms of number of devices, but does the job for now
    * Some devices actually offer more capabilities when connected in this way, e. g. Aqara cube reports not just the gesture, but also the **side** that the cube has landed on.

## Power

* Smart plugs
  * Anything compatible with tuya-convert will work nicely, e. g. I have a couple Blitzwolf sockets; for a little extra cost it's easy to get the models with power metering, which is handy for automations involving "dumb" devices
  * I've also used TP-Link Kasa smart socket with no issues
  * I've also used Xiaomi's ZigBee sockets — a massive **nope** from me, because they are designed for Chinese sockets (not European ones) and do not pass through the ground contact

## Thermal regulator

I have a piece of electric floor to supplement central heating in case there's an issue with it, and it can be somewhat helpful in drying of shoes. I was using a plain "dumb" regulator for a while, but at one point I shattered its LCD display with my bike; and instead of just replacing it I decided to go for an *upgrade* and use a Wi-Fi enabled model.

However, I ran into a problem.

I've been "unlucky" enough to integrate an NTC R<sub>25</sub>\=6.8kOhm thermistor into my floor thereby inadvertently vendor-locking myself to a local regulator manufacturer, because literally all other manufacturers I looked at use 10k, not 6.8k. NTCs by definition decrease in resistance as temperature increases, so having a lower resistance will result in higher-than-actual readings. How much higher? About 10 degrees Celsius. Quite a bit! Compensating for this in software may very well

💡 Thankfully, because the input for temperature is based on a **potential divider** out of external thermistor and a fixed value resistor (10kOhm from factory what feels like _everywhere_), I should be able to replace the resistor to make it compatible with my unfortunate setup.

There is an aftermarket firmware that divorces the device from the cloud, [WThermostatBeca](https://github.com/fashberg/WThermostatBeca).

## IR bridge

Remote controls on many devices are implemented through the use of commands modulated in infrared light. Such commands can be recorded and reproduced by various IR bridges, or "universal remotes".

I only really actively use one device in this way: a fan. The kind that pushes air around. But it's nice to not have to look for a remote every time.

Sadly, it has no feedback on, say, whether it's on. Although this can be added using a power-metering "smart plug". I haven't had any use for this yet, but I can see this becoming useful for a general "I'm going out" program that shuts off all unnecessary devices. For now I get by with doing this largely by hand. [[TODO]]

## Controlling the system

* Home Assistant itself comes with a highly customizable web UI and mobile apps.
* NFC stickers can be bound to ad-hoc actions and executed by scanning said tags with a smartphone.
* Aqara cube is attached to the most frequently used actions (lights mostly)
