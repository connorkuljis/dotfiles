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

-- Setup auto color scheme with default options
require("custom.auto_color_scheme").setup({
	enabled = true,
	auto_set_background = true,
	fallback_theme = "dark",
})

require("custom.radio_chatter").setup({
	enabled = true,
	backend = "auto",
})
