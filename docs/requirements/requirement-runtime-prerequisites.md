**file**: docs/requirements/requirement-runtime-prerequisites.md
**Status**: Active (Version 2.0.0)
**Area**: runtime
**Key**: `requirement-runtime-prerequisites`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file names what must already be on the machine to build and run HolaTui. The product does not install a compiler and does not install a media tool.

### 1.1 Human-facing

**In one sentence:** You need `rustc` and `cargo` on `PATH`. No encoder and no Python package are required.

| Includes | Excludes |
|----------|----------|
| `rustc` 1.74 or newer and `cargo` on `PATH` | A claim that HolaTui installs the Rust toolchain |
| Linux as the primary host | Root auto-install of rustup, FFmpeg, or Python |
| An empty runtime-tools line on the about page | A PATH probe that blocks the front board |

## 2. Core Rules (Mandatory)

1. **Toolchain.** Building and installing this crate **MUST** require `rustc` and `cargo` on `PATH`. The edition is 2021. `rustc` **MUST** be 1.74 or newer.
2. **No media tool.** FFmpeg, OpenCV, and any other encoder **MUST NOT** be required. `hello` and the text menu **MUST** run without them.
3. **No Python.** CPython, pip, and ChronicleLogger **MUST NOT** be required to run `hola-tui`.
4. **No root install.** The product **MUST NOT** run `sudo`, `apt`, `dnf`, or a downloaded script to satisfy this file. Type 1 elevation is out of scope.
5. **About page.** The runtime-tools line **MUST** stay `Runtime tools: none` (`requirement-rust-about`). The host check may show `rustc` and `cargo` locations. It does not install them.
6. **Missing compiler.** If `cargo` or `rustc` is missing, the build fails in cargo’s own message. The front board is not a second installer.
7. **Lifecycle.** `version-check`, `self-update`, `self-install`, and `self-uninstall` call `cargo` (`requirement-rust-cli-interface`). They do not install the Rust toolchain.
8. Actor / role / subject / approver: **considered**. No dest machine. No approver.
9. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Item | Value |
|------|--------|
| **Build** | `cargo build` and `cargo test --offline -- --test-threads=1` |
| **Install** | `cargo install --path .` |
| **System packages** | none |
| **Media binary** | none |
| **Python** | none |
| **Platform** | Linux primary. Other hosts where `rustc` and `cargo` run |
| **Product version** | 1.0.0 |

## Under command line for normal user only

On Termux, Git Bash, Windows cmd, or the same class, the normal user supplies `rustc` and `cargo`. **This requirement:** do not use administrator privilege, `sudo`, `apt`, or a dedicated system user to install a compiler or a media tool from inside HolaTui. Do not pipe a downloaded script into a shell.

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** The about page does not pretend a compiler was installed.
- **Intentional:** The toolchain and the product are different installs.
- **Anti-fragile:** `hello` needs only the built binary.
- **Over-protect:** No root package-manager call.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Add FFmpeg or ChronicleLogger back as a runtime requirement.
- Claim `cargo install holatui` installs rustup.
- Add a root install command to this product.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | `rustc` and `cargo` are the required host tools |
| AC-2 | No media binary is required |
| AC-3 | No Python package is required |
| AC-4 | No root auto-install is claimed |
