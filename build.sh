#!/bin/sh
# requirement-rust-packaging
# Maintainer verbs only. hola-tui flags are not accepted here.
set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
cd "$ROOT"

read_version() {
    awk '
        $1 == "version" {
            value = $3
            gsub(/"/, "", value)
            print value
            exit
        }
    ' "$ROOT/Cargo.toml"
}

VERSION=$(read_version 2>/dev/null || true)

out_err() {
    printf '%s\n' "$1" >&2
}

need_version() {
    if [ -z "$VERSION" ]; then
        out_err "ERROR: Cannot read the package version from Cargo.toml."
        out_err "   Next: set version in Cargo.toml to match src/identity.rs, then ./build.sh version"
        exit 1
    fi
}

if [ -n "$VERSION" ]; then
    printf '%s\n' "HolaTui build tool (v$VERSION)"
else
    printf '%s\n' "HolaTui build tool (version unread)"
fi
printf '%s\n' "========================================"

show_help() {
    cat << EOF
Usage: ./build.sh <command>

Operational commands:
  help       Show this list (also: no command, -h, --help)
  version    Print the package version from Cargo.toml
  clean      Remove the cargo target directory
  build      cargo build --release

Test command:
  test       cargo test --offline -- --test-threads=1

Examples:
  ./build.sh version
  ./build.sh build
  ./build.sh test
EOF
}

do_version() {
    need_version
    printf '%s\n' "$VERSION"
}

do_clean() {
    cargo clean
}

do_build() {
    cargo build --release
}

do_test() {
    cargo test --offline -- --test-threads=1
}

cmd=${1:-help}
case "$cmd" in
    help|-h|--help|"")
        show_help
        ;;
    version)
        do_version
        ;;
    clean)
        do_clean
        ;;
    build)
        do_build
        ;;
    test)
        do_test
        ;;
    *)
        out_err "ERROR: Unknown build command '$cmd'."
        out_err "   Next: ./build.sh help"
        exit 1
        ;;
esac
