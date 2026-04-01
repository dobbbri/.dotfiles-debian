vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/coffebar/neovim-project",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/Shatur/neovim-session-manager",
}, { confirm = false })

require("neovim-project").setup({
  projects = { -- define project roots
    "~/Sites/*",
    "~/Dev/*",
  },
  picker = {
    type = "fzf-lua",
  },
})
