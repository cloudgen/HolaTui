**file**: docs/requirements/requirement-rust-coding-style.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-coding-style`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file is the Rust style for the HolaTui crate. Product behavior stays on the peer requirements. This file says how that code is written.

### 1.1 Human-facing

**In one sentence:** The crate is Rust 2021, operator errors say what to type next, and the program does not publish media.

## 2. Core Rules (Mandatory)

1. **Edition.** Source **MUST** compile as Rust edition 2021. The compiler floor is `rustc` 1.74.
2. **Module notes.** Each `src/*.rs` file **MUST** open with a module comment that names its job. A file that implements product law **MUST** name the live `requirement-*.md` it follows.
3. **Operator text.** Text the person must act on **MUST** go through `cli::report` for command-line failures: `ERROR: ` on stderr, then `   Next: ` on stderr. Menu status text stays on `requirement-rust-tui`.
4. **No silent tool failure.** A missing external tool that a verb needs **MUST** surface as a non-zero cargo result or an empty host-check value. It **MUST NOT** be reported as success.
5. **Width.** Menu columns **MUST** use `unicode-width` with ambiguous width 1 (`src/width.rs`). Wide and fullwidth characters count as 2.
6. **No `id` probe.** Root detection **MUST** use the effective user id from the C library. It **MUST NOT** spawn `id`.
7. **No media publish.** The crate **MUST NOT** stage, move, or publish a media file. There is no `shutil.move` equivalent in this program.
8. **Match the file.** A change **MUST** follow the types and names already in that file. Do not introduce a second logger, a second menu painter, or a second identity module.
9. **Protection zones.** Frame glyph constants and other marked protection zones **MUST** stay until the user orders a change to that zone.
10. Actor / role / subject / approver: **considered**. No dest machine. No approver.
11. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Edition** | 2021 in `Cargo.toml` |
| **Error helper** | `src/cli.rs` `report` |
| **Width** | `src/width.rs` |
| **Effective uid** | `src/logger.rs` `effective_uid` |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** Failures the operator can fix name the next command.
- **Intentional:** One module comment states why the file exists.
- **Anti-fragile:** Display width does not assume one byte is one column.
- **Over-protect:** Protection zones stay verbose.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Add a media publish path.
- Spawn `id`, `python`, or `pip` from this crate.
- Strip protection-zone comments to shorten a file.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | `Cargo.toml` edition is 2021 |
| AC-2 | Command-line failures use `ERROR:` and `   Next:` |
| AC-3 | No media publish helper exists in `src/` |
