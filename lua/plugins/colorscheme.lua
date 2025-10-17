return {
    -- {
    --     'catppuccin/nvim',
    --     name = 'catppuccin',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('catppuccin').setup({
    --             flavour = 'mocha',
    --             integrations = {},
    --             transparent_background = true,
    --         })
    --
    --         vim.cmd.colorscheme('catppuccin')
    --     end,
    -- },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end,
    },
}
