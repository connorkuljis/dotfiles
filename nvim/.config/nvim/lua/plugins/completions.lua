-- plugins/completion.lua

local cmp = {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- "nvim-tree/nvim-web-devicons",
		},

		-- Use a release tag to download pre-built binaries
		version = "*",

		opts = function()
			return {
				-- Keymap presets: 'default', 'super-tab', or 'enter'
				keymap = {
					-- Choose a preset or define custom keymaps
					preset = "default",
				},

				appearance = {
					-- Fallback to nvim-cmp's highlight groups if the theme
					-- doesn't support blink.cmp
					use_nvim_cmp_as_default = true,

					-- Adjust spacing for Nerd Font icons
					nerd_font_variant = "mono", -- Options: "mono" or "normal"
				},

				-- Default list of enabled sources
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
			}
		end,

		-- Extend the default sources without redefining them
		opts_extend = { "sources.default" },
	},
}

return cmp
