# fish-config

My fish configs

## Prerequisites

It is assumed that:

* Fish Shell is installed, located at `/usr/local/bin/fish`, and is the current
  shell
  ```bash
  brew update; brew install fish
  printf "/usr/local/bin/fish" >> /etc/shells
  chsh -s /usr/local/bin/fish
  ```

* Fisherman is installed
  ```fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  ```

## Install

```fish
mv $HOME/.config/fish{,.bak}
git clone git@github.com:cmbankester/fish-config.git $HOME/.config/fish
## optional:
# touch $HOME/.config/fish/config.local.fish # for non-git-tracked stuff
exec fish # to reload shell
```

## TODO

* Add Desk installation / integration to readme
