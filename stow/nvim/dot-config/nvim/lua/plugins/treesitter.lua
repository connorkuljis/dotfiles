-- plugins/treesitter.lua

local treesitter = {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			ensure_installed = { "lua", "go", "html", "rust", "css", "python" },
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

return treesitter
