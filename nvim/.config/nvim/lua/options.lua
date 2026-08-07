-- ~/.config/nvim/lua/options.lua

-- Line numbers
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true

local scrolloff = math.floor(vim.o.lines / 2) - 3
vim.opt.scrolloff = scrolloff

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
vim.opt.shell = vim.fn.exepath("zsh")

-- Appearance
vim.g.netrw_banner = 0
vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine",   { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})
