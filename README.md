Vim settings, and plugins.
----

# Prereq

.xserverrc and .xinitrc need +x

##  Ubuntu
  ```
  sudo apt-get install -y git cmake \
                              ubuntu-dev-tools \
                              build-essential \
                              python3-dev \
                              python-dev \
                              python3-pip \
                              python-pip \
                              virtualenv \
                              neovim \
                              tmux \
                              tmuxinator \
                              ruby-neovim \
                              clang \
                              clang-tidy
  ```

## Arch
  See the arch subdirectory setup.sh and SETUP.md files.


## General

  FYI

  install pyenv and pyenv-virtualenv

  Predefined blocklets for i3blocks.
  ```
  git clone https://github.com/vivien/i3blocks-contrib
  ```

  ```
  ./update_bundles.sh

  git clone https://github.com/powerline/fonts
  ./fonts/install.sh

  pyenv virtualenv 2.7 neovim2
  pyenv virtualenv 3.7 neovim3
  ````
  for both virtualenvs install:
  ```
    jedi
    pynvim
    libclang-py3
 ```


