# fix word skip over certain characters: https://github.com/kovidgoyal/kitty/issues/838
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# fix kitty terminal issues with SSH
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# own aliases
alias ll='ls -alF'
alias la='ls -A'
alias jiraitems=$'acli jira workitem search --jql "assignee = currentUser() AND status = \'In Progress\'"'
alias llamaqwen35b='llama-server -hf unsloth/Qwen3.5-35B-A3B-GGUF:Q4_K_XL --port 8089'
alias llamaqwen9b='llama-server -hf unsloth/Qwen3.5-9B-GGUF:Q4_K_M --port 8089'
alias aap-chatops-start='/Users/James.Young@amfam.com/dev/side-projects/aap-chatops/scripts/run-bot-tmux.sh'
alias jyy='jyy-amfam-toolkit'

# AMFAM Claude Code Config
export ANTHROPIC_BASE_URL=https://ava-developers.amfam.com
export ANTHROPIC_AUTH_TOKEN=""
export ANTHROPIC_MODEL=claude-sonnet-5
export ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-haiku-4-5
export CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
export CURL_CA_BUNDLE=${HOME}/amfam-ssl-certs/ca-bundle.pem
export NODE_EXTRA_CA_CERTS=${HOME}/amfam-ssl-certs/amfam-bundle.pem
export BUNDLE_SSL_CA_CERT=${CURL_CA_BUNDLE}
export HTTPS_CA_FILE=${CURL_CA_BUNDLE}
export PERL_LWP_SSL_CA_FILE=${CURL_CA_BUNDLE}
export REQUESTS_CA_BUNDLE=${CURL_CA_BUNDLE}
export SSL_CERT_FILE=${CURL_CA_BUNDLE}
export CLOUDSDK_PYTHON_SSLCERTFILE=${CURL_CA_BUNDLE}

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


autoload -Uz compinit
# initializes zsh's native completion system
compinit
# enables bash-style completion definitions (needed for some CLIs)
autoload -U +X bashcompinit && bashcompinit
# terraform uses its own completion command via complete
complete -o nospace -C /opt/homebrew/bin/terraform terraform

if [ -x /opt/homebrew/bin/oc ]; then
  # load openshift CLI completion into zsh
  source <(oc completion zsh)
  compdef _oc oc
fi

eval "$(starship init zsh)"
fastfetch

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
