source "$ZPLUG_ROOT/init.zsh"

# Theme
zplug "agnoster/agnoster-zsh-theme", as:theme

if ! zplug check; then
 zplug install
fi

zplug load
