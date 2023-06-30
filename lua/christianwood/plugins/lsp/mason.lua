mason = require("mason")
mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "gopls",
    "tsserver",
    "cssls",
    "rust_analyzer",
  }
})
