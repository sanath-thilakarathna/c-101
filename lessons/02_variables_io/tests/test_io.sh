#!/usr/bin/env bash
set -euo pipefail

BIN="../bin/vars_io"

# Feed inputs: name, age, height
OUT="$(printf 'Bob\n30\n1.80\n' | "$BIN")"
CLEAN="$(printf "%s" "$OUT" | tr -d '\r')"   # normalize CRLF if any

# Look for the final summary line (ignore prompts)
if ! echo "$CLEAN" | grep -Fq "Hi Bob, age 30, height 1.80 m"; then
  echo "❌ Expected summary not found. Got:"
  echo "$OUT"
  exit 1
fi

echo "✅ Variables & I/O test passed."
