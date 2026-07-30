local colors = {
    bg = "#FBF1F2",
    fg = "#8B8198",
    red = "#D57E85",
    green = "#A3B367",
    yellow = "#DCB16C",
    blue = "#7297B9",
    magenta = "#BB99B4",
    cyan = "#69A9A7",
}

vim.api.nvim_set_hl(0, "Normal", {
    fg = colors.fg,
    bg = "none",
})

vim.api.nvim_set_hl(0, "Comment", {
    fg = colors.cyan,
    italic = true,
})

vim.api.nvim_set_hl(0, "String", {
    fg = colors.green,
})

vim.api.nvim_set_hl(0, "Function", {
    fg = colors.blue,
})

vim.api.nvim_set_hl(0, "Keyword", {
    fg = colors.magenta,
})
