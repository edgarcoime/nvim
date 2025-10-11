-- https://www.reddit.com/r/neovim/comments/1jw0zav/comment/mmeo1as/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- https://www.youtube.com/watch?v=IZnhl121yo0&t=29s
-- https://gist.github.com/smnatale/b847e568f1a155b8e8349f29a482a1f4
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local M = {
    'neovim/nvim-lspconfig',
    config = function()
        -- Mason ensure Install
        require('mason-tool-installer').setup({
            ensure_installed = {
                'dockerls',
                'bashls',

                -- 'pyright',
                'basedpyright',
                'lua_ls',
                'gopls',

                -- typst
                'tinymist',

                -- web
                'ts_ls',
                'html',
                'cssls',
                'tailwindcss',
            },
        })

        -- Lsp config
        vim.diagnostic.config({
            -- virtual_lines = true,
            -- virtual_text = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = 'rounded',
                source = true,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                    [vim.diagnostic.severity.WARN] = 'WarningMsg',
                },
            },
        })

        -- Server configs
        local servers = {
            dockerls = {},
            bashls = {},
            tinymist = {},

            -- PYTHON config
            basedpyright = {},
            -- pyright = {
            --     cmd = { 'pyright-langserver', '--stdio' },
            --     filetypes = { 'python' },
            --     root_markers = {
            --         'pyproject.toml',
            --         'setup.py',
            --         'setup.cfg',
            --         'requirements.txt',
            --         'Pipfile',
            --         'pyrightconfig.json',
            --     },
            --     settings = {
            --         python = {
            --             analysis = {
            --                 autoSearchPaths = true,
            --                 useLibraryCodeForTypes = true,
            --             },
            --         },
            --     },
            -- },
            -- Lua config
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        runtime = { version = 'LuaJIT' },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file('', true),
                        },
                        diagnostics = {
                            globals = { 'vim' },
                            disable = { 'missing-fields' },
                        },
                        format = {
                            enable = false,
                        },
                    },
                },
            },
            -- Gopls
            gopls = {},
            -- web
            ts_ls = {},
            html = {},
            cssls = {},
            tailwindcss = {},
        }

        -- Activate LSP
        for server, cfg in pairs(servers) do
            -- For each LSP server (cfg), we merge
            -- 1. A fresh empty table (to avoid mutating capabilities globally)
            -- 2. Your capabilities object with Neovim + cmp features
            -- 3. Any server-specific cfg.capabilities if defined in `servers`

            -- Extend completion capabilities
            -- LSP servers and clients are able to communicate to each other what features they support.
            -- By default, Neovim doesn't support everything that is in the LSP specification.
            -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            -- For Bink.cmp get_lsp_capabilities already includes default
            -- https://cmp.saghen.dev/installation#merging-lsp-capabilities

            -- Can give shared universal setting to capabilities here
            local modified_capabilities = vim.tbl_deep_extend('force', {}, cfg.capabilities or {}, {
                offsetEncoding = { 'utf-16' },
            })
            -- merge modified cfg capabilities with offsetEncoding to enforce utf-16
            cfg.capabilities = require('blink.cmp').get_lsp_capabilities(modified_capabilities)

            vim.lsp.config(server, cfg)
            vim.lsp.enable(server)
        end
    end,
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        { 'mason-org/mason-lspconfig.nvim', opts = {} },
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        {
            'j-hui/fidget.nvim',
            opts = {
                notification = {
                    window = {
                        winblend = 0, -- Background color opacity in the notification window
                    },
                },
            },
        },
    },
}
return M
