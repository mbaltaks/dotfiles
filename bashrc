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

for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env.bash,alias,completion.bash,prompt.bash,custom,private}; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

# Include fink config
#test -r /sw/bin/init.sh && . /sw/bin/init.sh
#source /sw/bin/init.sh

if [ -d /opt/local/etc/profile.d ]; then
  for i in /opt/local/etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# quick calculator
? () { echo "$*" | bc -l; }

# chruby
#source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh

# asdf, for managing language version installs
source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
