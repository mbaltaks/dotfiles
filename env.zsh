export EDITOR=vi
export PAGER=less
#export PAGER=/opt/local/bin/most
export GIT_PAGER='less -F -X'

# export PGDATA="${HOME}/Library/Application Support/Postgres/var-9.5"

# Set Display
DISPLAY=:0.0
export DISPLAY

export SD_REPO=${HOME}/sd

#stty erase 

# supposedly ANSI colours
# set noglob
# export TERMCAP=`cat ${HOME}/.termcap`
# unset noglob

# Colour support
# export CLICOLOR=1
# Forcing colours can break some scripts, like agvtool.
#export CLICOLOR_FORCE=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
# export LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS='exfxcxdxbxegedabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

#set -g default-terminal "screen-256color"

# alias ^H='stty erase ^H'
# alias ^?='stty errase ^?'

# I want to keep some history
# shopt -s histappend
# RAM history size
# export HISTSIZE=4096
# File history size
# export HISTFILESIZE=16384
# export HISTCONTROL=erasedups
# export PROMPT_COMMAND='history -a'
#export HISTIGNORE="&:ls:rm *:[bf]g:exit:l:more *:m *:history::cd:..:pine:foo:fink*:top:clear"
#export SAVEHIST=4096
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

export LC_TYPE=en_AU.UTF-8
export LC_ALL="en_AU.UTF-8"
export LANG="en_AU"

# And I want to search it with the arrow keys
# set -o vi  # to fix "bind: warning: line editing not enabled"
# bind '"[A":history-search-backward'
# bind '"[B":history-search-forward'
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward

# autoload -U history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^[[A" history-beginning-search-backward-end
# bindkey "^[[B" history-beginning-search-forward-end

# cycle through the options
#bind '"\t":menu-complete'

CVSROOT=/Users/Data/Library/CVS
export CVSROOT
CVS_RSH=/usr/bin/ssh
export CVS_RSH
# this for cvs-proxy installed by fink
#export CVS_PROXY=http://localhost:3128

# -M means give a very verbose promt
# -i means searches are case-insensitive except for upper-case
# -C means clear the screen, don't scroll it
# -e means exit after reaching the end a second time
# -r Raw colour escape sequences
export LESS=eFiMR
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GREP_COLORS=auto
export GREP_COLOR=auto

# everything seems to be set at 10.3
#export MACOSX_DEPLOYMENT_TARGET=10.4

# Perforce setup
export P4CONFIG=.p4config

xcrun=`which xcrun`
if [ -x "${xcrun}" ]; then
    export CODESIGN_ALLOCATE=$(xcrun -find codesign_allocate)
fi

export JAVA_HOME=`/usr/libexec/java_home`

export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1


export WORDCHARS='*?_[]~=&;!#$%^(){}'
export FZF_DEFAULT_OPTS='--reverse --color="info:#000000,spinner:#000000" --prompt="  "'

chpwd_functions+=(_virtualenv_auto_activate)
precmd_functions=(_virtualenv_auto_activate $precmd_functions)

#############################
### General configuration ###
#############################

setopt no_beep
setopt interactive_comments
setopt prompt_subst

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

setopt hup
setopt long_list_jobs
setopt notify

autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''
# case-insensitive, partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

#############################
### Plugins configuration ###
#############################

# source ~/.zsh/z.sh
# unalias z

####################
### Key bindings ###
####################
bindkey -e

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '\eb' backward-word
bindkey '\ef' forward-word
bindkey '\ed' kill-word
bindkey '^k' kill-line
bindkey '^d' delete-char
bindkey '\ew' backward-kill-word
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^p' up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search

zmodload zsh/complist
bindkey -M menuselect '^e' accept-line
bindkey -M menuselect '\ef' menu-complete
bindkey -M menuselect '\eb' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

zle -N insert-last-command-output
bindkey '^x^l' insert-last-command-output

autoload -U copy-earlier-word
zle -N copy-earlier-word
bindkey '^[m' copy-earlier-word

zle -N expand-or-complete-with-waiting-dots
bindkey '^i' expand-or-complete-with-waiting-dots

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

zle -N fancy-ctrl-z;
bindkey '^z' fancy-ctrl-z

zle -N exit-shell
bindkey '^Sx' exit-shell

bindkey -N paste
zle -N start-paste
bindkey '^[[200~' start-paste
zle -N end-paste
bindkey -M paste '^[[201~' end-paste
zle -N paste-insert paste-insert
bindkey -R -M paste "^@"-"\M-^?" paste-insert
bindkey -M paste -s '^M' '^J'

# bindkey -M emacs 'â' backward-word
# bindkey -M emacs 'æ' forward-word
# bindkey -M emacs 'ä' kill-word
# bindkey -M menuselect 'æ' menu-complete
# bindkey -M menuselect 'â' reverse-menu-complete
# bindkey '®' insert-last-word

#############
### Other ###
#############

stty -ixon
# if [ -z $TMUX ] && [ -z $VIM ]; then; tmux-start; fi
