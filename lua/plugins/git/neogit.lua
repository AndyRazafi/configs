return {
	"NeogitOrg/neogit",
	dependencies = {
		"plenary.nvim", -- required
		"diffview.nvim", -- optional
		"telescope.nvim", -- optional
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
			"<cmd> DiffviewOpen <cr>",
			desc = "Open diffview",
		},
		{
			"<leader>gD",
			"<cmd> DiffviewClose <cr>",
			desc = "Close diffview",
		},
	},
}
