return {
  'jay-babu/mason-null-ls.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup {
      ensure_installed = { "djlint", "prettier" },
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
      },
      -- Set up debug logging if you need to troubleshoot
      -- debug = true,
    }
  end,
}
