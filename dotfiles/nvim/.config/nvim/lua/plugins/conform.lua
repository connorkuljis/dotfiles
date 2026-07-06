-- plugins/conform.nvim
-- Manual formatting on demand. Format-on-save is intentionally NOT
-- handled here: it stays with the LSP servers (lua_ls formats Lua on
-- save via the LspAttach -> BufWritePre autocmd in lua/plugins/lsp.lua).
-- Conform is used only for `:Format` so that stylua -- the canonical Lua
-- formatter, enforcing quote/paren/wrap rules that lua_ls does not -- can
-- be invoked on demand when installed, with a transparent fallback to the
-- attached LSP server (lsp_fallback = true) when it is absent.

local conform = {
  {
    "stevearc/conform.nvim",
    enabled = true,
    config = function()
      require("conform").setup({
        -- Only map formatters we want conform to run on demand. JSON/HTML/CSS
        -- stay on their LSP servers (jsonls/html/cssls), so they are omitted
        -- here; `:Format` in those filetypes falls back to the LSP via
        -- lsp_fallback.
        formatters_by_ft = {
          lua = { "stylua" },
        },
        -- No format_on_save: LSP owns save formatting (see lsp.lua).
      })

      -- `:Format` (and `:'<,'>Format` for a visual range) runs the conform
      -- formatter for the current filetype, falling back to the attached
      -- LSP when conform has no formatter available for it (or that
      -- formatter is not installed). This mirrors "stylua if present, else
      -- lua_ls" but only ever on demand -- never racing the save autocmd.
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, 0 },
          }
        end
        require("conform").format({
          range = range,
          lsp_fallback = true,
          async = false,
        })
      end, { range = true, desc = "Format buffer (conform, LSP fallback)" })

      vim.keymap.set("n", "<leader>f", "<cmd>Format<CR>", { desc = "Format buffer" })
      vim.keymap.set("x", "<leader>f", "<cmd>Format<CR>", { desc = "Format selection" })
    end,
  },
}

return conform
