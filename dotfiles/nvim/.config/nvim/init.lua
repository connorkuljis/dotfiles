-- init.lua

-- Source .vimrc for shared Vimscript configuration
vim.cmd("source ~/.vimrc")

-- Load keymap configurations before loading plugins from lazy.
require("config.keymap")

-- https://lazy.folke.io/instalation
require("config.lazy")

-- Load options configuration for my user preferences
require("config.option")

-- Load autocommands
require("config.autocommand")

-- Colorscheme is set by the onedark.nvim plugin (see lua/plugins/themes.lua)

-- Setup auto color scheme with default options
require("custom.auto_color_scheme").setup({
  enabled = false,
  auto_set_background = true,
  fallback_theme = "dark",
})

require("custom.radio_chatter").setup({
  enabled = false,
  backend = "auto",
})
