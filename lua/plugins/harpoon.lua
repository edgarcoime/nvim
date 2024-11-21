return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({})

    local map = function(keys, func, desc)
      require("custom.functions").map("n", keys, func, { desc = "Harpoon: " .. desc })
    end

    map("<leader>a", function()
      harpoon:list():add()
    end, "Append bookmark")
    map("<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, "Toggle quick menu")

    map("<leader>1", function()
      harpoon:list():select(1)
    end, "Go to bookmark 1")
    map("<leader>2", function()
      harpoon:list():select(2)
    end, "Go to bookmark 2")
    map("<leader>3", function()
      harpoon:list():select(3)
    end, "Go to bookmark 3")
    map("<leader>4", function()
      harpoon:list():select(4)
    end, "Go to bookmark 4")
    map("<leader>5", function()
      harpoon:list():select(5)
    end, "Go to bookmark 5")
    map("<leader>6", function()
      harpoon:list():select(6)
    end, "Go to bookmark 6")
  end,
}
