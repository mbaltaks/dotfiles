# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files

for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env,alias,completion,prompt,custom}; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
