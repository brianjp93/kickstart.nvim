-- run python file with leader b
vim.keymap.set('n', '<leader>b', ':!python %<CR>', { noremap = true, silent = false, buffer = true })
