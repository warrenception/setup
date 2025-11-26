return {
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<A-g>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<A-G>", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "File history" },
    },
  },
}
