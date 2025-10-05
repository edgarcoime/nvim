return {
    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            'giuxtaposition/blink-cmp-copilot',
            'rafamadriz/friendly-snippets',
        },
        version = '1.*',
        opts = function(_, opts)
            local trigger_text = vim.g.lua_snip_trigger_text

            -- Sources
            opts.sources = vim.tbl_deep_extend('force', {}, opts.sources or {}, {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
                providers = {
                    lazydev = {
                        module = 'lazydev.integrations.blink',
                        score_offset = 80,
                    },
                    lsp = {
                        min_keyword_length = 0,
                        score_offset = 90,
                    },
                    path = {
                        -- module = 'blink.cmp.sources.path',
                        fallbacks = { 'snippets', 'buffer' },
                        opts = {
                            trailing_slash = true,
                            label_trailing_slash = true,
                            get_cwd = function(ctx)
                                return vim.fn.expand(('#%d:p:h'):format(ctx.bufnr))
                            end,
                            show_hidden_files_by_default = true,
                        },
                        score_offset = 25,
                    },
                    buffer = {
                        max_items = 3,
                        min_keyword_length = 2,
                        score_offset = 15,
                    },
                    copilot = {
                        async = true,
                        score_offset = -10,
                        module = 'blink-cmp-copilot',
                        name = 'copilot',
                    },
                    snippets = {
                        enabled = true,
                        max_items = 10,
                        min_keyword_length = 2,
                        -- module = 'blink.cmp.sources.snippets',
                        score_offset = 85,
                        should_show_items = function()
                            local col = vim.api.nvim_win_get_cursor(0)[2]
                            local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
                            -- NOTE: remember that `trigger_text` is modified at the top of the file
                            return before_cursor:match(trigger_text .. '%w*$') ~= nil
                        end,
                        -- After accepting the completion, delete the trigger_text characters
                        -- from the final inserted text
                        -- Modified transform_items function based on suggestion by `synic` so
                        -- that the luasnip source is not reloaded after each transformation
                        -- https://github.com/linkarzu/dotfiles-latest/discussions/7#discussion-7849902
                        -- NOTE: I also tried to add the ";" prefix to all of the snippets loaded from
                        -- friendly-snippets in the luasnip.lua file, but I was unable to do
                        -- so, so I still have to use the transform_items here
                        -- This removes the ";" only for the friendly-snippets snippets
                        transform_items = function(_, items)
                            local line = vim.api.nvim_get_current_line()
                            local col = vim.api.nvim_win_get_cursor(0)[2]
                            local before_cursor = line:sub(1, col)
                            local start_pos, end_pos =
                                before_cursor:find(trigger_text .. '[^' .. trigger_text .. ']*$')
                            if start_pos then
                                for _, item in ipairs(items) do
                                    if not item.trigger_text_modified then
                                        ---@diagnostic disable-next-line: inject-field
                                        item.trigger_text_modified = true
                                        item.textEdit = {
                                            newText = item.insertText or item.label,
                                            range = {
                                                start = {
                                                    line = vim.fn.line('.') - 1,
                                                    character = start_pos - 1,
                                                },
                                                ['end'] = {
                                                    line = vim.fn.line('.') - 1,
                                                    character = end_pos,
                                                },
                                            },
                                        }
                                    end
                                end
                            end
                            return items
                        end,
                    },
                },
            })

            opts.cmdline = {
                enabled = true,
            }

            opts.completion = {
                menu = { border = vim.g.border },
                documentation = {
                    window = { border = vim.g.border },
                    auto_show = true,
                },
            }

            opts.snippets = {
                preset = 'luasnip',
            }

            -- Check if need to enable
            opts.enabled = function()
                local filetype = vim.bo[0].filetype
                -- Disable for Snacks picker buffers
                if filetype == 'TelescopePrompt' or filetype == 'snacks_picker_input' then
                    return false
                end
                return true
            end

            opts.keymap = {
                preset = 'default',
            }

            return opts
        end,
    },
}
