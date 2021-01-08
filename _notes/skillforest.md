---
title: Skillforest
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

Every node is a skill. It depends on a bunch of other skills (dependencies). And practically everything else follows from that.

## History

In March 2016, I posted [the initial idea on Stack Overflow in Russian](https://ru.meta.stackoverflow.com/a/2793) and had a number of discussions about this with different people out in the wild.

In April 2016 I created a [repository](https://github.com/D-side/skillforest) to write down my thoughts in more detail.

In January 2018 I did a [first major recap of the idea in my blog (Russian)](https://dside.ru/knowledge-manager/). Of course, by now it's also out-of-date. But one significant addition to the original was the analogy with package managers, as I found that the problem there is essentially dependency management, and it's implemented in lots of software package managers. So maybe much of the legwork can be borrowed from there.

Some time in 2020 I found that folks at [Metacademy](https://metacademy.org/) have already implemented an MVP for roughly the same idea. I've already been pointed in that direction by Dmitry Nikoulin aka Pastafarianist.

At the time of writing I'm investigating [[ActivityPub]] and federated networks in general. [I'm available on Mastodon](https://mastodon.online/@dside) by the way.
