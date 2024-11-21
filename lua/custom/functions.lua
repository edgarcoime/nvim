local M = {}

function M.map(mode, lhs, rhs, additionals)
  local default_opts = { remap = true, silent = true }
  local new_opts = vim.tbl_deep_extend("force", default_opts, additionals or {})

  vim.keymap.set(mode, lhs, rhs, new_opts)
end

return M
