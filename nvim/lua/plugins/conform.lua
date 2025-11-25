return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
      { "<leader>f", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        solidity = { "forge_fmt" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
      formatters = {
        forge_fmt = {
          command = "forge",
          args = { "fmt", "--raw", "-" },
          stdin = true,
        },
      },
    },
  },
}
