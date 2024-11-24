require("todo-comments").setup {}

local map = function(keys, func, desc)
  require("utils").map("n", keys, func, { desc = "Todos: " .. desc })
end

-- Open todos in trouble ui
map("<leader>l;", "<cmd>Trouble todo<cr>", "Trouble Todos [;]")

-- Open todos in telescope mode
map("<leader>l/", "<cmd>TodoTelescope<cr>", "Trouble Todos [/]")
