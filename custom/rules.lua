---@module 'hl'

-- Global event handling
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Complex focus rule for XWayland / empty popups
hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = 1,
		float = 1,
		fullscreen = 0,
		pin = 0,
	},
	no_focus = true,
})

-- Floating rules (by window class)
for _, class in ipairs({
	"blueman-manager",
	"VirtualBox.*",
	"org.raspberrypi.rpi-imager",
	"sddm-conf",
	"bssh",
	"nwg-look",
	"steam",
	"textsnatcher",
	"anki",
	"de.unihannover.hci.quiz.QuizApplication",
}) do
	hl.window_rule({ match = { class = class }, float = true })
end

-- Floating rules (by window title)
for _, title in ipairs({
	"Anmelden.*",
	"nmtui",
	"Prism.*",
	"Konsolenfenster.*",
	"Tic Tac Toe",
	"Edit Item",
}) do
	hl.window_rule({ match = { title = title }, float = true })
end

-- Multi-attribute rules
hl.window_rule({
	match = { class = "firefox", title = "Bibliothek" },
	float = true,
})

hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	size = { 800, 600 },
})

-- Workspace assignments
for class, ws in pairs({
	kitty = 1,
	firefox = 2,
	thunar = 3,
}) do
	hl.window_rule({ match = { class = class }, workspace = ws })
end

-- Social & Mail apps (Workspace + No Initial Focus)
for class, ws in pairs({
	vesktop = 3,
	WebCord = 3,
	["eu.betterbird.Betterbird"] = 4,
}) do
	hl.window_rule({
		match = { class = class },
		workspace = ws,
		no_initial_focus = true,
	})
end

-- Minecraft & Console (Workspace 4 + Float)
for _, title in ipairs({
	"Minecraft.*",
	"Console window for.*",
}) do
	hl.window_rule({
		match = { title = title },
		workspace = 4,
		float = true,
	})
end
