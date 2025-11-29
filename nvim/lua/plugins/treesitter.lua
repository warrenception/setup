return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "typescript",
        "tsx",
        "javascript",
        "solidity",
        "lua",
        "json",
        "yaml",
        "markdown",
        "bash",
        "zig",
        "toml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
