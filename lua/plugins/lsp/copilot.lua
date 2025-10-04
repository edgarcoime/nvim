return {
    {
        'giuxtaposition/blink-cmp-copilot',
        dependencies = {
            'copilotlsp-nvim/copilot-lsp', -- optional for NES functionality
            {
                'zbirenbaum/copilot.lua',
                event = { 'InsertEnter' },
                cmd = 'Copilot',
                config = function()
                    require('copilot').setup({
                        suggestion = { enabled = false },
                        panel = { enabled = true },
                    })
                end,
            },
        },
    },
}
