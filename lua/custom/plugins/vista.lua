vim.keymap.set({'n', 'v'}, "<leader>l", ":Vista!!<cr>", { silent = true, noremap = true })
vim.g.vista_default_executive = 'nvim_lsp'

return {
  "liuchengxu/vista.vim",
}
