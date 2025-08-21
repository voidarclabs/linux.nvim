return {
    "echasnovski/mini.nvim",
    version = "",
    config = function()
        require('mini.pairs').setup() -- Bracket pairs and stuff
        require("mini.ai").setup() -- Around and In extension for visual mode
        require("mini.surround").setup() -- Suround selections with characters

        require("mini.icons").setup() -- Icon provider
    end,
}
