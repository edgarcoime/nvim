return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim', -- required
        'nvimtools/none-ls-extras.nvim',
        'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
    },
    config = function()
        local null_ls = require('null-ls')
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- Formatters & Linters for Mason to install
        -- List of possible binaries
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
        require('mason-null-ls').setup({
            ensure_installed = {
                -- Python tooling
                -- 'ruff', -- Python linter and formatter; Already installed via Mason
                'pylint',
                'black',
                'isort',

                -- Golang
                'gofumpt',
                'goimports',

                'prettier', -- ts/js formatter
                'eslint_d', -- ts/js linter
                'shfmt', -- Shell formatter
                'stylua', -- lua formatter; Already installed via Mason
            },
            automatic_installation = true,
        })

        local sources = {
            -- Python
            -- NOTE: python tooling is weird especially with pyling
            -- used a combination of config tomls and direnv to load specific envs when loading into folder
            -- https://github.com/williamboman/mason.nvim/issues/1336
            -- https://gist.github.com/kenmori/c46ee7f067cd8a856f9f71121b9621bf
            -- require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
            -- require("none-ls.formatting.ruff_format"),
            formatting.isort,
            formatting.black,
            diagnostics.pylint,

            -- golang
            formatting.gofumpt,
            formatting.goimports,

            formatting.prettier.with({
                filetypes = {
                    'html',
                    'json',
                    'yaml',
                    'markdown',
                    'astro',
                    'javascript',
                    'typescript',
                    'javascriptreact',
                    'typescriptreact',
                    'css',
                },
            }),
            require('none-ls.diagnostics.eslint_d'),
            require('none-ls.formatting.eslint_d'),
            formatting.stylua,
            formatting.shfmt.with({ args = { '-i', '4' } }),
            formatting.terraform_fmt,
        }

        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        null_ls.setup({
            debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
            sources = sources,
            -- you can reuse a shared lspconfig on_attach callback here
            on_attach = function(client, bufnr)
                if client:supports_method('textDocument/formatting') then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = true })
                        end,
                    })
                end
            end,
        })
    end,
}
