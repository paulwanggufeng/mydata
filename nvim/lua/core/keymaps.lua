vim.g.mapleader = " "

local keymap = vim.keymap

-- 命令
vim.cmd([[ 
  cnoreabbrev Q qa
  vnoremap <C-c> "*y
]])

-- ---------- 插入模式 ---------- ---
-- Ctrl+Backspace, Ctrl+H 等于向前删除一个 word
keymap.set("i", "<C-H>", "<C-w>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "<F7>", "]c") -- jump to next diff
keymap.set("n", "<S-F7>", "[c") -- jump to next diff

-- 取消高亮
keymap.set("n", "<leader>nl", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<A-L>", ":bnext<CR>")
keymap.set("n", "<A-H>", ":bprevious<CR>")
keymap.set("n", "<leader>bd", ":BufDel<CR>")

-- quicklist
vim.cmd([[
function!   QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
]])
vim.api.nvim_set_keymap('n', '<leader>ka' , ':call QuickFixOpenAll()<CR>', { noremap=true, silent=false })


-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- clangd
keymap.set("n", "<F10>", ":ClangdSwitchSourceHeader<CR>")
keymap.set("n", "<C-F12>", ":Telescope lsp_document_symbols<CR>", { noremap=true })
keymap.set('n', '<leader>gf', ':Telescope git_status<CR>')


