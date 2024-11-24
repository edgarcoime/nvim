local p = require("persistence")

p.setup()

local function map(mode, l, r, desc)
  require("utils").map(mode, l, r, { buffer = bufnr, desc = "Persistence: " .. desc })
end

-- load the session for the current directory
map("n", "<leader>eps", function() require("persistence").load() end, "Load current directory")

-- select a session to load
map("n", "<leader>epS", function() require("persistence").select() end, "Select session to load")

-- load the last session
map("n", "<leader>epl", function() require("persistence").load({ last = true }) end, "Load last session")

-- stop Persistence => session won't be saved on exit
map("n", "<leader>epd", function() require("persistence").stop() end, "Stop persistence: session wont be saved on exit")
