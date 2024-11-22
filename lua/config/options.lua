-- Set encoding
vim.opt.encoding = "utf-8"

-- Configure fill characters for various UI elements
vim.opt.fillchars = {
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
  vert = "│",
  eob = " ",
  msgsep = "‾",
  diff = "╱",
}

-- Split window preferences
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen" -- Avoid flickering when splitting windows

-- Timing settings
vim.opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete
vim.opt.updatetime = 500 -- For CursorHold events

-- Clipboard settings
if vim.fn.has("clipboard") == 1 then
  vim.opt.clipboard:append("unnamedplus")
end

-- Disable swapfile creation
vim.opt.swapfile = false

-- Ignore certain files and folders during globbing
vim.opt.wildignore:append {
  "*.o",
  "*.obj",
  "*.dylib",
  "*.bin",
  "*.dll",
  "*.exe",
  "*/.git/*",
  "*/.svn/*",
  "*/__pycache__/*",
  "*/build/**",
  "*.jpg",
  "*.png",
  "*.jpeg",
  "*.bmp",
  "*.gif",
  "*.tiff",
  "*.svg",
  "*.ico",
  "*.pyc",
  "*.pkl",
  "*.DS_Store",
  "*.aux",
  "*.bbl",
  "*.blg",
  "*.brf",
  "*.fls",
  "*.fdb_latexmk",
  "*.synctex.gz",
  "*.xdv",
}
vim.opt.wildignorecase = true -- Ignore case in command-line completion

-- Set up backup directory
local backupdir = vim.fn.stdpath("data") .. "/backup//"
vim.opt.backupdir = backupdir
vim.opt.backup = true -- Enable backups
vim.opt.backupcopy = "yes" -- Copy the original file to backupdir and overwrite it
vim.opt.backupskip = vim.opt.wildignore:get() -- Skip backup for patterns in wildignore

-- Tab and indentation settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Matching pairs and highlighting
vim.opt.matchpairs:append { "<:>", "「:」", "『:』", "【:】", "“:”", "‘:’", "《:》" }

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters

-- File encoding settings
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }

-- Line break settings
vim.opt.linebreak = true
vim.opt.showbreak = "↪" -- Character to show before wrapped lines

-- Command-line completion settings
vim.opt.wildmode = { "list", "longest" }

-- Mouse settings
vim.opt.mouse = "nic" -- Enable mouse in normal, insert, and command-line modes
vim.opt.mousemodel = "popup" -- Set mouse behavior
vim.opt.mousescroll = { "ver:1", "hor:0" }

-- Disable showing current mode on command line
vim.opt.showmode = false

-- File format settings
vim.opt.fileformats = { "unix", "dos" } -- File formats to use for new files

-- Confirmation settings
vim.opt.confirm = true -- Ask for confirmation when handling unsaved or read-only files

-- Bell settings
vim.opt.visualbell = true
vim.opt.errorbells = false -- Disable error bells

-- Command and search history
vim.opt.history = 500 -- Number of command and search history entries to keep

-- List mode and list characters
vim.opt.list = true
vim.opt.listchars = { tab = "▏ ", trail = "·", nbsp = "␣", extends = "❯", precedes = "❮" }

-- Auto-write files under certain conditions
vim.opt.autowrite = true

-- Title settings
vim.opt.title = true
vim.opt.titlestring = '%{v:lua.require("utils").get_titlestr()}'

-- Persistent undo
vim.opt.undofile = true

-- Short message settings
vim.o.shortmess = vim.o.shortmess .. "cSI" -- Customize messages during auto-completion and disable intro message

-- Completion behavior
vim.opt.completeopt:append("menuone") -- Show menu even if there is only one item
vim.opt.completeopt:remove("preview") -- Disable the preview window

-- Popup menu settings
vim.opt.pumheight = 10 -- Maximum number of items to show in popup menu
vim.opt.pumblend = 5 -- Pseudo transparency for completion menu

-- Floating window settings
vim.opt.winblend = 0 -- Pseudo transparency for floating windows

-- Insert mode keyword completion settings
vim.opt.complete:append("kspell")
vim.opt.complete:remove { "w", "b", "u", "t" }

-- Spell settings
vim.opt.spelllang = { "en" } -- Spell languages
vim.opt.spellsuggest = { "best", 9 } -- Show up to 9 spell suggestions

-- Indentation settings
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth

-- Virtual edit settings
vim.opt.virtualedit = "block" -- Allow virtual editing in block mode

-- Format options
vim.opt.formatoptions:append { "m", "M" } -- Correctly break multi-byte characters

-- Tilde operator settings
vim.opt.tildeop = true -- Tilde (~) is an operator

-- Syntax highlighting settings
vim.opt.synmaxcol = 250 -- Text after this column number is not highlighted
vim.opt.startofline = false -- Do not move cursor to the start of the line when moving to another line

-- Grep program settings
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

-- True color support
vim.opt.termguicolors = true -- Enable true color support
vim.opt.background = "dark" -- colorchemes that can be light or dark will default dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- cursor line
vim.opt.cursorline = true
vim.opt.scrolloff = 5
