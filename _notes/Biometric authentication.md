---
---

The act of "proving your authenticity" (that you're who you claim to be) by disclosing your biometric data (fingerprints, facial and other features of the body) to the verifier.

It's been getting increasingly common on consumer electronics in the 2010s and was enough for a lot of folks to actually start protecting their devices from unauthorized access by default — because unlocking them became a whole lot easier.

- Do not rely on biometric auth alone, always establish backup authentication factors
- Disable in high-risk circumstances

### Pros

- Quick
- Reasonably resistant to low-effort attacks: where password may be vulnerable to something as simple as camera recordings or residue/wear examination, biometrics are more difficult to replicate

### Cons

- Unlike a cryptographic key (or anything it can be derived from, e. g. password or pattern) it **cannot be changed** in an event of a leak
  - fingerprints these days can be replicated with photography and 3D printing, both technologies are widely available
- You may be forced to authenticate when you don't want to
  - be it in an overly trusted environment, such as letting a family member use your device
  - or under a threat of physical violence, such as from criminals or law enforcement
- They may change in an event of a trauma, so a backup authentication method is an absolute necessity
  - the trauma can be as mundane as exposing your fingertip to a hazardous chemical of some sort, like an especially aggressive cleaning solution
- Can be unreliable in unusual conditions, e. g. wet hands

> [[Security advice]]
