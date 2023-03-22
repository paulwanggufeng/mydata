person data


* search
    + class, function
    + find usages
    + set exclude directory (e.g. build/debug/release)
    
* gdb
    + compile
    + debug (breakpoint, view windows)


* plugins
    + md
    + 

* command
    + NvimTreeFindFile 跳转到 NvimTree 上文件对应位置
    + :Telescope live_grep search_dirs=. 在指定目录搜索文件内容
    + :cc 打开 quicklist 第一条
      - :cn 打开 quicklist 下一条
      - :cp 打开 quicklist 前一条
    + :ll 打开 locallist 命令，与 quickfix 类似。只是将 c 替换成 l
    + in file grep window <M-q> send_selected_to_qlist + open
    + in file grep window <C-q> send_to_qlist + open
    + open all quicklist files - <leader>ka
    + ]c jump to next diff ([c)
    + <leader>fd open diagnostic
    + ]d next diagnostic
    + <leader>ca code action 应用diagnostic修改建议


* 快捷键
    + gd, K, gr, <space>rn
    + zz, zt, zb 移动当前光标行到屏幕中间、顶部、底部
    + NvimTree
      - g? 显示快捷键
    + Ctrl-^ 跳转到上次打开的文件

* vim key
    + move screen
        - Ctrl-y Moves screen up one line
        - Ctrl-e Moves screen down one line
        - Ctrl-u Moves cursor & screen up ½ page
        - Ctrl-d Moves cursor & screen down ½ page
        - Ctrl-b Moves screen up one page, cursor to last line
        - Ctrl-f Moves screen down one page, cursor to first line
        - zz - move current line to the middle of the screen (warning: ZZ is save and exit, so watch out for caps lock)
        - zt - move current line to the top of the screen
        - zb - move current line to the bottom of the screen
    + Vim folding commands
        - zf#j creates a fold from the cursor down # lines.
        - zf/ string creates a fold from the cursor to string .
        - zj moves the cursor to the next fold.
        - zk moves the cursor to the previous fold.
        - za toggle a fold at the cursor.
        - zo opens a fold at the cursor.
        - zO opens all folds at the cursor.
        - zc closes a fold under cursor. 
        - zm increases the foldlevel by one.
        - zM closes all open folds.
        - zr decreases the foldlevel by one.
        - zR decreases the foldlevel to zero -- all folds will be open.
        - zd deletes the fold at the cursor.
        - zE deletes all folds.
        - [z move to start of open fold.
        - ]z move to end of open fold.



* installed
    + exa, nnn

* others
    + 显示可安装包列表
        - apt-cache policy <package name>
        - snap info <package name>

run lua command in nvim
:lua print("hello")

display number of current buffer
:echo bufnr('%')


vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<C-A-L>', function() vim.lsp.buf.format { async = true } end, bufopts)


可自行文件
/etc/rc.local

#!/bin/sh -e

sudo /usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other -o uid=1000 -o gid=1000 -o umask=022



