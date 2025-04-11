return {
	"b0o/incline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		window = { margin = { vertical = 0, horizontal = 0 } },
		hide = { cursorline = true },
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

			local icon = require("nvim-web-devicons").get_icon_color(filename)
			local modified = vim.bo[props.buf].modified

			if props.focused == true then
				return {
					{ "󰁔 " },
					{ modified and { icon, guifg = "#FF0000" } or icon },
					{ " " },
					{
						modified and { filename, guifg = "#FF0000", gui = "bold,italic,undercurl" } or filename,
					},
				}
			else
				return {
					{ modified and { icon, guifg = "#FF0000" } or icon },
					{ " " },
					{
						modified and { filename, guifg = "#FF0000", gui = "bold,italic,undercurl" } or filename,
					},
				}
			end
		end,
	},
}
