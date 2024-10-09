-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- line wrap
vim.opt.wrap = false

-- search 
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- appeareance
vim.opt.termguicolors = true
vim.opt.background = "dark"


-- copying 
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Treat dashses as full word
vim.opt.iskeyword:append("-")

-- Float diagnostics
vim.diagnostic.config({
    virtual_text = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

-- Show diagnostic keymap
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Disable swap files
vim.opt.swapfile = false
