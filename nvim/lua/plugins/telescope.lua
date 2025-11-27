return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          ".next/",
          ".nuxt/",
          ".turbo/",
          ".parcel-cache/",
          "dist/",
          "build/",
          "coverage/",
          "__pycache__/",
          ".venv/",
          "%.pyc",
          ".cache/",
          ".DS_Store",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = { "--hidden" },
        },
      },
    },
  },
}
