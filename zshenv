#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# https://erynwells.me/blog/2022/01/profiling-zsh/
# https://collectednotes.com/gillchristian/debugging-zsh-init-times
# https://www.dribin.org/dave/blog/archives/2024/01/01/zsh-performance/
#zmodload zsh/zprof

# Source a file when it exists. zsh reads this file first, so every later
# startup file can use it. bashrc has the same function for bash.
source_if_exists() { [ -f "$1" ] || return 0; . "$1"; }

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN ]]; then
  source_if_exists "${ZDOTDIR:-$HOME}/.zprofile"
fi
