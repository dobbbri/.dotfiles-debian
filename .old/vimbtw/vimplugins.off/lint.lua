vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint" },
})

local lint = require("lint")

lint.linters_by_ft = {
  astro = { "biomejs" },
  javascript = { "biomejs" },
  typescript = { "biomejs" },
  javascriptreact = { "biomejs" },
  typescriptreact = { "biomejs" },
  css = { "biomejs" },
  html = { "biomejs" },
  json = { "biomejs" },
  jsonc = { "biomejs" },
  -- lua = { "luacheck" },
  -- vue = { "biomejs" },
  -- svelte = { "biomejs" },
}

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function() require("lint").try_lint() end,
-- })

-- vim.api.nvim_create_user_command("Lint", function() lint.try_lint() end, {})

vim.keymap.set({ "n", "v" }, "l", function() lint.try_lint() end, { desc = "Lint file" })
