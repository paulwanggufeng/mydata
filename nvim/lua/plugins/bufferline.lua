vim.opt.termguicolors = true

local keymap = vim.keymap
-- keymap.set("n", "<leader>bd", ":bdelete<CR>")
keymap.set("n", "<leader>bd", ":BufDel<CR>")
keymap.set("n", "<leader>bp", ":BufferLinePick<CR>")
keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<A-H>", ":BufferLineMovePrev<CR>")
keymap.set("n", "<A-L>", ":BufferLineMoveNext<CR>")
-- nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
-- function sort_buffers_by_name()
--   require("bufferline").sort_buffers_by(
--     function(buf_a, buf_b)
--       local fnamemodify = vim.fn.fnamemodify
--       print("file name", fnamemodify(buf_a.name, ":t"))
--       return fnamemodify(buf_a.name, ":t") < fnamemodify(buf_b.name, ":t")
--     end
--   )
-- end
--
-- keymap.set("n", "<leader>bs", ":call sort_buffers_by_name()<cr>", { noremap = true, silent = true })


require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
