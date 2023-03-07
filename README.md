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

* installed
    + exa, nnn

* others
    + 显示可安装包列表
        - apt-cache policy <package name>
        - snap info <package name>

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



