-- https://www.reddit.com/r/neovim/comments/1jw0zav/comment/mmeo1as/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- https://www.youtube.com/watch?v=IZnhl121yo0&t=29s
-- https://gist.github.com/smnatale/b847e568f1a155b8e8349f29a482a1f4
local M = {
  "neovim/nvim-lspconfig",
  config = function()
    -- Mason ensure Install
    require("mason-tool-installer").setup({
      ensure_installed = {
        "lua_ls",
        "dockerls",
        "pyright",
        "gopls",
      }
    })

    -- Lsp config
    vim.lsp.enable({
      "lua_ls",
      "pyright",
      "gopls",
    })

    vim.diagnostic.config({
      -- virtual_lines = true,
      -- virtual_text = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
      },
    })
  end,
  dependencies = {
    { "mason-org/mason.nvim",           opts = {} },
    { "mason-org/mason-lspconfig.nvim", opts = {} },
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP.
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0, -- Background color opacity in the notification window
          },
        },
      },
    },
  },
}
return M
