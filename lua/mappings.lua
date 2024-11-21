local map = require("utils").map
local uv = vim.uv

-- Set ctrl q and ctrl s as save
map("n", "<C-s>", "<cmd>update<cr>", { desc = "Save current buffer" })
map("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Quit all buffers" })

-- Move the cursor based on physical lines, not the actual lines.
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true }, true)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true }, true)
map("n", "DOWN", "v:count == 0 ? 'gDOWN' : 'DOWN'", { expr = true }, true)
map("n", "UP", "v:count == 0 ? 'gUP' : 'UP'", { expr = true }, true)
map("n", "^", "g^")
map("n", "0", "g0")

-- Do not include white space characters when using $ in visual mode,
-- see https://vi.stackexchange.com/q/12607/15292
map("x", "$", "g_")

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Edit and reload nvim config file quickly
map("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
  silent = true,
  desc = "open init.lua",
})

map("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
  silent = true,
  desc = "reload init.lua",
})

-- Always use very magic mode for searching
map("n", "/", [[/\v]])

-- Change current working directory locally and print cwd after that,
-- see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "change cwd" })

-- Toggle spell checking
map("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
map("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })
