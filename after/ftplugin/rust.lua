local bufnr = vim.api.nvim_get_current_buf()
local tb = require("telescope.builtin")
local map = function(keys, func, desc)
  vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true, noremap = true, desc = "Rust: " .. desc })
end

-- local additionals = function() end
-- local on_attach = require("custom.lsp").onAttachCreator(additionals)
-- on_attach(nil, bufnr)

map("gd", tb.lsp_definitions, "[G]oto [D]efinition")

-- Find references for the word under your cursor.
map("gr", tb.lsp_references, "[G]oto [R]eferences")

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
map("gI", tb.lsp_implementations, "[G]oto [I]mplementation")

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

-- Opens a popup that displays documentation about the word under your cursor
--  See `:help K` for why this keymap
map("K", vim.lsp.buf.hover, "Hover Documentation")
map("J", function()
  vim.cmd.RustLsp("renderDiagnostic")
end, "RenderDiagnostic")

-- DIAGNOSTICS SETTINGS
-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
map("<leader>lt", tb.lsp_type_definitions, "[D]iag... [T]ype Definitions")

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
map("<leader>ld", tb.lsp_document_symbols, "[D]iag... [D]ocument Symbols")

-- Fuzzy find all the symbols in your current workspace
--  Similar to document symbols, except searches over your whole project.
map("<leader>lw", tb.lsp_dynamic_workspace_symbols, "[D]iag... [W]orkspace Symbols")

-- Rename the variable under your cursor
--  Most Language Servers support renaming across files, etc.
map("<leader>lr", vim.lsp.buf.rename, "[D]iag... [R]ename")

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
map("<leader>la", function()
  vim.cmd.RustLsp("codeAction")
end, "[D]iag... Code [A]ction")

-- Format the current buffer
-- using commandline rust binary "cargo fmt"
map("<leader>f", "<cmd>:!cargo fmt<cr>", "[D]iag... [F]ormat Buffer")
-- map("<leader>f", "", "[F]ormat")

-- Copilot toggle panel
map("<leader>lc", "<cmd>:Copilot panel<CR>", "[D]iag... [C]opilot Panel")
