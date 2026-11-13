# Do not autocomplete when accidentally pressing Tab on an empty line.
shopt -s no_empty_cmd_completion

# MacPorts Bash shell command completion
source_if_exists /opt/local/etc/profile.d/bash_completion.sh
source_if_exists /opt/local/share/bash-completion/completions/git
source_if_exists /usr/share/git-core/git-completion.bash
source_if_exists /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash

# For Debian
source_if_exists /etc/bash_completion.d/git

source_if_exists /usr/local/opt/nvm/etc/bash_completion  # This loads nvm bash_completion
