dotfiles
========


```sh
# vim
ln -s /Users/hoge/Documents/projects/dotfiles/vim/.vim /Users/hoge/.vim
ln -s /Users/hoge/Documents/projects/dotfiles/vim/.vimrc /Users/hoge/.vimrc

# zsh
ln -s /Users/hoge/Documents/projects/dotfiles/zsh/.zshrc /Users/hoge/.zshrc

# tmux
ln -s /Users/hoge/Documents/projects/dotfiles/tmux/tmux.conf /Users/hoge/tmux.conf
```


## zsh

/etc/shellsにzshのパスを追記する

```sh
sudo vim /etc/shells
```


## 導入手順

### mac

1. brewのインストール
2. brew でBrewfileのアプリケーションを一括でインストール
    * Brewfileが必要
    * gitが使えるようになる
    * python/go/ghqが使えるようになる
    * zsh/tmuxが使えるようになる
3. go/ghqの設定
    * GOPATH/ghq.rooなど
4. keyfileを適宜設定する
    * プライベートリポジトリを取得するためには必要
5. ghq importで必要なリポジトリを一括で取得
    * 個人的に必要なのものはvim/dotfile/mywikiくらいか
    * repo-list.txt(要はghq listの出力結果)が必要
    * cat repo-list.txt | ghq import
6. vimをビルド
7. シンボリックリンクの設定
8. google/slackなどのアカウントの設定

