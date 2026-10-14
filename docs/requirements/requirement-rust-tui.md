**file**: docs/requirements/requirement-rust-tui.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-tui`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file is the picture of HolaTui’s text menu. The screen has two parts on one board: the menu, and a bottom input box. The first row of the menu region keeps the current path on the left and, when that row has room, a clock of the local time on the right. That clock is drawn again each second. It does not show the product name or the package version. That picture is the default TUI style.

The session is `Tui` in `src/tui.rs`. The frame is `MenuPainter` in `src/painter.rs`. `main` stays in `src/cli.rs`. The product does not import a second menu crate for the frame glyphs.

Which verb runs stays on `requirement-rust-cli-interface`. The welcome sentence stays on `requirement-domain-holatui`. Status lines stay on `requirement-rust-cli-logging`. The path word stays on `requirement-rust-cli-language`.

### 1.1 Human-facing

**In one sentence:** On a terminal, `hola-tui` with no arguments shows a numbered menu and, along the bottom, a rounded box as wide as the screen, and you type on the only line inside that box.

| Includes | Excludes |
|----------|----------|
| The menu region above the box, and the rounded three-row frame | A `Choice:` line or a line-buffered `read` for that menu |
| The first row: Path and the folder on the left; a local clock on the right when the row has room, drawn again each second | The product name and the version on that first row. They stay on the status line |
| UTF-8 arc corners and bars, full screen width, typing on the only inner line | ASCII `+`, `-`, `\|` and sharp corners `┌` `┐` `└` `┘` |
| Front rows **1** hello, **3** system-log, **6** self-management, **7** language, **9** Exit | Row 2. Join. A numbered help row |

| You do… | What it means | What you type |
|---------|---------------|---------------|
| Start on a terminal with no words | You see hello, system-log, self-management, language, and Exit. The program does not print the welcome line yet and does not run cargo. | `hola-tui` |
| Read the first row | The left side names the folder this process is in. The word before that colon is Path until a saved language selects another word. When the row has room, the right side is a clock `HH:MM:SS`. | `hola-tui` |
| Choose hello | The screen stays up and shows `Welcome to HolaTui <version>.` | `1` then Enter, or type `hello` |
| Choose view-log | The screen lists the log files and waits in the bottom box until you type a file number or press Esc. A pause does not send you back. | `3`, then `31` |
| Start with no terminal | Help text and exit 0. | `hola-tui` with no terminal |

## 2. Core Rules (Mandatory)

1. **One writer.** The text-menu session **MUST** be `Tui` in `src/tui.rs`. The frame **MUST** be drawn by `MenuPainter` in `src/painter.rs`. `src/cli.rs` **MUST NOT** contain the frame glyphs (`FRAME_TOP_LEFT` belongs to `MenuPainter`). The menu **MUST NOT** be drawn with a `Choice:` line.
2. **Two regions.** On the front board the writer **MUST** draw a menu region and a bottom input box on the same screen. The menu region is every row above the box. Its first row **MUST** be the path line in rule 13. That row **MUST NOT** show the product name or the version. The numbered rows **MUST** follow the path line and **MUST NOT** be drawn inside the box. Each numbered row is a number, a verb, and an explain. On that board the number field is as wide as the longest number, and a shorter number is padded with spaces on the left. The verb field is as wide as the longest verb on that same board, and a shorter verb is padded with spaces immediately before the colon. The explain **MUST** be drawn after exactly one space. Those widths are display columns. East Asian Wide and Fullwidth count as two columns. Ambiguous stays one column. A wide character that does not fit is dropped whole. This board uses its own widths. The front board is **1** hello, **3** system-log, **6** self-management, **7** language, **9** Exit. Row **2** is omitted. **MUST NOT** renumber 3, 6, 7, or 9 to close the gap. Row **3** **MUST** open the system-log board: **31** view-log, **32** clear-log, **33** log-folder, and **0** Back. Row **6** **MUST** open the self-management board: **62** version, **63** about, **64** version-check, **65** self-update, **66** self-uninstall, **67** self-install, and **0** Back. **MUST NOT** use row **61**. Row **7** **MUST** open the language board. The codes stay on `requirement-rust-cli-language`. `language` is not an argv verb. `help` **MUST** stay off every numbered row. The front board **MUST NOT** list version, about, version-check, self-update, self-uninstall, self-install, view-log, clear-log, or log-folder.
3. **Three-row frame plus status line.** The bottom input box **MUST** be exactly three terminal rows high: a top border, one inner row, and a bottom border. The status line **MUST** be the next row, and that row **MUST** be the last row of the screen. The frame **MUST** span the full width the writer can place. The left border is the first column. The right border is the last column the writer can place.
4. **UTF-8 frame.** Those three rows **MUST** use these characters. Each one occupies one column. ASCII `+`, `-`, and `|` **MUST NOT** stand in for them. Sharp corners `┌` `┐` `└` `┘` **MUST NOT** stand in for the arcs.

| Row of the box | Characters, left to right |
|----------------|---------------------------|
| Top | `╭` (U+256D), then `─` (U+2500) repeated, then `╮` (U+256E) |
| Inner | `│` (U+2502), then the input field, then `│` (U+2502) |
| Bottom | `╰` (U+2570), then `─` (U+2500) repeated, then `╯` (U+256F) |

5. **Input inside the frame.** One space, the mark `> `, the typed characters, and the caret **MUST** sit on the only inner line, strictly between the two `│` characters. When the box is focused, the caret **MUST** be the block `█` (U+2588). When the list is focused, that block **MUST NOT** be drawn. Up and Down **MUST** walk the numbered rows and the box: Down on the last row enters the box, Up on the first row enters the box, Up from the box returns to the last row, and Down from the box returns to the first row. Enter **MUST** run the typed token, or the highlighted row when the box is empty. The box **MUST NOT** be a `Choice:` line.
6. **This board’s actions.** **hello** (**1**) **MUST** show `Welcome to HolaTui <version>.` on the result page. The typed verb `hola-tui hello` prints that same line and **MUST NOT** draw this screen. Row 1 **MUST NOT** join media, call an encoder, or list files. **self-management** (**6**) **MUST** open that board and **MUST NOT** leave the program. **version** (**62**) **MUST** show `HolaTui <version>` and **MUST NOT** call cargo. **about** (**63**) **MUST** show the about page from `requirement-rust-about`. When the page is longer than the screen, Up and Down scroll it. The footer says `Up/Down scrolls this page.` and `Press a key to return to the main menu.` **version-check** (**64**) **MUST** run `cargo search holatui --limit 1`. **self-update** (**65**) **MUST** run `cargo install holatui --force`. **self-uninstall** (**66**) **MUST** run `cargo uninstall holatui`. Choosing that row is the confirmation. **self-install** (**67**) **MUST** run `cargo install holatui`. Those cargo commands **MUST NOT** use `sudo`, **MUST NOT** use `curl`, and **MUST NOT** use `pip`. **0** **MUST** return to the front board. **system-log** (**3**) **MUST** open that board. **view-log** (**31**) **MUST** list the `.log` file names in the log folder and **MUST** show the chosen file on a result page. The person picks the number in the bottom box. That list **MUST** stay until the person chooses a number or presses Esc. The one-second clock wait **MUST NOT** close it. The result page **MUST** be the file name, a blank line, then the file text. An empty file **MUST** show `(empty)`. Esc **MUST** return to the system-log board and **MUST NOT** show the file. When the folder has no `.log` file, the result page **MUST** be `No log file in <folder>.` **clear-log** (**32**) **MUST** list those same names, then ask `Clear <name>? (y/n)`. Yes **MUST** empty that file and **MUST NOT** delete it. The result page **MUST** be `Cleared <name>.` No, Esc, or Enter **MUST** leave the file unchanged and **MUST NOT** show a result page. **log-folder** (**33**) **MUST** show `Log folder: <path>`. When no logger is present, that page **MUST** be `No log folder.` A chosen path **MUST** be a regular `.log` file whose parent, after resolve, is that log folder. Before the read and before the empty, the program **MUST** call `log_message` with `read log path=<path>` or `clear log path=<path>`, component `menu`, level INFO. **Exit** (**9**) **MUST** leave the program and return 0. It **MUST NOT** ask `Exit? (y/n)`. An unknown token **MUST** stay on this board and show the unknown-choice line. It **MUST NOT** exit the process. Empty argv on a terminal **MUST** show the front board and **MUST NOT** run self-install or self-update and **MUST NOT** show the welcome line by itself.
7. **Status line.** The status line under the frame **MUST** show the product name, the version, the board title, and the key hint `Up/Down  •  Enter`, separated by `│`. It **MUST NOT** replace one of the three frame rows. An error line, when shown, **MUST** sit in the menu region above the box.
8. **Result page.** After about, after hello, or after another result, the result page may omit the menu rows, the box, and the status line until the next key returns to the front board. When the body is longer than the room under the title, Up and Down scroll that body. A one-line result still closes on Down.
9. **Too small or no terminal.** If the screen cannot hold the path line, at least one numbered menu row, the three-row box, and the status line, the program **MUST NOT** collapse the box into one unframed row and **MUST NOT** fall back to a `Choice:` line. It **MUST** fail closed: non-zero, an operator-readable line, and the next step `hola-tui help`. If stdout is not a terminal and argv is empty, the program **MUST** print help and return 0. It **MUST NOT** draw this screen and **MUST NOT** wait.
10. **One writer, not a second logger.** A run that is not a text-screen verb **MUST NOT** open this screen. `hello`, `help`, `version`, and the cargo verbs **MUST NOT** draw this screen. `about` on a terminal **MUST** open this screen on the about page.
11. Actor / role / subject / approver: **considered**. No dest machine. No approver.
12. Dest fence conditions: **considered — none**.
13. **Path line.** The first row of the menu region, on the front board, on the self-management board, on the system-log board, and on the language board, **MUST** be the path line. The shape **MUST** be `<label>: <current path>`, with one space after the colon. `<current path>` **MUST** be the absolute current working directory. The path **MUST NOT** be translated. The label is one translatable message. English, the default, is `Path`. Traditional Chinese is `路徑`. When the path text is wider than the screen, the writer **MUST** keep the label, the colon, and the space, and **MUST** shorten the path from the left. A wide character that does not fit is dropped whole.

The same row **MUST** carry a clock on the right when the row has room. The shape **MUST** be `HH:MM:SS`, 24-hour, zero-padded. Eight characters. No date. The clock **MUST NOT** be translated. At least two spaces **MUST** separate the path text from the clock. When both fields fit, the clock **MUST** end on the last column the writer can place. When both do not fit, the writer **MUST** keep the path field and **MUST NOT** draw the clock. When no width is known, the row **MUST** be the path field, then two spaces, then the clock. The writer **MUST NOT** read `USER`, `USERNAME`, or run `id` for this row.

While those four boards are showing, the session **MUST** wait at most one second for the next key. When that wait ends and no key arrived, the session **MUST** draw this row again and **MUST** wait again. That wait **MUST NOT** leave the program, **MUST NOT** change the highlighted row, the typed buffer, or the board, and **MUST NOT** be read as Esc. The session **MUST NOT** start a thread to move the clock. A result page, the view-log file list, the clear-log file list, and the clear confirm do not use this one-second wait. Before each key read on those questions, the session **MUST** use a blocking read. A pause longer than one second **MUST** keep the characters already typed.

14. **Control-C is not row 9.** Row **9** Exit leaves with no confirm and returns 0. Control-C restores the terminal and returns 130. It is not the Exit row.

Picture of this board. The box in the picture is short so the corners stay visible. On a real screen the frame is the full width. `14:05:09` is a sample local time. `1.0.0` moves with `VERSION`.

```text
Path: /tmp/clips                                              14:05:09

1. hello          : show a welcome message
3. system-log     : view, clear, and the log folder
6. self-management: version, about, and cargo lifecycle
7. language       : display language for this menu
9. Exit           : leave
╭──────────────╮
│ > █          │
╰──────────────╯
  HolaTui 1.0.0  │  main menu  │  Up/Down  •  Enter
```

The same first row when Traditional Chinese is selected:

```text
路徑: /tmp/clips                                              14:05:09
```

### 2.1 Implementation Notes (this project)

| Field | Value |
|-------|--------|
| **Command** | `hola-tui` |
| **Open the screen** | `hola-tui` on a terminal, with no verb |
| **Session** | `Tui` in `src/tui.rs` |
| **Painter** | `MenuPainter` in `src/painter.rs` |
| **Caller** | `main` in `src/cli.rs` |
| **Front rows** | **1** hello, **3** system-log, **6** self-management, **7** language, **9** Exit |
| **System-log rows** | **31** view-log, **32** clear-log, **33** log-folder, **0** Back |
| **Self-management rows** | **62** version, **63** about, **64** version-check, **65** self-update, **66** self-uninstall, **67** self-install, **0** Back |
| **Cargo rows** | `cargo search holatui --limit 1`, `cargo install holatui --force`, `cargo uninstall holatui`, `cargo install holatui` |
| **Status line** | `  HolaTui <version>  │  main menu  │  Up/Down  •  Enter` |
| **No terminal, empty argv** | Help text, return 0 |
| **Too small** | Non-zero. Next step `hola-tui help` |
| **Proof** | `tests/contract.rs` covers the welcome line, row numbers, the path label, wide columns, and the cargo argv |

16-column inner line, focused and empty: `│ > █          │`

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** A screen too small to hold the frame fails closed.
- **Intentional:** Typing happens on the only inner line. The front rows are hello, system-log, self-management, language, and Exit.
- **Anti-fragile:** The right border uses the last column the writer can place.
- **Over-protect:** Do not replace the frame with a single underlined row, and do not fork the glyphs into `cli.rs`.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Collapse the bottom input box to one row.
- Draw the frame with ASCII `+`, `-`, or `|`, or with sharp corners `┌` `┐` `└` `┘`.
- Put the typed text, the caret, or `> ` on a border line or on a menu row.
- Draw the numbered menu rows inside the three-row frame.
- Draw this menu with a `Choice:` line.
- Renumber 3, 6, 7, or 9 to close the gap at row 2.
- Put hello anywhere except row 1, or remove row 1.
- Replace the cargo rows 64–67 with pip, sudo, or curl.
- Treat the one-second clock wait as Esc or as row 9 Exit.
