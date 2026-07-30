vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },

    "https://github.com/stevearc/conform.nvim",
    "https://github.com/mfussenegger/nvim-lint",
    "https://github.com/lambdalisue/vim-suda",
})

--- treesitter ---
require("treesitter")

 -- conform ---
require("conform")

--- lint ---
require("lint")

--- lsp ---
--require("lsp")
