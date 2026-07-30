local colors = {
    bg = "{{background}}",
    fg = "{{foreground}}",
    red = "{{color1}}",
    green = "{{color2}}",
    yellow = "{{color3}}",
    blue = "{{color4}}",
    magenta = "{{color5}}",
    cyan = "{{color6}}",
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
