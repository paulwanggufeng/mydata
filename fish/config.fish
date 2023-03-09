if status is-interactive
  # set LANG for interactive terminal (we don't the man, lazygit show other language in the terminal)
  # set -x LC_ALL en_US:UTF-8
  set -x LANG en_US.UTF-8
  set -x LANGUAGE en_US:en

  # Commands to run in interactive sessions can go here
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias grep='grep --color=auto'
  alias ls 'ls --color=auto'
  alias ll 'ls -l --color=auto --time-style=+"%Y-%m-%d %H:%M:%S"'
  alias l. 'ls -a --color=auto'

  #alias vi nvim
  alias vi lvim
  alias lg lazygit

  #set -x VISUAL nvim
  set -x VISUAL lvim
end

# LSP 可能会打开很多文件
ulimit -n 32768


set -gx DENO_INSTALL $HOME/.deno


