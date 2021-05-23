[ -f ~/.bash_test ] && echo ".local/etc/common.sh ing"

##############################################################################
### default

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##############################################################################
### aliases

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias gs='git status'
alias gp='git pull --rebase'
alias gps='git push'

alias v='vim'

##############################################################################
### nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##############################################################################
### fzf

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

##############################################################################
### 命令行提示符

# https://zhuanlan.zhihu.com/p/51008087
if [ -n "$BASH_VERSION" ]; then
    export PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
else
    if [ "$UID" -eq 0 ]; then
        export PROMPT='%F{10}%n@%m%f:%F{12}%~%f%# '
    else
        export PROMPT='%F{10}%n@%m%f:%F{12}%~%f\$ '
    fi
fi

##############################################################################
### PATH

export PATH="$HOME/.pyenv/bin:$PATH"

##############################################################################
### 历史

# 设置历史的包
export HISTTIMEFORMAT="%h %d %H:%M:%S "
# 内存中 HISTORY 的上限
export HISTSIZE=10000
# 文件中 HISTORY 的上限
export HISTFILESIZE=100000
# 忽略、删除重复的历史命令
export HISTCONTROL=ignoredups:erasedups
# 忽略简单的命令
export HISTIGNORE="ls *:ps *:history *:cd *"
# 有时间格式的时候配合 fzf 有问题，可能会把两条命令合并成一条，导致搜索不太对
export HISTTIMEFORMAT=""

# 执行命令前保存上一条命令到 HISTORY
# 读取文件中未在内存中的历史
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# 避免 .bash_history 被覆盖
shopt -s histappend
# 将多行命令保存为单条记录
shopt -s cmdhist


##############################################################################
### cd

# z.lua https://zhuanlan.zhihu.com/p/50548459
eval "$(lua $HOME/.local/bin/z.lua  --init bash once enhanced)"


##############################################################################
### kubectl & helm

if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion bash)
    alias k=kubectl
    complete -F __start_kubectl k
fi

if [ -x "$(command -v helm)" ]; then
    source <(helm completion bash)
fi



