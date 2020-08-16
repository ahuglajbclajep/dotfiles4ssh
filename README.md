# dotfiles4ssh

```sh
$ ssh myhost
% git clone https://github.com/ahuglajbclajep/dotfiles4ssh.git ~/.dotfiles && ~/.dotfiles/install.sh
% echo 'export PATH="~/.local/bin:$PATH"' >> ~/.profile && exit
$ ssh myhost -t 'exec ~/.local/bin/zsh -l'
```
