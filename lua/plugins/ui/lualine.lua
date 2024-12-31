return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")

		local colors = {
			bg = "#34343b",
			fg = "#7b7b7b",
			white = "#EFEFEF",
			mbg = "#3D255E",
			yellow = "#ff6300",
			cyan = "#477bde",
			darkblue = "#081633",
			green = "#86dd7f",
			orange = "#ffb684",
			violet = "#c678dd",
			magenta = "#c678dd",
			blue = "#5f96ca",
			red = "#ff0000",
			grey = "#3e3d50",
			lsp = "#97ff8f",
			diff_green = "#98be65",
			diff_orange = "#ff8800",
			diff_red = "#ec5f67",
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			hide_lsp_diagnostics = function()
				return vim.o.columns > 140
			end,
			hide_diff = function()
				return vim.o.columns > 120
			end,
			hide_line_col = function()
				return vim.o.columns > 140
			end,
			hide_cwd = function()
				return vim.o.columns > 80
			end,
			hide_filetype = function()
				return vim.o.columns > 120
			end,
		}

		local color_cond = function()
			local buf = vim.api.nvim_get_current_buf()
			local modified = vim.bo[buf].modified
			if modified then
				return { fg = colors.red, gui = "bold,italic" }
			end
			return { fb = colors.fg }
		end

		local config = {
			options = {
				refresh = {
					statusline = 500,
				},
                globalstatus = true,
				component_separators = "",
				section_separators = "",
				theme = "auto",
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"mode",
						color = { fg = colors.white, gui = "bold" },
					},
					-- {
					-- 	"branch",
					-- 	icon = "",
					-- 	color = { fg = colors.magenta },
					-- },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
						colored = true,
					},
					{
						"filetype",
						icon_only = true,
						colored = false,
						color = color_cond,
						padding = { left = 1, right = 0 },
					},
					{
						"filename",
						symbols = {
							modified = "",
							readonly = "[readonly]",
							unnamed = "**scratch**",
							newfile = "[New]",
						},
						cond = conditions.buffer_not_empty,
						color = color_cond,
						fmt = function(str)
							local ft = vim.bo.filetype
							if ft == "neo-tree" then
								return "neo-tree"
							end

							local buf = vim.api.nvim_get_current_buf()
							local modified = vim.bo[buf].modified
							if modified then
								return "*" .. str:gsub("^%s*(.-)%s*$", "%1") .. "*"
							end
							return str
						end,
						padding = { left = 0, right = 1 },
					},
					{ "searchcount" },
				},
				lualine_x = {
					{
						"diff",
						colored = true,
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							added = { fg = colors.diff_green },
							modified = { fg = colors.diff_orange },
							removed = { fg = colors.diff_red },
						},
						cond = conditions.hide_diff,
					},
					{
						function()
							local ft = vim.bo.filetype
							if ft == "neo-tree" then
								return ""
							end
							if ft ~= "" then
								return "󰅩 " .. vim.bo.filetype
							end
							return ""
						end,
						cond = conditions.hide_filetype,
						color = { fg = colors.fg },
					},
					{
						function()
							local msg = "No LSP"
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								if client.name ~= "null-ls" and client.name ~= "copilot" then
									return "󰄭 " .. client.name
								end
							end
							return msg
						end,
						color = { fg = colors.lsp },
					},
					{
						"progress",
						color = { fg = colors.fg },
					},
					{
						"location",
						padding = { left = 0, right = 1 },
						color = { fg = colors.fg },
						cond = conditions.hide_line_col,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		lualine.setup(config)
	end,
}
