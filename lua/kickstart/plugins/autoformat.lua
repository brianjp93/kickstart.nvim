-- autoformat.lua
--
-- Format with conform.nvim. External formatter CLIs are installed with Mason,
-- while Conform handles selecting/running them and falling back to LSP formatting.

local format_is_enabled = false -- Disabled by default. Toggle with :KickstartFormatToggle.

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        'djlint',
        'pgformatter',
        'prettier',
        'stylua',
      },
      integrations = {
        ['mason-lspconfig'] = false,
        ['mason-null-ls'] = false,
        ['mason-nvim-dap'] = false,
      },
    },
  },

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>p',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = { 'n', 'v' },
        desc = 'Format current buffer',
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      vim.api.nvim_create_user_command('KickstartFormatToggle', function()
        format_is_enabled = not format_is_enabled
        print('Setting autoformatting to: ' .. tostring(format_is_enabled))
      end, { desc = 'Toggle format on save' })
    end,
    opts = {
      notify_on_error = false,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      format_on_save = function(bufnr)
        if not format_is_enabled then
          return nil
        end

        return {
          bufnr = bufnr,
          timeout_ms = 1000,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },

        htmldjango = { 'djlint' },

        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        vue = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        less = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        handlebars = { 'prettier' },

        sql = { 'pg_format' },
        pgsql = { 'pg_format' },
        plsql = { 'pg_format' },
      },
    },
  },
}
