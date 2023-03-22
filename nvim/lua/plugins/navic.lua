local navic = require("nvim-navic")

navic.setup {
  icons = {
    Array = " ",
    Boolean = "蘒",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = "ﳠ ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Variable = " ",
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
}


-- local on_attach = function(client, bufnr)
--   if client.server_capabilities.documentSymbolProvider then
--     navic.attach(client, bufnr)
--   end
-- end
--
-- require("lspconfig").clangd.setup {
--   on_attach = on_attach
-- }
