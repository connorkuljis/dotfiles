return {
	{
		"junegunn/fzf.vim",
		enabled = true,
		dependencies = {
			"junegunn/fzf",
		},
		keys = {
			{
				"<leader>f",
				":Files <CR>",
				desc = "Open file picker",
			},
			{
				"<leader>F",
				":GitFiles <CR>",
				desc = "Open git files in file picker",
			},
			{
				"<leader>b",
				":Buffers <CR>",
				desc = "Open file buffer picker",
			},
			{
				"<leader>l",
				":Lines <CR>",
				desc = "Open line picker",
			},
			{
				"<leader>m",
				":Marks <CR>",
				desc = "Open mark picker",
			},
			{
				"<leader>/",
				":Rg <CR>",
				desc = "Open ripgrep picker",
			},
		},
	},
}
