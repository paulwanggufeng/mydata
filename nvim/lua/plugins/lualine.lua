local navic = require('nvim-navic')

-- local breadcrumb = function()
--   local breadcrumb_status_ok, breadcrumb = pcall(require, "breadcrumb")
--   if not breadcrumb_status_ok then
--     return
--   end
--   return breadcrumb.get_breadcrumb()
-- end

require('lualine').setup({
  options = {
    theme = 'tokyonight'
  },
  -- use navic plugin
  sections = {
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    }
  },
  -- use breadcrumb plugin
  -- winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { breadcrumb },
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
  -- inactive_winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { breadcrumb },
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
})
