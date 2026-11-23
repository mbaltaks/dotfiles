# ~/.bashrc: executed by bash(1) for non-login shells.

# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files

# https://dotfiles.github.io
# http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789

# Nix update:
# nix-channel --update nixpkgs
# nix-env -u '*'
# Nix clean:
# nix-collect-garbage -d

# MacPorts update: sudo port selfupdate && sudo port upgrade -cu --enforce-variants outdated
# MacPorts clean: sudo port clean --all installed && sudo port uninstall inactive leaves
# Virtualenv activate: source venv/bin/activate
# sudo bin/rbackup macbookpro > ~/Library/Logs/rbackup/"backup-`date`.log"
# Homebrew update: brew update && brew upgrade && brew cleanup
# softwareupdate --list --include-config-data
# xcrun simctl delete unavailable
# asdf plugin-update --all

# Source a file when it exists. zshenv has the same function for zsh.
source_if_exists() { [ -f "$1" ] || return 0; . "$1"; }

for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env.bash,alias,completion.bash,prompt.bash,custom} ~/.shellrc_overlay; do
    source_if_exists "$DOTFILE"
done

# Include fink config
#test -r /sw/bin/init.sh && . /sw/bin/init.sh
#source /sw/bin/init.sh

if [ -d /opt/local/etc/profile.d ]; then
  for i in /opt/local/etc/profile.d/*.sh; do
    source_if_exists "$i"
  done
  unset i
fi

# quick calculator
? () { echo "$*" | bc -l; }

# chruby
#source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh

# asdf, for managing language version installs
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# autoenv
# source /usr/local/opt/autoenv/activate.sh

source_if_exists ~/.bashrc_local

# added by travis gem
source_if_exists "${HOME}/.travis/travis.sh"

# for python pyenv
#eval "$(pyenv init -)"

#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

source_if_exists "${HOME}/Library/Preferences/org.dystroy.broot/launcher/bash/br"

source_if_exists ~/.fzf.bash

# Added by LM Studio CLI (lms)
[ -d "${HOME}/.lmstudio/bin" ] && export PATH="$PATH:${HOME}/.lmstudio/bin"

