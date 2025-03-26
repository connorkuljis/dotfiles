-- plugins/mini.lua

local mini = {
	{
		"echasnovski/mini.nvim",
		enabled = true,
		config = function()
			require("mini.statusline").setup()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.bracketed").setup()
			require("mini.pick").setup()
		end
	},
}

return mini
