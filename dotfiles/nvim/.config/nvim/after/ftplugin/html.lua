-- HTML convention: 2 spaces. The global default in lua/config/option.lua
-- is also 2 spaces; this ftplugin pins it explicitly for HTML.
--
-- The `html` language server (vscode-langservers-extracted) formats on
-- save (LspAttach -> BufWritePre autocmd in lua/plugins/lsp.lua).
-- vim.lsp.buf.format() forwards this buffer's shiftwidth/expandtab to
-- the server as tabSize/insertSpaces, so the values here are honored.
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
