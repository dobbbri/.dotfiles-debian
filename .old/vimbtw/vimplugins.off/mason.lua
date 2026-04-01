vim.pack.add({ 
  "https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
}, { confirm = false })

require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
    "astro-language-server",
    "bash-language-server",
    "json-lsp",
    "prettier",
    "shfmt",
    "stylua",
    "taplo",
    "biome",
    "tailwindcss-language-server",
    "lua-language-server",
    "typescript-language-server",
    "yamlfmt"
	},
})

-- vim.api.nvim_create_user_command(
--   "InstallThirdPartyTools",
--   function()
--     vim.cmd(
--       "MasonInstall "
--         .. "astro-language-server bash-language-server json-lsp biome prettier shfmt stylua taplo biome"
--         .. " tailwindcss-language-server lua-language-server typescript-language-server yamlfmt"
--     )
--   end,
--   {}
-- )
