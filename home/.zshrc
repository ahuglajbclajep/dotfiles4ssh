# ~/.zshrc: executed by zsh for non-login shells.
# see http://zsh.sourceforge.net/Guide/zshguide02.html

export DOTFILES_ROOT="$(readlink -f "$HOME/.zshrc" | sed 's:/[^/]*/[^/]*$::')"

# load antigen
if [ -f "$DOTFILES_ROOT/antigen.zsh" ]; then
  source "$DOTFILES_ROOT/antigen.zsh"

  # load plugins
  antigen use oh-my-zsh
  antigen bundle common-aliases
  antigen bundle pyenv
  antigen bundle lukechilds/zsh-nvm
  antigen bundle nvm
  antigen bundle yarn
  antigen bundle zdharma/fast-syntax-highlighting

  # load theme
  # see https://github.com/sindresorhus/pure/tree/v1.13.0#antigen
  antigen bundle mafredri/zsh-async
  antigen bundle sindresorhus/pure

  # apply all bundles
  antigen apply

  # if ~/.nvm/* exists from the beginning, `antigen bundle lukechilds/zsh-nvm` fails due to `git clone`
  [ ! -f "$NVM_DIR/default-packages" ] && echo 'yarn' > "$NVM_DIR/default-packages"
fi

setopt nobeep

kill9() {
  [ $# -eq 0 ] && return 1
  ps -u "$(whoami)" -o pid,ppid,comm | grep "$@" | awk '{print $1,$2}' | xargs -L 1 kill -9
}
