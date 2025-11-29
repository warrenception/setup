return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<D-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
    },
    opts = {
      view = {
        width = 35,
        number = false,
        relativenumber = false,
      },
      renderer = {
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
    },
  },
}
