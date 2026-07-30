vim.g.mapleader = " "

-- Replace selection without saving to register 
vim.keymap.set("x", "p", [["_dP]])

-- Delete text without saving to register 
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "x", '"_x')

-- Ctrl + c to get out of insert
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Ctrl + c to clear search highlights
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc =  "Clear search highlighting", silent = true })

-- Indent/unindent and keep selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Center cursor when moving up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center cursor when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move lines up/down in visual 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Sudo write
vim.keymap.set("n", "<leader>fU", "<cmd>:SudaWrite<CR>")

-- Makes file executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>")

-- Native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" }) 

-- Write
vim.keymap.set("n", "<leader>fs", "<cmd>w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>fS", "<cmd>wa<CR>", { desc = "Write all" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>qr", "<cmd>restart<cr>", { desc = "Restart" })

-- Replace
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Global replace" })

-- Files
vim.keymap.set("n", "<leader>ff", "<cmd>Ex<CR>", { desc = "Explorer" })

-- Commands
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Opens command line" })

--
--vim.keymap.set("n", "<leader>", "<cmd><CR>", { desc = "" })

