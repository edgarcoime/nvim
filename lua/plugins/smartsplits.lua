local plug = {
  "mrjones2014/smart-splits.nvim",
  event = "VimEnter",
  config = function()
    local splits = require("smart-splits")
    local map = require("utils").map

    -- navigating
    map("n", "<C-left>", function()
      splits.move_cursor_left()
    end, { desc = "Move to left split" })
    map("n", "<C-down>", function()
      splits.move_cursor_down()
    end, { desc = "Move to below split" })
    map("n", "<C-up>", function()
      splits.move_cursor_up()
    end, { desc = "Move to above split" })
    map("n", "<C-right>", function()
      splits.move_cursor_right()
    end, { desc = "Move to right split" })
  end,
}

return plug
