return {
    {
        'sylvanfranklin/omni-preview.nvim',
        dependencies = {
            -- Typst
            {
                'chomosuke/typst-preview.nvim',
                ft = 'typst',
                version = '1.*',
                opts = {
                    debug = true,
                    port = 6969,
                },
            },
            -- CSV
            { 'hat0uma/csvview.nvim', lazy = true },
        },
        opts = {},
        keys = {
            { '<leader>eeo', '<cmd>OmniPreview start<CR>', desc = 'OmniPreview Start' },
            { '<leader>eec', '<cmd>OmniPreview stop<CR>', desc = 'OmniPreview Stop' },
        },
    },
}
