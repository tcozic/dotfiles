return {
{
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
},
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = { "lua_ls", "rust_analyzer" },
    },
  },
    {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Configure LSP servers using the new API
        vim.lsp.config('ts_ls', {
          capabilities = capabilities
        })
        
        vim.lsp.config('solargraph', {
          capabilities = capabilities
        })
        
        vim.lsp.config('html', {
          capabilities = capabilities
        })
        
        vim.lsp.config('lua_ls', {
          capabilities = capabilities
        })

        -- Enable LSP servers (they will activate based on filetypes)
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('solargraph')
        vim.lsp.enable('html')
        vim.lsp.enable('lua_ls')
      
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {})
    end,
  },
}
