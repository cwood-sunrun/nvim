mason = require("mason")
mason_null_ls = require("mason")
mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "gopls",
    "cssls",
    "rust_analyzer",
    "apex_ls",
    "ts_ls"
  }
})

mason_null_ls.setup({
  ensure_installed = {
    "eslint_d",
    "prettier"
  }
})
