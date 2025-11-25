local map = vim.keymap.set

-- Escape
map("i", "jk", "<Esc>")

-- Split navigation (Option+hjkl)
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", { silent = true })
map("n", "<S-Tab>", ":bprev<CR>", { silent = true })

-- Close split (Option+w), close buffer (Option+Shift+w)
map("n", "<A-w>", ":close<CR>", { silent = true })
map("n", "<A-S-w>", ":bd!<CR>", { silent = true })

-- Splits (Option+- horizontal, Option+o vertical)
map("n", "<A-->", ":split<CR>", { silent = true })
map("n", "<A-o>", ":vsplit<CR>", { silent = true })

-- Reselect after indent
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- Search and replace in file (Option+r)
map("n", "<A-r>", ":%s/<C-r><C-w>//gc<Left><Left><Left>", { desc = "Replace word under cursor" })

-- Search and replace in repo (Option+Shift+r)
-- Greps word, puts in quickfix, then prompts for replacement
map("n", "<A-S-r>", function()
  local word = vim.fn.expand("<cword>")
  vim.cmd("silent grep! " .. word)
  vim.cmd("copen")
  vim.ui.input({ prompt = "Replace '" .. word .. "' with: " }, function(replacement)
    if replacement then
      vim.cmd("cclose")
      vim.cmd("cdo s/" .. word .. "/" .. replacement .. "/g | update")
      vim.notify("Replaced '" .. word .. "' with '" .. replacement .. "' across repo")
    end
  end)
end, { desc = "Replace word across repo" })

-- Half-page scroll centered (Option+d/u)
map("n", "<A-d>", "<C-d>zz")
map("n", "<A-u>", "<C-u>zz")

-- Terminal toggle (Option+n) - single persistent terminal
vim.g.term_buf = nil
vim.g.term_win = nil

local function toggle_terminal()
  if vim.g.term_win and vim.api.nvim_win_is_valid(vim.g.term_win) then
    vim.api.nvim_win_hide(vim.g.term_win)
    vim.g.term_win = nil
  else
    if vim.g.term_buf and vim.api.nvim_buf_is_valid(vim.g.term_buf) then
      vim.cmd("botright split")
      vim.cmd("resize 15")
      vim.api.nvim_win_set_buf(0, vim.g.term_buf)
      vim.g.term_win = vim.api.nvim_get_current_win()
    else
      vim.cmd("botright split | resize 15 | terminal")
      vim.g.term_buf = vim.api.nvim_get_current_buf()
      vim.g.term_win = vim.api.nvim_get_current_win()
    end
    vim.cmd("startinsert")
  end
end

map("n", "<A-n>", toggle_terminal, { silent = true })
map("t", "<A-n>", "<C-\\><C-n>:lua vim.api.nvim_win_hide(vim.g.term_win); vim.g.term_win = nil<CR>", { silent = true })

-- Terminal navigation
map("t", "<A-h>", "<C-\\><C-n><C-w>h")
map("t", "<A-j>", "<C-\\><C-n><C-w>j")
map("t", "<A-k>", "<C-\\><C-n><C-w>k")
map("t", "<A-l>", "<C-\\><C-n><C-w>l")
map("t", "jk", "<C-\\><C-n>")
