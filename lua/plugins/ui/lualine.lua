return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")

		local colors = {
			bg = "#34343b",
			fg = "#7b7b7b",
			white = "#efefef",
			mbg = "#3d255e",
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
			hide_branch = function()
				return vim.o.columns > 140
			end,
		}

		local filetype = function()
			local ft = vim.bo.filetype
			local prefix = "󰅩 "
			if ft == "neo-tree" then
				return ""
			end
			if ft == "typescript" then
				return prefix .. "ts"
			end
			if ft == "javascript" then
				return prefix .. "js"
			end
			if ft == "typescriptreact" then
				return prefix .. "tsx"
			end
			if ft == "javascriptreact" then
				return prefix .. "jsx"
			end
			if ft ~= "" then
				return prefix .. vim.bo.filetype
			end
			return ""
		end

		local copilot = function()
			local clients = vim.lsp.get_clients()
			if next(clients) == nil then
				return ""
			end
			for _, client in ipairs(clients) do
				if client.name == "GitHub Copilot" then
					return " "
				end
			end
			return ""
		end

		local lsp = function()
			local clients = vim.lsp.get_clients()
			if next(clients) == nil then
				return ""
			end
			if #clients > 1 then
				for _, _ in ipairs(clients) do
					return "󰄭 " .. "+" .. #clients
				end
			else
				for _, client in ipairs(clients) do
					return "󰄭 " .. client.name
				end
			end
		end

		local modified_color_cond = function()
			local buf = vim.api.nvim_get_current_buf()
			local modified = vim.bo[buf].modified
			if modified then
				return { fg = colors.red, gui = "italic" }
			end
			return { fb = colors.fg }
		end

		local config = {
			options = {
				refresh = {
					statusline = 50,
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
					{
						"branch",
						icon = { "" },
						color = { fg = colors.blue, gui = "italic" },
						cond = conditions.hide_branch,
					},
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
						colored = true,
					},
					{
						"filetype",
						icon_only = true,
						colored = false,
						color = modified_color_cond,
						padding = { left = 1, right = 0 },
					},
					{
						"filename",
						path = 1,
						symbols = {
							modified = "",
							readonly = "[readonly]",
							unnamed = "**scratch**",
							newfile = "[New]",
						},
						cond = conditions.buffer_not_empty,
						color = modified_color_cond,
						fmt = function(str)
							local ft = vim.bo.filetype
							if ft == "neo-tree" then
								return "neo-tree"
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
						filetype,
						cond = conditions.hide_filetype,
						color = { fg = colors.fg },
					},
					{
						lsp,
						color = { fg = colors.lsp },
						on_click = function()
							vim.cmd("LspInfo")
						end,
					},
					{
						copilot,
						color = { fg = colors.fg },
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
