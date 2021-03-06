export EDITOR=/usr/bin/vi
export PAGER=/usr/bin/less
#export PAGER=/opt/local/bin/most

export PGDATA="${HOME}/Library/Application Support/Postgres/var-9.5"

# Set Display
DISPLAY=:0.0
export DISPLAY

export SD_REPO=${HOME}/sd

#stty erase 

# supposedly ANSI colours
set noglob
export TERMCAP=`cat ${HOME}/.termcap`
unset noglob

# Colour support
export CLICOLOR=1
# Forcing colours can break some scripts, like agvtool.
#export CLICOLOR_FORCE=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad

#set -g default-terminal "screen-256color"

alias ^H='stty erase ^H'
alias ^?='stty errase ^?'

# I want to keep some history
shopt -s histappend
# RAM history size
export HISTSIZE=4096
# File history size
export HISTFILESIZE=16384
export HISTCONTROL=erasedups
export PROMPT_COMMAND='history -a'
#export HISTIGNORE="&:ls:rm *:[bf]g:exit:l:more *:m *:history::cd:..:pine:foo:fink*:top:clear"
#export SAVEHIST=4096

export LC_TYPE=en_AU.UTF-8
export LC_ALL="en_AU.UTF-8"
export LANG="en_AU"

# And I want to search it with the arrow keys
set -o vi  # to fix "bind: warning: line editing not enabled"
bind '"[A":history-search-backward'
bind '"[B":history-search-forward'

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

# everything seems to be set at 10.3
#export MACOSX_DEPLOYMENT_TARGET=10.4

# Perforce setup
export P4CONFIG=.p4config

xcrun=`which xcrun`
if [ -x "${xcrun}" ]; then
    export CODESIGN_ALLOCATE=$(xcrun -find codesign_allocate)
fi

#export JAVA_HOME=`/usr/libexec/java_home`

export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
