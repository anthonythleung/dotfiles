#!/bin/bash

dotdir=$PWD

# ZSH
mkdir ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh
ln -s $dotdir/.zshrc $HOME/.zshrc

# Vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ln -s $dotdir/.vimrc $HOME/.vimrc

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $dotdir/.tmux.conf $HOME/.tmux.conf

# ssh
ln -s $dotdir/ssh/config $HOME/.ssh/config

# Profile
ln -s $dotdir/.profile $HOME/.profile
