# !/bin/bash

dotdir=$PWD

# NVim
if [ ! -d "$HOME/.config/nvim/init.vim" ]; then
  mkdir $HOME/.config
  mkdir $HOME/.config/nvim
  ln -s $HOME/$dotdir/nvim/init.vim /home/vagrant/.config/nvim/init.vim
fi
# Vim Plug
if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
nvim +PlugInstall +qall

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

# GDB
if [ ! -e "$HOME/.gdbinit" ]; then
  ln -s $dotdir/.gdbinit $HOME/.gdbinit
fi

# KeyMaps
if [ -e "$HOME/Documents/Projects/qmk_firmware"]; then
  if [ ! -e "$HOME/Documents/Projects/qmk_firmware/keyboards/nyquist/keymaps/anthony"]; then
    mkdir $HOME/Documents/Projects/qmk_firmware/keyboards/nyquist/keymaps/anthony
  fi
  ln -s $dotdir/keymaps/nyquist/* $HOME/Documents/Projects/qmk_firmware/keyboards/nyquist/keymaps/anthony

  if [ ! -e "$HOME/Documents/Projects/qmk_firmware/keyboards/tada68/keymaps/anthony"]; then
    mkdir $HOME/Documents/Projects/qmk_firmware/keyboards/tada68/keymaps/anthony
  fi
  ln -s $dotdir/keymaps/tada68/* $HOME/Documents/Projects/qmk_firmware/keyboards/tada68/keymaps/anthony
fi

# FISH
if [ ! -d "$HOME/.config/fish" ]; then
  mkdir $HOME/.config/fish
fi
if [ ! -d "$HOME/.config/fish/functions" ]; then
  mkdir $HOME/.config/fish/functions
fi
if [ ! -e "$HOME/.config/fish/config.fish" ]; then
  ln -s "$dotdir/fish/config.fish" "$HOME/.config/fish/config.fish"
fi
if [ ! -e "$HOME/.config/fish/aliases.fish" ]; then
  ln -s "$dotdir/fish/aliases.fish" "$HOME/.config/fish/aliases.fish"
fi
if [ ! -e "$HOME/.config/fish/functions/dev_ubuntu.fish" ]; then
  ln -s "$dotdir/fish/functions/dev_ubuntu.fish" "$HOME/.config/fish/functions/dev_ubuntu.fish"
fi
if [ ! -e "$HOME/.config/fish/functions/fish_prompt.fish" ]; then
  ln -s "$dotdir/fish/functions/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"
fi
