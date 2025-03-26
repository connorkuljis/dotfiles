-- plugins/telescope.lua

local telescope = {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		opts = {},
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- Require Telescope
			local builtin = require("telescope.builtin")

			-- File-related searches
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		end,
	},
}

return telescope
