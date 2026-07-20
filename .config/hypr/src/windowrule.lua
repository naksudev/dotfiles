-- Window Rules & Layer rules
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
	name = "apply-float-imv",
	match = {
		class = "(imv)"
	},
	float = true
})

hl.window_rule({
	name = "idle-inhibit-vbox",
	match = {
		title = "(- Oracle VM VirtualBox$)"
	},
	idle_inhibit = "always"
})

hl.window_rule({
	name = "idle-inhibit-vmware",
	match = {
		title = "(- VMWare Workstation$)"
	},
	idle_inhibit = "always"
})

hl.window_rule({
	name = "stay-focused-steam", -- TODO: Try without the rule
	match = {
		class = "^(steam)$"
	},
	stay_focused = true
})

hl.window_rule({
	name = "min-size-steam", -- TODO: Try without the rule
	match = {
		class = "^(steam)$"
	},
	min_size = { 1, 1 }
})

hl.window_rule({
	name = "pin-pip",
	match = {
		title = "(^Picture-in-Picture)"
	},
	pin = true
})

hl.window_rule({
	name = "pin-pip",
	match = {
		title = "(^Picture-in-Picture)"
	},
	float = true
})


hl.layer_rule({
	name = "dim-around-rofi-launcher",
	match = {
		namespace = "^(rofi)$"
	},
	dim_around = true
})

hl.layer_rule({
	name = "dim-around-swaync-control-center",
	match = {
		namespace = "^(swaync-control-center)$"
	},
	dim_around = true
})
