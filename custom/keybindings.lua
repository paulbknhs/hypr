---@module 'hl'

local mainMod = "SUPER"

-- Applications
local terminal = "kitty"
local browser = "firefox"
local fileManager = "thunar"
local sudoFileManager = "sudo thunar"

-- Window Management
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + C", hl.dsp.window.float())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

-- App Shortcuts
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd(sudoFileManager))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("neovide"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("/home/paul/projects/rofi-greek/greek.sh"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("kitty nmtui"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("pavuc"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("element-desktop"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("kitty python3"))

-- Clipboard Manager (Rofi + Cliphist)
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Screenshots (Hyprshot)
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + SHIFT + CTRL + S", hl.dsp.exec_cmd("hyprshot -m output"))

-- Media Controls (Playerctl)
for key, action in pairs({
	XF86AudioNext  = "next",
	XF86AudioPause = "play-pause",
	XF86AudioPlay  = "play-pause",
	XF86AudioPrev  = "previous",
}) do
	hl.bind(key, hl.dsp.exec_cmd("playerctl " .. action), { locked = true })
end

-- Focus Navigation (Vim keys & Arrow keys)
local directions = {
	h = "left",  left  = "left",
	j = "down",  down  = "down",
	k = "up",    up    = "up",
	l = "right", right = "right",
}
for key, dir in pairs(directions) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = dir }))
end

-- Workspaces 1-10 (Focus & Move)
for i = 1, 10 do
	local key = (i == 10) and "0" or tostring(i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special Workspace (Scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse Navigation & Window Drag/Resize
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:274", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 3.0"), { mouse = true })
