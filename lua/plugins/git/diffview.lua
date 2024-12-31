return {
	"sindrets/diffview.nvim",
	lazy = true,
	config = function()
		local actions = require("diffview.actions")
		require("diffview").setup({
			keymaps = {
				disable_default = true,
				file_panel = {
					{ "n", "<down>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
					{ "n", "<up>", actions.select_prev_entry, { desc = "Open the diff for the next file" } },
				},
			},
		})
	end,
}
