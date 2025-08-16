-- plugins/appearance.lua

local appearance = {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		enabled = true,
	},
	{
		"maxmx03/solarized.nvim",
		priority = 1000,
		enabled = true,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = true,
	},
}

return appearance
