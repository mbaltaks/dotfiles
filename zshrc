#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# Customize to your needs...
# http://jeromedalbert.com/migrate-from-oh-my-zsh-to-prezto/


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
# Homebrew update: brew update && brew upgrade && brew cleanup && brew autoremove
# softwareupdate --list --include-config-data
# xcrun simctl delete unavailable
# asdf plugin-update --all

[[ -d /opt/brew/share/zsh/site-functions/ ]] && fpath+=(/opt/brew/share/zsh/site-functions/)
[[ -d /opt/homebrew/share/zsh/site-functions ]] && fpath+=(/opt/homebrew/share/zsh/site-functions)

# for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env.zsh,alias,completion.zsh,prompt.zsh,custom,private}; do
for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env.zsh,alias,completion.zsh,prompt.zsh,custom} ~/.shellrc_overlay; do
    source_if_exists "$DOTFILE"
done

# if [ -d /opt/local/etc/profile.d ]; then
#   for i in /opt/local/etc/profile.d/*.sh; do
#     if [ -r $i ]; then
#       . $i
#     fi
#   done
#   unset i
# fi

# quick calculator
# ? () { echo "$*" | bc -l; }

# for python pyenv
#eval "$(pyenv init -)"

# https://asdf-vm.com/ manages packages for all languages
# replaces nvm, rvm/chruby/rbenv, etc
#source $(brew --prefix asdf)/asdf.sh
#source /usr/local/opt/asdf/asdf.sh
#. /opt/local/share/asdf/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)


source_if_exists "${HOME}/Library/Preferences/org.dystroy.broot/launcher/bash/br"

source_if_exists "/opt/local/share/mcfly/mcfly.zsh"

source_if_exists /opt/local/share/fzf/shell/key-bindings.zsh
source_if_exists /opt/local/share/fzf/shell/completion.zsh
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#eval "$(starship init zsh)"

#eval "$(nodenv init -)"
#eval "$(arch -x86_64 nodenv init -)"

#zprof

# initialise completions with ZSH's compinit
autoload -U compinit && compinit -i

# zoxide's completions need compinit to run first
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

(( $+commands[npm] )) && export PATH="$PATH:$(npm config get prefix)/bin"

# Added by LM Studio CLI (lms)
[[ -d "${HOME}/.lmstudio/bin" ]] && export PATH="$PATH:${HOME}/.lmstudio/bin"

# opencode
[[ -d "${HOME}/.opencode/bin" ]] && export PATH="${HOME}/.opencode/bin:$PATH"

# Hermes Agent command
[[ -d "$HOME/.local/bin" ]] && case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
