return {
  {
  "mason-org/mason.nvim",
  -- Tell lazy to use your fork
  url = "https://github.com/tcozic/mason.nvim.git",
  
  -- Optional, but good practice if you made the change
  -- on a branch other than "main"
  -- branch = "your-fix-branch-name", 
  
  config = function()
    require("mason").setup()
  end
},
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "cmakels", -- This is the correct lspconfig name
        "pyright", -- For Python
        "lemminx", -- For XML
        "html",
      },
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

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("solargraph", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      
      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("cmakels", {
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("lemminx", {
        capabilities = capabilities,
      })
        -- Enable LSP servers (they will activate based on filetypes)
      -- Enable LSP servers (they will activate based on filetypes)
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("solargraph")
      vim.lsp.enable("html")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      
      -- === ADDED FOR ROS2 ===
      vim.lsp.enable("pyright")
      vim.lsp.enable("cmakels")
      vim.lsp.enable("lemminx")
      -- ======================
      --
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {})
    end,
  },
}
