local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "catppuccin-mocha"

config.font = wezterm.font("MonaspiceAr Nerd Font", { weight = "Regular" })
config.harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" }
config.font_size = 16
config.cell_width = 0.9
config.line_height = 1

config.window_decorations = "RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true
config.pane_focus_follows_mouse = true

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function is_editor(pane)
	local name = basename(pane:get_foreground_process_name())
	return name == "nvim" or name == "vim"
end

config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "UpArrow",
		mods = "CMD",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "DownArrow",
		mods = "SHIFT",
		action = wezterm.action_callback(function(win, pane)
			if is_editor(pane) then
				win:perform_action({ SendKey = { key = "DownArrow", mods = "SHIFT" } }, pane)
			else
				win:perform_action({ ActivatePaneDirection = "Down" }, pane)
			end
		end),
	},
	{
		key = "UpArrow",
		mods = "SHIFT",
		action = wezterm.action_callback(function(win, pane)
			if is_editor(pane) then
				win:perform_action({ SendKey = { key = "UpArrow", mods = "SHIFT" } }, pane)
			else
				win:perform_action({ ActivatePaneDirection = "Up" }, pane)
			end
		end),
	},
	{
		key = "RightArrow",
		mods = "SHIFT",
		action = wezterm.action_callback(function(win, pane)
			if is_editor(pane) then
				win:perform_action({ SendKey = { key = "RightArrow", mods = "SHIFT" } }, pane)
			else
				win:perform_action({ ActivatePaneDirection = "Right" }, pane)
			end
		end),
	},
	{
		key = "LeftArrow",
		mods = "SHIFT",
		action = wezterm.action_callback(function(win, pane)
			if is_editor(pane) then
				win:perform_action({ SendKey = { key = "LeftArrow", mods = "SHIFT" } }, pane)
			else
				win:perform_action({ ActivatePaneDirection = "Left" }, pane)
			end
		end),
	},
	{
		key = "p",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			window:perform_action(
				wezterm.action.PaneSelect({
					alphabet = "1234567890",
				}),
				pane
			)
		end),
	},
}

return config
