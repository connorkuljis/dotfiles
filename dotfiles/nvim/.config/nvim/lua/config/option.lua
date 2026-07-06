-- Use 2 spaces for indentation (house style; matches .stylua.toml)
vim.opt.expandtab = true

-- Disable smart indent (use treesitter indent)
vim.opt.smartindent = false

-- Set tab width to 2 spaces
vim.opt.tabstop = 2

-- Set shift width to 2 spaces
vim.opt.shiftwidth = 2

-- Set soft tab to 2 spaces too
vim.opt.softtabstop = 2

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "longest:list,full"

-- Enable persistent undo
vim.o.undofile = true
local undo_dir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undo_dir, "p")
vim.opt.undodir = undo_dir .. "//"

-- Show indent markers
vim.o.list = true
