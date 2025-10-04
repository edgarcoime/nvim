vim.loader.enable()

local utils = require('utils')
-- Using nightly so irrelevent
-- local expected_version = "0.11.4"
-- utils.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath('config')
---@cast config_dir string
---

-- load global
require('globals')

-- load core settings
require('core')

require('autocmds')

-- load Lazy and plugins
require('plugin_specs')

-- some global settings
-- setting options in nvim
-- various autocommands
-- all the user-defined mappings
-- all the plugins installed and their configurations
