-- local actions = require("diffview.actions")

require('diffview').setup({
    keymaps = {
        disable_defaults = false,
    view = {
            {"n", "v"}, "<leader>a", function() print("bar") end, {nowait=true},
    }
    }
}
)
