-- plugins/lsp.lua

-- LSP Configuration Plugin
local lsp = {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		config = function()
			-- tell lsp to use completions
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			-- language servers
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.zls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })

			-- LSP Keybinds
			vim.keymap.set('n', 'gD', vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Show references" })
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show documentation" })
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { desc = "Format file" })
			vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, { desc = "Signature help" })
			vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { desc = "Type definition" })

			-- Diagnostics
			vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set('n', '<leader>d', vim.diagnostic.setqflist, { desc = "Open diagnostics list" })

			-- Workspace
			vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
			vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
			vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
				{ desc = "List workspace folders" })

			-- Symbols
			vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_workspace_symbols,
				{ desc = "Workspace symbols" })
			vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
				{ desc = "Document symbols" })
			-- LSP auto-formatting on save
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp", { clear = true }),
				callback = function(args)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format { async = false, id = args.data.client_id }
						end,
					})
				end
			})
		end,
	},
}

return lsp
