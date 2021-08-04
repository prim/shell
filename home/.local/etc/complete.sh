[ -f ~/.shell-debug ] && echo "loading .local/etc/complete.sh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion bash)
fi

if [ -x "$(command -v helm)" ]; then
    source <(helm completion bash)
fi
