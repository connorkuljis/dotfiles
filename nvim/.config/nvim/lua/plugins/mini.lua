-- plugins/mini.lua

local mini = {
	{
		"echasnovski/mini.nvim",
		enabled = true,
		config = function()
			require("mini.statusline").setup()
			require("mini.comment").setup()
		end
	},
}

return mini
