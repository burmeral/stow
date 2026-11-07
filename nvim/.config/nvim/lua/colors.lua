local colors = {
    bg = "#F4F2ED",
    fg = "#060504",
    red = "#F2F278",
    green = "#8D9D4C",
    yellow = "#4A50C0",
    blue = "#5C6731",
    magenta = "#31378C",
    cyan = "#19140B",
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
