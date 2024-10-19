return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({})

    local map = function(keys, func, desc)
      require("custom.functions").map("n", keys, func, { desc = "Todos: " .. desc })
    end

    -- Open todos in trouble ui
    map("<leader>l;", "<cmd>Trouble todo<cr>", "Trouble Todos [;]")

    -- Open todos in telescope mode
    map("<leader>l/", "<cmd>TodoTelescope<cr>", "Trouble Todos [/]")
  end,
}
