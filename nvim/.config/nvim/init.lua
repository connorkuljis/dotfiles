-- init.lua

-- Load keymap configurations before loading plugins from lazy.
require("config.keymap")

-- https://lazy.folke.io/instalation
require("config.lazy")

-- Load options configuration for my user preferences
require("config.option")

-- Load autocommands
require("config.autocommand")

-- Set the colorscheme
vim.cmd([[colorscheme onedark]])

-- Automatic light/dark mode moved to lua/config/theme.lua
local enableAutoLightDarkMode = true
local bg = "dark"

if enableAutoLightDarkMode then
	local theme = require("config.theme")
	bg = theme.get_system_theme() or "dark"
end

vim.cmd("set background=" .. bg)
