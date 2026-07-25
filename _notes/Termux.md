---
---

An Android application that provides a runtime environment for software written for GNU/Linux that can run on Android's Linux kernel.

It allows Android users to tap into an _enormous_ collection of existing Linux software to perform functions that are not adequately served by applications built specifically for Android.

It features a package management system typical for Linux, presently based on dpkg/apt.

Software highlights:

- `file` is a utility that identifies the type of data inside a given file, should you ever run into an unfortunate situation to get a file without an extension that would indicate what to open it with
- `maxima` is a powerful tool for solving some kinds of mathematical problems that are more _tedious_ than hard, featuring automatic differentiation, limit calculation, equation solving and calculation
- `yt-dlp` (installed via `pip`) is a powerful utility suite for downloading media from YouTube and a large list of other websites that don't offer a proper download function
    - YouTube videos in particular it can convert to other formats, download and save only their audio tracks, embed thumbnails and video metadata into resulting files
    - Requires `ffmpeg` for media conversion, which is a powerhouse in itself
- `aria2` allows for rather reliable downloading over less than reliable internet channels
- `ruby`, `rust` and `python` provide full proper environments to build and run programs in respective languages, even through REPLs, where available, and this list of languages is not exhaustive
    - REPLs in particular allow for some everyday computations like calculating dates (things like "N days from now"), numbers, transforming data between formats
- `termux-api` package offers a set of `termux-*` tools for interfacing with Android, allowing for of simple automations powered by battle-tested Linux software
    - A useful accessory for this is `jq`, since outputs of `termux-*` utilities are usually in JSON
- `man` may not necessarily output the manual page for the specific version of software you have on your machine, but if you're looking to comfortably read the manual on another device, it'll do the job a lot of the time, thanks to Termux translating vertical dragging into vertical cursor movements, which makes it seem like Linux pagers are touch-aware (they aren't, but it _feels_ like they are)
- `micro`, `vim` and `emacs` will provide you with an editing experience about on par with what you can get with text-mode tools on the desktop
    - Combine that with language runtimes mentioned above and you could feasibly build software on your phone — not the most comfortable experience probably, but available (possibly comfortable with the right accessories)
- `fzf` provides menus that are surprisingly usable on touchscreens with adaptations made in Termux

The list is probably very far from exhaustive, but it's what I could quickly think of off the top of my head.

## Integration

One feature I use a lot is _URL sharing_ to Termux, which invokes a script at a certain fixed path, feeding the shared URL as an argument. What you do with that URL is up to you, bearing in mind the capabilities listed above you can imagine how powerful this could get.

At one point I built a very simple menu system for it that, given a URL, asks you what you want to do with it with an `fzf`-based menu. The script is primitive enough that I won't show any code here, but you can leverage the fact that Linux can be pretty liberal with script filenames, they can absolutely be human-readable, so command names can double as menu labels. Just mind the quotes. Use `shellcheck` if you can't.