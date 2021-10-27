---
---

## The struggles

There is this never-ending holy war between laymen and power users of computers and other computational hardware, on whether text-based or graphical interfaces are the way to go.

Both sides make somewhat good points:

* Graphical interfaces are *waaaay* easier to pick up for simpler tasks, due to being built upon far more intuitive input methods that physically correspond to similar actions in the real world (like dragging and dropping files or pieces of text between places, or hitting switches on and off to start and stop something)
* Graphical interfaces are just a lot more flexible than text-based in terms of what they can display, text-based is often limited to monospace fonts, which is already a severe limitation to what it can do well

Yet:

* Graphical interfaces are a lot more resource-intensive, and due to that text-based is therefore usually a lot more responsive and light on energy (which is relevant on battery-powered devices)
* Graphical interfaces typically don't support any forms of automation other than what may be built into individual tools — so each tool ends up reimplementing a sizeable chunk of functionality to do that, and interaction between multiple such tools is usually impossible
    * A more popular approach is either digging into the internal structure of the interface (like HTML on the web) which is unstable, prone to breaking after updates of the underlying software and only works with a limited set of software (websites and Electron-based apps); or recording and replaying ordinary user inputs. The latter comes with all imperfections of the input methods:
        * exclusivity (the system usually perceives only one set of these, so they can only do one task) — defeated through either virtualization or OS-specific hackery
        * focus on manual interactions, which are performed at "human speeds", which is why plain recordings of actions are usually edited to make them run faster, saving time — which is the whole point of automation
    * Command lines, on the other hand, are inherently replayable, and quickly: since the command typed in manually can be saved and placed elsewhere to be invoked as part of another process; and manual actions are only required to *build* the command, not to *run* it, so there's much less time and resources wasted in execution
    * Command lines are also a lot more composable: because outputs are easy to capture and analyze by other commands, even different pieces of software can interact with each other effectively, and where they can't, a gateway can be built to facilitate that interaction anyway. This level of composability in graphical interfaces is hard to find and it's usually purpose-built, like VSTi in sound engineering.

## The middle ground

These wars usually occur in places that only consider **existing** solutions, and for good reason: most discussions on the internet are driven by pressing issues encountered in the moment, so designing a good solution to address the problem is usually left out as a path too long. And yet, some problems continue to persist for years, long enough for someone to actually get around to solving them.

**One solution to this lies in taking the best of both worlds.**

### The familiar realm

Let's make something clear first though. There are some good parts in modern graphical interfaces. Even these, though, are usually half-broken. One of these would be dran&drop, which has to be the most intuitive mouse gesture there is, and it's **criminally underutilized**.

You can drag&drop rather a lot of things: files, text, images

Another good mechanism, which has become so essential it's often times the primary mechanism for interaction across software, is the clipboard. It isn't necessarily hard-tied to the graphical, it's available in text-based too, but graphical interfaces take it to the next level by allowing far more types of content.

### The dark realm

Command line clearly being ahead in capabilities… The path of least resistance appears to be exposing the capabilities of the command line using a friendlier interface.

#### Packaged automation

Some have tried! There's NodeRED for instance, that attempts to package data processing into a reasonably intuitive "postal service" pattern, where every node receives messages and does something to them and/or emits them at any or all of the outputs that it wants depending on what kind of node it is.

And it allows extension by way of installing additional libraries that contain more node types, and some node types can be developed within NodeRED itself.

TODO: what's good about it, message channels

## The economic incentive

TODO: for lack of portable flexible mechanisms, the industry has gotten accustomed to selling every narrowly-scoped implementation as a major feature, it's easy to suspect an economic incentive under it, but it's probably just the easiest way to go about the low-hanging features

> [[Futurisms]]