-- config/keymap.lua

-- Unbind space
vim.keymap.set("n", "<space>", "<nop>")

-- Map leader
vim.g.mapleader = " "

-- Map local leader
vim.g.maplocalleader = "\\"

-- reload config
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR> <cmd>echo 'reloaded config!'<CR>")

-- Open Explore
vim.keymap.set("n", "<leader>e", "<cmd>Explore <CR>")

-- Define a custom command to open ~/.config/nvim
vim.api.nvim_create_user_command('EditConfig', function()
	vim.cmd('edit ~/.config/nvim')
end, {})

function insert_timestamp()
	-- Get the current timestamp
	local timestamp = os.date("%Y-%m-%d %H:%M:%S")

	-- Get the current buffer and cursor position
	local buf = vim.api.nvim_get_current_buf()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- 0 refers to the current window

	-- Insert the timestamp at the current cursor position
	vim.api.nvim_buf_set_text(buf, row - 1, col, row - 1, col, { timestamp })
end

vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua insert_timestamp()<CR>", { noremap = true, silent = true })
