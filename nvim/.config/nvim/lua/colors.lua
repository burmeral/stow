local colors = {
    bg = "#F3FFF2",
    fg = "#1E5872",
    red = "#21B9FD",
    green = "#0F1B3D",
    yellow = "#10504B",
    blue = "#50348D",
    magenta = "#169F98",
    cyan = "#0F7B25",
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
