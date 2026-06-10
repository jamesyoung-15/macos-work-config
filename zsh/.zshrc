# fix word skip over certain characters: https://github.com/kovidgoyal/kitty/issues/838
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# fix kitty terminal issues with SSH
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -Uz compinit
compinit
eval "$(starship init zsh)"
fastfetch
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# AMFAM Claude Code Config
export ANTHROPIC_BASE_URL=https://ava-developers.amfam.com
export ANTHROPIC_AUTH_TOKEN=""
export ANTHROPIC_MODEL=claude-sonnet-4-5
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