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


* 快捷键
    + gd, K, gr, <space>rn
    + NvimTree
      - g? 显示快捷键


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



