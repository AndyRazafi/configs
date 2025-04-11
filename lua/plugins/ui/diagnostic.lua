return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = { "BufReadPre", "BufNewFile" },
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "powerline",
		})

		vim.diagnostic.config({ virtual_text = false })

		local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰛩 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
