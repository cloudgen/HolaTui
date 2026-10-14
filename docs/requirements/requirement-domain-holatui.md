**file**: docs/requirements/requirement-domain-holatui.md
**Status**: Active (Version 1.0.0)
**Area**: domain
**Key**: `requirement-domain-holatui`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file is the only Active domain surface for HolaTui. The product prints one welcome sentence. The typed verb `hello` prints that sentence in the terminal and does not draw the menu. Menu row **1 hello** shows the same sentence on the text menu.

Join, file listing, and an external encoder are not part of this product.

### 1.1 Human-facing

**In one sentence:** `hola-tui hello` prints `Welcome to HolaTui 1.0.0.` and the menu’s first row shows that same line.

| Includes | Excludes |
|----------|----------|
| The welcome sentence, help, and the about page | Joining media, listing files, FFmpeg |
| Row 1 `hello` | A second domain file |

## 2. Core Rules (Mandatory)

1. **One domain file.** This file is the only Active `requirement-domain-*`. 
2. **Welcome sentence.** The sentence **MUST** be `Welcome to HolaTui <version>.` `<version>` is `VERSION` in `src/identity.rs`, the same string as `Cargo.toml`.
3. **Two surfaces.** `hola-tui hello` **MUST** print that sentence and **MUST NOT** draw the menu. Menu row 1 **MUST** show that sentence on the result page. Empty argv on a terminal **MUST** open the menu and **MUST NOT** print the sentence by itself.
4. **No media.** `join` and `list-videos` **MUST** be unknown verbs and **MUST** exit non-zero. The program **MUST NOT** scan the folder for media and **MUST NOT** call an encoder.
5. **About domain line.** The about identity block **MUST** include `Domain: Show a welcome message`.
6. Actor / role / subject / approver: **considered**. No dest machine. No approver.
7. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Sentence** | `Welcome to HolaTui 1.0.0.` |
| **Typed verb** | `hola-tui hello` |
| **Menu** | Row **1** `hello` |
| **Version** | `1.0.0` |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** An unknown media verb fails closed.
- **Intentional:** One sentence, two ways to see it.
- **Anti-fragile:** The sentence does not depend on a media tool.
- **Over-protect:** Do not put join back on row 1.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Replace row 1 with join, list, or an encoder step.
- Change the welcome sentence without updating this file, the TUI requirement, and the README together.
- Add a second Active domain file.
