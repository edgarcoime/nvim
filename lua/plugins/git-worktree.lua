return {
  "ThePrimeagen/git-worktree.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local wt = require("git-worktree")
    local telescope = require("telescope")

    wt.setup()
    telescope.load_extension("git_worktree")

    local map = function(m, l, r, desc)
      require("custom.functions").map(m, l, r, { desc = "Git WT: " .. desc })
    end

    map("n", "<leader>sgw", telescope.extensions.git_worktree.git_worktrees, "[S]earch [G]it [W]T")
    map("n", "<leader>sgn", telescope.extensions.git_worktree.create_git_worktree, "[S]earch [G]it WT [N]ew tree")
  end,
}
