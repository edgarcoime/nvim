local map = require("custom.functions").map

-- NOTE: Setting remap makes the mapping recursive b/c without it will not expand
-- Also by setting expr the rhs mapping is determined at runtime

-- Editor shortcuts
map("n", "<leader>eS", "<cmd>noa w!<cr>", { desc = "Save without vim hooks or formatting" })

-- Set ctrl q and ctrl s as save
map("n", "<C-s>", "<cmd>w!<cr>")
map("n", "<C-q>", "<cmd>qa!<cr>")

-- Paste buffer shortcuts
map("x", "<leader>p", [["_dP]], { desc = "Paste without replacing buffer" })

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line into system clipboard" })

-- Toggle line wrap with <leader>w
map("n", "<leader>ecw", "<cmd>set wrap!<cr>", { desc = "Toggle line [w]rap for vim" })

-- window management
map("n", "\\", "<C-w>s", { desc = "Split window horizontally" })
map("n", "|", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>q", "<C-w>q", { desc = "Close Window" })

-- NOTE: resizing windows only use arrows because in terminal no diff between ctrl + shift
-- map("n", "<C-S-.>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Width" })
-- map("n", "<C-S-,>", "<cmd>vertical resize +5<cr>", { desc = "Increase Width" })

-- TODO: Add horizontal resizing

-- map("n", "<C-LEFT>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Width" })
-- map("n", "<C-RIGHT>", "<cmd>vertical resize +5<cr>", { desc = "Increase Width" })
-- map("n", "<C-DOWN>", "<cmd>resize -5<cr>", { desc = "Decrease height" })
-- map("n", "<C-UP>", "<cmd>resize +5<cr>", { desc = "Increase height" })

-- -- tabs
-- keymap.set("n", "<leader>te", "<cmd>tabedit<cr>", opts("Edit tab"))
-- -- keymap.set("n", "<tab>", "<cmd>tabnext<Return><cr>", opts "Progress forward tabs")
-- keymap.set("n", "<s-tab>", "<cmd>tabprev<Return><cr>", opts("Progress backward tabs"))
-- keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>", opts("Close tab"))
