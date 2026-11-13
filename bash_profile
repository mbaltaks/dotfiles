# ~/.bash_profile: executed by bash(1) for login shells.

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
if [ -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]; then . "${HOME}/.nix-profile/etc/profile.d/nix.sh"; fi # added by Nix installer

export PATH="$HOME/.cargo/bin:$PATH"

[ -f "${HOME}/Library/Preferences/org.dystroy.broot/launcher/bash/br" ] && source "${HOME}/Library/Preferences/org.dystroy.broot/launcher/bash/br"

# Added by LM Studio CLI (lms)
export PATH="$PATH:${HOME}/.lmstudio/bin"
# End of LM Studio CLI section

[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH
