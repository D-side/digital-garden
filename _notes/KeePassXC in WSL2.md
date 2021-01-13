---
title: KeePassXC in WSL2
---

Back in my native Linux days I got used to an SSH agent paired with a [[KeePass|KeePassXC]] that manages my keys. I didn't have to do much to get it to work, I just enabled SSH Agent integration in KeePassXC, enabled the SSH agent's systemd service and things just worked.

In 2021 I decided to give Windows 10 and <abbr title="Windows Subsystem for Linux, version 2">WSL2</abbr> a try. Replicating that setup proved to be quite a hassle.

## Starting point

I had KeePassXC running in Windows (because WSL2 can't comfortably run GUIs just yet).

The SSH client I was meaning to use was in Ubuntu, running inside WSL2, and came from OpenSSH. Basically, the very same one I was using in Linux.

The overall setup is going to look as follows:

* KeePassXC for key management
* OpenSSH Authentication Agent service on Windows, updated to version 8
* [WSL SSH Agent](https://github.com/rupor-github/wsl-ssh-agent) that "is a simple 'notification tray' applet which maintains AF_UNIX ssh-agent compatible socket on Windows end"
* [npiperelay](https://github.com/jstarks/npiperelay), "a tool that allows you to access a Windows named pipe in a way that is more compatible with a variety of command-line tools"
* [socat](https://linux.die.net/man/1/socat) that converts a named pipe to a Unix domain socket
* `ssh`, OpenSSH client inside WSL

## The process

Because there was some rather unfortunate backtracking involved, I'll be posting the shortest path that I eventually discovered.

### KeePassXC

So I started off by enabling the SSH agent integration, and checked the box for _OpenSSH agent_, since I was running an OpenSSH client, and thought I'd need a respective agent.

This is where I found that OpenSSH agent isn't in Windows despite the rumors I heard. Well, okay I didn't expect things to be **that** easy.

### OpenSSH agent in Windows

I looked it up and found that OpenSSH has to be installed using "Manage optional features" in the system settings. Alright.

I opened that up and found *two*: "OpenSSH Client" and "OpenSSH Server". That's fair enough, OpenSSH implements both a server, `sshd`, and a client, `ssh`. You need "OpenSSH Server" at least because that's what includes the agent.

Then I opened up "Services" settings in Windows 10:

* **enabled and started** "OpenSSH Authentication Agent" and set it up to start *automatically*
* **disabled** "OpenSSH SSH Server" (because I didn't need it, and before enabling it I would at least review its configuration so make sure it's secure; it's a remote access server, not fun and games)

After a restart (and there have been a few throughout the process, I think changing the "optional features" needed this?) I could verify in `cmd` that `ssh-add -l` was indeed listing my keys when KeePassXC is unlocked, and no keys when it's locked. Half way there then!

### Bridging the gap

So now we have a functioning SSH agent and an SSH client to connect it to. How hard can it be?

The hard work has already been done by the authors of [WSL SSH Agent](https://github.com/rupor-github/wsl-ssh-agent) and [npiperelay](https://github.com/jstarks/npiperelay), so you mostly just have to install these. WSL SSH Agent already includes npiperelay in the release archive, so no, you don't have to build npiperelay, although you could, to boost confidence that your keys are safe.

**WSL SSH Agent** has to be installed according to the README, which involves creating a shortcut to the executable _with parameters_ and placing it somewhere where it will be auto-started

Now everything mostly comes down to putting this snippet somewhere that's executed whenever you start a shell (`$WINTOOLS` has to be replaced or defined with the Linux path where you put `npiperelay.exe`):

```sh
export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
ss -a | grep -q $SSH_AUTH_SOCK
if [ $? -ne 0   ]; then
    rm -f $SSH_AUTH_SOCK
    ( setsid \
        socat \
          UNIX-LISTEN:$SSH_AUTH_SOCK,fork \
          EXEC:"$WINTOOLS/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & \
    ) >/dev/null 2>&1
fi
```

Here's what it does:

* `$SSH_AUTH_SOCK` is defined to the path where SSH agent's socket is expected
* `ss -a`'s output is inspected for presence of an active socket on that path
* If the socket **is** there, everything should be set!
* ...but if it isn't, whatever file is at that path currently is removed (not sure why, but [`socat`'s docs](https://linux.die.net/man/1/socat) suggest that it might be left hanging even after the socket is closed) and to create it, `setsid` is used to start a new session, where:
  * `//./pipe/openssh-ssh-agent`, the named pipe exposed by WSL SSH Agent, is converted into a more Linux-friendly format via `npiperelay`
  * `socat` starts, creating a Unix socket at `$SSH_AUTH_SOCK` and connecting it to the aforementioned `npiperelay` process (it actually **starts** that process via `EXEC` then connects to it)
  * because `socat` is started with `setsid` (ok) and a `&` at the end (not sure it's necessary...), it does not block the starting shell and keeps on living even when that shell dies
  * all the **outputs of `setsid` are discarded** (redirected to `/dev/null` the "black hole" of Unix): <abbr title="standard error stream">stderr</abbr> is forwarded to <abbr title="standard output stream">stdout</abbr> via `2>&1`, a rather common idiom, and stdout is discarded directly

...and this is it. Try `ssh-add -l` in `cmd` and in WSL.

### Finishing up

After everything was set up, I also [**updated** OpenSSH to version 8.0](https://github.com/PowerShell/Win32-OpenSSH/releases/), because a warning was popping up as I was testing the final setup:

```sh
warning: agent returned different signature type ... (expected ...)
```

## Acknowledgements:

I do not take credit for finding this solution, it's an aggregation from the following places, in order of finding:

* [Nilesh S suggested](https://nileshgr.com/2020/04/19/keepassxc-ssh-agent-in-wsl-and-openssh-for-windows) that combo in the first place
* [Shea Polansky](https://polansky.co/blog/a-better-windows-wsl-openssh-experience/) explained everything that starts **after** KeePassXC
* The `socat`+`npiperelay` hack is straight out of the [WSL SSH Agent's README](https://github.com/rupor-github/wsl-ssh-agent#wsl-2-compatibility)
