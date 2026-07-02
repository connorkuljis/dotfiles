-- plugins/lsp.lua

-- LSP Configuration Plugin
local lsp = {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		config = function()
			-- List of language servers to configure
			local servers = {
				"bashls",
				"clangd",
				"cssls",
				"gopls",
				"html",
				"jdtls",
				"jsonls",
				"lua_ls",
				"basedpyright",
				"ruff",
				"ts_ls",
				"yamlls",
				"zls",
			}

			-- List of required modules
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			-- Configure each language server with the same capabilities
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			-- LSP Keybinds
			-- TODO: fix collision with go to local declaration (vim standard)
			-- https://vim.fandom.com/wiki/Go_to_definition_using_g
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set("n", "<leader>gp", vim.lsp.buf.references, { desc = "Show references" })
			vim.keymap.set("n", "<leader>go", vim.lsp.buf.hover, { desc = "Show documentation" })
			vim.keymap.set("n", "<leader>gc", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, { desc = "Signature help" })
			vim.keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, { desc = "Type definition" })
			vim.keymap.set("n", "<leader>gs", vim.lsp.buf.document_symbol, { desc = "Document symbols" })

			-- Diagnostics
			vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
			vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "Open diagnostics quick fix list" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

			-- Workspace
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
			vim.keymap.set("n", "<leader>wl", vim.lsp.buf.list_workspace_folders, { desc = "List workspace folders" })
			vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })

			-- LSP auto-formatting on save
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp", { clear = true }),
				callback = function(args)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								id = args.data.client_id,
							})
						end,
					})
				end,
			})
		end,
	},
}

return lsp
