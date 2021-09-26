---
title: "Directed Acyclic Graph"
meta: true
---

A **directed acyclic graph** (a DAG) from graph theory is a graph (a collection of arbitrarily connected dots), that's directed (connections have a direction, i. e. they're *arrows*, not lines) and acyclic (there are no cycles, i. e. routes along the arrows from any point towards itself).

The above definition is deliberately simplified to layman's terms, you may find several terms in use around DAGs:

* "Dots" being connected can be vertices (graph theory) or nodes (data structures)
* "Connections" may be edges (graph theory), 

DAGs are a surprisingly common occurrence for something so scientific. They're formed wherever a data element can refer to zero or more elements of the same kind.[^1]

Most well-known use is in git, for commits (≈revisions, versions):

* Ordinarily a commit refers to a single parent commit, a version that changes were built upon
* A **merge** (combination of multiple "timelines" of changes) produces a commit that points at **multiple** parents
* A commit may have no parents at all if it's the first in the repository (as a commit is being created, any parents it refers to must already exist) or, more generally, if it's a first commit in an "orphan branch" (a repository can have more than one)

## Topological sort

Perhaps one of the most interesting operations on a DAG is a topological sort, which is a list of nodes in such an order that for any given node in the list there are *no* nodes later in the list pointing at it.

Perhaps the simplest illustration of this concept is on a list of tasks, some of which have prerequisites. A topological sort of that list of tasks is order in which tasks have to be executed such that whenever a task is started, its prerequisites are guaranteed to be completed.

## Breaking acyclicity

DAGs are convenient, but can be hard to build in distributed environments.

Git bypasses this problem nicely by requiring all parents to be **present** and **immutable** (unchangeable), so cycles cannot be formed because commits are added one by one, and a cycle would have to be added **in one step**.

But something that allows nodes to change or even not exist may result in a perfectly good DAG turning into a DG (directed, but no longer acyclic, graph). With, you've guessed it, cycles.

Continuing on a list of tasks analogy outlined in [toposort](#topological-sort), a cycle of tasks would be a bunch of tasks connected into a loop by dependency arrows. If a task can only be started once everything pointing at it has been completed, a cycle would render a list of tasks impossible to complete.

This does happen in the real world: package management solutions can have some software require other software to be installed on a system. And because software *updates* every now and then, lists of their dependencies change and may sometimes form a cycle. This is rare and is frowned upon, but can happen and there is usually an "emergency mechanism" to deal with it that breaks the loop, e. g. see [how Debian does it](https://www.debian.org/doc/debian-policy/ch-relationships.html#binary-dependencies-depends-recommends-suggests-enhances-pre-depends):

> If there is a circular dependency among packages being installed or removed, installation or removal order honoring the dependency order is impossible, requiring the dependency loop be broken at some point and the dependency requirements violated for at least one package. Packages involved in circular dependencies may not be able to rely on their dependencies being configured before they themselves are configured, depending on which side of the break of the circular dependency loop they happen to be on. If one of the packages in the loop has no `postinst` script, then the cycle will be broken at that package; this ensures that all `postinst` scripts are run with their dependencies properly configured if this is possible. Otherwise the breaking point is arbitrary. Packages should therefore avoid circular dependencies where possible, particularly if they have `postinst` scripts.

[^1]: The same setup with zero or one reference yields a tree, or, more strictly, a collection of trees (because lack of a reference indicates a data element is a root of a tree)