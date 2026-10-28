---@module 'hl'

local mainMod = "SUPER"

-- Noctalia UI layer rules (blur & transparency)
hl.layer_rule({
	match = {
		namespace = "noctalia-background-.*$",
	},
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

-- Helper for Noctalia Quickshell IPC calls
local function noctalia_ipc(action)
	return hl.dsp.exec_cmd("qs -c noctalia-shell ipc call " .. action)
end

-- Noctalia UI Shortcuts
hl.bind(mainMod .. " + D", noctalia_ipc("launcher toggle"))
hl.bind("ALT + Tab", noctalia_ipc("launcher windows"))
hl.bind(mainMod .. " + SHIFT + L", noctalia_ipc("lockScreen lock"))
hl.bind(mainMod .. " + SHIFT + E", noctalia_ipc("launcher emoji"))
hl.bind(mainMod .. " + SHIFT + Q", noctalia_ipc("sessionMenu toggle"))

-- Volume & Brightness Controls
local media_keys = {
	AudioRaiseVolume  = "volume increase",
	AudioLowerVolume  = "volume decrease",
	AudioMute         = "volume muteOutput",
	MonBrightnessUp   = "brightness increase",
	MonBrightnessDown = "brightness decrease",
}
for key, action in pairs(media_keys) do
	hl.bind("XF86" .. key, noctalia_ipc(action), { locked = true })
end
