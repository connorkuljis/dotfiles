-- Lua house style: 2 spaces, matching .stylua.toml. The global default
-- in lua/config/option.lua is also 2 spaces; this ftplugin pins it
-- explicitly for Lua so it stays correct if the global ever changes.
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- Formatting:
--   * on save  -> lua-language-server, via the LspAttach -> BufWritePre
--                 autocmd in lua/plugins/lsp.lua (respects the 2-space
--                 options set above).
--   * on demand -> `:Format` (conform.nvim) runs stylua when installed,
--                  falling back to lua_ls. See lua/plugins/conform.lua.
--                  stylua can also be run manually from the shell via
--                  scripts/format.sh.
