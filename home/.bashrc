[ -f ~/.shell-debug ] && echo "loading .bashrc"

##############################################################################
### init.sh

# 千万别混淆 Bash/Zsh 的四种运行模式 https://zhuanlan.zhihu.com/p/47819029
# 提高效率从编写 init.sh 开始 https://zhuanlan.zhihu.com/p/50080614

# 交互式模式的初始化脚本
# 防止被加载两次
if [ -z "$_INIT_SH_LOADED" ]; then
    _INIT_SH_LOADED=1
else
    return
fi

# 如果是非交互式则退出，比如 bash test.sh 这种调用 bash 运行脚本时就不是交互式
# 只有直接敲 bash 进入的等待用户输入命令的那种模式才成为交互式，才往下初始化
case "$-" in
    *i*) ;;
    *) return
esac

# 将个人 ~/.local/bin 目录加入 PATH
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# 判断 ~/.local/etc/common.sh 存在的话，就 source 它一下
if [ -f "$HOME/.local/etc/common.sh" ]; then
    . "$HOME/.local/etc/common.sh"
fi

# 判断 ~/.local/etc/config.sh 存在的话，就 source 它一下
if [ -f "$HOME/.local/etc/config.sh" ]; then
    . "$HOME/.local/etc/config.sh"
fi

# 判断 ~/.local/etc/local.sh 存在的话，就 source 它一下
if [ -f "$HOME/.local/etc/local.sh" ]; then
    . "$HOME/.local/etc/local.sh"
fi

# 整理 PATH，删除重复路径
if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}
        case $PATH: in
           *:"$x":*) ;;
           *) PATH=$PATH:$x;;
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi

export PATH

# 如果是 bash/zsh 的话，source 一下 ~/.local/etc/function.sh
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
    # run script for interactive mode of bash/zsh
    if [[ $- == *i* ]] && [ -z "$_INIT_SH_NOFUN" ]; then
        if [ -f "$HOME/.local/etc/function.sh" ]; then
            . "$HOME/.local/etc/function.sh"
        fi
    fi
fi

# 如果是登陆模式，那么 source 一下 ~/.local/etc/login.sh
if [ -n "$BASH_VERSION" ]; then
    if shopt -q login_shell; then
        if [ -f "$HOME/.local/etc/login.sh" ] && [ -z "$_INIT_SH_NOLOG" ]; then
            . "$HOME/.local/etc/login.sh"
        fi
    fi
elif [ -n "$ZSH_VERSION" ]; then
    if [[ -o login ]]; then
        if [ -f "$HOME/.local/etc/login.sh" ] && [ -z "$_INIT_SH_NOLOG" ]; then
            . "$HOME/.local/etc/login.sh"
        fi
    fi
fi

# 尝试跳转到 tmux
if [[ -z "$TMUX" ]]; then
    if [ $USER == "hcjn0770" ]; then
        # -2 Force tmux to assume the terminal supports 256 colours.
        # -u tmux attempts to guess if the terminal is likely to support UTF-8 by checking the first of
        #    the LC_ALL, LC_CTYPE and LANG environment variables to be set for the string "UTF-8".
        #    This  is not always correct: the -u flag explicitly informs tmux that UTF-8 is supported.
        tmux -2 -u new-session -s $USER
        tmux -2 -u attach -t $USER
    fi
else
    [ -f ~/.shell-debug ] && echo "loading .bashrc: in tmux"
fi

