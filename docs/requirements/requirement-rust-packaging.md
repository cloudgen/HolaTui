**file**: docs/requirements/requirement-rust-packaging.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-packaging`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file owns the crate identity and how a person builds and installs HolaTui. Lifecycle command strings stay on `requirement-rust-cli-interface`. The menu rows that run them stay on `requirement-rust-tui`.

### 1.1 Human-facing

**In one sentence:** The package is the cargo crate `holatui` at version 1.0.0, and the program you run is `hola-tui`.

## 2. Core Rules (Mandatory)

1. **Manifest.** `Cargo.toml` **MUST** set `name` to `holatui`, `version` to `1.0.0`, `edition` to `2021`, `license` to `MIT`, and authors to `Wilgat Wong <wilgat.wong@gmail.com>`.
2. **Binary.** The only binary target **MUST** be `hola-tui` with path `src/main.rs`.
3. **Version SSOT.** `Cargo.toml` `version` and `src/identity.rs` `VERSION` **MUST** be the same string. `hola-tui version` **MUST** print `HolaTui` plus that string.
4. **Identity constants.** `src/identity.rs` **MUST** hold `APP_NAME` `HolaTui`, `CONSOLE_NAME` `hola-tui`, `CRATE_NAME` `holatui`, `AUTHOR_NAME` `Wilgat Wong`, `AUTHOR_EMAIL` `wilgat.wong@gmail.com`, `HOMEPAGE` `https://github.com/cloudgen/HolaTui`, `DOWNLOAD_URL` empty, `BASIC_USAGE` `hola-tui hello`, `LANG_ENV` `HOLATUI_LANG`, and `APP_DIR` `HolaTui`.
5. **Dependencies.** Direct dependencies **MUST** be `crossterm` and `unicode-width`. There **MUST NOT** be a Python package, a `pyproject.toml`, or a pip dependency.
6. **Install.** From this tree the install command is `cargo install --path .`. When the crate is on the registry the install command is `cargo install holatui`. Neither command uses sudo.
7. **Homepage.** The forge URL **MUST** be `https://github.com/cloudgen/HolaTui`. That is the repository the user named.
8. **No wrapper script.** `build.sh` **MUST** be absent. Build with `cargo build --release`. Test with `cargo test --offline -- --test-threads=1`. Clean with `cargo clean`. Those commands **MUST NOT** upload to a package index and **MUST NOT** push git.
9. Actor / role / subject / approver: **considered**. No dest machine. No approver.
10. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Manifest** | `Cargo.toml` |
| **Lockfile** | `Cargo.lock` |
| **Identity** | `src/identity.rs` |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** Two version strings that disagree are a defect.
- **Intentional:** The crate name and the console name are different and both are fixed here.
- **Anti-fragile:** A checkout installs with `cargo install --path .` without a registry.
- **Over-protect:** Cargo is the only build entry. This package does not push.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Rename the crate to `HelloTui` or the binary to `hello-tui`.
- Add a pip or setuptools manifest.
- Point the homepage at a repository the user did not name.
- Add a wrapper that uploads or runs `git push`.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | `Cargo.toml` name, version, edition, license, and binary match rules 1 and 2 |
| AC-2 | `src/identity.rs` `VERSION` equals the manifest version |
| AC-3 | `build.sh` is absent |
| AC-4 | No `pyproject.toml` remains |
