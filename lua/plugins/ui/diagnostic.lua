return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	config = function()
		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰛩 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})
		require("tiny-inline-diagnostic").setup({
			signs = {
				left = "",
				right = "",
				diag = "●",
				arrow = "",
				up_arrow = "",
				vertical = "",
				vertical_end = "",
			},
		})
	end,
}
