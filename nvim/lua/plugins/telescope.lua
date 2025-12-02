return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<D-S-p>", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find files (hidden)" },
      { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        file_ignore_patterns = {
          ".git/",
          ".next/",
          ".nuxt/",
          ".turbo/",
          ".parcel-cache/",
          ".cache/",
          ".DS_Store",
        },
      },
      pickers = {
        live_grep = {
          additional_args = { "--hidden" },
        },
      },
    },
  },
}
