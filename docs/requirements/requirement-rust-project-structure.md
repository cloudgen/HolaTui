**file**: docs/requirements/requirement-rust-project-structure.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-project-structure`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file is the repository layout for HolaTui. Module jobs stay on `requirement-rust-modules`. Package fields stay on `requirement-rust-packaging`.

### 1.1 Human-facing

**In one sentence:** The program lives in `src/*.rs`, the contract tests live in `tests/contract.rs`, and product law lives in `docs/requirements/`.

## 2. Core Rules (Mandatory)

1. **Ship tree.** The repository **MUST** contain `Cargo.toml`, `Cargo.lock`, `src/main.rs`, `src/lib.rs`, and the modules named by `requirement-rust-modules`.
2. **Proof.** `tests/contract.rs` **MUST** be the automated contract suite for hello, the menu numbers, language save, cargo argv, and the about identity lines.
3. **Law.** `docs/requirements/index.md` **MUST** list every live `requirement-*.md`. Product law **MUST NOT** live under `docs/templates/`.
4. **User docs.** Root `README.md`, `CHANGELOG.md`, `SECURITY.md`, and `LICENSE.md` **MUST** name HolaTui. They **MUST NOT** tell the reader to `pip install` this product.
5. **Retired Python tree.** After the Rust tests pass, `src/HelloTui/`, `pyproject.toml`, and `tests/test_*.py` **MUST** be absent. Older join pictures under `screenshots/` and files under `sample-videos/` **MAY** remain. The README menu pictures **MUST** be captures of the HolaTui boards, and row 1 on those pictures **MUST** be hello. The README **MUST NOT** present the join pictures as the live menu.
6. **Build output.** `target/` **MUST** be gitignored. It is not source.
7. **Harness docs.** `docs/skills/`, `docs/templates/`, `docs/terminologies/`, `docs/policies/`, and `docs/human-intro/` are portable harness knowledge. This product rename **MUST NOT** rewrite them to insert HolaTui facts.
8. Actor / role / subject / approver: **considered**. No dest machine. No approver.
9. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Path | Role |
|------|------|
| `src/` | Rust ship unit |
| `tests/contract.rs` | Contract proof |
| `docs/requirements/` | Specialized law |
| `screenshots/` | Live menu captures, plus older join pictures |
| `sample-videos/` | Historical media fixtures, unused by `hello` |
| `build.sh` | Maintainer cargo wrapper |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** Two ship units in one tree is two laws.
- **Intentional:** Pictures stay so the history of the menu is visible.
- **Anti-fragile:** `target/` can be deleted and rebuilt.
- **Over-protect:** Harness folders are not a place to store this product’s name.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Put the ship unit back under `src/HelloTui/` or `src/VideoJoin/`.
- Delete `screenshots/` as part of the rename.
- Write product URLs into `docs/templates/` or `docs/skills/`.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | `src/main.rs` and `src/lib.rs` exist |
| AC-2 | `tests/contract.rs` exists |
| AC-3 | `src/HelloTui/` and `pyproject.toml` are absent |
| AC-4 | `target/` is listed in `.gitignore` |
