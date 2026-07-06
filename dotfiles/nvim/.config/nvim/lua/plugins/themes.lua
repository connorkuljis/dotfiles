-- plugins/appearance.lua

local appearance = {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      local ok = pcall(vim.cmd.colorscheme, "onedark")
      if not ok then
        vim.notify("colorscheme 'onedark' not found", vim.log.levels.WARN)
      end
    end,
    enabled = true,
  },
  {
    "maxmx03/solarized.nvim",
    priority = 1000,
    enabled = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    enabled = true,
  },
  {
    "marko-cerovac/material.nvim",
    priority = 1000,
    enabled = true,
  },
}

return appearance
