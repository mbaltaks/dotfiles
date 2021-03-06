# Do not autocomplete when accidentally pressing Tab on an empty line.
shopt -s no_empty_cmd_completion

# MacPorts Bash shell command completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi
if [ -f /opt/local/share/bash-completion/completions/git ]; then
  source /opt/local/share/bash-completion/completions/git
fi
if [ -f /usr/share/git-core/git-completion.bash ]; then
  source /usr/share/git-core/git-completion.bash
fi
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
  source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

# For Debian
if [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
fi

[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
