# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files

# https://dotfiles.github.io
# http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789

for DOTFILE in ~/.dotfiles/{function,function_macosx,path,env,alias,completion,prompt,custom}; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
