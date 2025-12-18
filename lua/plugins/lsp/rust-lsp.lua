return {
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ['rust-analyzer'] = {
                            inlayHints = {
                                bindingModeHints = { enable = false },
                                chainingHints = { enable = true },
                                closingBraceHints = { enable = true, minLines = 25 },
                                closureReturnTypeHints = { enable = 'always' },
                                lifetimeElisionHints = { enable = 'always', useParameterNames = true },
                                maxLength = 25,
                                parameterHints = { enable = true },
                                reborrowHints = { enable = 'always' },
                                renderColons = true,
                                typeHints = {
                                    enable = true,
                                    hideClosureInitialization = false,
                                    hideNamedConstructor = false,
                                },
                            },
                        }


                    }
                }
            }
        end
    },
}
