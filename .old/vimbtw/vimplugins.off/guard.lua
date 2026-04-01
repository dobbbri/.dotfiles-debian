return {
  "nvimdev/guard.nvim",
  dependencies = { "nvimdev/guard-collection" },
  config = function()
    local ft = require("guard.filetype")
    ft("astro,typescript,javascript,javascriptreact,typescriptreact"):fmt("prettier")
    ft("xml,css,scss,html,yaml,json,jsonc,markdown"):fmt("prettier")
    ft("lua"):fmt("stylua")
    ft("sh"):fmt("shfmt")

    vim.g.guard_config = {
      fmt_on_save = false,
      lsp_as_default_formatter = true,
    }
  end,
}
