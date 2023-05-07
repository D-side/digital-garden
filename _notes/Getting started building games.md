---
---

Back when I used to hang around [GameMaker](https://gamemaker.io/) user groups (around 2008-2013) I answered variations of this question numerous times, but only years later, in 2022, I came up with a response that's useful, reasonably comprehensive and doesn't come off as smug or demeaning (I wasn't especially diplomatic back then, which I'm not proud of, but it happened).

## Question

> Hi everyone! I have a question about game development — a 12yo kid came up with a concept for a game (idea, visualistion, scenario, etc.) and is now asking where to go with it next, who'd be interested. Where would he look for developers that might take something of the sort?

## My answer (2022)

As much as I'd like to avoid ruining a child's dream and coming off as rude (I was once in similar shoes and talked to dozens of other people with a similar mindset) — the path ahead is tough and practically never ends in an actual functioning game.

At this age there's absolutely zero sense of implementation complexity, market situation, intermediate stages of development (i. e. the kid might have a vision for what the game should look like at the end, but not how to get there).

So in cases like this I recommend picking up some simple game building software and building a prototype with that, just to see if the concept works at all. _NB: sometimes the prototype doesn't even need to be a videogame, a tabletop may work just as well and that requires a lot less skills and resources._

This process produces at least two kinds of useful results: (1) skills required to evolve that or any future concepts and (2) materials for a showcase to those who could potentially help.

## Comments (2023)

The answer is still valid, but I thought I'd add some specifics, as without them the answer kinda looks like "a dead end" (unless the "tabletop advice" resonated _really_ well) and so it's hard to take seriously. It's like that for a reason, however — most initiatives of this kind end in nothing, and this answer very much reflects that.

Still.

### Tabletop equipment

If we're talking tabletops, it of course hinges on previous tabletop experience. For some it's just a race of moving pieces along a mostly-linear map as dictated by rolls of six-sided dice, or something like chess which requires merely pieces and a board. Childhood experiences can vary, and these are largely all I ever thought of tabletops.

Only years later I got to experience just how massive the tabletop landscape is.

- In place of boring abstract bell-like colored pieces the game might come with full-on plastic figurines — today **3D printing** has evolved sufficiently that it is now possible to draw something up in Blender and not spend a fortune getting it done out of plastic.
- Many games rely on **cards** — which aren't that hard to implement by using normal household color printers on printable card stock, and to draw the cards themselves I would probably pick [Inkscape](https://inkscape.org/) as a good combination of vector graphics and being free & open-source. Supplement that with a cutting mat, metal ruler and a good knife and you'll have a set of decent cards in no time. You can even get protector bags to make them feel more premium if you want.
- Various **plastic tokens** can be purchased online; might be a good idea to go with something abstract and assign meaning to the tokens in the rules, so that the same tokens can be used in other prototypes as well.
- Rather than relying on item counts or coin-like means of counting resources, the tabletop community offers many kinds of **counters**, probably the simplest of which can be done out of paper and, optionally, paperclips.

### Videogame

Popular projects have so massive lists of credits that it might seem that building a videogame is straight up an impossible undertaking for a single person. Pleased to state that it's not the case and reasonably recent examples exist:

- Eric Barone aka ConcernedApe built **Stardew Valley**: the game itself, its graphics, sound and music all by himself; initial versions anyway, massive commercial success allowed him to acquire some help from others (it may be 7 years old technically, but it's still being updated)
- Arsi Patala aka Hakita built a substantial part of **ULTRAKILL** himself, see [the video log](https://www.youtube.com/playlist?list=PLFG57rtsH8Jso3qfd5eO6egyBtW3nyvir) of what the evolution of the game looked like — he eventually found a publisher and additional help (as of right now it's technically in Early Access, but it has the level of polish well beyond a final product of his titan-sized competitors)

#### Engine

[GameMaker](https://gamemaker.io/) seems to keep evolving to this day, and may still be a decent choice that does not require learning of a full-on programming language. That said, in my experience the "codeless" (or as the industry has grown to call it, "no-code") part of the software quickly reaches its limit and investing time into exploring an actual language saves time in the long run.

I've heard about [MIT App Inventor](https://appinventor.mit.edu/), but it's entirely cloud-based and may not even exist by the time you're reading this (if a long time passed since 2023). And I have zero hands-on experience building games with it. It does, however, use a [Scratch](https://scratch.mit.edu/)-like interface for building algorithms, which I believe is just the right amount "into the future" where we'll hopefully abolish programming languages as text and start working directly with structures — but I digress.

[Godot](https://godotengine.org/) is another solid contender — it recently got rid of the no-code parts of it because they probably ran into a GameMaker'ish situation that they weren't making the engine more approachable. The engine itself, however, is solid enough that it's picked for serious game production, while being, again, free & open-source. It even has a decent system for asset distribution found in more prominent commercial game engines like Unity and Unreal — which may be more to your liking, but be sure to check the "fine print" they will impose on your game should you pick them.

#### Assets

🧠 Mind you, you **don't** want highest quality from the start. You need just enough to keep working on the game. As the game evolves, you will very likely want to change the style of it, but you probably want something working to try the styles out on. Also, going for realism isn't necessarily the best choice: it's expensive both to produce and run, ages quickly and does not stand out (and is actually one of my main [[Videogame woes]]).

✏️ If you can draw, the graphics is largely a solved issue. If you can't — well, some graphics you can get from [Kenney](https://kenney.nl/), who graciously releases (most of?) his cutesy-looking art under Creative Commons Zero, which is for most intents and purposes "public domain", meaning it's perfectly legal to do just about anything with it: use and redistribute in commercial games, modify if needed, etc. Do feel free to toss a coin in his direction though, he deserves it.

🔊 Sounds you can either record (and post-process using something like [Tenacity](https://tenacityaudio.org/), in the very least removing background noise) or synthesize (e. g. with [Bfxr](https://www.bfxr.net/)). Or ignore, for starters.

🎶 Good royalty-free music can be difficult to find. One composer I'm aware of that [offers nice royalty-free music](https://incompetech.com/music/royalty-free/music.html) is Kevin McLeod. If you insist on being part of that production process, you could try generating melodies in [Abundant Music](https://pernyblom.github.io/abundant-music/), exporting as MIDI and importing them into [LMMS](https://lmms.io/) or [SunVox](https://www.warmplace.ru/soft/sunvox/).

None of these tools are by any means special or mandatory in any way. They're just easy enough to pick up for someone not immersed into any of the respective crafts. And they don't magically give magnificent results, so if you are already accustomed to certain tools in any of the above areas, feel free to keep using those.

> [[FAQ]]
