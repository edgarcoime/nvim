-- scrollbar with context
return {
    {
        'kevinhwang91/nvim-hlslens',
        config = function()
            require('hlslens').setup({
                build_position_cb = function(plist, _, _, _)
                    require('scrollbar.handlers.search').handler.show(plist.start_pos)
                end,
            })

            vim.cmd([[
            augroup scrollbar_search_hide
                autocmd!
                autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
            augroup END
          ]])
        end,
    },
    {
        'petertriho/nvim-scrollbar',
        -- cmd = "UndotreeToggle",
        dependencies = {},
        config = function()
            -- require('scrollbar').setup()
            -- require('scrollbar.handlers.gitsigns').setup()
            require('scrollbar').setup({
                handlers = {
                    gitsigns = true, -- Requires gitsigns
                    handle = true,
                    search = true, -- Requires hlslens
                    diagnostic = false, -- Requires nvim-lsp
                    -- cursor = true, -- Requires Neovim nightly (or 0.9+)
                    -- ale = true, -- Requires ALE
                },
                excluded_filetypes = {
                    'prompt',
                    'TelescopePrompt',
                    'noice',
                    'notify',
                    'cmp_menu',
                    'cmp_docs',
                    'NvimTree',
                    'neo-tree',
                    'Trouble',
                    'lazy',
                    'mason',
                    'undotree',
                },
            })
        end,
    },
}
