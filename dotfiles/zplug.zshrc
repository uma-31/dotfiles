source "$ZPLUG_ROOT/init.zsh"

if ! zplug check; then
 zplug install
fi

zplug load
