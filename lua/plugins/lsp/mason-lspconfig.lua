return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = { "mason.nvim" },
	config = function()
		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup({
			ensure_installed = { "vtsls" },
		})
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({})
			end,
		})

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
					},
				},
			},
		})

		lspconfig.vtsls.setup({
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		})
	end,
}
