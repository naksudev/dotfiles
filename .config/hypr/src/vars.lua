-- Variables
-- https://wiki.hypr.land/Configuring/Basics/Variables/

-- Inputs
hl.config({
	input = {
		kb_layout = "fr,us",
		kb_options = "grp:win_space_toggle",
		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
				natural_scroll = true
		}
	}
})

hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "workspace"
})

hl.config({
	cursor = {
		no_hardware_cursors = true,
		hide_on_tablet = true,
	}
})

hl.device({
	name = "logitech-usb-receiver",
	sensitivity = -0.40
})

hl.device ({
	name = "xppen-artist-16-3rd",
	output = "HDMI-A-1",
	transform = 2
})

-- General
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,

		col = {
			active_border = "rgb(C82828)",
			inactive_border = "rgba(932020aa)"
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "dwindle"
	},

	decoration = {
		rounding = 8,

		blur = {
				enabled = false, -- Disabled because my laptop is very bad
				size = 2,
				passes = 1
		}
	},

	animations = {
		enabled = true
	}
})

hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows",		 enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",	 enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",			 enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade",				 enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces",	 enabled = true, speed = 6, bezier = "default", style = "slidevert" })

hl.config({
	group = {
		auto_group = true,

		col = {
			border_active = "0x66FFFFFF",
		},

		groupbar = {
			enabled = false
		}
	}
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		background_color = "0x000000",
		disable_autoreload = true
	},

	ecosystem = {
		no_update_news = true
	},

	debug = {
		disable_logs = false
	}
})
