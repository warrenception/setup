return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")

      local function open_in_editor()
        local entry = oil.get_cursor_entry()
        if entry and entry.type == "file" then
          local filepath = oil.get_current_dir() .. entry.name
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "oil" then
              vim.api.nvim_set_current_win(win)
              vim.cmd("edit " .. vim.fn.fnameescape(filepath))
              return
            end
          end
        end
        oil.select()
      end

      local function toggle_sidebar()
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "oil" then
            vim.api.nvim_win_close(win, true)
            return
          end
        end
        vim.cmd("vsplit | wincmd H | vertical resize 35")
        oil.open()
      end

      oil.setup({
        columns = { "icon" },
        view_options = { show_hidden = true },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<CR>"] = { callback = open_in_editor, desc = "Open in editor" },
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<D-b>", toggle_sidebar, { desc = "Toggle file browser" })
    end,
  },
}
