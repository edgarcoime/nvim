local M = {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  lazy = false,
  branch = 'master',
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter.configs')

    -- configure treesitter
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup({
      highlight = {
        enable = true,
        disable = { 'rust' },
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      -- autotag = { enable = true },
      -- auto install any that i don't have
      auto_install = true,
      -- ensure languages are installed
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'printf',
        'python',
        'query',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    })
  end,
}
return M
