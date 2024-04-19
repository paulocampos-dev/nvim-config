local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.shiftround = true -- Round indent

-- Appearance
opt.number = true -- Show line number
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 5
opt.conceallevel = 0
opt.cursorline = true -- Enable highlighting of the current line
opt.laststatus = 3    -- global statusline
opt.list = true       -- Show some invisible characters (tabs...
opt.pumblend = 10     -- Popup blend
opt.pumheight = 10    -- Maximum number of entries in a popup
opt.showmode = false  -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.winminwidth = 5   -- Minimum window width
-- opt.colorcolumn = "80"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse = "a"               -- Enable mouse mode
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.modifiable = true
opt.encoding = "UTF-8"
opt.autowrite = true           -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.smartcase = true -- Don't ignore case with capitals
opt.splitkeep = "screen"
opt.timeoutlen = 600
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.virtualedit = "block"          -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode

opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- Folding
opt.foldlevel = 99
opt.foldcolumn = "0"
opt.foldlevelstart = 99
opt.foldenable = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
