-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({ "git", "clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath
	})

	if vim.v.shell_error ~= 0 then
		local errmsg = {
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}

		vim.api.nvim_echo(errmsg, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "habamax" } },
	checker = {
		enabled = false,
		notify = false,
	},
	change_detection = {
		enabled = false,
		notify = false,
	},
})
