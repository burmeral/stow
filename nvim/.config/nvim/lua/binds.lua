-- ~/.config/nvim/lua/binds.lua

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Delete text without saving to register 
vim.keymap.set("n", "D", '"_dd')

-- Change without yanking
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set("n", "C", '"_C')

-- Substitute without yanking
vim.keymap.set("n", "s", '"_s')
vim.keymap.set("x", "s", '"_s')
vim.keymap.set("n", "S", '"_S')

-- Replace character without yanking
vim.keymap.set("n", "r", '"_r')
vim.keymap.set("x", "p", [["_dP]])

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
vim.keymap.set("n", "<leader>fa", "<cmd>wa<CR>", { desc = "Write all" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>qr", "<cmd>restart<cr>", { desc = "Restart" })

-- Replace
vim.keymap.set("n", "<leader>r", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left><Left>]], { desc = "Local replace" })
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], { desc = "Global replace" })

-- Files
vim.keymap.set("n", "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>", { desc = "Find file" })
vim.keymap.set("n", "<leader>fe", "<cmd>lua Snacks.explorer()<CR>", { desc = "Open explorer" })
vim.keymap.set("n", "<leader>fr", "<cmd>lua Snacks.picker.recent()<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fg", "<cmd>lua Snacks.picker.grep()<CR>", { desc = "Find text" })

-- Paths
vim.keymap.set("n", "<leader>fc", function()
    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Open nvim directory" })

vim.keymap.set("n", "<leader>fC", function()
    Snacks.picker.files({ cwd = vim.fn.expand("~/Stow") })
end, { desc = "Open stow directory" })

vim.keymap.set("n", "<leader>fN", function()
    Snacks.picker.files({ cwd = "/etc/nixos" })
end, { desc = "Open nixos directory" })  

vim.keymap.set("n", "<leader>fH", function()
    Snacks.picker.files({ cwd = vim.fn.expand("~/.config/hypr/") })
end, { desc = "Open hypr directory" })  

-- Org
--vim.keymap.set("n", "<leader>od", "<cmd> <CR>", { desc = "Open Org dashboard" })

-- Commands
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Open command line" })
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy menu" })

--
--vim.keymap.set("n", "<leader>", "<cmd><CR>", { desc = "" })

