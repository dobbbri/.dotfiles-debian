-- {
--   "akinsho/bufferline.nvim",
--   event = "BufReadPre",
--   opts = require("plugins.configs.bufferline"),
-- },

return {
  options = {
    style_preset = 4, -- {default = 1,minimal = 2,no_bold = 3,no_italic = 4}
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    show_close_icon = false,
    show_buffer_icons = false,
    indicator = {
      icon = "", -- this should be omitted if indicator style is not 'icon'
      style = "slant",
    },
    -- offsets = {
    --   { filetype = "NvimTree", highlight = "NvimTreeNormal" },
    -- },
  },
}
