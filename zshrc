# ~/.zshrc: executed by zsh(1) for non-login shells.

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

# for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env.zsh,alias,completion.zsh,prompt.zsh,custom,private}; do
for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env.zsh,alias,completion.zsh,prompt.zsh,custom,private}; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

if [ -d /opt/local/etc/profile.d ]; then
  for i in /opt/local/etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# quick calculator
# ? () { echo "$*" | bc -l; }

# for python pyenv
#eval "$(pyenv init -)"

# https://asdf-vm.com/ manages packages for all languages
# replaces nvm, rvm/chruby/rbenv, etc
#source $(brew --prefix asdf)/asdf.sh
source /usr/local/opt/asdf/asdf.sh

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
