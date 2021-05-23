[ -f ~/.shell-debug ] && echo "loading .bash_profile"

# 避免 login shell 不执行 bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

