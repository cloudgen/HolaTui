**file**: docs/requirements/requirement-rust-readme.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-readme`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file owns the root `README.md` as the user-facing document. The menu behavior it describes stays on `requirement-rust-tui`. Install commands stay on `requirement-rust-packaging`.

### 1.1 Human-facing

**In one sentence:** The README shows how to install `hola-tui`, what the menu looks like, and captures of that menu.

## 2. Core Rules (Mandatory)

1. **Title.** The README **MUST** title the product **HolaTui** and **MUST** say it prints a welcome message from the command line and from menu row 1.
2. **Badges.** The README **MUST** show a version badge `1.0.0`, an MIT license badge, a CIAO badge linking to `https://github.com/cloudgen/ciao`, a stars badge for `cloudgen/HolaTui`, and a Rust badge. It **MUST NOT** show a Python or PyPI badge for this product.
3. **Install.** The install section **MUST** give `cargo install --path .` from a checkout of `https://github.com/cloudgen/HolaTui.git` and **MUST** say `cargo install holatui` is the registry command. It **MUST NOT** document `pip install`.
4. **Menu picture.** The README **MUST** show the English front board with rows 1 hello, 3 system-log, 6 self-management, 7 language, and 9 Exit, the system-log board (31, 32, 33, 0), the language board (71–83 and 0), and the self-management board (62–67 and 0). Self-management notes **MUST** say cargo, not pip. The frame **MUST** use `╭`, `╮`, `│`, `╰`, `╯`, and the status line **MUST** name `HolaTui 1.0.0`.
5. **Usage.** The usage section **MUST** list `hola-tui hello`, `help`, `version`, `about`, `version-check`, `self-update`, `self-install`, and `self-uninstall --force`, and **MUST** state the cargo command each lifecycle verb runs.
6. **Screenshot honesty.** The README screenshot section **MUST** show captures of this program: the thirteen front boards, the language board, the self-management board, the system-log board, and the about page. Those captions **MUST** say row **1** is hello. The README **MUST NOT** present the older join pictures as the live menu.
7. **No harness dump.** The README **MUST NOT** list skills, molds, or the agent inventory.
8. Actor / role / subject / approver: **considered**. No dest machine. No approver.
9. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **File** | `README.md` |
| **Version badge** | 1.0.0 |
| **Stars target** | `https://github.com/cloudgen/HolaTui` |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** A live menu picture is a capture of this program, and row 1 on it is hello.
- **Intentional:** The fenced menu in the README is the live board.
- **Anti-fragile:** Install works from the checkout when the registry name is not published yet.
- **Over-protect:** The README does not teach the agent OS.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Restore a PyPI install block.
- Describe the live menu PNGs as the old join menu.
- Point the Stars badge or the clone URL at a repository other than `https://github.com/cloudgen/HolaTui`.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | README title and version badge say HolaTui 1.0.0 |
| AC-2 | Install commands are cargo commands |
| AC-3 | Four menu boards are shown and row 1 is hello |
| AC-4 | Screenshot text says the pictures are HolaTui captures and row 1 is hello |
