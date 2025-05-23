-- null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- null_ls.setup({
--   sources = {
--     formatting.prettier,
--     formatting.gofmt,
--     formatting.rustfmt,
--     diagnostics.eslint_d,
--     diagnostics.proselint,
--   },
--       -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
--                     vim.lsp.buf.format({ async = false })
--                     -- vim.lsp.buf.formatting_sync()
--                 end,
--             })
--         end
--     end,
-- })
--
--
