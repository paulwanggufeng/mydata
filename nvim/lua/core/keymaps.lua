vim.g.mapleader = " "

local keymap = vim.keymap

-- 命令

keymap.set({ "n", "i", "v", "x" }, "<C-s>", "<cmd>wa<cr>", { noremap = true, silent = true })
keymap.set("n", "<C-Del>", "de", { noremap = true, silent = true })
keymap.set("i", "<C-Del>", "<Esc>ldei", { noremap = true, silent = true })
keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

vim.cmd([[
  cnoreabbrev Q qa
  vnoremap <C-c> "*y
]])


-- quickfix 窗口总是显示在最下面
-- wincmd foo is equivalent with typing ^W foo, and CTRL-W_J moves the current window to the very bottom.
-- au FileType qf executes this for every file with the filetype "qf" (quickfix).
vim.cmd([[
au FileType qf wincmd J
]])


-- ---------- 插入模式 ---------- ---
-- Ctrl+Backspace, Ctrl+H 等于向前删除一个 word
-- keymap.set("i", "<C-H>", "<C-w>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nl", ":nohl<CR>")

-- 注释当前单词,可用于快速注释 'Unused parameter'
-- 'CommentUnusedparameter'
keymap.set("n", "<leader>cu", "ciw/*<Esc>pa*/<Esc>")

-- 切换buffer
-- keymap.set("n", "<A-h>", ":bprevious<CR>")
-- keymap.set("n", "<A-l>", ":bnext<CR>")

keymap.set("n", "<leader>zf", "zf%<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>zF", ":%g/^{/ normal! zf%<CR>", { noremap = true, silent = false }) -- fold all functions

-- quicklist
vim.cmd([[
function! QuickFixOpenAll()
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
vim.api.nvim_set_keymap('n', '<leader>ka', ':call QuickFixOpenAll()<CR>', { noremap = true, silent = false })


-- 根据不同窗口设置快捷键
-- F19 -> S-F7
-- function SET_DIFF_KEYMAP()
--   vim.keymap.set("n", "<F7>", "]c")  -- jump to next diff
--   vim.keymap.set("n", "<F19>", "[c") -- jump to prev diff (F19 -> S-F7)
-- end
--
-- function SET_QFIX_KEYMAP()
-- end

vim.keymap.set("n", "<F7>", ":cn<cr>")
vim.keymap.set("n", "<F19>", ":cprev<cr>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- lsp, clangd
keymap.set("n", "<F10>", ":ClangdSwitchSourceHeader<CR>")


keymap.set("i", "<C-j>", "copilot#Accept('<CR>')",
  { noremap = true, expr = true, silent = true, replace_keycodes = false })
-- local map = function (type, key, value, opts)
--   local options = { noremap = true }
--   if opts then options = vim.tbl_extend('force', options, opts) end
--   vim.api.nvim_set_keymap(type, key, value, options)
-- end
-- map("i", "<C-j>", "copilot#Accept('<CR>')", {expr=true, silent=true, noremap=true})



-- other category
keymap.set('n', '<leader>ot', ':ToggleTerm<CR>')
