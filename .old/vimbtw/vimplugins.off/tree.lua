return {
  view = { width = 40 },
  actions = { open_file = { quit_on_open = true } },
  filters = {
    git_ignored = true,
    dotfiles = false,
    custom = {"dist", "lazy-lock.json", "package-lock.json", "node_modules", ".DS_Store" },
  },
  git ={
    enable = true,
    ignore = true,
    timeout = 400,
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "󰓎",
          deleted = "󰍴",
          ignored = "◌",
        },
      },
    },
  },
}


  -- { "nvim-tree/nvim-tree.lua", opts = require("plugins.configs.tree") },
