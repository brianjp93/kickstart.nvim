vim.keymap.set("i", "<A-i>", '<esc>:call emmet#expandAbbr(3, "")<CR>i', { silent = true, noremap = true })
vim.keymap.set("n", "<A-i>", ':call emmet#expandAbbr(3, "")<CR>', { silent = true, noremap = true })

return {
  "mattn/emmet-vim",
}
