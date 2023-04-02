local builtin = require('telescope.builtin')

-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- 环境里要安装ripgrep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})

local find_symbols = [[<cmd>lua require('telescope.builtin').lsp_document_symbols({symbol_width = 0.8})<cr>]]
vim.keymap.set('n', '<F36>', find_symbols, { noremap = true, silent = true }) -- (F36 -> C-F12)

local find_w_symbols =
[[<cmd>lua require('telescope.builtin').lsp_workspace_symbols({fname_width = 0.6, symbol_width = 0.2})<cr>]]
vim.keymap.set('n', '<F48>', find_w_symbols, { noremap = true, silent = true }) -- (F48 -> C-S-F12)

-- keymap.set('n', '<leader>gf', ':Telescope git_status<CR>')

vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')



-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  defaults = {
    previewer = true,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.9,
      height = 0.9,
    },
    mappings = {
      n = {
        ['<C-d>'] = require('telescope.actions').delete_buffer,
      }
    },                                        -- mappings
    lsp_workspace_symbols_max_results = 2000, -- not sure if it works
  },                                          -- defaults
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
