local function get_window_below()
	local curr_win = vim.api.nvim_get_current_win()
	local curr_pos = vim.api.nvim_win_get_position(curr_win)
	local curr_row = curr_pos[1]

	local windows = vim.api.nvim_list_wins()
	local target_win = nil
	local min_row_diff = nil

	for _, win in ipairs(windows) do
		local cfg = vim.api.nvim_win_get_config(win)
		if win ~= curr_win and cfg.relative == "" then
			local pos = vim.api.nvim_win_get_position(win)
			local row = pos[1]

			if row > curr_row then
				local row_diff = row - curr_row
				if not min_row_diff or row_diff < min_row_diff then
					min_row_diff = row_diff
					target_win = win
				end
			end
		end
	end

	return target_win
end

local function has_window_below()
	local curr_win = vim.api.nvim_get_current_win()
	local curr_cfg = vim.api.nvim_win_get_config(curr_win)

	-- Ignore if it's a floating window
	if curr_cfg.relative ~= "" then
		return false
	end

	local curr_pos = vim.api.nvim_win_get_position(curr_win)
	local curr_row, curr_col = curr_pos[1], curr_pos[2]
	local curr_width = vim.api.nvim_win_get_width(curr_win)

	local windows = vim.api.nvim_list_wins()

	for _, win in ipairs(windows) do
		if win ~= curr_win then
			local cfg = vim.api.nvim_win_get_config(win)
			if cfg.relative == "" then -- skip floating windows
				local pos = vim.api.nvim_win_get_position(win)
				local row, col = pos[1], pos[2]
				local width = vim.api.nvim_win_get_width(win)

				local is_below = row > curr_row
				local overlaps_horizontally = (col < curr_col + curr_width) and (col + width > curr_col)

				if is_below and overlaps_horizontally then
					return true
				end
			end
		end
	end

	return false
end

return {
	"willothy/wezterm.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		create_commands = false,
	},
	keys = {
		{
			"<leader>wS",
			function()
				require("wezterm").split_pane.vertical()
			end,
			desc = "Wezterm split pane vertical",
		},
		{
			"<leader>wV",
			function()
				require("wezterm").split_pane.horizontal()
			end,
			desc = "Wezterm split pane horizontal",
		},
		{
			"<leader>wd",
			function()
				local wezterm = require("wezterm")
				wezterm.switch_pane.direction("Down", wezterm.get_current_pane())
			end,
			desc = "Wezterm split pane horizontal",
		},
		{
			"<leader>wM",
			function()
				local wezterm = require("wezterm")
				wezterm.zoom_pane(wezterm.get_current_pane())
			end,
			desc = "Wezterm split pane horizontal",
		},
		{
			"<S-down>",
			function()
				local wezterm = require("wezterm")
				if has_window_below() then
					local target_win = get_window_below()
					if target_win then
						vim.api.nvim_set_current_win(target_win)
					end
				else
					wezterm.switch_pane.direction("Down", wezterm.get_current_pane())
				end
			end,
			desc = "Wezterm split pane horizontal",
		},
	},
}
