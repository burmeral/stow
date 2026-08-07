local colors = {
    bg = "#FDFFFF",
    fg = "#2D4363",
    red = "#3178DC",
    green = "#0E222A",
    yellow = "#092853",
    blue = "#233459",
    magenta = "#1C4599",
    cyan = "#37549A",
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
