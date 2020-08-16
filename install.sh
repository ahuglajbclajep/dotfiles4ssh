#! /bin/bash -e

cd "$(dirname "$0")"

# see https://github.com/xxh/xxh-shell-zsh/blob/40d16b1/build.sh#L26-L27
zshbin='https://github.com/romkatv/zsh-bin/releases/download/v4.1.0/zsh-5.8-linux-x86_64.tar.gz'
zshdir="$HOME/.local"
dirmaps=(
  "home:$HOME"
)

if [ -x "$(command -v "$zshdir/bin/zsh")" ]; then
  mkdir -p "$zshdir"
  curl -sSL $zshbin | tar -xzC "$zshdir"
  # for add-zsh-hook, is-at-least and compinit
  # see https://github.com/romkatv/zsh-bin/blob/v4.1.0/install#L478
  "$zshdir/share/zsh/5.8/scripts/relocate"
fi
# see https://github.com/zsh-users/antigen/issues/659
[ ! -f 'antigen.zsh' ] && curl -sSLo 'antigen.zsh' git.io/antigen

read -rp 'create symbolic links? (y/N): ' yn
if [ "$yn" = 'y' ]; then
  for dirmap in "${dirmaps[@]}"; do
    from="${dirmap%:*}"
    to="${dirmap#*:}"

    files=$(find "$from" -type f)
    defaultIFS="$IFS"; IFS=$'\n'
    for file in $files; do
      target="$to/${file#*/}"
      mkdir -p "${target%/*}"
      ln -is "$PWD/$file" "$target"
    done
    IFS="$defaultIFS"
  done
fi
