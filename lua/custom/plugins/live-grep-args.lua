vim.keymap.set("n", "<leader>f", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

return {
  "nvim-telescope/telescope-live-grep-args.nvim",
}
