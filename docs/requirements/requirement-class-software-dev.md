**file**: docs/requirements/requirement-class-software-dev.md
**Status**: Active (Version 1.2.0 – HolaTui software-development class law + residual stack)
**Area**: class
**Key**: `requirement-class-software-dev`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

Declare this workspace as a software-development project class and hold the residual collection of software-engineering stack facts not already owned by more specific Active peer requirements: primary language, toolchain policy, package and build tooling, and runtime OS family.

This file is class law plus the residual SSOT. It is not a second copy of the welcome sentence, the text menu, the logger, the module map, packaging tables, or error-handling tables.

### 1.1 Human-facing

**In one sentence:** HolaTui is a Rust program, built with cargo, and this file points at the requirement that owns each other topic.

| Includes | Excludes |
|----------|----------|
| Language, compiler floor, package tool, and the residual pointer table | A second copy of the menu or the cargo command strings |
| Shell install and root elevation marked absent | A cargo lifecycle marked absent. That lifecycle is owned by the CLI and the TUI |
| One human operator. No dest approver | A new actor-requirement file |

## 2. Core Rules (Mandatory)

### 2.0 Project class membership

1. **MUST** treat this workspace as software-development (shippable software), not genesis-template and not server-maintenance.
2. **MUST** use basename `requirement-class-software-dev.md` as the sole Active class-law file for this class.
3. **MUST NOT** register an Active `requirement-class-server-maintenance.md` while the class is software-development.
4. **MUST** retain portable harness knowledge when present. Specialized product knowledge lives in this and peer `requirement-*.md` files.
5. **MUST NOT** invent hollow product docs solely to look specialized.

### 2.1 Residual collection principle

6. **MUST** treat this file as the default home for software-stack facts not owned by another Active requirement.
7. **MUST NOT** duplicate full normative tables that already live in a more specific Active requirement.

### 2.2 Programming language

8. The ship unit **MUST** be Rust. Edition is **2021**.
9. The product is **compiled**. It is not a Python package.
10. **MUST NOT** freeze the product name `HolaTui` as if it were the language name.

### 2.3 Toolchain

11. The toolchain class is **rustc + cargo**.
12. Version policy: **minimum**. `rustc` 1.74 or newer is enough for this crate’s edition and `std` features used here. A newer stable rustc is accepted.
13. Cross-compilation is **out of scope** for this requirement.

### 2.4 Package tool

14. The package tool **MUST** be cargo. The manifest is `Cargo.toml`. The lockfile is `Cargo.lock` when generated.
15. The test runner is `cargo test`.
16. This file **MUST NOT** require a secret token or a private registry password.

### 2.5 Runtime

17. Day-to-day use is a normal user on Linux. The binary does not require root.
18. Building needs `rustc` and `cargo` on `PATH`. Running `hola-tui hello` does not need a media tool.

### 2.6 Pointers

| Topic | Owner |
|-------|--------|
| Welcome sentence | `requirement-domain-holatui` |
| Text menu | `requirement-rust-tui` |
| Menu language | `requirement-rust-cli-language` |
| Typed verbs | `requirement-rust-cli-interface` |
| Logger | `requirement-rust-cli-logging` |
| About page | `requirement-rust-about` |
| Modules | `requirement-rust-modules` |
| Manifest | `requirement-rust-packaging` |
| Layout | `requirement-rust-project-structure` |
| README | `requirement-rust-readme` |
| Errors | `requirement-rust-error-handling` |
| Host tools | `requirement-runtime-prerequisites` |
| Encoder | `requirement-video-ffmpeg-pipeline` (**Retired**) |

19. Actor / role / subject / approver: **considered**. No dest machine. No approver. This file does **not** add an actor requirement.
20. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Language** | Rust 2021 |
| **Tool** | cargo |
| **Binary** | `hola-tui` |
| **Crate** | `holatui` |
| **Version** | `1.0.0` |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** Do not claim a Python runtime for this ship unit.
- **Intentional:** One class file, pointers for the rest.
- **Anti-fragile:** A newer stable rustc still builds the crate.
- **Over-protect:** Do not mark the cargo lifecycle absent.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Reclassify this workspace as genesis while these Active requirements exist.
- Move the menu picture into this file.
- Add a shell installer from this residual file.
