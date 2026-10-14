**file**: docs/requirements/requirement-rust-cli-interface.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-cli-interface`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file owns the typed verbs and the decision to open the text menu. The menu picture stays on `requirement-rust-tui`. The welcome sentence stays on `requirement-domain-holatui`.

### 1.1 Human-facing

**In one sentence:** `hola-tui` with no words on a terminal opens the menu, and `hola-tui hello` prints the welcome line without that menu.

## 2. Core Rules (Mandatory)

1. **Binary.** The program name **MUST** be `hola-tui`. There is no `python -m` entry.
2. **Verbs.** The only product verbs are `help`, `version`, `about`, `hello`, `self-install`, `version-check`, `self-update`, and `self-uninstall`. `language`, `join`, and `list-videos` are not verbs.
3. **Empty argv.** On a terminal, empty argv **MUST** open the text menu and return 0 when the person chooses Exit. Off a terminal, empty argv **MUST** print help and return 0. It **MUST NOT** wait.
4. **hello.** `hola-tui hello` **MUST** print the welcome sentence and return 0. It **MUST NOT** draw the menu.
5. **version.** `hola-tui version` and `hola-tui --version` **MUST** print `HolaTui <version>` and **MUST NOT** call cargo and **MUST NOT** draw the menu.
6. **about.** On a terminal, `hola-tui about` **MUST** open the about page on the text screen. Off a terminal, it **MUST** print that page on stdout and return 0. There is no `--json`.
7. **help.** `help`, `--help`, and `-h` **MUST** print usage and return 0. They **MUST NOT** draw the menu.
8. **Cargo verbs.** `version-check` runs `cargo search holatui --limit 1`. `self-update` runs `cargo install holatui --force`. `self-install` runs `cargo install holatui`. `self-uninstall` runs `cargo uninstall holatui` and on the command line **MUST** require `--force`. Without `--force` the program **MUST** return non-zero and **MUST NOT** run cargo. `--force` on any other verb **MUST** return non-zero. These verbs **MUST NOT** draw the menu, **MUST NOT** use sudo, and **MUST NOT** use pip.
9. **Unknown verb.** An unknown verb **MUST** print `ERROR: Unknown verb '<token>'.` and a next step `hola-tui help — verbs: ...`, and **MUST** return 1.
10. **Quiet peek.** Before the logger is constructed, a small argv walk **MUST** decide whether this run opens the text screen. The runs that open it are empty argv on a terminal and `about` on a terminal.
11. Actor / role / subject / approver: **considered**. No dest machine. No approver.
12. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Binary** | `hola-tui` |
| **Parser** | `src/cli.rs` `parse` |
| **Screen gate** | `opens_text_screen` |
| **Basic usage** | `hola-tui hello` |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** Unknown verbs and a bare uninstall fail closed.
- **Intentional:** The verb list is closed.
- **Anti-fragile:** No terminal still prints help and returns 0.
- **Over-protect:** Do not add a file operand or a media flag.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Add `join`, `list-videos`, or `language` as argv verbs.
- Let empty argv off a terminal wait for a key.
- Run cargo from empty argv.
- Drop the `--force` requirement on command-line `self-uninstall`.
