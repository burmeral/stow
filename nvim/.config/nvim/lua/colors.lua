local colors = {
    bg = "#F3F3EA",
    fg = "#050502",
    red = "#F77D74",
    green = "#ABC15C",
    yellow = "#8C6340",
    blue = "#6D3130",
    magenta = "#46461F",
    cyan = "#171708",
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
