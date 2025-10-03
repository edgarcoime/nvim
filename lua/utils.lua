local fn = vim.fn
local version = vim.version

local M = {}

--- Mapping overwrite for uniformity and defaults
--- @param mode string|string[]
--- @param lhs string
--- @param rhs string|function
--- @param additionals? vim.keymap.set.Opts
--- @param overwrite? boolean
function M.map(mode, lhs, rhs, additionals, overwrite)
  local default_opts = { remap = true, silent = true }
  local new_opts = {}
  if overwrite then
    new_opts = additionals or {}
  else
    new_opts = vim.tbl_deep_extend("force", default_opts, additionals or {})
  end

  vim.keymap.set(mode, lhs, rhs, new_opts)
end

function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

--- check whether a feature exists in Nvim
--- @param feat string the feature name, like `nvim-0.7` or `unix`.
--- @return boolean
M.has = function(feat)
  if fn.has(feat) == 1 then
    return true
  end

  return false
end

--- Create a dir if it does not exist
function M.may_create_dir(dir)
  local res = fn.isdirectory(dir)

  if res == 0 then
    fn.mkdir(dir, "p")
  end
end

--- Generate random integers in the range [Low, High], inclusive,
--- adapted from https://stackoverflow.com/a/12739441/6064933
--- @param low integer the lower value for this range
--- @param high integer the upper value for this range
--- @return integer
function M.rand_int(low, high)
  -- Use lua to generate random int, see also: https://stackoverflow.com/a/20157671/6064933
  math.randomseed(os.time())

  return math.random(low, high)
end

--- Select a random element from a sequence/list.
--- @param seq any[] the sequence to choose an element
function M.rand_element(seq)
  local idx = M.rand_int(1, #seq)

  return seq[idx]
end

--- check if the current nvim version is compatible with the allowed version
--- @param expected_version string
--- @return boolean
function M.is_compatible_version(expected_version)
  -- check if we have the latest stable version of nvim
  local expect_ver = version.parse(expected_version)
  local actual_ver = vim.version()

  if expect_ver == nil then
    local msg = string.format("Unsupported version string: %s", expected_version)
    vim.api.nvim_err_writeln(msg)
    return false
  end

  local result = version.cmp(expect_ver, actual_ver)
  if result ~= 0 then
    local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
    local msg = string.format(
      "Expect nvim version %s, but your current nvim version is %s. Use at your own risk!",
      expected_version,
      _ver
    )
    vim.api.nvim_err_writeln(msg)
  end

  return true
end

function M.get_titlestr()
  local title_str = ""

  -- Check if the system is Linux
  if vim.g.is_linux then
    -- Retrieve the hostname
    local hostname = vim.fn.hostname()
    title_str = hostname .. "  "
  end

  -- Get the full path of the current buffer, relative to the home directory
  local buf_path = vim.fn.expand("%:p:~")
  title_str = title_str .. buf_path .. "  "

  -- Check if the buffer is listed and has a valid path
  if vim.bo.buflisted and buf_path ~= "" then
    -- Get the last modification time of the file
    local last_mod_time = vim.fn.getftime(vim.fn.expand("%"))
    if last_mod_time ~= -1 then
      -- Format the modification time
      local formatted_time = os.date("%Y-%m-%d %H:%M:%S%z", last_mod_time)
      title_str = title_str .. formatted_time
    end
  end

  return title_str
end

M.plugin_dir = vim.fn.stdpath("data") .. "/lazy"
M.lazypath = M.plugin_dir .. "/lazy.nvim"

return M
