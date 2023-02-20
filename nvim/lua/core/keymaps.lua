vim.g.mapleader = " "

local keymap = vim.keymap

-- 命令
vim.cmd([[ 
  cnoreabbrev Q qa
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

-- 取消高亮
keymap.set("n", "<leader>nl", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<A-L>", ":bnext<CR>")
keymap.set("n", "<A-H>", ":bprevious<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- clangd
keymap.set("n", "<F10>", ":ClangdSwitchSourceHeader<CR>")
keymap.set("n", "<C-F12>", ":Telescope lsp_document_symbols<CR>")

