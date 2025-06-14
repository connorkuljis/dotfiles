return {
	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" },
		enabled = true,
		config = function()
			vim.keymap.set('n', '<leader>f', ':Files <CR>',
				{ desc = "Open file picker" }
			)
			vim.keymap.set('n', '<leader>b', ':Buffers <CR>',
				{ desc = "Open file buffer picker" }
			)
			vim.keymap.set('n', '<leader>l', ':Lines <CR>',
				{ desc = "Open line picker" }
			)
			vim.keymap.set('n', '<leader>m', ':Marks <CR>',
				{ desc = "Open mark picker" }
			)
			vim.keymap.set('n', '<leader>/', ':Rg <CR>',
				{ desc = "Open ripgrep picker" }
			)
		end
	},
}
