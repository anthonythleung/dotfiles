#!/bin/bash

dotdir=$PWD

# ZSH
if [ ! -d "$HOME/.antigen" ]; then
  echo dirctory does not exist
  mkdir ~/.antigen
fi
if [ ! -e "$HOME/.antigen/antigen.zsh" ]; then
  curl -L git.io/antigen > ~/.antigen/antigen.zsh
fi
if [ ! -e "$HOME/.zshrc" ]; then
  ln -s $dotdir/.zshrc $HOME/.zshrc
fi

# Vim
if [ ! -e "$HOME/.vim/autoload/pathogen.vim" ]; then
  mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
if [ ! -e "$HOME/.vimrc" ]; then
  ln -s $dotdir/.vimrc $HOME/.vimrc
fi

# Tmux
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ ! -e "$HOME/.tmux.conf" ]; then
  ln -s $dotdir/.tmux.conf $HOME/.tmux.conf
fi

# ssh
if [ ! -e "$HOME/.ssh/config" ]; then
  ln -s $dotdir/ssh/config $HOME/.ssh/config
fi

# Profile
if [ ! -e "$HOME/.profile" ]; then
  ln -s $dotdir/.profile $HOME/.profile
fi

# GDB
if [ ! -e "$HOME/.gdbinit" ]; then
  ln -s $dotdir/.gdbinit $HOME/.gdbinit
fi
