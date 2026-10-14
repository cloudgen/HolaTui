# CHANGELOG

All notable changes to **HolaTui** are documented here.
Version SSOT: `Cargo.toml` `version` and `src/identity.rs` `VERSION`.

## [1.0.0] - 2026-10-12

### Changed

- Product name is **HolaTui**. Crate name is `holatui`. Console program is `hola-tui`. Version is **1.0.0**.
- The ship unit is a Rust crate (edition 2021). The Python package, `pyproject.toml`, and `python -m` entry are removed.
- Typed `hello` prints `Welcome to HolaTui 1.0.0.` in the terminal and does not draw the menu.
- Front row **1** is **hello**. Choosing it shows that same welcome line on the menu.
- Menu rows **64**–**67** and the matching typed verbs call `cargo`. Command-line `self-uninstall` still requires `--force`.
- Front row **6** is **self-management**. Front row **7** is **language**.
- Menu language leaf is `~/.local/HolaTui/language`. The override environment variable is `HOLATUI_LANG`.
- The about page domain line is `Domain: Show a welcome message`. Runtime tools line is `Runtime tools: none`. Host-check fields name the Rust toolchain.
- Status lines are written by the in-tree `StatusLog`. ChronicleLogger is not a dependency.
- Homepage is `https://github.com/cloudgen/HolaTui`.
- README screenshots are captures of this menu. Row 1 is hello.

### Removed

- Join, file listing, and FFmpeg. `join` and `list-videos` are not verbs.
- pip lifecycle commands.

## [1.0.5] - 2026-10-04

Historical VideoJoin release. Kept so the earlier about-page change stays visible.

### Changed

- `about` showed one page: product identity, a host check of this computer, and a star box.
- Version was **1.0.5**. `ChronicleLogger>=1.3.1` was the Python logger floor.

## [1.0.4] - 2026-10-04

Historical VideoJoin release. The text menu, thirteen languages, and system-log board started here. Row 1 on that release was join.

## [1.0.3] - 2026-08-09

Historical VideoJoin release. Stream-copy concat with a re-encode fallback, published with `shutil.move`.

## [1.0.2] - prior

Historical VideoJoin release. Interactive two-file join with console script `video-join`.
