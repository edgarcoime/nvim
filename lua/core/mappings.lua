vim.g.mapleader = " "

local keymap = vim.keymap

local function map(mode, lhs, rhs, additionals)
  local default_opts = { remap = true, silent = true }
  local new_opts = vim.tbl_deep_extend("force", default_opts, additionals or {})

  vim.keymap.set(mode, lhs, rhs, new_opts)
end

-- NOTE: Setting remap makes the mapping recursive b/c without it will not expand
-- Also by setting expr the rhs mapping is determined at runtime

-- ensure jump list keybinds are not overwritten
map("n", "<C-o>", "g;")
map("n", "<C-i>", "g,")

-- Set ctrl q and ctrl s as save
map("n", "<C-s>", "<cmd>w!<cr>")
map("n", "<C-q>", "<cmd>qa!<cr>")

-- Toggle line wrap with <leader>w
-- map("n", "<leader>ew", "<cmd>set wrap!<cr>", { desc = "Toggle line [w]rap for vim", expr = true })
map("n", "<leader>ew", "<cmd>set wrap!<cr>", { desc = "Toggle line [w]rap for vim" })


-- cutting single characters don't put to register
-- WARN: enabling makes deleting with x slow
-- keymap.set("n", "x", '"_x"')

-- Diagnostic keymaps
-- keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts "Open diagnostic [Q]uickfix list")

-- -- Set ctrl q and ctrl s as save
-- keymap.set("n", "<C-s>", "<cmd>w!<cr>", opts("Force Write"))
-- keymap.set("n", "<C-q>", "<cmd>qa!<cr>", opts("Force Quit"))
--
-- -- editor configs
-- -- Toggle line wrap with <leader>w
-- vim.api.nvim_set_keymap("n", "<leader>el", "<cmd>set wrap!<CR>", opts("Toggle line wrap"))
--
-- -- tabs
-- keymap.set("n", "<leader>te", "<cmd>tabedit<cr>", opts("Edit tab"))
-- -- keymap.set("n", "<tab>", "<cmd>tabnext<Return><cr>", opts "Progress forward tabs")
-- keymap.set("n", "<s-tab>", "<cmd>tabprev<Return><cr>", opts("Progress backward tabs"))
-- keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>", opts("Close tab"))
--
-- -- window management
-- keymap.set("n", "\\", "<C-w>s", opts("Split window horizontally"))
-- keymap.set("n", "|", "<C-w>v", opts("Split window vertically"))
--
-- -- Move window
-- keymap.set("n", "<leader>th", "<C-w>h", opts("Move tab left"))
-- keymap.set("n", "<leader>tl", "<C-w>l", opts("Move tab right"))
-- keymap.set("n", "<leader>tj", "<C-w>j", opts("Move tab down"))
-- keymap.set("n", "<leader>tk", "<C-w>k", opts("Move tab up"))
--
-- -- resize window
-- keymap.set("n", "<C-S-h>", "<C-w><", opts("Resize left"))
-- keymap.set("n", "<C-S-l>", "<C-w>>", opts("Resize right"))
-- keymap.set("n", "<C-S-j>", "<C-w>-", opts("Resize down"))
-- keymap.set("n", "<C-S-k>", "<C-w>+", opts("Resize up"))
--
-- -- Paste buffer shortcuts
-- keymap.set("x", "<leader>p", [["_dP]], opts("Paste without replacing buffer"))
--
-- -- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
