return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",
			numbers = "none",
			-- numbers = function(opts)
			-- 	return string.format("%s", opts.ordinal)
			-- end,
			diagnostics = false,
			always_show_bufferline = false,
			show_duplicate_prefix = true,
			indicator = {
				icon = "▎",
				style = "icon",
			},
			buffer_close_icon = "󰅖",
			show_close_icon = false,
			show_buffer_close_icons = true,
			show_buffer_icons = false,
			tab_size = 12,
			custom_filter = function(buf_number, buf_numbers)
				if vim.bo[buf_number].filetype ~= "neo-tree" then
					return true
				end
				if vim.fn.bufname(buf_number) ~= "." then
					return true
				end
			end,
			pick = {
				alphabet = "1234567890",
			},
		},
	},
}
