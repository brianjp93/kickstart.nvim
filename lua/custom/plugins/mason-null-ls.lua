return {
  'jay-babu/mason-null-ls.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup {
      ensure_installed = { "djlint" },
    }
    require("null-ls").setup {
      sources = {
        require('null-ls').builtins.formatting.djlint.with({
          extra_args = { "--reformat" },
          filetypes = { "htmldjango" },
        })
      }
    }
  end,
}
