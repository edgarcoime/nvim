local M = {}

local function split_string(input, delimiter)
  local result = {}
  for match in (input .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

local function truncated_filepath(filepath)
  -- Check if depth is more than three
  local parts = split_string(filepath, "/")

  -- Get the last sections of path
  local last_three = filepath:match("([^/]+/[^/]+/[^/]+)$")

  if last_three then
    if #parts > 3 then
      return "../" .. last_three
    else
      return last_three
    end
  end

  return filepath
end

M.renderWithIconName = function()
  local helpers = require("incline.helpers")
  local devicons = require("nvim-web-devicons")

  require("incline").setup({
    window = {
      padding = 0,
      margin = { horizontal = 0, vertical = 0 },
    },
    render = function(props)
      -- vim.fn.expand("%:t")
      -- vim.fn.fnamemodify()

      -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      -- local display_name = string.format("%s/%s", vim.fn.expand("%:h:t"), filename)
      -- local parent_dir = vim.fn.expand("%:h:t")

      -- https://neovim.io/doc/user/cmdline.html#filename-modifiers
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:.")
      -- local display_name = truncated_filepath(filename)
      local display_name = truncated_filepath(filename)

      -- print("filename: ", filename)
      -- print("displayname: ", display_name)

      -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:h")
      local ft_icon, ft_color = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified
      local buffer = {
        ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
        " ",
        { display_name, gui = modified and "bold,italic" or "bold" },
        " ",
        guibg = "#363944",
      }
      return buffer
    end,
  })
end

return M
