**file**: docs/requirements/requirement-rust-error-handling.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-error-handling`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file owns how HolaTui fails on the command line and on the text screen. The verb list stays on `requirement-rust-cli-interface`. The too-small screen stays on `requirement-rust-tui`.

### 1.1 Human-facing

**In one sentence:** A command that cannot run prints `ERROR:` and a `Next:` line, and Ctrl-C leaves with status 130.

## 2. Core Rules (Mandatory)

1. **Shape.** `cli::report` **MUST** write `ERROR: {message}` and then `   Next: {next}` to stderr (three spaces before `Next:`), and **MUST** return 1.
2. **Unknown verb.** An unknown verb **MUST** use that shape with message `Unknown verb '{token}'.` and next step `hola-tui help — verbs: ` plus the product verb list. Status **MUST** be 1.
3. **Unknown option.** A token that starts with `-` and is not `--help`, `-h`, `--version`, or `--force` **MUST** use that shape with message `Unknown option '{token}'.` and next step `hola-tui help`.
4. **Extra argument.** A second positional token **MUST** use that shape with message `Unexpected argument '{token}'.`
5. **Bare uninstall.** `self-uninstall` without `--force` **MUST** use that shape with message `self-uninstall removes this package with cargo.` and next step `hola-tui self-uninstall --force`. It **MUST NOT** run cargo.
6. **Force elsewhere.** `--force` on any verb other than `self-uninstall` **MUST** use that shape with message `--force is only for self-uninstall.`
7. **Too small.** When the text screen is too small, the program **MUST** use that shape with message `The text screen is too small for the menu and the input box.` and next step `hola-tui help`.
8. **Open failure.** Any other screen-open failure **MUST** use that shape with message `The text menu could not open on this terminal.`
9. **Interrupt.** Ctrl-C on the text screen **MUST** return 130 and **MUST NOT** print `ERROR:`. Menu row 9 Exit **MUST** return 0.
10. **Parse before logger side effects.** A parse error **MUST** return before the text screen opens. It **MUST NOT** wait for a key.
11. **Cargo failure.** When a lifecycle verb runs cargo and cargo returns non-zero, the program **MUST** return that non-zero code. It **MUST NOT** print a success line for a failed cargo command.
12. Actor / role / subject / approver: **considered**. No dest machine. No approver.
13. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Reporter** | `src/cli.rs` `report` |
| **Parser** | `src/cli.rs` `parse` |
| **Screen errors** | `src/cli.rs` `screen_error` |
| **Interrupt** | `Key::Interrupt` in `src/tui.rs`, status 130 |

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** The next line tells the person a command that is in the verb list.
- **Intentional:** Ctrl-C and Exit are different statuses.
- **Anti-fragile:** A non-terminal empty argv prints help and returns 0 instead of erroring.
- **Over-protect:** `--force` does not unlock any verb except uninstall.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Return 0 for an unknown verb.
- Run cargo when `self-uninstall` has no `--force`.
- Map Ctrl-C to menu Exit.
- Drop the `Next:` line from `report`.

## 5. Acceptance criteria

| ID | Criterion |
|----|-----------|
| AC-1 | Unknown verb prints `ERROR: Unknown verb` and `   Next:` and returns 1 |
| AC-2 | Bare `self-uninstall` returns 1 and does not run cargo |
| AC-3 | Ctrl-C on the text screen returns 130 |
| AC-4 | Row 9 returns 0 |
