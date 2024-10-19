return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({})

    local function map(mode, l, r, desc)
      require("custom.functions").map(mode, l, r, { desc = "Neogit: " .. desc })
    end

    map("n", "<leader>gn", function()
      neogit.open()
    end, "Open Menu")
  end,
}
