-- Inspired by: https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/plugins/debug.lua
return {
    -- Use code lldb
    -- https://aur.archlinux.org/packages/codelldb
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Debugger ui
        'rcarriga/nvim-dap-ui',

        -- Dep for nvim dap ui
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'mason-org/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Var names inline
        'theHamsta/nvim-dap-virtual-text',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
        -- 'mrcjkb/rustaceanvim',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        require('mason-nvim-dap').setup({
            ensure_installed = {
                'codelldb',
                'delve',
            },
            handlers = {},
            automatic_installation = true,
        })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup({
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Install golang specific config
        require('dap-go').setup({
            delve = {
                -- On Windows delve must be run attached or it crashes.
                -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
                detached = vim.fn.has('win32') == 0,
            },
        })
    end,
    keys = {
        -- Basic debugging keymaps, feel free to change to your liking!
        {
            '<leader>dc',
            function()
                require('dap').continue()
            end,
            desc = 'Debug: Start/Continue',
        },
        {
            '<leader>di',
            function()
                require('dap').step_into()
            end,
            desc = 'Debug: Step Into',
        },
        {
            '<leader>do',
            function()
                require('dap').step_over()
            end,
            desc = 'Debug: Step Over',
        },
        {
            '<leader>dO',
            function()
                require('dap').step_out()
            end,
            desc = 'Debug: Step Out',
        },
        {
            '<leader>db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Debug: Toggle Breakpoint',
        },
        {
            '<leader>dB',
            function()
                require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end,
            desc = 'Debug: Set Conditional Breakpoint',
        },
        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        {
            '<leader>dt',
            function()
                require('dapui').toggle()
            end,
            desc = 'Debug: See last session result.',
        },
        {
            '<leader>dl',
            function()
                require('dapui').run_last()
            end,
            desc = 'Debug: Run Last Configuration',
        },
    },
}
