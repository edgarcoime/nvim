return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { 
        sections = {
          { section = "header" },
          { section = "keys", gap = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
          { section = "startup" },
        },
      },
      explorer = { 
        layout = {
          cycle = false,
        }
      },
      indent = { enabled = true },
      picker = { enabled = true },
      notifier = { 
        enabled = true,
        timeout = 2000,
      },
      toggle = { enabled = true },
      quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- ?statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      { "<leader>ex", function() Snacks.explorer() end, desc = "Snacks Explorer" },

      -- Searching
      { "<leader>sr", function() Snacks.picker.recent() end, desc = "[S]earch [R]ecent" },
      { "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]ile" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "[S]earch [M]arks" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "[S]earch [M]an Pages" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "[S]earch [U]ndo History" },
      { "<leader>sP", function() Snacks.picker.lazy() end, desc = "[S]earch for [P]lugin Spec" },
      { "<leader>sp", function() Snacks.picker.projects() end, desc = "[S]earch [P]rojects" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "[S]earch [J]umps" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "[S]earch [C]ommand History" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "[S]earch [C]ommands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[S]earch [D]iagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "[S]earch Buffer [D]iagnostics" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "[S]earch [L]ocation List" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "[S]earch [Q]uickfix List" },
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>s'", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      -- Grep
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "[S]earch Grep current [B]uffer" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "[S]earch Grep all [B]uffers" },
      { "<leader>sa", function() Snacks.picker.grep() end, desc = "[S]earch Grep [A]ll" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch Visual selection or [W]ord", mode = { "n", "x" } },
      -- git
      { "<leader>gF", function() Snacks.picker.git_files() end, desc = "[G]it [F]iles" },
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "[G]it [B]ranches" },
      -- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "[G]it [L]og" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "[G]it [L]azy Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "[G]it Log [L]ine" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "[G]it [S]tatus" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "[G]it [S]tash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "[G]it [D]iff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "[G]it Log [F]ile" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      -- QOL
      { "<leader>e.", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>en", function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>ed", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>eC", function() Snacks.picker.colorschemes() end, desc = "Search colorschemes" },
    }
  }
}
