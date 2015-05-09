#http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
