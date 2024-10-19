return {
  "mrjones2014/smart-splits.nvim",
  event = "VimEnter",
  config = function()
    local splits = require("smart-splits")
    local map = require("custom.functions").map

    -- navigating
    map("n", "<C-h>", function()
      splits.move_cursor_left()
    end, { desc = "Move to left split" })
    map("n", "<C-j>", function()
      splits.move_cursor_down()
    end, { desc = "Move to below split" })
    map("n", "<C-k>", function()
      splits.move_cursor_up()
    end, { desc = "Move to above split" })
    map("n", "<C-l>", function()
      splits.move_cursor_right()
    end, { desc = "Move to right split" })
  end,
}
