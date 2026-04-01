-- {
--   "lukas-reineke/indent-blankline.nvim",
--   main = "ibl",
--   opts = require("plugins.configs.indentblankline"),
-- },

return {
  indent = { char = "│" },
  exclude = {
    filetypes = { "tex", "plaintex", "markdown" },
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    priority = 500,
  },
}
