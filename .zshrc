#Antigen
source ~/.antigen/antigen.zsh

#OhMyZsh
#export ZSH=/Users/anthonyleung/.oh-my-zsh
antigen use oh-my-zsh

# Antigen Bundles
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle vagrant
antigen bundle tmux

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
PURE_PROMPT_SYMBOL=λ

# Tell Antigen that you're done.
antigen apply



# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#SH_THEME="norm"

#source $ZSH/oh-my-zsh.sh

# NVM
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# GULP Autocomplete
#eval "$(gulp --completion=zsh)" # gulp autocompletion

# Auto ls when cd
cd() { builtin cd "$@"; l; }

# Use the proper paths based on your installation
#export MYSQLXPB_PROTOBUF_INCLUDE_DIR=/usr/local/opt/protobuf/include
#export MYSQLXPB_PROTOBUF_LIB_DIR=/usr/local/opt/protobuf/lib
#export MYSQLXPB_PROTOC=/usr/local/opt/protobuf/bin/protoc

# ssh alias
#alias dev="cd ~/Documents/Projects/dev-vagrant/ > /dev/null && vagrant up > /dev/null && vagrant ssh"

# Auto start tmux
 # [ -z "$TMUX"  ] && { tmux attach 2> /dev/null || exec tmux new-session && exit;}

# markdown alis
alias mdhtml="sh /Users/anthonyleung/Dropbox/University\ of\ Waterloo/Pandoc/pandoc.sh"
alias schoolSTFP="sshfs th4leung@linux.student.cs.uwaterloo.ca:/u0/th4leung ~/SchoolSFTP -o defer_permissions -o volname=School"

# Virtualenv python3
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
