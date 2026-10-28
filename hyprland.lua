---@module 'hl'

-- Environment Variables
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

-- Monitors
for _, monitor in ipairs({
	{ output = "HDMI-A-1", mode = "1920x1080", position = "1920x0" },
	{ output = "DP-1",     mode = "1920x1080", position = "1920x0" },
	{ output = "eDP-1",    mode = "preferred", position = "0x0" },
}) do
	monitor.scale = monitor.scale or 1
	hl.monitor(monitor)
end

-- Core Configuration
hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 1,
		col = {
			active_border = { colors = { "rgba(2266ddff)" } },
			inactive_border = { colors = { "rgba(595959aa)" } },
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "master",
	},
	decoration = {
		rounding = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 6,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 3,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = false,
	},
	input = {
		kb_layout = "de",
		kb_options = "caps:swapescape",
		numlock_by_default = true,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
		},
	},
})

-- Input Devices
for name, sensitivity in pairs({
	["syna32b3:01-06cb:ce7d-mouse"] = 0.0,
	["logitech-g502-hero-gaming-mouse"] = -0.2,
	["tpps/2-elan-trackpoint"] = -0.5,
}) do
	hl.device({ name = name, sensitivity = sensitivity })
end

-- Custom Submodules
require("custom.keybindings")
require("custom.rules")
require("custom.noctalia")
require("custom.animations")

-- Autostart
hl.on("hyprland.start", function()
	local autostart = {
		"noctalia",
		"/usr/local/bin/dl-sort",
		"hyprpaper",
		"demonsend start",
		"wl-paste --type text --watch cliphist store",
		"wl-paste --type image --watch cliphist store",
	}
	for _, cmd in ipairs(autostart) do
		hl.exec_cmd(cmd)
	end
end)
