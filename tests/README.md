# Tests — HolaTui

Contract proof for the Rust ship unit.

## Status (2026-10-12, product 1.0.0)

| Item | State |
|------|--------|
| Suite | `tests/contract.rs` |
| Covers | `hello` output, text-screen gate, unknown `join` / `list-videos`, help text, front row numbers, system-log rows, language 71–83 save, cargo argv, bare uninstall, about identity lines, version match, logger name |
| Runner | `cargo test --offline -- --test-threads=1` |
| Threads | The suite changes process environment and the working directory. Run it with `--test-threads=1`. |

## Rules

1. Contract cases do not call the network.
2. `./build.sh test` is the maintainer wrapper for the same cargo command.
3. Pictures in `screenshots/` are not fixtures for this suite.

## Run

```bash
cargo test --offline -- --test-threads=1
```
