return {
  "jay-babu/mason-null-ls.nvim",

  dependencies = {
    -- This correctly points to your fork
    "tcozic/mason.nvim",
    "nvimtools/none-ls.nvim",
  },

  config = function()
    local mnl = require("mason-null-ls")
    local nls = require("null-ls") -- Get the none-ls module

    -- This is your list of tools, but with the correct Mason names
    local sources_to_install = {
      -- lua
      "stylua",
      "selene",
      -- c/c++
      "clang_format",
      "cpplint", -- Using the one you requested
      -- cmake
      "cmakelang", -- Mason name for cmake_format
      "cmakelint",
      -- python
      "black", -- Using black (already installed)
      "isort", -- Using isort (already installed)
      "pylint", -- Already installed
      -- html/xml
      "xmlformatter", -- Using the one you requested
    }
  mnl.setup({
      ensure_installed = sources_to_install,
      automatic_installation = true,
      automatic_setup = false, -- We are doing manual setup below
    })

    -- 3. Setup none-ls MANUALLY with the correct source objects
    nls.setup({
      -- This is the list of *source objects*, not strings
      sources = {
        -- Lua
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.selene,

        -- C/C++
        nls.builtins.formatting.clang_format,
        nls.builtins.diagnostics.cpplint,

        -- CMake
        nls.builtins.formatting.cmake_format, -- This builtin uses the 'cmakelang' package
        nls.builtins.diagnostics.cmake_lint,  -- This builtin uses the 'cmake-lint' package

        -- Python
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
        nls.builtins.diagnostics.pylint,
        -- XML
        nls.builtins.formatting.xmlformatter,
      },

      -- This is the correct place for your on_attach keymap
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {
            buffer = bufnr,
            desc = "[LSP] Format buffer",
          })
        end
      end,
    })
  end,
}
