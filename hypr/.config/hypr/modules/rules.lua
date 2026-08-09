-- ~/.config/hypr/modules/rules.lua

-- Window rules

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Host-specific logic

local otterSize  = { 410, 220 }
local kittySize  = { 1384, 703 }

if Hostname == "koch" then

	otterSize    = { 420, 220 }
    kittySize    = { 1384, 703 }

elseif Hostname == "cross" then

    otterSize  = { 410, 220 }
    kittySize  = { 1247, 430 }

else
end


-- Universal window rules (shared among all hosts)

hl.window_rule({ 
    name         = "zen-border-rounding",
    match        = { class = "zen-beta" }, 
    rounding     = 20,
})

hl.window_rule({ 
    name         = "kitty-scratch",
    match        = { class = "kitty", class = "scratchpad" }, 
	size         = kittySize, 
    float        = true,
    center       = true,
    no_anim      = true,
    workspace    = "special:scratchpad",
})

hl.window_rule({
	name         = "otter-launcher",
	match        = { class = "otter" },
	float        = true,
    pin          = true,
    stay_focused = true,
	-- animation    = "popin 80%",
    no_anim      = true,
	size         = otterSize,
	opaque       = true,
})

hl.window_rule({
    name         = "audacious",
    match        = { class = "Audacious" },
    float        = true,
    no_anim      = true,
    opaque       = true, 
})

hl.window_rule({ 
    name         = "pip",
    match        = { class = "zen-beta", title = "Picture-in-Picture" }, 
    float        = true,
})

-- Default window rules

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Workspace rules + Overlays

-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Behavior

hl.config({ general = { resize_on_border = true, allow_tearing = false } })

