return {
    "echasnovski/mini.nvim",
    version = "*",  -- or a specific tag
    config = function()
      -- Only load the modules you want
      require("mini.animate").setup()
      require("mini.pairs").setup()
      require("mini.statusline").setup()
      require("mini.cursorword").setup({
	      content = {
		active = true,
	      }
      })
      require("mini.notify").setup()
      require("mini.surround").setup({
        mappings = {
          add = "gsa", -- Add surrounding
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding
          replace = "gsr", -- Replace surrounding
        },
      })
    end,
  }
