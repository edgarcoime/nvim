vim.loader.enable()

local utils = require("utils")

local expected_version = "0.10.2"
-- utils.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

-- load global
require("globals")
-- vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml_conf/options.vim"))
-- NOTE: might not work before loading config
require("custom-autocmd")

-- load core settings
require("core")

-- load Lazy and plugins
require("plugin_specs")

-- some global settings
-- setting options in nvim
-- various autocommands
-- all the user-defined mappings
-- all the plugins installed and their configurations
