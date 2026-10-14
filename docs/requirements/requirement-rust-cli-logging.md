**file**: docs/requirements/requirement-rust-cli-logging.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-cli-logging`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

`main` constructs one `StatusLog` before it dispatches a verb and before it builds the text menu. That logger writes a daily file. When the run will open the text screen, the construct is quiet so those lines do not paint over the frame.

This product does not depend on the Python ChronicleLogger package. `StatusLog` in `src/logger.rs` is the product logger. The line shape and the folder ladder follow the same operator contract: a kebab name, a base directory, a log directory, and a daily file.

### 1.1 Human-facing

**In one sentence:** `hola-tui version` can show status lines, and the text menu keeps those lines off the screen.

## 2. Core Rules (Mandatory)

1. **One construct.** `main` **MUST** call `StatusLog::new` once, with the product name `HolaTui`, before verb dispatch and before `Tui` is built. **MUST NOT** construct a second logger.
2. **Resolved name.** The stored name **MUST** be the kebab form `hola-tui`. `main` **MUST** read `log_name()`, `base_dir()`, and `log_dir()` before the first `log_message`.
3. **Quiet.** When `opens_text_screen` is true, `is_quiet` **MUST** be true at construct, before the log directory is created. A later quiet call **MUST NOT** be the only quiet. Other runs leave quiet false, so the operator can see `Created directory:` and, when debug is on, `debug mode`.
4. **Debug.** `is_debug` **MUST** be decided from `DEBUG` or `debug` already set to `1`, `true`, or `show` (any letter case) before construct. There is no `--debug` flag. When debug is on, `main` **MUST** write four `log_message` calls with component `main`: the resolved name, the version, and `src/cli.rs`; `Using` plus `StatusLog::class_version()`; the base directory at level DEBUG; the message `debug mode`. The version string inside `class_version` **MUST** come from that function, not from a second hand-typed library version at the call site.
5. **Line shape.** A status line **MUST** look like `[YYYY-MM-DD HH:MM:SS] pid:<pid> [LEVEL] @<component> :] <message>`.
6. **Daily file.** The file **MUST** be `<logDir>/hola-tui-YYYYMMDD.log`.
7. **Folders.** When `basedir` and `logdir` arguments are empty, the base directory **MUST** be chosen in this order: `CONDA_PREFIX` when that directory exists, then `VIRTUAL_ENV` when it contains `.pyenv`, then `VIRTUAL_ENV` when that directory exists, then `/var/hola-tui` when the effective user id is 0, otherwise `${HOME}/.app/hola-tui`. The log directory **MUST** be `<base>/log`. Product code **MUST NOT** shell out to `conda` or `id` to choose this folder. An explicit `basedir` or `logdir` argument, used by tests, wins.
8. **Menu notes.** view-log and clear-log **MUST** log `read log path=<path>` and `clear log path=<path>` with component `menu` before the read or the empty. Those calls **MUST NOT** sit inside the debug gate.
9. **Not on the about page.** `in_venv`, `in_pyenv`, and `in_conda` **MUST NOT** be printed on the about page. They read `VIRTUAL_ENV`, `PYENV_VERSION` or `PYENV_ROOT`, and `CONDA_PREFIX` or `CONDA_EXE`.
10. **Created directory.** When the log directory is created and the run is not quiet, the program **MUST** print `Created directory: <path>`. A quiet run **MUST NOT** print that line.
11. Actor / role / subject / approver: **considered**. No dest machine. No approver.
12. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Type** | `StatusLog` in `src/logger.rs` |
| **Construct** | `StatusLog::new(APP_NAME, screen, basedir, logdir)` in `src/cli.rs` |
| **Class version** | `StatusLog v1.0.0` |
| **Kebab name** | `hola-tui` |
| **Normal-user base** | `${HOME}/.app/hola-tui` |
| **Root base** | `/var/hola-tui` |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** The quiet flag is set before the directory is created.
- **Intentional:** One logger, one daily file.
- **Anti-fragile:** A test can pass its own base directory.
- **Over-protect:** Do not mirror status lines onto the text menu.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Construct the logger after the menu opens.
- Print `Created directory:` on a text-screen run.
- Add a second file logger or `logging` setup.
- Put the logger lines inside the menu frame.
- Depend on the Python ChronicleLogger package.
