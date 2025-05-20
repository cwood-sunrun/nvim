local api = require("nvim-tree.api")

-- Focus file in file tree that matches current buffer
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if (vim.fn.bufname() == "NvimTree_1") then return end

        api.tree.find_file({ buf = vim.fn.bufnr() })
    end,
})

-- Auto reload files when changed externally
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  nested = true,
  callback = function() 
    if (vim.api.nvim_get_mode().mode ~= "c") then
      vim.api.nvim_command('checktime')
    end
  end,
  pattern = { "*" },
})

