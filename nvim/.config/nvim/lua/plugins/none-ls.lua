return {

  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.formatting.pyink,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.formatting.tidy,
        null_ls.builtins.diagnostics.tidy,
        --null_ls.builtins.formatting.prettier,
        --null_ls.builtins.diagnostics.erb_lint,
        --null_ls.builtins.diagnostics.rubocop,
        --null_ls.builtins.formatting.rubocop,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
