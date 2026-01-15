# fix word skip over certain characters: https://github.com/kovidgoyal/kitty/issues/838
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# fix kitty ssh terminal issue: https://wiki.archlinux.org/title/Kitty#Terminal_issues_with_SSH
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# enable zsh completions
autoload -Uz compinit
compinit

# starship prompt
eval "$(starship init zsh)"
# start fastfetch
fastfetch