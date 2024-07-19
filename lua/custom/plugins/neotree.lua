-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true })
vim.keymap.set("n", "<space>nn", ":Neotree reveal_file=%<CR>", { silent = true, desc = 'Reveal current file in Neotree.' })

require('which-key').add {
  { "<leader>n", group = "[N]eotree" },
  { "<leader>n_", hidden = true },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
}
