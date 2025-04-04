return {
	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" },
		enabled = true,
		config = function()
			vim.keymap.set('n', '<leader>f', ':Files <CR>',
				{ desc = "Open file picker" }
			)
		end
	},
}
