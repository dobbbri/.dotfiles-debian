vim.pack.add({ "https://github.com/gaelph/logsitter.nvim" }, { confirm = false })

local logss = require("logsitter")

logss.setup({
  path_format = "fileonly",
  prefix = "[Log]->",
  separator = "->",
})

vim.keymap.set("n", "<leader>l", function() logss.log() end, { desc = "Logsitter: log current" })
