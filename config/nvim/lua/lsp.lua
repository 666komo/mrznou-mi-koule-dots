-- lsp.lua

local nvim_lsp = require('lspconfig')

-- Setup for TypeScript (ts_ls instead of tsserver)
nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
}

-- Setup for Rust
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
}

-- Add more language server setups as needed
