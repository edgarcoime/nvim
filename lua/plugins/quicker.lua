-- Advanced Quickfix list
-- https://github.com/stevearc/quicker.nvim
return {
    'stevearc/quicker.nvim',
    ft = 'qf',
    config = function()
        local q = require('quicker')

        vim.keymap.set('n', '<leader>d', function()
            q.toggle()
        end, {
            desc = 'Toggle quickfix',
        })
        vim.keymap.set('n', '<leader>w', function()
            q.toggle({ loclist = true })
        end, {
            desc = 'Toggle loclist',
        })

        q.setup({
            keys = {
                {
                    '>',
                    function()
                        require('quicker').expand({ before = 2, after = 2, add_to_existing = true })
                    end,
                    desc = 'Expand quickfix context',
                },
                {
                    '<',
                    function()
                        require('quicker').collapse()
                    end,
                    desc = 'Collapse quickfix context',
                },
            },
        })
    end,
}
