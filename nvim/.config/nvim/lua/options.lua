vim.g.netrw_banner = 0

vim.opt.guicursor = ""

-- Scrolloff
local scrolloff = math.floor(vim.o.lines / 2) - 3
vim.opt.scrolloff = scrolloff

-- Line numbers
vim.opt.guicursor = ""
-- vim.opt.scrolloff = 8 

-- Wrapping
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

-- Smart tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Case-sensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

-- Swap file + Undo dir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- Clipboard append
vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@") 

-- Command line
vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.o.cmdheight = 0
vim.opt.termguicolors = true

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})
