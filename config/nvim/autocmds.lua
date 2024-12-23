-- autocmds.lua

-- Enable autoformat for specific filetypes
vim.cmd [[
  augroup AutoFormat
    autocmd!
    autocmd BufWritePre *.lua,*.js,*.ts,*.cpp :lua vim.lsp.buf.formatting_sync()
  augroup END
]]
