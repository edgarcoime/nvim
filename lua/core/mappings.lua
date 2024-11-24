local map = require("utils").map
local uv = vim.uv

-- Turn the word under cursor to upper case
map("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into title case
map("i", "<c-t>", "<Esc>b~lea")

-- Navigation in the location and quickfix list
map("n", "[l", "<cmd>lprevious<cr>zv", { silent = true, desc = "previous location item" })
map("n", "]l", "<cmd>lnext<cr>zv", { silent = true, desc = "next location item" })

map("n", "[L", "<cmd>lfirst<cr>zv", { silent = true, desc = "first location item" })
map("n", "]L", "<cmd>llast<cr>zv", { silent = true, desc = "last location item" })

map("n", "[q", "<cmd>cprevious<cr>zv", { silent = true, desc = "previous qf item" })
map("n", "]q", "<cmd>cnext<cr>zv", { silent = true, desc = "next qf item" })

map("n", "[Q", "<cmd>cfirst<cr>zv", { silent = true, desc = "first qf item" })
map("n", "]Q", "<cmd>clast<cr>zv", { silent = true, desc = "last qf item" })

-- Close location list or quickfix list if they are present, see https://superuser.com/q/355325/736190
map("n", [[\x]], "<cmd>windo lclose <bar> cclose <cr>", {
  silent = true,
  desc = "close qf and location list",
})

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
map("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line below",
})

map("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line above",
})

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
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Change current working directory locally and print cwd after that,
-- see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "change cwd" })

-- Toggle spell checking
map("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
map("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
-- FIX: error when inputting command c in normal mode
-- map("n", "c", '"_c')
-- map("n", "C", '"_C')
-- map("n", "cc", '"_cc')
-- map("x", "c", '"_c')

-- Break inserted text into smaller undo units when we insert some punctuation chars.
local undo_ch = { ",", ".", "!", "?", ";", ":" }
for _, ch in ipairs(undo_ch) do
  map("i", ch, ch .. "<c-g>u")
end

-- insert semicolon in the end
map("i", "<A-;>", "<Esc>miA;<Esc>`ii")

-- Go to the beginning and end of current line in insert mode quickly
map("i", "<C-A>", "<HOME>")
map("i", "<C-E>", "<END>")

-- Go to beginning of command in command-line mode
map("c", "<C-A>", "<HOME>")

-- Delete the character to the right of the cursor
map("i", "<C-D>", "<DEL>")

-- MY CUSTOM MAPPINGS
-- Set ctrl q and ctrl s as save
map("n", "<C-s>", "<cmd>update<cr>", { desc = "Save current buffer" })
map("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Quit all buffers" })

-- Editor shortcuts
map("n", "<leader>eS", "<cmd>noa w!<cr>", { desc = "Save without vim hooks or formatting" })

-- Paste buffer shortcuts
map("x", "<leader>p", [["_dP]], { desc = "Paste without replacing buffer" })
-- Replace visual selection with text in register, but not contaminate the register,
-- see also https://stackoverflow.com/q/10723700/6064933.
map("x", "p", '"_c<Esc>p')

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line into system clipboard" })

-- Toggle line wrap with <leader>w
map("n", "<leader>ecw", "<cmd>set wrap!<cr>", { desc = "Toggle line [w]rap for vim" })

-- window management
map("n", "\\", "<C-w>s", { desc = "Split window horizontally" })
map("n", "|", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>q", "<C-w>q", { desc = "Close Window" })
