vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")

-- Clear search
vim.keymap.set("n", "<CR>", ":nohl<CR><CR>")

-- Dleete char but don't copy it into regiset
vim.keymap.set("n", "x", "'_x'")

-- windows
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- vertical split
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- horizontal split
vim.keymap.set("n", "<leader>=", "<C-w>=") -- equalize splits 
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- equalize splits 


-- Zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>") -- equalize splits 

-- file tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
-- this usee git root
vim.keymap.set("n", "<leader>p", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').grep_project()<CR>", { silent = true })
