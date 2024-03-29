person data


* gdb
    + compile
    + debug (breakpoint, view windows)

* command
    + NvimTreeFindFile 跳转到 NvimTree 上文件对应位置
    + :Telescope live_grep search_dirs=. 在指定目录搜索文件内容
    + :Telescope live_grep search_dirs=%:p 在当前打开的文件中搜索字符串
      - 上面的命令等同与 :lua require'telescope.builtin'.live_grep{ search_dirs={"%:p"} }
    + :Telescope live_grep grep_open_files=true 在当前所有打开的文件中搜索字符串
    + :Telescope lsp_document_symbols symbols=metho 在当前buffer只查找 method
      - :lua require("telescope.builtin").lsp_document_symbols({ symbols = { "class", "field" } }) 查询多个类型
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
    + :.!seq 1 15 在当前位置插入序列号 (1 - 15) vim sequence number
    + :%!sort -k2nr 整个文件按第二列排序,排序以数字顺序排序(默认为字典顺序),降序排序
        - :'<,'>!sort -k2nr  排序范围为选择区域
    + 在其他terminal编译并将错误输出到文件,并在 quickfix list 中打开错误
        - make -C build -j6 my_application 2>&1 | tee backup/compile.txt
        - :cexpr system('cat backup/compile.txt')


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
        - zf/string creates a fold from the cursor to string .
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
    + Using jump list
        - Ctrl-^ 跳转到上次打开的文件
        - Like a web browser, you can go back, then forward:
        - Press Ctrl-O to jump back to the previous (older) location.
        - Press Ctrl-I (same as Tab) to jump forward to the next (newer) location.
        - Display the jump list for the current window with:
            + :jumps

* git
    + show a commit merge time (not commit time)
        - git log --pretty=format:"%ci [%h] %s" <commit-id> | head -1

* others
    + 显示可安装包列表
        - apt-cache policy <package name>
        - apt-cache madison <package name>
            * apt list -a <package name>
        - snap info <package name>

run lua command in nvim
:lua print("hello")

display number of current buffer
:echo bufnr('%')






