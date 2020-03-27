#!/bin/bash

root_dir=$(cd $(dirname $0)/..; pwd)

# vim
ln -s $root_dir/vim/.vim $HOME/.vim
ln -s $root_dir/vim/.vimrc $HOME/.vimrc

# zsh
ln -s $root_dir/zsh/.zshrc $HOME/.zshrc

# tmux
ln -s $root_dir/tmux/.tmux.conf $HOME/.tmux.conf
