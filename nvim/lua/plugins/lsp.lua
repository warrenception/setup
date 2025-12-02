return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Solidity config (ts_ls is already defined by nvim-lspconfig)
      vim.lsp.config("solidity_ls", {
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_markers = { "hardhat.config.js", "hardhat.config.ts", "foundry.toml", ".git" },
      })

      -- Zig LSP
      vim.lsp.config("zls", {
        cmd = { "zls" },
        filetypes = { "zig", "zon" },
        root_markers = { "build.zig", "build.zig.zon", ".git" },
      })

      -- Lua LSP for nvim config editing
      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", "stylua.toml", ".git" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Enable servers
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("solidity_ls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("zls")

      -- Keymaps (only when LSP attaches)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "Go to references")
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")

          -- Smart rename: LSP rename if on symbol, otherwise text substitution
          map("<leader>rn", function()
            local params = vim.lsp.util.make_position_params()
            local result = vim.lsp.buf_request_sync(0, "textDocument/definition", params, 1000)
            local has_definition = false
            for _, res in pairs(result or {}) do
              if res.result and #res.result > 0 then
                has_definition = true
                break
              end
            end
            if has_definition then
              vim.lsp.buf.rename()
            else
              local word = vim.fn.expand("<cword>")
              vim.ui.input({ prompt = "Replace '" .. word .. "' with: " }, function(new_word)
                if new_word and new_word ~= "" then
                  vim.cmd("%s/\\<" .. vim.fn.escape(word, "/\\") .. "\\>/" .. vim.fn.escape(new_word, "/\\") .. "/g")
                  vim.notify("Replaced '" .. word .. "' with '" .. new_word .. "'")
                end
              end)
            end
          end, "Smart rename")
          map("<leader>e", vim.diagnostic.open_float, "Show error")
          map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
        end,
      })
    end,
  },
}
