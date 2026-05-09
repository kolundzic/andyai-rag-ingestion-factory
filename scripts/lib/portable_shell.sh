#!/usr/bin/env bash
set -euo pipefail
safe_echo() { printf '%s\n' "$*"; }
require_file() { if [ ! -f "$1" ]; then safe_echo "Missing file: $1"; exit 1; fi; }
require_dir() { if [ ! -d "$1" ]; then safe_echo "Missing directory: $1"; exit 1; fi; }
