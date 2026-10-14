**file**: docs/requirements/requirement-rust-about.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-about`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file owns the about page. Menu row **63** and the verb `hola-tui about` show one text page: product identity, a host check, and a star box. The screen that draws the page stays on `requirement-rust-tui`. The domain sentence stays on `requirement-domain-holatui`. The version string stays on `requirement-rust-packaging`. There is no `--json`.

### 1.1 Human-facing

**In one sentence:** About names this build, this computer, and where the program is running from, in English.

| Includes | Excludes |
|----------|----------|
| Identity lines, host-check lines, and the star box | A second about layout or a remote version lookup |
| Rust, rustc, and cargo reads | Python, pip, pyenv, conda, or Cython lines |
| Install kind: global, local, or uninstalled | A curl install line while the download URL is empty |

## 2. Core Rules (Mandatory)

1. **One page.** Menu action **about** and `hola-tui about` **MUST** show one page in this order: identity, host check, star box. A blank line **MUST** separate the blocks. On a terminal the page is the text-screen result. Off a terminal the page **MUST** be the whole of standard output and **MUST** return 0. The page **MUST NOT** be `--version`. There is no `--json`.
2. **Identity block.** The first four lines **MUST** be, in order: `HolaTui {version}`, `Domain: Show a welcome message`, `Runtime tools: none`, `Entry points: hola-tui`. The runtime-tools line **MUST NOT** name FFmpeg. The page **MUST NOT** name `py-tui`, **MUST NOT** print `python -m`, and **MUST NOT** print the author email.
3. **Host-check header.** The check **MUST** start with `{local stamp} HolaTui(v{version})  [CHECK SYSTEM]:` and the next line **MUST** be two spaces then `Now checking your operation system!`. The stamp **MUST** be local time `YYYY-MM-DD HH:MM:SS.ffffff`. There are two spaces before `[CHECK SYSTEM]:`.
4. **Host-check fields.** After the header, each field **MUST** start with four spaces, then the label, a colon, a space, and the value, in this order. A missing value **MUST** leave the line in place.

| Label | Read |
|-------|------|
| `Rust` | First line of `rustc --version`, trimmed. Empty when `rustc` is not on `PATH`. |
| `C Library` | The `host:` value from `rustc -vV`. Empty when that read is empty. |
| `Operation System` | `PRETTY_NAME` from `/etc/os-release` when that file yields a non-empty name. Otherwise `{OS} {ARCH}` from the Rust target constants. |
| `Architecture` | `x86_64` and `amd64` → `amd64`. `aarch64` and `arm64` → `arm64`. `x86`, `i386`, and `i686` → `x86`. Any other name is kept. |
| `Current User` | Environment `USER` when non-empty, else `USERNAME` when non-empty, else empty. |
| `Shell` | Environment `SHELL`, else empty. |
| `Rust Executable` | Basename of the `rustc` path. Empty when `rustc` is missing. |
| `rustc location` | First `rustc` file found by walking `PATH`. |
| `cargo location` | First `cargo` file found by walking `PATH`. |
| `Inside docker container` | `True` when `/.dockerenv` exists, otherwise `False`. |
| `Binary Type` | `{arch}-{libc}` when both are non-empty. `{arch}-` when libc is empty. Empty when arch is empty. Libc comes from the host triple: `msvc` or `windows` → `msc`, `musl` → `musl`, `gnu` → `glibc`. An empty host and `SHELL=/bin/ash` → `muslc`. An empty host otherwise → `unknown`. Any other triple uses the last `-` segment. |
| `Location` | Canonical `current_exe` unless a test override is set. The same path is the indented path inside the star box. |
| `PID` | Process id as decimal text. |
| `Cache folder used` | Preferred path when `/dev/shm` is a directory. Otherwise the first fallback when `/tmp` is a directory. Otherwise the second fallback. |
| `Cache folder (preferred)` | `/dev/shm/cache/cache-HolaTui-{user}-{pid}` when the user is non-empty. Without a user, the leaf is `cache-HolaTui-{pid}`. |
| `Cache folder (1st fallback)` | `/tmp/cache/` plus that same leaf. |
| `Cache folder (2nd fallback)` | `{HOME}/.cache/cache-HolaTui-{pid}` when `HOME` is an absolute path. No username in that leaf. Empty when home is missing. The line stays. |
| `Persistence storage` | `{HOME}/.local/HolaTui` when home exists. Empty when it does not. The line stays. |
| `TTY / Interactive` | `yes` when the about caller says stdout is a terminal, otherwise `no`. |

5. **Do not create cache directories.** Building the page **MUST NOT** create the cache folders or the persistence directory.
6. **Install kind.** Classify `Location` in this order.
   - The path contains `{sep}src{sep}`, is not under `site-packages` or `dist-packages`, and a parent within eight levels has `Cargo.toml`: **uninstalled**.
   - Under the home directory, and the path is packaged or the basename is `hola-tui`, `HolaTui`, or `holatui`: **local**.
   - Starts with `/usr/`, `/opt/`, or `/bin/`: **global**.
   - Packaged (`site-packages` or `dist-packages`) and not under home: **global**.
   - Contains `/.cargo/bin/` and is under home: **local**.
   - Otherwise: **uninstalled**.
7. **Star box sentences.** **global** **MUST** say `You are using the GLOBAL INSTALLED version, location:`. **local** **MUST** say `You are using the LOCAL INSTALLED version, location:`. **uninstalled** **MUST** say `You are using an UNINSTALLED version, location:`.
8. **Star box lines.** Inside the border, in order: `{APP_NAME} ({version}) by {author} on {date}`; a blank line; the install sentence; four spaces and the program path; a blank line; `Basic Usage:`; four spaces and `hola-tui hello`; a blank line; `Please visit our homepage: `; four spaces, a double quote, the homepage, and a double quote. Author is `Wilgat Wong`. Date is `2026-10-12`. Homepage is `https://github.com/cloudgen/HolaTui`.
9. **Border.** When the download URL is empty and the homepage is non-empty, print through the blank line after the homepage and omit the two extra source blanks. Pad every printed line on the right to the longest printed line. The top and bottom borders are that width plus four asterisks. Each body row is `* `, the padded line, ` *`. One all-space body row sits under the top border and one sits above the bottom border.
10. **No install channel on this page.** `DOWNLOAD_URL` in `src/identity.rs` **MUST** stay empty. The live about page **MUST NOT** contain `curl`. The box may render `Installation command:` and `curl -fsSL {url} | sh` only when a caller passes a non-empty URL. This product’s about caller **MUST NOT** pass one.
11. **No privilege and no network.** Building the page **MUST NOT** call `sudo`, install a package, or open a socket. It **MUST NOT** spawn `python2`, `python3`, `conda`, `pyenv`, or `id`. It may spawn `rustc --version` and `rustc -vV`.
12. **Environment booleans.** `in_venv`, `in_pyenv`, and `in_conda` **MUST** be evaluated when the check is constructed and **MUST NOT** be printed on this page.
13. Actor / role / subject / approver: **considered**. No dest machine. No approver.
14. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Composer** | `src/about.rs` `AboutPage::framework_about` |
| **Host check** | `src/check_system.rs` `CheckSystem::check_system_lines` |
| **Identity constants** | `src/identity.rs` |
| **Proof** | `tests/contract.rs` about identity lines, no curl, no py-tui, no ffmpeg |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** A missing `rustc` leaves the Rust lines empty. The page still prints.
- **Intentional:** The field list is the Rust toolchain, not a CPython host check.
- **Anti-fragile:** Cache paths are reported and not created.
- **Over-protect:** An empty download URL keeps `curl` off the page.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Put FFmpeg, pip, Python, or py-tui on this page.
- Print `curl` while `DOWNLOAD_URL` is empty.
- Add `--json`.
- Create the cache directories while building the page.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | Identity lines are the four lines in rule 2 |
| AC-2 | Host-check labels match rule 4, in that order |
| AC-3 | Empty download URL omits `curl` |
| AC-4 | Install kind follows rule 6 |
| AC-5 | The page does not create cache directories |
