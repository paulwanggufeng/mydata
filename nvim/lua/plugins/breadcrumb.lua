local breadcrumb = require("breadcrumb")

breadcrumb.setup {
  disabled_filetypes = {
    "",
    "help",
  },
  icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = " ",
    Interface = " ",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = "蘒",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
    -- these key may not appear in breadcrumb, I just copy the config from nvim-navic plugin
    -- Color = " ",
    -- Folder = " ",
    -- Keyword = " ",
    -- Reference = " ",
    -- Snippet = " ",
    -- Text = " ",
    -- Unit = " ",
  },
  separator = ">",
  depth_limit = 0,
  depth_limit_indicator = "..",
  color_icons = true,
  highlight_group = {
    component = "BreadcrumbText",
    separator = "BreadcrumbSeparator",
  },
}

breadcrumb.init()

