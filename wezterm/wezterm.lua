local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- https://github.com/MLFlexer/smart_workspace_switcher.wezterm
local sessionizer = wezterm.plugin.require("https://github.com/mikkasendke/sessionizer.wezterm")

-- TODO:
-- Have it find both things in windows and WSL, if i open a folder in windows
-- it should open a new workspace or use existing one, in the same domain.
--
-- Example: if i open D:/projects in windows, it should start in a powershell shell
-- Example: if i open ~/projects in WSL, it should start in WSL
--
local sessionizer_schema = {
	sessionizer.DefaultWorkspace({}),
	sessionizer.AllActiveWorkspaces({}),
	sessionizer.FdSearch("D:/projects/"),
	sessionizer.FdSearch("D:/probe/"),
	sessionizer.FdSearch("C:/Users/testm/.dotfiles/"),
}

-- Find out how to set the default shell to be msys2
config.default_prog = { "pwsh.exe" }

-- Disable the window bar
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.color_scheme = "Rosé Pine (Gogh)"

local font = "JetBrains"

if font == "Fira Code" then
	config.font = wezterm.font("Fira Code", {
		weight = 300,
	})
elseif font == "IBM" then
	config.font = wezterm.font("IBM Plex Mono", {
		weight = "Regular",
	})
	config.freetype_load_target = "Light"
elseif font == "JetBrains" then
	config.font = wezterm.font("JetBrains Mono", {
		weight = 400,
	})
elseif font == "CommitMono" then
	config.font = wezterm.font("CommitMono", {
		weight = 400,
	})
end

config.max_fps = 160
config.font_size = 13
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.window_padding = {
	top = 2,
	right = 4,
	bottom = 0,
	left = 4,
}

-- multiplexer setup
config.leader = { key = "LeftAlt", mods = "NONE" }

config.keys = {
	{
		mods = "ALT",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "ALT",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "ALT",
		key = "s",
		action = sessionizer.show(sessionizer_schema),
	},
	-- {
	-- 	mods = "ALT",
	-- 	key = "s",
	-- 	action = workspace_switcher.switch_workspace(),
	-- },
	-- {
	-- 	mods = "ALT",
	-- 	key = "S",
	-- 	action = workspace_switcher.switch_to_prev_workspace(),
	-- },
}

for i = 1, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		mods = "ALT",
		key = tostring(i),
		action = wezterm.action.ActivateTab(i - 1),
	})
end

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

-- plugins
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)

return config
