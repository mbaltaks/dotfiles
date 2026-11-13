#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# https://erynwells.me/blog/2022/01/profiling-zsh/
# https://collectednotes.com/gillchristian/debugging-zsh-init-times
# https://www.dribin.org/dave/blog/archives/2024/01/01/zsh-performance/

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
