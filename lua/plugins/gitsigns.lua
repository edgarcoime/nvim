return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gs = require("gitsigns")

    local on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, desc)
        require("utils").map(mode, l, r, { buffer = bufnr, desc = "Gitsigns: " .. desc })
      end

      -- Actions
      map("n", "<leader>gp", gitsigns.preview_hunk, "Preview Hunk")
      map("n", "<leader>gr", gitsigns.reset_hunk, "Reset Hunk")

      map("n", "<leader>gu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>gR", gitsigns.reset_buffer, "Reset Buffer")
      map("n", "<leader>gp", gitsigns.preview_hunk, "Preview Hunk")

      map("n", "<leader>gtd", gitsigns.toggle_deleted, "Toggle deleted")
      map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, "Toggle line blame")
      -- map("n", "<leader>gS", gitsigns.stage_buffer, "Stage Buffer")
      -- map("n", "<leader>gl", function()
      --   gitsigns.blame_line { full = true }
      -- end, "Blame Line Full")
      -- map("n", "<leader>gd", gitsigns.diffthis, "Diff this")
      -- map("n", "<leader>gD", function()
      --   gitsigns.diffthis("~")
      -- end, "Diff this")
    end

    gs.setup {
      current_line_blame = true,
      on_attach = on_attach,
    }
  end,
}
