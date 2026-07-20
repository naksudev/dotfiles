-- Binds
-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers/

local mainMod = "SUPER"

-- Windows
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + X", hl.dsp.window.fullscreen_state({ internal = 2, client = 0}))

hl.bind(mainMod .. " + ALT + left",	 hl.dsp.window.resize({ x = -10, y = 0 }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = 10, y = 0 }))
hl.bind(mainMod .. " + ALT + up",		 hl.dsp.window.resize({ x = 0, y = 10 }))
hl.bind(mainMod .. " + ALT + down",	 hl.dsp.window.resize({ x = 0, y = -10 }))

hl.bind(mainMod .. " + SHIFT + left",	 hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",		 hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",	 hl.dsp.window.move({ direction = "down",  }))

hl.bind(mainMod .. " + left",	 hl.dsp.focus({ direction = "left", true }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right", true }))
hl.bind(mainMod .. " + up",		 hl.dsp.focus({ direction = "up", true }))
hl.bind(mainMod .. " + down",	 hl.dsp.focus({ direction = "down", true }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Groups
hl.bind(mainMod .. " + G",						 hl.dsp.group.toggle())
hl.bind("ALT + right",								 hl.dsp.group.next())
hl.bind("ALT + left",									 hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + left",	 hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. " + CTRL + right",	 hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + CTRL + up",		 hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. " + CTRL + down",	 hl.dsp.window.move({ direction = "down", group_aware = true }))

-- Workspaces
for i = 0, 8 do
	local key = i + 9
	hl.bind(mainMod .. " + code:" .. key, 				hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + code:" .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",				 hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down",	 hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",		 hl.dsp.focus({ workspace = "e-1" }))

-- Brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +1% && swayosd-client --brightness raise"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%- && swayosd-client --brightness lower"))

-- Screenshot
hl.bind("code:107", 							hl.dsp.exec_cmd("hyprshot --silent --clipboard-only -m output"))
hl.bind(mainMod .. " + code:107", hl.dsp.exec_cmd("hyprshot --clipboard-only -c -m window"))
hl.bind("SHIFT + code:107", 			hl.dsp.exec_cmd("hyprshot --clipboard-only -m region"))

-- Audio control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5% && swayosd-client --output-volume raise --max-volume 100"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5% && swayosd-client --output-volume lower --max-volume 100"))
hl.bind("XF86AudioMute", 				hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
hl.bind("XF86AudioPlay", 				hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", 				hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", 				hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86audiostop", 				hl.dsp.exec_cmd("playerctl stop"))

-- Microphone control
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-source-volume @DEFAULT_SOURCE@ +5 && swayosd-client --input-volume raise --max-volume 100"))
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-source-volume @DEFAULT_SOURCE@ -5 && swayosd-client --input-volume lower --max-volume 100"))
hl.bind("SHIFT + XF86AudioMute", 				hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))

-- Misc
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + M", 			hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + R", 			hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/launchers/app-launcher.rasi"))
hl.bind(mainMod .. " + I", 			hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + L", 			hl.dsp.exec_cmd("loginctl lock-session "))
hl.bind("XF86PowerOff",		 			hl.dsp.exec_cmd("loginctl lock-session & systemctl suspend"))
hl.bind(mainMod .. " + N", 			hl.dsp.exec_cmd("swaync-client -t"))
