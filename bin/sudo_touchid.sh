#!/usr/bin/env bash
# Let Touch ID approve sudo, by adding pam_tid.so to /etc/pam.d/sudo. It needs sudo and gsed.
#
# Usage: sudo_touchid.sh          Add the line if it is missing.
#        sudo_touchid.sh --help   Print this text.

case "${1:-}" in
  -h|--help)
    awk 'NR == 1 { next } /^#/ { sub(/^# ?/, ""); print; next } { exit }' "$0"
    exit 0
    ;;
esac

set -eu
if grep -q pam_tid.so /etc/pam.d/sudo; then
    echo "👌 Touch ID sudo already set up"
else
    sudo gsed -i "2iauth       sufficient     pam_tid.so" /etc/pam.d/sudo
    echo "👍 Touch ID sudo added"
fi

# Touch ID pro tip for Terminal users: add auth sufficient pam_tid.so to your /etc/pam.d/sudo file and you can stop typing your password for sudo
# https://github.com/gibfahn/dot/blob/master/setup/touchid_sudo_check.sh
# https://github.com/gibfahn/dot/blob/master/setup/touchid_sudo.sh
# https://github.com/gibfahn/up-rs
# https://github.com/biscuitehh/pam-watchid
