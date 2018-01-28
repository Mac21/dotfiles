#
# ~/.bash_profile
#

export VISUAL=nvim
export EDITOR=nvim


export GOARCH=amd64
export GOROOT="$HOME/go"
# Uncomment when dev golang / kubernetes
export ARCH=x86_64
export K8S_VERSION=$(curl -sS https://storage.googleapis.com/kubernetes-release/release/stable.txt)

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
