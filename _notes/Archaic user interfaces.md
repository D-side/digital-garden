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
        * focus on manual interactions, which are performed at "human speeds", which is why plain recordings of actions are usually edited to make them run faster, saving time — which is the whole point of automation; and can randomly start failing if the UI can't keep up, because there's no native way to get feedback from the inputs
    * Command lines, on the other hand, are inherently replayable, and quickly: since the command typed in manually can be saved and placed elsewhere to be invoked as part of another process; and manual actions are only required to *build* the command, not to *run* it, there's much less time and resources wasted in repeated executions
    * Command lines are also a lot more composable: because outputs are easy to capture and analyze by other commands, even different pieces of software can interact with each other effectively, and where they can't, a gateway can be built to facilitate that interaction anyway. This level of composability in graphical interfaces is hard to find and it's usually purpose-built, like VSTi in sound engineering.

## The middle ground

These wars usually occur in places that only consider **existing** solutions, and for good reason: most discussions on the internet are driven by pressing issues encountered in the moment, so designing a good solution to address the problem is usually left out as a path too long. And yet, some problems continue to persist for years, long enough for someone to actually get around to solving them.

One solution to this lies in taking the best of both worlds.

### The familiar realm

Let's make something clear first though. There are some good parts in modern graphical interfaces. Even these, though, are usually half-broken. One of these would be drag&drop, which has to be the most intuitive mouse gesture there is, and it's **criminally underutilized**.

> 📝 For the purposes of this topic the "share" pattern in mobile apps is largely equivalent to drag&drop, as a one-off transmission between the apps. Compatibility is handled a bit differently: instead of displaying a list of apps compatible with the given type of shared content, drag&drop displays feedback from the app that's under the cursor. Capability-wise it's essentially the same.

You can drag&drop rather a lot of things: files, text, images – but all these are usually one-off interactions and don't establish a communication **channel** or a pipeline. A lot of the time they are also limited to internal interactions within a single piece of software.

Another good mechanism, which has become so essential it's often times the primary mechanism for interaction across software, is the clipboard. It isn't necessarily hard-tied to the graphical realm, it's available in text-based too, but graphical interfaces take it to the next level by allowing far more types of content within it.

### The dark realm

Since the command line offers a lot of potential that GUIs don't, maybe a significant improvement can be made through exposing the capabilities of command line tools using a friendlier interface.

#### Packaged automation

Some have tried! There's [[Node-RED]] for instance, that attempts to package data processing into a reasonably intuitive "postal service" pattern, where every node receives messages and does something to them and/or emits them at any or all of the outputs that it wants depending on what kind of node it is.

And it allows extension by way of installing additional libraries that contain more node types, and some node types can be developed within NodeRED itself.

TODO: what's good about it, message channels

## The economic incentive

Your typical consumer lacks information on what generic mechanisms already exist on their system to carry out many types of tasks. Many of them are very powerful, but are oftentimes too abstract to easily explain.

Say, newcomers to Linux that start exploring the command line are at first confused, as the utilities they have seem to be a bit too simple, almost primitive. But then some of them discover [pipes](https://en.wikipedia.org/wiki/Pipeline_(Unix)) that allow them to chain these simple tools together, each amplifying the other. This is one of the core pieces of [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy): that each program has to do one thing well and should expect to be used alongside others.

Outside of power-user circles, however, there is little incentive to explore these mechanisms. And circles of power users have historically been very narrow. So a lot of the time commercial software development companies cater to popular demand and their own bottom line and build their own ways of interaction. This way they:

- have a lot more control over it and can shape it in response to customer demands for an easier-to-use UI, which is a competitive advantage
- can afford to license interaction mechanisms more restrictively and only implement them in their own software, licensing this technology to partners they trust under undisclosed conditions — if they can meet the wider demand of their customer base, they can bring more business to themselves and their partners this way

And so every powerful feature that could feasibly be implemented externally, in a more generic fashion, and thus could work on a lot more than objects than just the ones within a certain piece of software — it becomes limited to that piece of software.

And this also results in a *massive* duplication of effort where developers implement the same features over and over and over again in different places. If they're lucky enough to find new or uninformed enough developers that find that kind of work engaging, even if it doesn't advance the industry overall nor does it empower the user to a maximum possible extent, they can get away with it. And as it stands now, they often do.

> [[Futurisms]]