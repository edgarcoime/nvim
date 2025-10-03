vim.loader.enable()

local utils = require("utils")

local expected_version = "0.11.4"
utils.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

-- load global
require("globals")

-- load core settings
require("core")

-- NOTE: Not fully useable yet but stable in 0.11
-- vim.lsp.enable({
--   -- lua
--   "luals",
-- })

-- load Lazy and plugins
require("plugin_specs")

-- some global settings
-- setting options in nvim
-- various autocommands
-- all the user-defined mappings
-- all the plugins installed and their configurations
