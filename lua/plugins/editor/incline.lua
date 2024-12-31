return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	opts = {
		window = { margin = { vertical = 0, horizontal = 0 } },
		hide = { cursorline = true },
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

			local icon = require("nvim-web-devicons").get_icon_color(filename)
			local modified = vim.bo[props.buf].modified
			local function get_branch()
				require("lualine.components.branch.git_branch").init()
				local branch = require("lualine.components.branch.git_branch").get_branch()
				return props.focused and branch ~= nil and branch ~= "" and { " ", { branch, gui = "italic" }, " " } or { "" }
			end

			return {
				{ get_branch() },
				{ modified and { icon, guifg = "#FF0000" } or icon },
				{ " " },
				{ modified and { filename, guifg = "#FF0000", gui = "bold,italic" } or filename },
			}
		end,
	},
}
