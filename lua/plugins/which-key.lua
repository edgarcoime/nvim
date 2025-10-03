local config = {
  {
    "echasnovski/mini.icons",
    version = "*",  -- Always get the latest version
    opts = {},
  },
  {
    "nvim-tree/nvim-web-devicons",
    version = "*",  -- Always get the latest version
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup {}
      wk.add {
        { "<leader>c", group = "[C]ode", mode = { "n", "x" } },

        { "<leader>d", group = "[D]ebugger" },

        { "<leader>l", group = "[L]SP" },

        { "<leader>s", group = "[S]earch" },
        { "<leader>sg", group = "[S]earch [G]it" },

        { "<leader>t", group = "[T]ab" },

        { "<leader>g", group = "[G]it" },
        { "<leader>gt", group = "[G]it [T]oggle" },

        { "<leader>w", group = "[W]orkspace" },

        { "<leader>e", group = "[E]ditor" },
        { "<leader>ec", group = "[E]ditor [C]onfig" },
        { "<leader>ep", group = "[E]ditor [P]ersistence" },
      }
    end,
  }
}
return config
-- return {}
