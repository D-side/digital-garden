---
title: Z-shell
---

Z-shell aka `zsh` is my shell of choice.

## Rationale

I only consider Bash and Fish to be its only real competitors. Bash may be a more established and common alternative, but it's pretty stripped-down by default and harder to augment compared to zsh. Fish is the exact opposite in that sense: it's highly advanced right out-of-the-box, featuring autosuggestions "as you type" and completions based on man pages (like, wow); but it's still rather scarce in the wild.

So why zsh? It's sort of a middle-ground between the two. It's not as widespread as Bash, but it has a _massive_ community that has produced plugins for what feels like _everything_.

That said, I might switch to Fish when I invest time into reconsidering my shell choice.

## Features

<a href="/assets/zsh.png" target="_blank"><img src="/assets/zsh.png" alt="My zsh in action"></a>

* Highlight zsh command syntax as I type, most notably highlighting available executables in green and unrecognized in red
* Display a prefix-matching command from history that I probably want right ahead of the cursor, completing at the press of a <abbr title="right arrow"><kbd>➡</kbd></abbr> key
* Notify me of commands that ran for long enough that I probably switched to doing something else ([[TODO]] fix this after transition to WSL2)
* Show a wealth of information alongside the prompt, some of which can even stay *after* the command was run, for historical purposes:
  * clock (when was the prompt shown, which is usually roughly around the time when the command was started)
  * time taken by the last command, if it was 3+ seconds, otherwise I probably don't care
  * status of the last command (it looks a bit confusing in history because it does not refer to the command next to which it's rendered, but rather the one _before_ it)
  * number of pending tasks in taskwarrior (this was a random find, I didn't even set it up; and I'm not sure I'll stick with taskwarrior)
  * git status of the directory that I'm in

### Possible improvements:

* Fish-esque man page-based completions: https://github.com/nevesnunes/sh-manpage-completions

## Current state

I no longer use the entirety of oh-my-zsh, because it has grown to a less than a decent size, so I prever to cherry-pick just the things that I need instead. Which is when I started using plugin managers, and at the moment I'm using [Antigen](https://github.com/zsh-users/antigen).

My theme these days is [powerlevel10k](https://github.com/romkatv/powerlevel10k), which is, no way to put milder, **insanely powerful** (hence the name, I guess!), it handles all the information display that does not change according to input (and the docs say that it can show some more that _does_ depend on input, such as information about software in commands I'm about to run, e. g. version of Ruby in `bundler`, or current context in `kubectl`).

## History

In the "my first Linux distro" days, Bash was everywhere, and I only heard about zsh after a few years.

What hooked me up was oh-my-zsh. That was a taste of "shell power" I was never exposed to before, and I was very impressed.

I also tried to give Fish a chance, but found that support for it is rather limited and zsh is much easier to find help with. As far as I know this is still the case.
