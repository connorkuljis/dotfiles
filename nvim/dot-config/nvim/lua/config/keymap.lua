-- config/keymap.lua
--
local M = {}

-- map leaders
vim.keymap.set("n", "<space>", "<nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", "<cmd>Explore <CR>")

function M.ConfigOpen()
	vim.cmd([[edit ~/.config/nvim]])
end

vim.api.nvim_create_user_command("ConfigOpen", M.ConfigOpen, {})

function M.InsertCurrentTime()
	local time_str = os.date("%Y-%m-%dT%H:%M:%S")
	vim.api.nvim_put({ time_str }, "v", false, {})
end

vim.keymap.set("n", "<leader>ti", M.InsertCurrentTime,
	{ desc = "Insert current time" }
)

function M.WriteBufferWithDate()
	local filename = os.date("%Y-%m-%d") .. ".txt"
	vim.cmd("write " .. filename)
	vim.notify("Buffer written to " .. filename, vim.log.levels.INFO)
end

vim.keymap.set("n", "<leader>tw", M.WriteBufferWithDate, {
	desc = "Write buffer to file with today's date"
})

return M
