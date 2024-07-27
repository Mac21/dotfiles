#
# ~/.bash_profile
#
export TERMINAL=termite
export TERM=termite

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
export PROMPT_COMMAND="pwd > /tmp/whereami"
