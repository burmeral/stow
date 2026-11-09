local colors = {
    bg = "#2E3440",
    fg = "#D8DEE9",
    red = "#BF616A",
    green = "#A3BE8C",
    yellow = "#EBCB8B",
    blue = "#81A1C1",
    magenta = "#B48EAD",
    cyan = "#88C0D0",
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
