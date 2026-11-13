#!/bin/sh
# Strip the formatting from the clipboard, so it holds plain text only.
#
# Usage: clipboard_plaintext.sh          Replace the clipboard with its plain-text form.
#        clipboard_plaintext.sh --help   Print this text.

case "${1:-}" in
  -h|--help)
    awk 'NR == 1 { next } /^#/ { sub(/^# ?/, ""); print; next } { exit }' "$0"
    exit 0
    ;;
esac

pbpaste | pbcopy
