---
featured: true
---

Skillforest is a concept that I never got around building, that essentially takes the concept of skill trees from RPGs and applies it to skills of the real world.

However, skills in the real world are somewhat more complicated. Every human being explores countless skill trees over the course of their life, and intersections between the trees are rather common. Hence it's not one tree, but rather a forest.

## Purpose

The repository description at the time of writing is as follows:

> A concept of a federated skilltree for tracking skills: for self-assessment, self-improvement, skillset representation and exchange

I still can't add much to this. Although I doubt all of these features will see active use in the end, I believe the *ability* to diverge towards any of these, should the need arise, is essential.

In a way, it's going to be a "meta-tool", as in a tool that powers other tools usable more directly. This can also allow the development to be more iterative (not that it's been very helpful, as I've been unable to allocate any significant development time to the project anyway).

## Data

Technically, the data structure that the skills form isn't even a tree as far as graph theory is concerned, but is rather a DAG (directed acyclic graph). At least that's the theory. Since I envision these graphs to be community-maintained, someone is bound to sneak in a cycle in there somewhere, and the software needs to be ready for that.

Every node of the DAG is a skill, and can be marked as known or not. Granularity can vary, the initial idea was to have a node per **concept** to grasp. A skill depends on a bunch of other skills (dependencies) in a way that it cannot be marked as known lest its dependencies are also marked as known.

A user targets a certain skill they wish to learn and an app can show them what steps are available to them at any given time. They can learn at their own pace and take a break from a particularly challenging topic by switching to another.

Over time, some nodes can receive updates, prompting the user to refresh their knowledge on the respective subjects, including the new parts.

As the system evolves, more types of relationships can be introduced

## History

In March 2016, I posted [the initial idea on Stack Overflow in Russian](https://ru.meta.stackoverflow.com/a/2793) and had a number of discussions about this with different people out in the wild.

In April 2016 I created **the [repository](https://github.com/D-side/skillforest)** to write down my thoughts in more detail and in a slightly more discoverable place.

In January 2018 I did a [first major recap of the idea in my blog (Russian)](https://dside.ru/knowledge-manager/). One significant addition to the original was the analogy with package managers, as I found that the problem there is essentially dependency management, and it's implemented in lots of software package managers. So maybe much of the legwork can be borrowed from there.

Some time in 2020 I found that folks at [Metacademy](https://metacademy.org/) have already implemented an MVP for roughly the same idea. I've already been pointed in that direction by Dmitry Nikoulin aka Pastafarianist.

Also in 2020 and till mid-2021 I've been exploring [[ActivityPub]] and the potential to socialize the activity of building and tracking the forests without confining the system to a single provider, but it doesn't seem to complement the core capabilities in a big enough way to justify the effort. This can be reconsidered once an MVP is going and if it shows results.

In 2021 I found some more uses for similar abstractions, collectively dubbing them [[Redo list]].

Implementation at the time of writing is still not started.
