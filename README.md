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

* Oh My Fish is installed to `$HOME/.local/share/omf`
  ```bash
  curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
  ```

## Install

```fish
mv $HOME/.config/fish{,.bak}
git clone git@github.com:cmbankester/fish-config.git $HOME/.config/fish
## optional:
# touch $HOME/.config/fish/config.local.fish # for non-git-tracked stuff
exec fish # to reload shell
fundle install # to install fundle plugins
```

## TODO

* Remove reliance on Oh My Fish
  * Instead, use
    [oh-my-fish-core](https://github.com/tuvistavie/oh-my-fish-core) fundle
    plugin(s)
* Add Desk installation to readme
* Add Deskfiles?
* Create fundle plugin?
