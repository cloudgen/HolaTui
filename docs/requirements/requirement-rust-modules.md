**file**: docs/requirements/requirement-rust-modules.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-modules`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file names the Rust modules that implement HolaTui and which requirement owns each module’s behavior. It replaces a class-and-inheritance map. There is no Python package.

### 1.1 Human-facing

**In one sentence:** Each behavior lives in one module under `src/`, and `hola-tui` starts at `src/main.rs`.

## 2. Core Rules (Mandatory)

1. **One crate.** The library crate **MUST** be `holatui`. `src/lib.rs` **MUST** declare the modules in the table below and no Python module.
2. **One binary.** `src/main.rs` **MUST** call `holatui::cli::main` and exit with that code.
3. **Ownership.** A module **MUST NOT** take over a behavior owned by another row.

| Module | Owns | Law |
|--------|------|-----|
| `src/identity.rs` | Product name, version, console name, crate name, author, homepage, empty download URL, verb list | `requirement-rust-packaging` |
| `src/cli.rs` | Argument parse, verb dispatch, operator errors, quiet peek | `requirement-rust-cli-interface`, `requirement-rust-error-handling` |
| `src/tui.rs` | Text-screen session, help text, view-log, clear-log, log-folder questions | `requirement-rust-tui` |
| `src/painter.rs` | Frame glyphs, path line, clock, display columns, row tables | `requirement-rust-tui` |
| `src/model.rs` | Focus, typed buffer, key actions | `requirement-rust-tui` |
| `src/session.rs` | Board loop used by tests and by the kind callback | `requirement-rust-tui` |
| `src/language.rs` | Leaf load and save, `HOLATUI_LANG`, path label | `requirement-rust-cli-language` |
| `src/lang_catalog.rs` | Thirteen language strings | `requirement-rust-cli-language` |
| `src/logger.rs` | `StatusLog` | `requirement-rust-cli-logging` |
| `src/system_log.rs` | List, read, and clear log files | `requirement-rust-tui`, `requirement-rust-cli-logging` |
| `src/self_manage.rs` | Cargo argv for rows 64–67 and the welcome sentence helper | `requirement-rust-cli-interface`, `requirement-domain-holatui` |
| `src/about.rs` | About page text | `requirement-rust-about` |
| `src/check_system.rs` | Host-check reads and install kind | `requirement-rust-about` |
| `src/width.rs` | Display columns, ambiguous width 1 | `requirement-rust-tui` |

4. **No media module.** There **MUST NOT** be a module whose job is joining, listing, or encoding media.
5. Actor / role / subject / approver: **considered**. No dest machine. No approver.
6. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Entry** | `src/main.rs` |
| **Library root** | `src/lib.rs` |
| **Tests** | `tests/contract.rs` links the library crate |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** The binary does not parse arguments itself.
- **Intentional:** The table is the module map.
- **Anti-fragile:** A language catalog change does not move the frame painter.
- **Over-protect:** Do not fold the logger into the about page.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Reintroduce `src/HelloTui/` or a `python -m` entry.
- Add a join or FFmpeg module.
- Move the welcome sentence off `requirement-domain-holatui`.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | `src/lib.rs` declares every module in the table |
| AC-2 | `src/main.rs` exits with `holatui::cli::main` |
| AC-3 | No Python ship unit remains under `src/` |
