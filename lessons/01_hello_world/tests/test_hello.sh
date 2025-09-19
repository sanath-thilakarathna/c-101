#!/usr/bin/env bash
set -euo pipefail

BIN="../bin/hello"
OUT="$($BIN)"

if [[ "$OUT" != "Hello, C-101!" ]]; then
  echo "Expected 'Hello, C-101!' but got '$OUT'"
  exit 1
fi

echo "Hello World test passed."
