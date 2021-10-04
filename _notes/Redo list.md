---
featured: true
---

A set of tasks designed for ease of repeatability by others. The term itself is a variation of popular "todo list", but with emphasis on *redoing* what someone else already went through. Data-wise a simplest redo list is tasks + dependency relations between them (forming a [[DAG]], hopefully; in reality acyclicity may be violated).

## Concept of *session*

In a way redo lists are a generalization of [[Skillforest]], inspired by recipe reference cards found on marvellous [Cooking for Engineers](http://www.cookingforengineers.com/) (open any recipe and scroll past the instructions to see a table'ish chart). Both roadmaps for learning and cooking recipes are very similar data-wise, albeit require substantially different UIs due to very different workflows around them:

* A learning process is something that's passed through *once per person*, and that fact is subsequently persisted somewhere for later reuse (trimming dependencies on other learning processes)
    * Well, in reality previously explored concepts may have to be revised, but let's leave out this bit for now
* A recipe is something that is completed in a relatively short time span (<1 hour, often a few hours, much less often a few days), is commonly restarted every once in a while, and may be in progress across *multiple instances per person* (e. g. in a restaurant)

There is evidently a shared concept in both processes, one that tracks which steps have already been completed. Naming being hard as usual, I'll settle on a term "session".

* In educational context, there would be one session per person that gets continually updated as new topics are mastered or added as goals; only one session that would exist indefinitely (only closed by, perhaps, its owner's death? but who would do that then?)
* In a cooking context, there would be one session per cooking attempt and an app should be capable of managing multiple concurrent sessions, plus being capable of closing sessions that have been completed or aborted

## Other possible applications

Other possible uses of redo lists that came to mind:

* Tooling setup instructions in IT organizations: not everyone typically needs **all** the tools, but some tools commonly require others to be installed and configured in a particular way, so latching just onto an existing package manager just doesn't cut it without extensive research and support effort
    * Also, instructions may specify several variations of a certain tool, e. g. different editors, different networking tools or key management solutions

## Application

### Minimum viable

While an idea of visualizing the entire map of tasks left to do sounds appealing to a huge fan of data visualiation like myself, implementing that is not very easy, and usefulness of this visualization would be marginal anyway.

Something more useful would be a list of tasks that are ready for kick off. As tasks are completed, more tasks are unlocked and added to the list. A view like this provides everything necessary to follow any given redo list to completion.

### Later stages

Other views may be implemented as well, for the curious, but only at later stages.

Important areas to cover:

* **Progress** – something that indicates how much progress on active goals has already been made and how much is still left
    * Numbers! Now, there's a complication: which numbers to pick in case there are multiple candidates for one task's dependency
* **Discovery** – something to explore previously unknown goals to decide whether they're worth pursuing
    * This could be done through recommendations attached to some of the nodes
* **Lookahead** – peek at tasks that are not yet available and at what's keeping them from becoming available
    * Other than curiosity I don't see much of a point here
* **Revison** – some tasks may have to be completed again when a situation calls for it
    * E.g. when some concepts were forgotten, or when a certain intermediate resource in cooking has been exhausted
* **Outlook** – what's known to the system and is readily available for completion, but doesn't contribute towards active goals
    * The idea is to highlight low-hanging topics "out there" that may spark interest towards exploring other goals