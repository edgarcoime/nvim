return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  dependencies = {
    { "echasnovski/mini.nvim", version = false },
  },
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local wk = require("which-key")
    wk.setup({
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
      },
    })

    wk.add({
      { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
      { "<leader>d", group = "[D]ebugger" },
      { "<leader>l", group = "[L]SP" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>sg", group = "[S]earch [G]it" },
      { "<leader>t", group = "[T]ab" },
      -- { "<leader>h", group = "Git [H]unk" },
      { "<leader>g", group = "[G]it" },
      { "<leader>gt", group = "[G]it [T]oggle" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>e", group = "[E]ditor" },
      { "<leader>ec", group = "[E]ditor [C]onfig" },
    })
  end,
}
