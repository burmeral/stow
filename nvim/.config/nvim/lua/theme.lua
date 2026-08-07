-- ~/.config/nvim/lua/theme.lua

vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

local group = vim.api.nvim_create_augroup("MyHighlights", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = function()
        vim.api.nvim_set_hl(0, "SnacksDashboardIcon", {
            fg = "#89b4fa",
            bold = true,
        })

        vim.api.nvim_set_hl(0, "SnacksDashboardDesc", {
            fg = "#cdd6f4",
            bold = true,
        })

        vim.api.nvim_set_hl(0, "SnacksDashboardKey", {
            fg = "#f9e2af",
        })
    end,
})
