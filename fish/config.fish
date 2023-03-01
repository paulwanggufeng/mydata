### LANGUAGE
# do not set in global
# for lazygit
# set -gx LANG en_US.UTF-8
# for ls
# set -x LANGUAGE en_US:en

if status is-interactive
    # Commands to run in interactive sessions can go here
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias ls "set -x LANGUAGE en_US.UTF-8; /usr/bin/ls --color=auto"
    alias ll "set -x LANGUAGE en_US.UTF-8; /usr/bin/ls -l --color=auto --time-style=+'%Y-%m-%d %H:%M:%S'"
    alias l. "set -x LANGUAGE en_US.UTF-8; /usr/bin/ls -a --color=auto"

    alias vi nvim
    alias lg "set -x LC_ALL en_US.UTF-8; lazygit"
end

# LSP 可能会打开很多文件
ulimit -n 32768


set -gx DENO_INSTALL $HOME/.deno


