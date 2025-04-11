return {
	"kylechui/nvim-surround",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "gsa",
				normal_cur = "gss",
				visual = "gSv",
				delete = "gsd",
				change = "gsc",
			},
		})
	end,
}
