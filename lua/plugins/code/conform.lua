return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			html = { "prettierd" },
			javascript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			typescript = { "prettierd" },
			markdown = { "prettierd" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		notify_on_error = true,
		notify_no_formatters = true,
		formatters = {
			prettierd = {
				inherit = true,
				append_args = { "--use-tabs" },
			},
		},
	},
	keys = {
		{
			"<leader>=",
			function()
				require("conform").format({ lsp_format = "first" })
			end,
			desc = "Format file",
		},
	},
}
