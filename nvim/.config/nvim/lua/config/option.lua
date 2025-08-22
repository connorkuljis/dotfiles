-- Use tabs instead of spaces
vim.opt.expandtab = false

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
vim.o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"

-- Show indent markers
vim.o.list = true
