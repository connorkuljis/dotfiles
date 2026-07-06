-- plugins/treesitter.lua

local treesitter = {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    opts = {
      ensure_installed = { "lua", "go", "html", "rust", "css", "python" },
    },
  },
}

return treesitter
