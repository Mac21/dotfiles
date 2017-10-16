Vim settings, and plugins.
----

# Note
  Both .xserverrc and .xinitrc need +x

# Prereq

##  Ubuntu
  sudo apt-get install -y git cmake ubuntu-dev-tools build-essential python3-dev python-dev python3-pip python-pip virtualenv neovim tmux tmuxinator ruby-neovim clang clang-tidy
  mkdir bundle  

## Arch
  TODO: Complete and maybe add setup script?  
  sudo pacman -Sy git cmake ruby clang clang-tidy python python2 python2-pip python-pip python-virtualenv  


## General
  ./update_bundles.sh  

  git clone https://github.com/powerline/fonts  
  ./fonts/install.sh

  virtualenv --python=python2 neovim2  
  virtualenv --python=python3 neovim3  

  for both virtualenvs install:  
    jedi  
    neovim  
    libclang-py3  


