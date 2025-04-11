return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd" },
				css = { "prettierd" },
				jsonc = { "prettierd" },
				json = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				markdown = { "prettierd" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
			notify_on_error = true,
			notify_no_formatters = true,
			formatters = {
				prettierd = {
					inherit = true,
					append_args = { "--use-tabs" },
				},
			},
		})
	end,
	keys = {
		{
			"<leader>=",
			function()
				require("conform").format({ lsp_format = "fallback" })
			end,
			desc = "Format file",
		},
	},
}
