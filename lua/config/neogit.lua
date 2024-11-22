local neogit = require("neogit")
neogit.setup {}

local function map(mode, l, r, desc)
  require("utils").map(mode, l, r, { desc = "Neogit: " .. desc })
end

map("n", "<leader>gn", function()
  neogit.open()
end, "Open Menu")
