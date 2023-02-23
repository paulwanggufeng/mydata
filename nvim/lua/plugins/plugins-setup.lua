-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' -- 主题

  use { "folke/which-key.nvim",  }

  use {
    'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
  }
  use {
    'nvim-tree/nvim-tree.lua',  -- 文档树
    requires = {
      'nvim-tree/nvim-web-devicons', -- 文档树图标
    }
  }
  use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
  use {'ojroques/nvim-bufdel'}

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'}
    }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim', run = 'make'
  }

  -- 快速跳转
use {
  "ggandor/leap.nvim",
  keys = { "s", "S" },
  config = function()
    local leap = require "leap"
    leap.set_default_keymaps()
  end,
}
  use {
    "ggandor/flit.nvim",
    requires = { 'ggandor/leap.nvim'},
  config = function()
    require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- -- A string like "nv", "nvo", "o", etc.
  -- labeled_modes = "v",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}
    end
  }
  -- 命令行模糊搜索
use {
  'gelguy/wilder.nvim',
   requires = { "romgrk/fzy-lua-native" },
}

  -- 命令行终端
--   use {"akinsho/toggleterm.nvim", tag = '*', config = function()
--   require("toggleterm").setup()
-- end}
  use {"akinsho/toggleterm.nvim", tag = '*' }


  use "nvim-treesitter/nvim-treesitter" -- 语法高亮
  use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括号颜色区分
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig"
  }

use {
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

 -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path" -- 文件路径
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  use "numToStr/Comment.nvim" -- gcc和gc注释
  -- use "sbdchd/neoformat" -- 格式化
  use "windwp/nvim-autopairs" -- 自动补全括号

--   use({
--     "jose-elias-alvarez/null-ls.nvim",
--     -- config = function()
--     --     require("null-ls").setup()
--     -- end,
--     requires = { "nvim-lua/plenary.nvim" },
-- })

  use "akinsho/bufferline.nvim" -- buffer分割线

  -- git
  use "lewis6991/gitsigns.nvim" -- 左则git提示
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- markdown
  use({
    'toppair/peek.nvim',
    run = 'deno task --quiet build:fast' 
  })


  if packer_bootstrap then
    require('packer').sync()
  end
end)
