-- config/keymap.lua

-- map leaders
vim.keymap.set("n", "<space>", "<nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", "<cmd>Explore <CR>")

-- Define a custom command to open ~/.config/nvim
vim.api.nvim_create_user_command("ConfigOpen", function()
	vim.cmd("edit ~/.config/nvim")
end, {})

-- Insert current time with leader + tt
vim.keymap.set("n", "<leader>t", function()
	local time_str = os.date("%H:%M:%S") -- Format: HH:MM:SS (24-hour)
	vim.api.nvim_put({ time_str }, "v", false, {})
end, { desc = "Insert current time" })
