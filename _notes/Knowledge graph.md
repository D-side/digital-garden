---
featured: true
---

A mental model (i. e. a way to think) of knowledge that represents (1) topics as dots and (2) associations as _direct_ connections _between_ the dots.

The simplest implementation of it would be encoding your own knowledge with presence of points. Points you have you know, point you don't have you don't.

However, if you detach knowledge from your experience in particular and zoom out to groups, societies and overall humanity, there's a lot of additional modeling techniques you can use:

- Knowledge of something within a certain _group_ can be indicated with a percentage that indicates the likelihood that someone in that _group_, chosen at random, knows it
- For practical use knowledge doesn't always have to be actually *known*, sometimes *validation* is enough; that's essentially how abstraction works, where you validate that it works a certain way based on its inner workings, and can then forget about said inner workings altogether — this introduces an additional state of points on a knowledge graph in relation to a specific subject

## Usage

### Bridging

In constructive discussions and arguments probably the only way to convince the other side of something is to provide them with a region of **your** knowledge graph until it bridges with **theirs**.

- If that region is bigger than you can easily convey, then it's too early for that discussion. You can provide an external source so that others can still acquire the necessary pieces without your involvement, depending on how interested the other parties are.

### Propaganda

A form of propaganda I have often seen involves deliberately building a region of knowledge graph _disconnected_ from the target audience's own experiences. They can still follow associations on that graph in their head and that can sometimes enough to trick them into thinking that graph has enough consistency to it to believe it and make decisions based on it.

On its own this technique isn't very reliable for malicious purposes, as usable knowledge has a high likelihood of accidentally bridging to a person's own experiences and leading them to discover a contradiction, rendering propaganda's message questionable. One occurrence of this usually isn't enough and other factors can be used to compensate.

One of them is a subtle suggestion that this graph is very far from their own and the relevant regions of it only exist in the heads of certain "experts". Which can be true, but can also be a message "do not waste time expanding knowledge in that direction, you'll need years to get anywhere useful". Depending on how convincing the message is, it can even diminish some of the person's own relevant experiences.

### UX improvement

If you define a graph of knowledge expected to be already known by "your average user", you can somewhat judge how difficult a certain task is for them. (You can also enrich your model with the _likelihood_ of them knowing something or not, but I didn't go further down this path yet. Besides, even the first variant is a lot of work.)

To do so, depict knowledge _about your task_ on the same graph. Then calculate, what points "your average user" would have to add to their graph in order to reach the point where they know everything they need to perform the task reliably.

Improvement of UX in that model lies in reducing the set of points that need to be added. Eliminating certain points from that set entirely is a solid improvement. Replacing some points with others can also be an improvement, so long as new points are easier to grasp than the old ones. (Points can be wildly different in that regard, so there's some arbitrariness to it. The same issue renders less effective simple absolute metrics such as a number of additional points or a sum of additional points' arbitrary weights.)

## Examples

- [The map of this garden](/map), inspired by note graph in [Obsidian.md](https://obsidian.md/)
- [Entity-Attribute-Value data modeling pattern](https://en.wikipedia.org/wiki/Entity%E2%80%93attribute%E2%80%93value_model)
  - [Semantic Web's RDF](https://en.wikipedia.org/wiki/Resource_Description_Framework)
  - [Datomic](https://www.datomic.com/) (every datom is an EAV tuple + a few more fields)
- (Hypothetical) [[Skillforest]] & [[Redo list]]
- (Stretch?) [xkcd: Purity](https://xkcd.com/435/) depicts a linear chain of science disciplines where every discipline employs tools from the discipline directly to the right of it
