if status is-interactive
    # Commands to run in interactive sessions can go here
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'
    alias ll='ls -l --color=auto --time-style=+"%Y-%m-%d %H:%M:%S"'
    alias l.='ls -a --color=auto'
    alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

    alias vi nvim
    alias lg lazygit
end

# set -x CLANG_FORMAT_TOOL /opt/tools/clang-format

### LANGUAGE
# for lazygit
set -gx LC_ALL en_US.UTF-8
# set -gx LANGE en_US.UTF-8
# for ls
set -gx LANGUAGE en_US:en


set -gx DENO_INSTALL $HOME/.deno

# fish_add_path -U ~/.local/bin/


