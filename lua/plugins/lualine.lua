return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        -- theme = "horizon",
        -- theme = 'dracula',
        theme = "nightfly",
        globalstatus = true,
      },
      sections = {
        lualine_b = {
          "branch",
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
          },
        },
        lualine_c = {
          "filename",
        },
        lualine_x = {
          -- get_attached_clients,
          -- clients_lsp,
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
          },
          "filetype",
        },
      },
    })
  end
}

