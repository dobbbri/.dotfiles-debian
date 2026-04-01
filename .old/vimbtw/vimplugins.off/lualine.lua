return {
  "nvim-lualine/lualine.nvim",
  dependencies = "meuter/lualine-so-fancy.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        globalstatus = true,
        always_show_tabline = true,
        theme = require("plugins.configs.colorschemes.lualine.fgcolors"),
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { { "fancy_mode" } },
        lualine_b = { { "fancy_branch" }, { "fancy_diff" } },
        lualine_c = { { "fancy_cwd", substitute_home = true } },
        lualine_x = { { "fancy_diagnostics" } },
        lualine_y = { { "fancy_searchcount" }, { "fancy_lsp_servers" } },
        lualine_z = {
          { require("lazy.status").updates, cond = require("lazy.status").has_updates },
          { "fancy_location" },
        },
      },
      tabline = {
        lualine_a = { { "buffers", use_mode_colors = true, symbols = { alternate_file = "" } } },
        lualine_z = { "fileformat" },
      },
      extensions = { "lazy", "mason", "man" },
    })
  end,
}
