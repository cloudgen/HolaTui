# Requirements index

**Product:** HolaTui (Rust CLI — text menu on a terminal; `hello` prints a welcome line, menu row 1 shows it)
**Workspace state:** Specialized product law (left genesis); **software-development** class; **cargo** install (not a shell online installer).
**Product version:** **1.0.0** (align `Cargo.toml` `version` and `src/identity.rs` `VERSION`, and the root `README.md` Version badge)
**Updated:** 2026-10-12

| ID / key | Title | Area | Status | Path | Updated |
|----------|-------|------|--------|------|---------|
| requirement-class-software-dev | Software-development class law + residual stack (Rust, cargo) | class | Active | `requirement-class-software-dev.md` | 2026-10-12 |
| requirement-domain-holatui | Domain surface SSOT (welcome line: typed `hello`, menu row 1, help, about) | domain | Active | `requirement-domain-holatui.md` | 2026-10-12 |
| requirement-rust-about | About page: identity, host check, star box. No `--json` | rust | Active | `requirement-rust-about.md` | 2026-10-12 |
| requirement-video-ffmpeg-pipeline | Retired. No encoder, no concat, no media publish | video | Retired | `requirement-video-ffmpeg-pipeline.md` | 2026-10-12 |
| requirement-rust-cli-interface | CLI entry, typed verbs, empty-argv menu on a terminal and help off a terminal | rust | Active | `requirement-rust-cli-interface.md` | 2026-10-12 |
| requirement-rust-cli-logging | StatusLog construct in `main` before the parser; quiet on the text screen | rust | Active | `requirement-rust-cli-logging.md` | 2026-10-12 |
| requirement-rust-tui | Text menu: hello, system-log, language, self-management, Exit. Path word is selected by the language requirement. Default is `Path`. Menu columns are display columns | rust | Active | `requirement-rust-tui.md` | 2026-10-12 |
| requirement-rust-cli-language | Menu language: front row 7, codes 71–83, leaf `~/.local/HolaTui/language`. `language` is not an argv verb | rust | Active | `requirement-rust-cli-language.md` | 2026-10-14 |
| requirement-rust-modules | Module map for the Rust ship unit | rust | Active | `requirement-rust-modules.md` | 2026-10-12 |
| requirement-rust-coding-style | Rust style for this crate. No media publish | rust | Active | `requirement-rust-coding-style.md` | 2026-10-12 |
| requirement-rust-packaging | `Cargo.toml` / version / binary `hola-tui` | rust | Active | `requirement-rust-packaging.md` | 2026-10-12 |
| requirement-rust-project-structure | Repository layout and `src/` modules | rust | Active | `requirement-rust-project-structure.md` | 2026-10-12 |
| requirement-rust-readme | Root user document: sections, badges, menu picture | rust | Active | `requirement-rust-readme.md` | 2026-10-12 |
| requirement-rust-error-handling | Fail-closed errors; operator-readable next step | rust | Active | `requirement-rust-error-handling.md` | 2026-10-12 |
| requirement-runtime-prerequisites | Host `rustc` and `cargo` to build. No root auto-install. No media tool | runtime | Active | `requirement-runtime-prerequisites.md` | 2026-10-12 |

## Intentionally absent (by design)

| Surface | Status on HolaTui |
|---------|-------------------|
| Shell online install / `SCRIPT_URL` / Type O empty-argv install-ensure / `curl\|sh` | **Absent** |
| Shell local `install` / `uninstall` / shell self-update | **Absent** (cargo package) |
| Type 1 sudoers / root elevation allowlist | **Absent** |
| Automatic companion `.sha256` channel integrity law | **Absent** |
| OpenCV / duration probe / FFmpeg | **Absent** |
| Python package, `pyproject.toml`, `python -m`, pip lifecycle | **Absent**. Lifecycle is cargo |
| Second Active `requirement-domain-*` | **Forbidden** while `requirement-domain-holatui` is Active |
| Front row 2, cut / speed / boomerang, `list-mp4`, `join`, `list-videos` | **Absent**. Front row 1 is `hello` |
| `--json` | **Absent** |
| Actor-role requirement file | **Absent**. Class residual is no dest approver |

**Install mode:** **cargo** (`hola-tui` binary). Not a shell installer.

**Cargo lifecycle:** claimed. Rows 64–67 and the typed verbs `version-check`, `self-update`, `self-install`, and `self-uninstall` are `requirement-rust-cli-interface` and `requirement-rust-tui`. They use `cargo`. They do not use `sudo` or `pip`. Empty argv does not run them.

**Logger:** required. `main` in `src/cli.rs` writes `StatusLog::new(...)` before argument dispatch. The text screen passes quiet so status lines stay off the frame.

**Rules for agents:**

1. Treat rows above as the **live product-law inventory** for HolaTui.
2. **Do not invent** additional `requirement-*.md` paths — verify on disk and add a registry row in the same change when creating one.
3. Product source comments cite **only** these live requirement files.
4. This versioned surface lists **requirement rows only**.
5. Keep Status and Path in sync with each file’s header when status changes.
6. **Class gate:** software-development requires exactly one Active `requirement-class-software-dev.md`.
7. **Domain SSOT:** exactly one Active domain file (`requirement-domain-holatui`).
8. **Do not introduce** a shell installer or Type 1 elevation without an explicit user order and a registry update.
9. **Do not** treat cargo rows 64–67 as a reason to add a shell installer. **Do not** mark those cargo rows absent.
10. The text-menu picture stays on `requirement-rust-tui`. A language change does not drop the frame, the path line, the clock, or rows 1, 3, 6, 7, and 9.
