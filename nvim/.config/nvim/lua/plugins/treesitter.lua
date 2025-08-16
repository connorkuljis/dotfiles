-- plugins/treesitter.lua

local treesitter = {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			ensure_installed = { "lua", "go", "html", "rust", "css" },
			auto_install = true,
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

return treesitter
