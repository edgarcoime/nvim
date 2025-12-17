-- Format on save for Rust files
local augroup = vim.api.nvim_create_augroup('RustFormatting', { clear = true })

-- Set up format on save when LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
    group = augroup,
    callback = function(event)
        local bufnr = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        
        -- Only set up for rust_analyzer
        if client and client.name == 'rust_analyzer' then
            if client:supports_method('textDocument/formatting') then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr, event = 'BufWritePre' })
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        end
    end,
})

