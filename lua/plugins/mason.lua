-- https://gist.github.com/smnatale/b847e568f1a155b8e8349f29a482a1f4
local M = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "lua_ls",
        "dockerls",
        "pyright",
        "gopls",
      }
    })
  end,
  dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "mason-org/mason-lspconfig.nvim", opts = {} },
      "neovim/nvim-lspconfig",
  },
}
return M
