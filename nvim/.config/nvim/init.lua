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

-- Automatic light/dark mode.
local enableAutoLightDarkMode = true
local bg = "dark"

if enableAutoLightDarkMode then
	local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
	if not handle then
		error("cannot get gnome interface color theme")
		return
	end

	local result = handle:read("*a")
	handle:close()

	-- trim whitespace/newlines
	result = result:gsub("%s+", "")

	-- trim single quotes
	result = result:gsub("'", "")

	local themes = {
		["prefer-dark"] = "dark",
		["default"]     = "light",
		["auto"]        = "light", -- some GNOME versions
	}

	bg = themes[result]
end

vim.cmd("set background=" .. bg)
