local function getWordsV2()
    local allowed_filetypes = { markdown = true, typst = true, txt = true }
    local ft = vim.bo.filetype
    if not allowed_filetypes[ft] then
        return ''
    end

    local wc = vim.fn.wordcount()
    if wc['visual_words'] then -- text is selected in visual mode
        return wc['visual_words'] .. 'W/' .. wc['visual_chars'] .. 'C (V)'
    else -- all of the document
        return wc['words'] .. 'W'
    end
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require('lualine')

        lualine.setup({
            options = {
                -- theme = "horizon",
                -- theme = 'dracula',
                theme = 'nightfly',
                globalstatus = true,
            },
            sections = {
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Changes the symbols used by the diff.
                    },
                },
                lualine_c = {
                    'filename',
                },
                lualine_x = {
                    -- get_attached_clients,
                    -- clients_lsp,
                    {
                        'diagnostics',
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰠠 ' },
                    },
                    'filetype',
                },
                lualine_z = {
                    'location',
                    getWordsV2,
                },
            },
        })
    end,
}
