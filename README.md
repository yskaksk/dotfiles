dotfiles
========


## zsh

/etc/shellsにzshのパスを追記する

```sh
sudo vim /etc/shells
```

## npm

1. brew でnodebrewをインストールする

```
brew install nodebrew
```

2. nodebrew でNode.jsとnpmをインストールする

```
mkdir -p ~/.nodebrew/src
nodebrew install-binary latest
```
