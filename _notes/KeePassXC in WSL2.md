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
* [npiperelay](https://github.com/jstarks/npiperelay), "a tool that allows you to access a Windows named pipe in a way that is more compatible with a variety of command-line tools"
* [socat](https://linux.die.net/man/1/socat) that converts a named pipe to a Unix domain socket
* `ssh`, OpenSSH client inside WSL

## The process

Because there was some rather unfortunate backtracking involved, I'll be posting the shortest path that I eventually discovered… and subsequently shortened further because of updates upstream — e. g. WSL SSH Agent is no longer a part of it (and, possibly, never was).

### OpenSSH agent in Windows

I looked it up and found that OpenSSH has to be installed using "Manage optional features" in the system settings. You only need "OpenSSH **Client**". *(On recent Windows 10 as of October 2022, older versions had it under "OpenSSH Server" for some reason, but that was apparently fixed by Microsoft!)*

Then I opened up "Services" settings in Windows 10:

* started "OpenSSH Authentication Agent" and set it up to start *automatically*
* ~~disabled "OpenSSH SSH Server" (because I didn't need it, and before enabling it I would at least review its configuration so make sure it's secure; it's a remote access server, not fun and games)~~ *(not anymore!)*

After a restart (and there have been a few throughout the process, I think changing the "optional features" needed this?) I could verify in PowerShell that `ssh-add -l` was indeed listing my keys when KeePassXC is unlocked, and no keys when it's locked.

#### Side note: OpenSSH versions

If you're running a sufficiently new Linux distro in WSL2 you may also have to [update OpenSSH](https://github.com/PowerShell/Win32-OpenSSH) to a matching version (or above?).

For instance, as of October 2022 Ubuntu 22.04 shipped with OpenSSH 8.9 and did not work with the 8.1 agent that ships with Windows 10 by default and printed this in the output for `ssh -vvv user@host`:

```
debug2: get_agent_identities: ssh_agent_bind_hostkey: communication with agent failed
debug1: get_agent_identities: ssh_fetch_identitylist: communication with agent failed
```

Updating OpenSSH in Windows to 8.9 fixed it. Matching versions of the Linux client and the Windows agent should most certainly work, a newer agent might also work.

### KeePassXC

In "Tools", "Settings", "SSH Agent" I enabled the SSH agent integration for OpenSSH.

I already had the keys in my database configured properly, but if you're doing this for the first time, the easiest to understand option is to keep the private key (probably `id_rsa`) **inside** the database:

- open the database entry you want to store the key in
- ❔ if your private key is protected with a passphrase (which is a good idea), visit the "Entry" tab and enter the passphrase in the "Password" field so that KeePassXC can unlock your key for the agent
- visit the "Advanced" tab and in the "Attachments" block hit the "Add" button and add the private key file to the entry
- visit the "SSH Agent" tab and make sure the "Private key" is set to "Attachment" and the correct file is selected in the dropdown menu next to it;
    - you'll know it's working properly if you see the fingerprint and public key below
    - check the respective boxes if you wish the key to be automatically added and/or removed as you unlock or lock your database
    - ✖ user confirmation at the time of writing (October 2022) is broken and causes KPXC to fail to connect to the agent, requiring the option to be switched off and the database lock & unlock

### Bridging the gap

Now we have a functioning SSH agent and an SSH client that needs to connect to it. [The solution to that](https://github.com/rupor-github/wsl-ssh-agent#wsl2-compatibility):

- download `npiperelay.exe` ([from GitHub](https://github.com/jstarks/npiperelay/releases)) and place it (extracting, if necessary) somewhere accessible to WSL2
    - locations inside WSL2 unfortunately don't seem to work and cause `socat` to not start
- install `socat`, it's widely available in various Linux repositories
    - in Ubuntu you would do `sudo apt install socat`
- place this [relay script](https://github.com/rupor-github/wsl-ssh-agent/blob/master/docs/wsl-ssh-agent-relay) somewhere you can run from within WSL2, 📝 editing `RELAY_BIN` to point at wherever you placed `npiperelay.exe`
- place the following two lines into the startup file of whichever shell you're using (could be `~/.profile`, `~/.bashrc`, `~/.zshrc` or something else), 📝 adjusting the path to the relay script in the first line to wherever you placed it on the previous step:
    ```sh
    ${HOME}/.local/bin/wsl-ssh-agent-relay start
    export SSH_AUTH_SOCK=${HOME}/.ssh/wsl-ssh-agent.sock
    ```

### Checking

The tricks above will take effect in the new shells. Here are a few things you can try to check the setup:

- `ssh-add.exe -l` to check the state of the agent: it should output key fingerprints from your KPXC database that you can find inside the entries on the "SSH Agent" tab
    - if it's working, but doesn't have the keys, lock the KeePassXC database and unlock it again if the last time you did that was before the agent was running
    - if no keys show up still, check if you actually have the key you want configured per the "KeePassXC" section above
    - if the key you want *does* show up but does not seem to be usable, try adding `-vvv` to the `ssh` command and looking through the output to see what it says about the agent; you may have to update OpenSSH in Windows, see the section "Side note: OpenSSH versions" above
- `wsl-ssh-agent-relay status` (📝 adjust the path to the relay script if needed) will tell you if the relay is running, and if it isn't, then either
    - the shell startup script you added the lines to is not firing, refer to the documentation of the shell you're using (`echo $SHELL` should get you started)
    - the `RELAY_BIN` is not pointing to `npiperelay.exe` in a way that it can resolve (e. g. I tried to put it on `PATH` and trimmed `RELAY_BIN` to just the filename, but that did not work out and I used the `${HOME}`-based path like above instead)
    - `npiperelay.exe` is not in the Windows filesystem (it does not seem to work when launched out of the WSL2 filesystem, the `start` command does not report any error, but `status` says the relay isn't running)
    - the agent was started *after* the relay without the `-s` option as outlined in the comments inside the relay script

## References

* [Nilesh S suggested](https://nileshgr.com/2020/04/19/keepassxc-ssh-agent-in-wsl-and-openssh-for-windows) that combo in the first place
* [Shea Polansky](https://polansky.co/blog/a-better-windows-wsl-openssh-experience/) explained everything that starts **after** KeePassXC
* The `socat`+`npiperelay` hack is straight out of the [WSL SSH Agent's README](https://github.com/rupor-github/wsl-ssh-agent#wsl-2-compatibility)
* [KeePassXC FAQ: SSH Agent integration](https://keepassxc.org/docs/#faq-ssh-agent-how)