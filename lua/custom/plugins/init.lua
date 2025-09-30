-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- type j-k to go to normal mode while in insert mode or terminal mode.
vim.keymap.set('i', 'jk', '<esc>', { silent = true })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { silent= true, noremap = true })

-- tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<cr>', { silent = true })
vim.keymap.set('n', '<leader>tl', ':tabm +1<cr>', { silent = true })
vim.keymap.set('n', '<leader>th', ':tabm -1<cr>', { silent = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<cr>', { silent = true })

-- git
vim.keymap.set('n', '<leader>gs', ':Git<cr>', { silent = true })
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>', { silent = true })
vim.keymap.set('n', '<leader>gl', ':Git log<cr>', { silent = true })

-- windows
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true, noremap = true })
vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true, noremap = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true, noremap = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true, noremap = true })

-- general mappings
vim.keymap.set('n', '<c-p>', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>,', ':noh<cr>', { desc = 'Turn off search highlighting.', silent = true })

-- quickfix
vim.keymap.set('n', ']q', ':cn<cr>', { silent = true, desc = 'Next Quickfix' })
vim.keymap.set('n', '[q', ':cp<cr>', { silent = true, desc = 'Prev Quickfix' })

vim.keymap.set({'v', 'n'}, 'L', '$', { noremap = true })
vim.keymap.set({'v', 'n'}, 'H', '^', { noremap = true })

-- Global format binding that will be overridden by filetype-specific ones
vim.keymap.set('n', '<leader>p', function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, desc = "Format current buffer" })

vim.api.nvim_create_augroup("JSSettings", { clear = true })

-- Use vim.lsp.buf.format for JS/TS files instead of direct shell command to prettier
-- This will use null-ls's prettier formatter which respects .prettierrc
vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.js", "*.ts", "*.tsx", "*.jsx" },
  group = "JSSettings",
  callback = function()
    vim.keymap.set("n", "<leader>p", function()
      vim.lsp.buf.format({ async = true })
    end, { silent = true, buffer = true, desc = "Format using LSP" })
  end,
})

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

return {
  {
    "sainnhe/forest-night",
    config = function()
      vim.cmd.colorscheme 'everforest'
    end,
  },
}
