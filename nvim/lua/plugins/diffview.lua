return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<A-g>", "<cmd>DiffviewOpen<cr>", desc = "Git diff all files" },
      { "<A-G>", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    },
  },
}
