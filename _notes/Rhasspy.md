[Website](https://rhasspy.readthedocs.io/en/latest/)

A voice assisdant toolkit that bundles together the best of what open-source projects (and a few proprietary ones) have to offer today.

## Russian language

It supports the Russian language decently with the following components:

* Porcupine for voice activation — it only has a few pre-trained English hotword models by default, but there are a some among them that sound reasonably close in Russian
    * Now that a fork of Snowboy includes training scripts for custom words, may be a better choice
* Kaldi for speech to text — just works!
* Fsticuffs for text to intent — turns a sentence into data about the command
* NodeRED and Home Assistant for intent handling — allows control over my [[Home automation]] setup and building new commands with reasonable ease without code
* Larynx for text to speech — showed up in the nick of time before I considered adapting RHVoice to work with it; has a few speech defects, but generally good

## Handy advice

* The sounds that signal activation and end of recognition delay subsequent steps, therefore are best kept small
    * I learned that the hard way by first putting sound effects by R2D2 in Star Wars — seemed brief at first, the delay was barely noticeable originally, but over time the annoyance added up to rather a lot.
    * I found a recording of a few keypresses on a mechanical keyboard and cut out a single key **press** and **release** for start and end of recognition respectively — yielding an impression that it records commands with a tape recorder from the olden days. Cool *and* quick!
* Add some sentences to stop false positives from doing anything. Attach them to a name of the intent that does not have a handler. Phrases such as "stand down", "ignore that", "not you", etc.
    * You *can* add responses later though, phrases like "okay", "got it", "[nop nop nop](https://en.wikipedia.org/wiki/NOP_(code))" and the like — until they get annoying anyway 🙂
* I happen to have a particularly badmouthing friend, it was a lot of fun to teach the assistant to respond to him in kind, he himself also guided the process.
