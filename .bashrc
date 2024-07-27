# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -AlhF'
alias la='ls -Ah'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Completion directory
# Source each .bash file inside this directory.
if [ -x ~/.bin ]; then
  for file in $(dir ~/.bin); do
    fp="~/.bin/$file"
    if [ -f $fp ]; then
      . $fp
    fi
  done
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Print directory after moving.
# cd() { builtin cd "$@"; ll; }

gcgh() {
  git clone "https://github.com/$@";
}

# Prune any branch which has status 'gone'
gpbr() {
  for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do
    git branch -D $branch
  done
}

xscreenname() {
  xrandr | grep connected | grep -v disconnected | awk '{print $1}'
}

xscalescreen() {
  #xrandr --output "$(xscreenname)" --scale 1.0x1.0
  #xrandr --output "$(xscreenname)" --scale 1.5x1.5
  xrandr --output "$(xscreenname)" --scale 0.5x0.5
}

dockercleanup() {
  docker rmi -f $(docker images -qf "dangling=true")
}

export TERM=termite
export TERMINAL=termite

#source <(kubectl completion bash)
export VISUAL=nvim
export EDITOR=nvim
export PAGER=most


export GOARCH=amd64
export GOROOT="$HOME/go"
# Uncomment when dev golang / kubernetes
export ARCH=x86_64
# if [[ -n $K8S_VERSION ]]; then
  # export K8S_VERSION=$(curl -sS https://storage.googleapis.com/kubernetes-release/release/stable.txt)
# fi

export GOPATH="$HOME/gocode"
# TODO: uncomment when debugging neovim.
# PATH="$PATH:$HOME/neovim/bin"

# Nodejs path manip.
export RUBY_GEMS="$HOME/.gem/ruby/2.5.0/bin"
export NPM_CONFIG_PREFIX="$HOME/.node_modules"
if [ -d $GOPATH/src/k8s.io/kubernetes/third_party/etcd ]; then
  PATH="$GOPATH/src/k8s.io/kubernetes/third_party/etcd:$PATH"
fi

PATH="$GOPATH/bin:$PATH:$RUBY_GEMS:$NPM_CONFIG_PREFIX/bin:/home/toller/.local/bin"
export RIPGREP_CONFIG_PATH="$HOME/.vim/.ripgreprc"

if [[ -e /bin/pyenv || -e /usr/bin/pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# if [ -e /home/toller/.sfdx ]; then
#   eval $(sfdx autocomplete:script bash)
# fi

export PATH
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }pwd > /tmp/whereami"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
