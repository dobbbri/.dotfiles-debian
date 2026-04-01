-- Minimal WezTerm configuration using iTerm2 color schemes
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Use built-in iTerm2 color scheme (WezTerm ships with 700+ schemes)
-- See full list: https://wezterm.org/colorschemes/

-- GitHub Dark color palette
local colors = {
	fg = "#d0d7de",
	bg = "#0d1117",
	comment = "#8b949e",
	red = "#ff7b72",
	green = "#3fb950",
	yellow = "#d29922",
	blue = "#539bf5",
	magenta = "#bc8cff",
	cyan = "#39c5cf",
	selection = "#415555",
	caret = "#58a6ff",
	invisibles = "#2f363d",
}

config.color_scheme = "Catppuccin Mocha"

-- Font (adjust to your preference)
local fonts = {
  { family = "Lilex Nerd Font", size = 15, line_height = 1.1 },
	{ family = "JetBrainsMono Nerd Font", size = 15, line_height = 1.1 },
	{ family = "UbuntuMono Nerd Font", size = 16, line_height = 1.1 },
	{ family = "UbuntuSansMono Nerd Font", size = 15, line_height = 1.1 },
	{ family = "CaskaydiaMono Nerd Font", size = 15, line_height = 1.1 },
}
local sel_font = 4

-- Font configuration
config.font = wezterm.font_with_fallback({
	fonts[sel_font].family,
})
config.use_cap_height_to_scale_fallback_fonts = true
config.line_height = fonts[sel_font].line_height
config.font_size = fonts[sel_font].size
--
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_frame = {
	font = wezterm.font({
		family = "UbuntuMono Nerd Font",
		weight = "Regular",
	}),
	font_size = 12.0,
	active_titlebar_bg = colors.bg,
}

-- Performance
config.window_background_opacity = 0.95
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false

-- Keybindings - ALT-based for panes and tabs
config.keys = {}

-- Pane management
for _, v in ipairs({
	{ "Enter", act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ "w", act.CloseCurrentPane({ confirm = true }) },
	{ "LeftArrow", act.ActivatePaneDirection("Left") },
	{ "RightArrow", act.ActivatePaneDirection("Right") },
	{ "UpArrow", act.ActivatePaneDirection("Up") },
	{ "DownArrow", act.ActivatePaneDirection("Down") },
}) do
	table.insert(config.keys, { mods = "ALT", key = v[1], action = v[2] })
end

-- Vertical split
table.insert(
	config.keys,
	{ mods = "ALT|SHIFT", key = "Enter", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }
)

-- Tab management
table.insert(config.keys, { mods = "ALT", key = "t", action = act.SpawnTab("CurrentPaneDomain") })
table.insert(config.keys, { mods = "ALT", key = "q", action = act.CloseCurrentTab({ confirm = true }) })

-- Tab navigation (ALT+1-8)
for i = 0, 7 do
	table.insert(config.keys, { mods = "ALT", key = tostring(i + 1), action = act.ActivateTab(i) })
end

-- Other
table.insert(config.keys, { mods = "ALT", key = "c", action = act.CopyTo("ClipboardAndPrimarySelection") })
table.insert(config.keys, { mods = "ALT", key = "v", action = act.PasteFrom("Clipboard") })
table.insert(config.keys, { mods = "ALT", key = "=", action = act.IncreaseFontSize })
table.insert(config.keys, { mods = "ALT", key = "-", action = act.DecreaseFontSize })
table.insert(config.keys, { mods = "ALT", key = "0", action = act.ResetFontSize })

-- Auto-detect Wayland
local is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil or os.getenv("XDG_SESSION_TYPE") == "wayland"
config.enable_wayland = is_wayland

-- Hide tab bar if only one tab
config.hide_tab_bar_if_only_one_tab = true

return config
