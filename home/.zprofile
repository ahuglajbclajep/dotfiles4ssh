# ~/.zprofile: executed by zsh for login shell.
# see http://zsh.sourceforge.net/Guide/zshguide02.html

# read ~/.profile
# see https://support.apple.com/kb/HT208050
[[ -e "$HOME/.profile" ]] && emulate sh -c ". $HOME/.profile"
