#!/usr/bin/env sh
# formats all lua files with stylua
if ! command -v stylua >/dev/null 2>&1; then
  echo "stylua is not installed. Install it and rerun."
  exit 1
fi
stylua .
