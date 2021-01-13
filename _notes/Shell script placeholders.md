---
---

[[Techwriting]] I see this so often that it's gotten painful.

Please, when you're posting snippets of code for the shell, **use variables for placeholders (sections that have to be replaced by the user)**.

It's easy too!

```sh
# Somewhere near the start:
export SOMETHING="Replace me!" # Significance
```

```sh
# Throughout the guide
some_obscure_command $SOMETHING
another_command -x --foo $SOMETHING
```

As a bonus, you get to give your placeholders meaningful names! And the commands from the guide can be copied as-is, saving your readers' time.

You're probably wondering which placeholder to use in whatever you're writing anyway, if for a split second. I commonly see two options that aren't that great:

* *Your value* (that value that *you* use). The reader has to identify it as a placeholder, which is not always easy, especially if it's a **part** of the language-level value (say, a piece of the filesystem path). Unless the value is *very* likely to be the same as the reader's, leaving it as-is is not a great idea.
* Meaningless and probably syntactically invalid generic placeholder like `...`; they don't always stand out that much, and when there are multiple values involved, you need **multiple** placeholders, and finding several placeholders of this style is usually not easy.

...and ultimately both require manual replacements. And manual replacements are a drag.

* They require navigating to the exact point of replacement, with either a mouse, keyboard or a veeeeery caaaareful finger gesture. It doesn't sound that bad until you have to do this a dozen times per script.
* They're rather error-prone. If two places in the code should be replaced with the same value, you can use the same variable and have the user define it beforehand **once**, this way getting different values where not expected is **practically impossible**.

Now, I have heard some authors say that they specifically **require manual replacements to encourage deeper understanding of the material** they're presenting. In my experience **this doesn't help**. Often times a particularly lazy reader will just bug someone more knowledgeable who's probably going to fix that bit without explaining how it works. We can all be respectful to each other's time and stop doing it.
