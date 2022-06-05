source "$ZPLUG_ROOT/init.zsh"

# Theme
zplug 'agnoster/agnoster-zsh-theme', as:theme

# Other plugins
zplug 'zsh-users/zsh-completions'
zplug 'marlonrichert/zsh-autocomplete'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# Install plugins if not installed
if ! zplug check; then
 zplug install
fi

# Load plugins
zplug load
