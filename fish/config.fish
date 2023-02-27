if status is-interactive
    # Commands to run in interactive sessions can go here
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'
    alias ll='ls -l --color=auto --time-style=+"%Y-%m-%d %H:%M:%S"'
    alias l.='ls -a --color=auto'

    alias vi nvim
    alias lg "set -x LC_ALL en_US.UTF-8; lazygit"
end

# LSP 可能会打开很多文件
ulimit -n 32768

### LANGUAGE
# set -gx LANGE en_US.UTF-8
# for ls
set -gx LANGUAGE en_US:en


set -gx DENO_INSTALL $HOME/.deno


