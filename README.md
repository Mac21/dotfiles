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

  The vimproc plugin requires you execute make in its directory.

  ```
  ./update_bundles.sh

  git clone https://github.com/powerline/fonts
  ./fonts/install.sh

  virtualenv --python=python2 neovim2
  virtualenv --python=python3 neovim3
  ````
  for both virtualenvs install:
  ```
    jedi
    neovim
    libclang-py3
 ```


