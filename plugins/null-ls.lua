local null_ls = require("null-ls")
null_ls.setup({ debug = true })

return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.clang_format.with({
        extra_args = { "-style='/home/alan/.clang-format'" },
      }),

      null_ls.builtins.formatting.uncrustify.with({
        filetypes = { "dsaodsapm" }
      }),

      null_ls.builtins.formatting.astyle.with({
        filetypes = { "dsaodsapm" }
      })
    }
    return config -- return final config table
  end,
}
