-- ~/.config/nvim-new/lua/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

-- Go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
autocmd("FileType", {
    group = augroup("close_with_q", { clear = true }),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- LSP attach
autocmd("LspAttach", {
    group = augroup('lsp-attach', { clear = true }),
    callback = function(event)
        -- Create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            if func == nil then
                print("Warning: Trying to map with nil function for keys: " .. keys)
                return
            end
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '' .. desc })
        end

        -- Hover documentation
        map("K",
            function() vim.lsp.buf.hover({ border = "rounded", max_width = 100, max_height = 30 }) end,
            "Hover Documentation"
        )

        -- Go to definition
        map('gd', function() Snacks.picker.lsp_definitions() end, '[G]oto [D]efinition')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', function() Snacks.picker.lsp_declarations() end, '[G]oto [D]eclaration')

        -- Goes through implementations
        map("gI", function() Snacks.picker.lsp_implementations() end, "[G]oto [I]mplementation")

        -- Looks at type definitions
        map("gy", function() Snacks.picker.lsp_type_definitions() end, "Goto T[y]pe Definition")

        -- Goto references
        vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end,
            { buffer = event.buf, desc = "[G]oto [R]eferences", nowait = true })

        -- Opens diagnostics
        map("gl", vim.diagnostic.open_float, "[G]oto [L] Diagnostics")

        -- Opens definition in vertical split for reference
        map("gV", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "[G]oto Definition in [V]ertical Split")

        -- Peeks into signature documentation
        map("gs", vim.lsp.buf.signature_help, "[G]oto [S]ignature Documentation")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>la', vim.lsp.buf.code_action, '[L]SP [A]ction', { 'n', 'x' })
        -- map("<leader>lA", vim.lsp.buf.range_code_action, "Range [L]SP Code [A]ctions")

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("<leader>lr", vim.lsp.buf.rename, "[L]SP re[n]ame all references")

        -- Formats entire document
        map("<leader>lf", vim.lsp.buf.format, "[L]SP [f]ormat")

        -- Peeks at symbols in buffer/workspace
        map("<leader>ls", function() Snacks.picker.lsp_symbols() end, "[L]SP [s]ymbols")
        map("<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, "[L]SP Workspace [S]ymbols")


        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
            })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
        end
    end,

})
autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
