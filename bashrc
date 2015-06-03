# ~/.bashrc: executed by bash(1) for non-login shells.

# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files

# https://dotfiles.github.io
# http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789

# MacPorts update: sudo port selfupdate && sudo port upgrade -cu --enforce-variants outdated
# MacPorts clean: sudo port clean --all installed && sudo port uninstall inactive leaves
# Virtualenv activate: source venv/bin/activate
# sudo bin/rbackup macbookpro > ~/Desktop/"backup-`date`.log"

for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env,alias,completion,prompt,custom}; do
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

export RUBY_BUILD_CACHE_PATH="$HOME/.rbenv/cache"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
