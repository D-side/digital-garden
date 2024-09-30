---
title: Node-RED
---
A node-based programming environment well suited for simple data processing.

What I like about it is a feeling of physicality it gives to a seemingly abstract workspace. Individual nodes almost feel like circuitry components, except they're software and what flows through the wires is *data* in form of messages.

In addition to nodes some other elements you might see in a mature workspace would be message injection buttons, debug probes, comments, groups and wire organization tools like junctions and hidden linkages ("under the desk" of sorts).

- Message injection buttons act just like device buttons, only instead of blinking an LED at you by bridging it to the battery it will instead send a piece of data somewhere: maybe a local file or database, maybe a device on your network, maybe a service on the internet.
- Status lines underneath the nodes respond to what's going on within the program, giving you a live view of what it does right now and right beside the respective pieces that do it. It's not something you get for free really, you have to plan for it, but [commercial software also pursues observability in the exact same way](https://en.wikipedia.org/wiki/Observability_(software)), only on a larger scale and to a greater extent. The level of observability that status lines provide is enough for them to work as a rudimentary debugger and a live dashboard.

There's also an *extensive* collection of community nodes for it, teaching it easy access to tons of things, including but not limited to: providing form controls beyond message injection, sending and receiving mail and instant messages, converting data between formats, scheduling, accessing network file shares, talking to USB serial devices… [the list goes on](https://flows.nodered.org/search?type=node&sort=downloads).
## Low/no-code stigma

Just about every time I bring it up and gush about it, people from programming circles roll their eyes in distaste. Which is understandable, most of them probably aren't this tool's intended audience. Still, many of their stated reasons *why* they roll their eyes are in actuality *false*:

- It quickly turning into unmaintainable mess is entirely the fault of the developer, even if their medium is nodes instead of code. In that sense Node-RED programs are not any different from text-based programs. Both environments have tools to tackle the organization aspect of the program: Node-RED in particular features junctions, link nodes, groups and subflows. Learn to use them and when to use them and your workspace will look *sublime* when you're done, though this may require some extra effort.
- Marketing often claims that such solutions "just work™" and require no testing, which seasoned software veterans dismiss as unrealistic and based on that dismiss the whole tool. Such marketing claims are straight up false, a different code format does not address the necessity (or lack thereof) of testing in any way.
- Lack of version control? It comes with `git `built-in, including diffing tools.

## My uses

* [[Home automation|Talking to Home Assistant]] was my starting point.
* My largest project was handling intents from my voice assistant — phrase recording, recognition and classification was done outside by Rhaapy, Node-RED received the name of the command and its parameters and was in charge of making it happen.
* A friend of mine brought to my attention an opportunity to try to connect together a niche USB peripheral and Home Assistant — which I did, everything worked quite easily.

## References

- [Project website](https://nodered.org/)
- [Library of extensions and examples](https://flows.nodered.org/)
- [Node-RED nodes for voice2json](https://github.com/johanneskropf/node-red-contrib-voice2json) that, at least in theory, are everything you need to have a voice assistant suite running within Node-RED with decent visibility into its internals down to (but not including) the levels of signal processing.