**file**: docs/requirements/requirement-rust-cli-language.md
**Status**: Active (Version 1.0.0)
**Area**: rust
**Key**: `requirement-rust-cli-language`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file owns the menu language for HolaTui. The text menu can show its boards in one of thirteen languages. English is the default. The person picks a language on front row **7**. The pick is saved for the next run. The picture of the menu stays on `requirement-rust-tui`. Typed verbs stay on `requirement-rust-cli-interface`. `language` is not one of those verbs.

`MenuLanguage` in `src/language.rs` holds the codes, the saved leaf, and the words. `MenuPainter` writes `MenuLanguage` in its constructor. The words live in `src/lang_catalog.rs`.

### 1.1 Human-facing

**In one sentence:** On the HolaTui menu, you type **7** to pick the language the menu uses, and the next time you open the menu it still uses that language.

| Includes | Excludes |
|----------|----------|
| Front row 7, the language board, the saved file, and the words on the menu boards | A `language` argument on the command line |
| English as the default when the file is missing or not a known code | Reading `LANG` or `LC_ALL` to pick the menu language |
| The path word, board titles, category names, Back, Exit, and the choice warning | Translating the folder path, the clock, the welcome line, or a leaf command token such as `hello` |

## 2. Core Rules (Mandatory)

1. **One owner.** This file selects the menu language and owns the words the menu boards print. `language` **MUST NOT** be an argv verb.
2. **Default.** The code **MUST** be `en` when the leaf is missing, when the first line is empty, or when that line is not one of the thirteen codes. An invalid first line **MUST NOT** be rewritten. `LANG`, `LANGUAGE`, `LC_ALL`, and `LC_MESSAGES` **MUST NOT** select a code.
3. **Process override.** When `HOLATUI_LANG` is one of the thirteen codes, that code **MUST** win at process start. That start **MUST NOT** write the leaf. Any other value is ignored and the leaf is read.
4. **Leaf.** The leaf is `${HOME}/.local/HolaTui/language`. The program reads only the first line, ignores a trailing carriage return, and ignores later lines. A menu pick **MUST** write the code, one newline, and nothing else. The directory **MUST** be mode `0700`. The file **MUST** be mode `0600`. The program creates that directory only when a pick is saved. A missing home, or a write that fails, **MUST** keep the code this process already had and **MUST** show the failed-write line in that previous language. The front board **MUST** still return.
5. **Front row 7.** The front board **MUST** print row **7** `language`. That row **MUST** open the language board. Rows **1**, **3**, **6**, and **9** stay hello, system-log, self-management, and Exit.
6. **Language block.** Assigned rows are **71** through **83**, in the order below. **70** and **84** through **89** are reserved. They **MUST NOT** be printed. Typing a reserved number **MUST** show the unknown-choice line and **MUST NOT** write the leaf. **0**, an empty Enter on Back, and Esc **MUST** return to the front board and **MUST NOT** write the leaf.
7. **Names on the language board.** Each assigned row **MUST** show that language’s endonym as the short, in every UI language. The explain **MUST** be that UI language’s sentence with the endonym in the name slot. The English sentence is `use {name} for this menu`.
8. **What follows the code.** On the four boards, these follow the selected code: the path label, the board title, category shorts, category longs, leaf longs, Back, Exit, the unknown-choice line, the saved-language line, and the failed-write line. Leaf shorts stay the English tokens `hello`, `view-log`, `clear-log`, `log-folder`, `version`, `about`, `version-check`, `self-update`, `self-uninstall`, and `self-install`.
9. **What stays English.** The welcome line, command output, cargo lifecycle output, the argv `version` line, the help body, and the about page stay English. The key hint `Up/Down  •  Enter` stays English. The folder path and the clock are not translated.
10. **After a successful pick.** The session **MUST** show the saved-language line and **MUST** redraw the front board in the new language. That line sits above the box until the next key.
11. **Unknown choice.** The English line is `That choice is not on this list. Pick a listed number.`
12. **Clock.** The language board is a clock board. A language pick does not open a result page.
13. Actor / role / subject / approver: **considered**. No dest machine. No approver.
14. Dest fence conditions: **considered — none**.

### 2.1 Implementation Notes (this project)

| Code | Endonym | Row | Path label | Saved line |
|------|---------|-----|------------|------------|
| `en` | English | 71 | Path | Menu language is English |
| `zh-Hans` | 简体中文 | 72 | 路径 | 菜单语言是简体中文 |
| `zh-Hant` | 繁體中文 | 73 | 路徑 | 選單語言是繁體中文 |
| `es` | Español | 74 | Ruta | El idioma del menú es español |
| `ar` | العربية | 75 | المسار | لغة القائمة هي العربية |
| `fr` | Français | 76 | Chemin | La langue du menu est le français |
| `pt` | Português | 77 | Caminho | O idioma do menu é português |
| `ru` | Русский | 78 | Путь | Язык меню — русский |
| `de` | Deutsch | 79 | Pfad | Die Menüsprache ist Deutsch |
| `ja` | 日本語 | 80 | パス | メニューの言語は日本語 |
| `ko` | 한국어 | 81 | 경로 | 메뉴 언어는 한국어 |
| `nl` | Nederlands | 82 | Pad | De menutaal is Nederlands |
| `el` | Ελληνικά | 83 | Διαδρομή | Η γλώσσα του μενού είναι ελληνικά |

| Item | Value |
|------|--------|
| **Module** | `MenuLanguage` in `src/language.rs` |
| **Words** | `src/lang_catalog.rs` |
| **Leaf** | `${HOME}/.local/HolaTui/language`. Directory `0700`. File `0600` |
| **Override** | `HOLATUI_LANG`. Does not write |
| **Lifecycle words** | The self-management longs name **cargo**, not pip |
| **Proof** | `tests/contract.rs` `language_leaf_round_trip` |

Worked leaf after choosing Traditional Chinese:

```text
zh-Hant
```

There is no `hola-tui language` command. On the open menu, `7` then `73` saves `zh-Hant`.

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** A bad leaf line is not rewritten.
- **Intentional:** English is the default. A locale variable does not change the menu.
- **Anti-fragile:** A failed write keeps the previous code.
- **Over-protect:** File mode `0600`, directory mode `0700`.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Read `LANG` to select the menu language.
- Add `language` as an argv verb.
- Drop a code from the thirteen, or print row 70 or rows 84–89.
- Translate the welcome line, the path value, or the clock.
- Write the leaf as root or with a mode other than `0600`.
