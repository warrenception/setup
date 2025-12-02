local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"  -- Always reserve space, prevents layout shift
opt.winborder = "rounded"  -- Rounded borders on floating windows
opt.cursorline = true
opt.scrolloff = 8

-- Diagnostics (signs + underline, no inline text)
vim.diagnostic.config({
  signs = true,
  virtual_text = false,
  underline = true,
})

-- Behavior
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300

-- Disable swap (undo file is enough)
opt.swapfile = false

-- Use ripgrep for :grep (respects .gitignore)
opt.grepprg = "rg --vimgrep --smart-case"
opt.grepformat = "%f:%l:%c:%m"

-- Autosave when leaving buffer or losing focus
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})

-- Force filetype detection and treesitter highlight
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function(args)
    vim.schedule(function()
      if vim.bo[args.buf].filetype == "" then
        vim.cmd("filetype detect")
      end
      -- Force treesitter highlight
      local ok, _ = pcall(vim.treesitter.start, args.buf)
      if not ok then
        pcall(vim.treesitter.start, args.buf, vim.bo[args.buf].filetype)
      end
    end)
  end,
})

-- Auto-close quickfix after selecting an item
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = true, silent = true })
  end,
})


