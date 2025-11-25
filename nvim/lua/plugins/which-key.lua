return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 300,
      icons = {
        mappings = false,
      },
      spec = {
        { "<leader>c", group = "code" },
        { "<leader>r", group = "rename/recent" },
        { "<leader>b", desc = "buffers" },
        { "<leader>e", desc = "show error" },
        { "<leader>f", desc = "format" },
      },
    },
  },
}
