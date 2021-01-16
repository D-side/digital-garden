---
title: Managing SSH identites
---

How do people live with more than one SSH identity? Here's how I do.

[[Security advice]]

## My way

### Identify the keys

First I need a way to identify keys for myself. Something I can use to understand what am using at any given moment. Filenames could be an obvious choice, but I don't store private keys in my file system directly. I use an SSH Agent and [[KeePass]] combo.

What I did is I exported _public_ key files from my KeePass and stored them in `~/.ssh/identities`. Public keys are not secret at all, in fact, you can get public SSH keys of any GitHub user by using a URL like `https://github.com/{username}.keys`. [Here are mine](https://github.com/D-side.keys). Thus no, doing so is not in any way a security risk.

Why are public keys useful, you might ask, if `ssh` needs a private key to authenticate? Read on.

### Tell `ssh` the correct key

What I found is that `ssh` can actually accept **public keys** as identities, as long as it has access to respective private keys! And in my case it can access keys through the SSH agent. This works both with the `-i` option of `ssh` to specify a key for a single command and with a default key location like `~/.ssh/id_rsa.pub`. I specify the key I need by symlinking it to the default path:

```sh
rm ~/.ssh/id_rsa.pub
ln -s "$pubkey" ~/.ssh/id_rsa.pub && \
  echo "Using $(basename "$pubkey" .pub) as SSH identity"
```

Yes, I didn't define `$pubkey` yet. There's more than one way to do that.

### Key selection menu

I have the files with meaningful names in `~/.ssh/identites` and now need a way to pick one of them. The snippet above uses `$pubkey`, so that is where I'll place the result.

These solutions have one thing in common: the `find ~/.ssh/identities -type f` command that outputs all the identity files.

#### Option 1: bash, `select`

This command outputs a prompt where every option has a number. You need to type in the number of the option you want and hit <kbd>Enter</kbd>.

```bash
select pubkey in $(find ~/.ssh/identities -type f)
do
  rm ~/.ssh/id_rsa.pub
  ln -s "$pubkey" ~/.ssh/id_rsa.pub
  break
done
```

#### Option 2: `fzf`

`fzf` is a nifty command-line utility that accepts multi-line input displays a menu out of them, plus an input field that accepts a search query. The search algorithm is "fuzzy", hence the name (FuZzy Finder); similar algorithms drive  functions like the "command palette" and "go to anything" in some modern text editors:

```sh
pubkey=$(find ~/.ssh/identities -type f | fzf)
rm ~/.ssh/id_rsa.pub
ln -s "$pubkey" ~/.ssh/id_rsa.pub
```

### Display the selected key

I use [[zsh]] with a [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme that displays prompt segments relevant to the command I'm typing in.

This is the section of my `~/.p10k.zsh` that displays the current key when I need it:

```zsh
#####################################[ ssh_key ]#####################################
# Shows the name of the public key behind the symlink at `~/.ssh/id_rsa.pub`
function prompt_ssh_key() {
  p10k segment -f 208 -i '🔑' -t "$(basename $(readlink ~/.ssh/id_rsa.pub) .pub)"
}
# Hide the segment by default, show it when it's needed:
typeset -g POWERLEVEL9K_SSH_KEY_SHOW_ON_COMMAND='ssh|git|hub'
```

## Other (bad?) ways

A typical way to do this is to use the `-i` argument and specify the key explicitly in every `ssh` command. That's a hassle as it often requires editing the command someone else may have given. This can be somewhat alleviated by storing keys in the same places, but that's too much to ask: for instance, I prefer not to store SSH keys in the filesystem at all.

Another way is to use an alias for when you need to use a particular key. That works when you're invoking `ssh` from the command line yourself, but doesn't work when you're using a script that includes its own call to `ssh`. So I wanted a way that works implicitly.

Implicitly. Okay. How about SSH config then? It allows specifying keys that are specific to certain hosts, be it a hostname, IP address or a subnet. What could go wrong there? Rather a lot.

* IP addresses from private ranges may be pointing at different hosts depending on the network you're in. Use hostnames then? Hostname resolution isn't always available. I happened to work in a system that obtained IP addresses programmatically. Could a properly working hostname system improve the experience of working with it? Possibly, but it still wasn't there.
* One and the same set of hosts could be providing you access to different resources depending on the key you used. And there's a popular example: GitHub. A popular myth with beginners is that SSH key is a direct alternative to a password, except with a different way of usage. That's not true: an SSH key both _tells_ a service who you are and _proves_ it, and in that sense it serves as _both_ username _and_ password. The username you use to access GitHub is actually `git`, for everyone. Executing `ssh git@github.com` allows you to see what account you're authenticated with on GitHub.
