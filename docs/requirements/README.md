# Requirements

Authoritative specialized product law for **HolaTui** lives here.

**Current state (2026-10-12):** Specialized **software-development** product. Left genesis. Registry is populated — see `index.md`. Fourteen Active requirements. One Retired requirement. Product version is **1.0.0**.

## Product identity (summary)

| Field | Value |
|-------|--------|
| Product | `HolaTui` |
| Crate | `holatui` |
| Version SSOT | **`1.0.0`** (`Cargo.toml` + `src/identity.rs` `VERSION`) |
| Product README SSOT | Root `README.md` |
| Ship surface | Rust crate; binary **`hola-tui`** |
| Install mode | **cargo** (`cargo install --path .` from this tree; `cargo install holatui` when the crate is published) — not a shell installer |
| Domain surface | `requirement-domain-holatui` — welcome line (`hello`), help, about |
| Text menu | `requirement-rust-tui` — front rows hello, system-log, language, self-management, Exit. Default path word is `Path` |
| Menu language | `requirement-rust-cli-language` — row 7, thirteen codes, leaf `~/.local/HolaTui/language`. `language` is not an argv verb |
| Status logger | `requirement-rust-cli-logging` — `StatusLog::new` inside `main` before dispatch |
| Modules | `requirement-rust-modules` |
| Runtime tools | **rustc** and **cargo** to build. No external media tool |

## Class requirement gate

| Class | Required class file |
|-------|---------------------|
| software-development | `requirement-class-software-dev.md` (**Active**) |
| genesis-template | N/A — this workspace is no longer genesis for product law |

## Purpose

- **Plan** designs work by reading and updating these docs.
- **Implement** delivers code that **traces** to these requirements.
- **Review** verifies delivery against requirements and CIAO checklists.
- Product **README** must stay honest with this law (install, features, version).

## Layout

| Path | Role |
|------|------|
| `docs/requirements/index.md` | Registry of all requirements — keep in sync |
| `docs/requirements/requirement-*.md` | CIAO-style project requirements |

## Status values

Typical: `draft` · `Active` · `approved` · `in-progress` · `done` · `deprecated` · `superseded`

## Rules

1. Never invent paths — verify on disk.
2. Class files only via class process; non-class via create-specific process.
3. Never dump harness inventories into this versioned surface.
4. Online shell install and Type 1 elevation stay **absent** unless product mode is explicitly changed.
5. Sole domain SSOT: `requirement-domain-holatui.md`.
6. When changing the welcome line or the menu rows: update the domain and TUI requirements **and** root `README.md` in the same change.
7. Version SSOT in `Cargo.toml` and `src/identity.rs` and the README Version badge must match when a release is claimed.
