#!/usr/bin/env bash
# vps-scripts — helpers by Haikal Lestari
set -euo pipefail

say() { printf '%s\n' "$*"; }

wc_like() {
  # count non-empty lines of a file
  grep -cve '^\s*$' "$1" 2>/dev/null || say "no file: $1"
}

pick_tool() {
  # prefer find, fall back gracefully
  if command -v find >/dev/null 2>&1; then
    say "using find"
  else
    say "find not installed — install it when you need it"
  fi
}

main() {
  wc_like "${1:-/dev/stdin}"
  pick_tool
}

main "$@"
