-- Use tabs instead of spaces
vim.opt.expandtab = false

-- Disable smart indent (use treesitter indent)
vim.opt.smartindent = false

-- Set tab width to 4 spaces
vim.opt.tabstop = 4

-- Set shift width to 4 spaces
vim.opt.shiftwidth = 4

-- Set soft tab to be 4 spaces too, since we are using tabs for indenting
vim.opt.softtabstop = 4

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
