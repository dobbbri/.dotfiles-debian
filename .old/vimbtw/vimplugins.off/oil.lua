vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/benomahony/oil-git.nvim" },
})

local ignore_files = {
  ".DS_Store",
  ".git",
  ".astro",
  ".vscode",
  ".gitignore",
  -- "dist",
  "lazy-lock.json",
  "package-lock.json",
  "node_modules",
  "pnpm-lock.yaml",
}

local oil = require("oil")

oil.setup({
  columns = { "icon" },
  keymaps = {
    ["<C-l>"] = false,
    ["<C-k>"] = false,
    ["<C-j>"] = false,
    ["<M-h>"] = "actions.select_split",
    -- ["q"] = { "actions.close", mode = "n" },
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<Esc>"] = "actions.close",
  },
  float = {
    max_width = 0.4,
    max_height = 0.8,
    border = "single",
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _) return vim.tbl_contains(ignore_files, name) end,
  },
  skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "-", oil.toggle_float, { desc = "Show File Manager" })
vim.keymap.set("n", "=", ":w<CR>", { desc = "Save Oil changes" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil", -- Adjust if Oil uses a specific file type identifier
  callback = function() vim.opt_local.cursorline = true end,
})
