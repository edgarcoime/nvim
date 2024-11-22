return {
  "glacambre/firenvim",
  enabled = function()
    local result = vim.g.is_win or vim.g.is_mac
    return result
  end,
  -- it seems that we can only call the firenvim function directly.
  -- Using vim.fn or vim.cmd to call this function will fail.
  build = function()
    local firenvim_path = require("utils").plugin_dir .. "/firenvim"
    vim.opt.runtimepath:append(firenvim_path)
    vim.cmd("runtime! firenvim.vim")

    -- macOS will reset the PATH when firenvim starts a nvim process, causing the PATH variable to change unexpectedly.
    -- Here we are trying to get the correct PATH and use it for firenvim.
    -- See also https://github.com/glacambre/firenvim/blob/master/TROUBLESHOOTING.md#make-sure-firenvims-path-is-the-same-as-neovims
    local path_env = vim.env.PATH
    local prologue = string.format('export PATH="%s"', path_env)
    -- local prologue = "echo"
    local cmd_str = string.format(":call firenvim#install(0, '%s')", prologue)
    vim.cmd(cmd_str)
  end,
}
