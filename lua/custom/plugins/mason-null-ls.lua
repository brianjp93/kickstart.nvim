return {
  'jay-babu/mason-null-ls.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup {
      ensure_installed = { "djlint", "prettier", "pgformatter" },
    }
    require("null-ls").setup {
      sources = {
        -- HTML Django formatting
        require('null-ls').builtins.formatting.djlint.with({
          extra_args = { "--reformat" },
          filetypes = { "htmldjango" },
        }),
        -- Prettier for JS/TS files - will automatically detect .prettierrc
        require('null-ls').builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "graphql",
            "handlebars"
          },
        }),
        -- SQL formatting with pgformatter
        require('null-ls').builtins.formatting.pg_format.with({
          filetypes = { "sql", "pgsql", "plsql" },
        }),
      },
      -- Set up debug logging if you need to troubleshoot
      -- debug = true,
    }
  end,
}
