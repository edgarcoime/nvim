local utils = require("utils")

local plugin_dir = utils.plugin_dir
local lazypath = utils.lazypath

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    lazyrepo,
    "--branch=stable", -- latest stable release
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- check if firenvim is active
local firenvim_not_active = function()
  return not vim.g.started_by_firenvim
end

local plugin_specs = {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
}

require("lazy").setup {
  spec = {
    plugin_specs,
    { import = "plugins" },
  },
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
  rocks = {
    enabled = false,
  },
  checker = {
    enabled = true,
  },
}

-- Toggle setup Lazy nvim setup
local toggleLazy = function()
  local lazy_open = false
  for _, win in pairs(vim.api.nvim_list_wins()) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
    if bufname:match("lazy://") then
      lazy_open = true
      break
    end
  end

  if lazy_open then
    vim.cmd("q") -- Close the Lazy.nvim window if it's open
  else
    vim.cmd("Lazy") -- Open the Lazy.nvim dashboard if it's not open
  end
end

vim.keymap.set("n", "<leader>el", toggleLazy, { desc = "Toggle Lazy Config", noremap = true, silent = true })
