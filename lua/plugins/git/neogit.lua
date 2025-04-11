return {
	"NeogitOrg/neogit",
	dependencies = {
		"plenary.nvim", -- required
		"diffview.nvim", -- optional
	},
	config = true,
	keys = {
		{
			"<leader>gg",
			function()
				require("neogit").open({ kind = "replace" })
			end,
			desc = "Neogit",
		},
		{
			"<leader>gd",
			":DiffviewOpen <CR>",
			desc = "Open diffview",
		},
		{
			"<leader>gD",
			":DiffviewClose <CR>",
			desc = "Close diffview",
		},
	},
}
