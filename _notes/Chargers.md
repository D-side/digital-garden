---
---

# Chargers

USB Type C and [[Power Delivery]] are probably the best thing to ever happen to the charging world. Although it did bring in compatibility complications, with these sorted **once** you can have a **compact** set of charging hardware for pretty much everything.

## Hardware suport

I focus on USB Type C support heavily. Thus, to make best use of the kit, you may have to focus your purchasing decisions on hardware that has that specific kind of charging port. As of 2021, these can actually be found on surprisingly many kinds of devices:

* smartphones (ok, that one is obvious), cameras, handheld gaming consoles (hi Nintendo!) and other hi-tech electronics
* laptops (seems to be a lesser known feature, and may not always support **charging**! sometimes just data transfers, double-check the specs)
* bodycare devices like toothbrushes and shavers (yup!)
* flashlights (some even double as smaller power banks)
* pumps and compressors (okay, not entirely sure about compressors _yet_, since mine came with a microUSB, but it's close enough, I'm counting it!)
* arc lighters (notably, fuelless)
* ultrasonic humidifiers
* fans
* bug traps

## A full kit for 2021

 > ℹ For the sake of brevity, USB Type A will be A, and USB Type C just C

* A multi-port GaN AC/wall charger with 20V [[Power Delivery]] support on at least one of the outputs and at least one USB type A (aka "full-sized") — can charge most laptops that have PD charging support
* A power bank with 20V [[Power Delivery]] support
* Cables:
	* C—C, 2m length, angled connector, with support up to 100W — for charging during use
	* C—C, shortest available — if the wall charger comes with more than one; getting a short one may be a good idea for use in tight spaces like backpacks (with a power bank)
		* one may come bundled with Thunderbolt devices, probably rather short too — it's usually good
	* A—C, 2m length, angled connector — for charging a smartphone/tablet during use and compatibility with devices that do not support [[Power Delivery]]
	* A—C, shortest available — for use in tight spaces like backpacks with a power bank
* Adapters:
	* C—microUSB (x2) — for compatibility with older microUSB devices, of which there are still many, and many will likely survive for quite a while
		* most gamepads, older smartphones/tablets and other USB-chargeable devices
	* C(f)—C(m) adapter, to make any C cable angled
		* some are even **magnetic**, but do mind the number of contacts they have, as using an adapter may limit the capabilities of the port to:
			* charging only (realistically, magnetic connectors are usually only good for this, as other peripherals don't take as kindly to sudden removal)
			* data transfer (magnetics usually OK for smaller/cheaper peripherals)
			* high-speed data transfer, sufficient for DisplayPort
			* extreme-speed data transfer, sufficient for Thunderbolt
	* C—Lightning (x1?) — in case you own any Apple devices or have any friends come by with these
* A AA/AAA _(AAAAAA!)_ charger for NiMH or similar batteries commonly found in gamepads and remotes
	* ℹ Newer Xbox gamepads support a battery that replaces 2xAA and connects to internal USB charging contacts, obsoleting AA batteries
* ☀ A folding solar panel wth USB output — if you're into the great outdoors, this might even save your bacon
* Dust plugs: not strictly for charging, but bring that extra peace of mind (_somewhat_ improve survivability) for ports that are used very infrequently, be it charging ports or any other (like 3.5mm jack)

## Important points

* Most/all cables in my kit have a C on the receiving end: this is intentional, as it's likely going to be the norm for most devices (short of the most power-hungry ones) going forward, and mismatches can be fixed with adapters
* 20V power can satisfy most laptops, which are usually the most power-hungry devices _on the go_
* [[Power Delivery]] may fail for smaller/cheaper devices over C—C cables due to lack of negotiation chips — this isn't dangerous ([[Power Delivery|PD]] is designed to be safe and doesn't output >5V by default), but charging might just not start under these conditions
	* Curiously, charging over an adapter (like, say, microUSB) may not be affected by this phenomenon
* Power banks have to have rated capacity below 100Wh to be allowed on airplanes — not just in hand luggage, but **at all** (lithium-based batteries are not allowed in checked luggage)