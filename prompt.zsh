export PROMPT='%~$(git-prompt-info)$ '


# function prompt_custom_precmd {
#   git-info
# }

# function prompt_custom_setup {
#   setopt LOCAL_OPTIONS
#   unsetopt XTRACE KSH_ARRAYS
#   prompt_opts=(cr percent subst)

#   # Load required functions.
#   autoload -Uz add-zsh-hook

#   # Add hook for calling git-info before each command.
#   add-zsh-hook precmd prompt_custom_precmd

#   # Set git-info parameters.
#   zstyle ':prezto:module:git:info' verbose 'yes'
#   zstyle ':prezto:module:git:info:branch' format '%F{green}%b%f'
#   zstyle ':prezto:module:git:info:clean' format ' %F{green}✔%f'
#   zstyle ':prezto:module:git:info:dirty' format ' %F{red}✗%f'
#   zstyle ':prezto:module:git:info:keys' format \
#     'prompt' ' %F{green}(%f$(coalesce "%b" "%p" "%c")${git_info[rprompt]}%s%F{green})%f' \
#     'rprompt' '%C%D'

#   # Define prompts.
#   PROMPT='%~${(e)git_info[prompt]}$ '
#   RPROMPT=''
# }

# prompt_custom_setup "$@"

# export GIT_PS1_SHOWCOLORHINTS=true
# export GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWSTASHSTATE=true
# export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_DESCRIBE_STYLE='contains'
#export GIT_PS1_SHOWUPSTREAM='auto'

# if [ -f /opt/local/share/git/git-prompt.sh ]; then
#     source /opt/local/share/git/git-prompt.sh
# fi
# if [ -f /usr/share/git-core/git-prompt.sh ]; then
#     source /usr/share/git-core/git-prompt.sh
# fi
# if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then
#     source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
# fi

# GIT_PS1_SHOWCOLORHINTS=true

# function parse_git_dirty
# {
#   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
# }

# function real_user
# {
#   LOGNAME=$(logname)
#   if [ "${LOGNAME}" == "${USER}" ]; then
#     echo "${LOGNAME}"
#   else
#     echo "$(tput setaf 1)${LOGNAME}$(tput sgr0) as ${USER}"
#   fi
#   #FULLUSER=$([ "${LOGNAME}" = "${USER}" ] && echo ${USER} || echo '$(tput setaf 1)${LOGNAME}$(tput sgr0) as ${USER}')
#   #echo ${FULLUSER}
# }

# GREEN="\[\e[0;32m\]"
# COLOR_NONE="\[\e[0m\]"

#PS1='\h:\W \u\$ '
#PS1='\h:\w \u\$ '
#export PS1='\u@\h \w$(__git_ps1 "[%s]")$ '
#export PS1='\u@\h \w\[\e[0;32m\]$(__git_ps1 "[%s]")\[\e[0m\]$ '
#export PS1='\u@\h \w$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]]")$ '
#export PS1='\u@\h:\w$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;31m\]$(parse_git_dirty)\[\e[0m\]]")$ '
#export PS1='$(real_user)@\h:\w$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;31m\]$(parse_git_dirty)\[\e[0m\]]")$ '
#export PS1='$(real_user)@\h:\w$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]]")$ '
#export PS1='$(real_user)@\h:\w$(__git_ps1 "[%s]")$ '
#export PS1VAL='$(real_user)@\h:\w$(__git_ps1 " (%s)")$ '

# git_prompt=`type __git_ps1`
# if [ "functionZ" == ${git_prompt}Z ]; then
#     #export PS1VAL='@\h:\w$(__git_ps1 " ($GREEN%s$COLOR_NONE)")$ '
#     export PS1VAL='$(real_user)@\h:\w$(__git_ps1 "[%s]")$ '
# else
#     #export PS1VAL='@\h:\w$ '
#     export PS1VAL='$(real_user)@\h:\w$ '
# fi

# function set_prompt
# {
#   PS1="${PS1VAL}"
# }

# set a fancy prompt (non-color, unless we know we "want" color)
#  - stupid gnome-terminal sets only xterm, see https://bugs.launchpad.net/ubuntu/+source/bash/+bug/103929
#  - Mac OS X sets xterm-256color
# if [ "functionZ" == ${git_prompt}Z ]; then
#     case "$TERM" in
#         xterm-color|xterm|xterm-256color)
#             #PROMPT_COMMAND=set_prompt
#             #PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
#             # Downside here is that it breaks other things that try to adjust PS1, like virtualenv
#             PROMPT_COMMAND='__git_ps1 "$(real_user)@\h:\w" "\\\$ "'
#             #PS1="${PS1VAL}"
#         ;;
#         *)
#             PS1="${PS1VAL}"
#         ;;
#     esac
# else
#     PS1="${PS1VAL}"
# fi
