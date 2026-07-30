-- ~/.config/hypr/modules/binds.lua

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- Default modifiers
local mainMod = "SUPER + "
local subMod = "ALT + "
local tertiaryMod = "CTRL +"
local keyboardString = "1234567890"
local keybindIndex = 1
local directions = { h = "left", j = "down", k = "up", l = "right", }
local resizeDelta = { left  = { x = -25, y =  0 }, right = { x =  25, y =  0 }, up = { x =  0,  y = 25 }, down = { x =  0,  y = -25 } }
local workspaces = { first = 1, last = 10, scratchpad = "special:magic" }

-- Alternative modifiers
if Hostname == "koch" then
	keybindIndex = 2
elseif Hostname == "cross" then
    keybindIndex = 3
end

local globalAppBinds = {

    -- Close windows
    { key = { "BACKSPACE" }, dispatch = hl.dsp.window.close() },
    { key = { "q" }, dispatch = hl.dsp.window.close() },

    -- Open windows
    { key = { "SPACE" }, command = "fuzzel" },
    { key = { "RETURN" }, command = "kitty" },
    { mod = mainMod, key = { "b" }, command = "zen-beta" },

    -- Handle windows
    { key = { "u" }, dispatch = hl.dsp.window.fullscreen({ action = "toggle" }) },
    { key = { "i" }, dispatch = hl.dsp.window.pseudo({ action = "toggle" }) },
    { key = { "o" }, dispatch = hl.dsp.window.float({ action = "toggle" }) },
    { key = { "p" }, dispatch = hl.dsp.window.pin({ action = "toggle" }) },
    { key = { "g" }, dispatch = hl.dsp.layout("togglesplit") },

	-- Drag windows 
	{ key = { "mouse:272" }, dispatch = hl.dsp.window.drag(), opts = { mouse = true } },
	{ key = { "mouse:273" }, dispatch = hl.dsp.window.resize(), opts = { mouse = true } },

    -- Infinite desktop nav

    -- Move between workspaces
    { mod = tertiaryMod, key = { "h" }, dispatch = hl.dsp.focus({ workspace = "-1" }) },
    { mod = tertiaryMod, key = { "l" }, dispatch = hl.dsp.focus({ workspace = "+1" }) },
    { mod = tertiaryMod, key = { "SHIFT + h" }, dispatch = hl.dsp.window.move({ workspace = "-1" }) },
    { mod = tertiaryMod, key = { "SHIFT + l" }, dispatch = hl.dsp.window.move({ workspace = "+1" }) },

    -- Window travel
    { mod = subMod, key = { "h" }, command = "navigate_windows.py left" },
    { mod = subMod, key = { "j" }, command = "navigate_windows.py down" },
    { mod = subMod, key = { "k" }, command = "navigate_windows.py up" },
    { mod = subMod, key = { "l" }, command = "navigate_windows.py right" },

    -- Move tiled windows
    { mod = subMod, key = { "SUPER + h" }, command = "move_window_tiled.py left" },
    { mod = subMod, key = { "SUPER + j" }, command = "move_window_tiled.py down" },
    { mod = subMod, key = { "SUPER + k" }, command = "move_window_tiled.py up" },
    { mod = subMod, key = { "SUPER + l" }, command = "move_window_tiled.py right" },

    -- Move floating windows
    { mod = subMod, key = { "SUPER + h" }, command = "move_window.py left", opts = { repeating = true } },
    { mod = subMod, key = { "SUPER + j" }, command = "move_window.py down", opts = { repeating = true } },
    { mod = subMod, key = { "SUPER + k" }, command = "move_window.py up", opts = { repeating = true } },
    { mod = subMod, key = { "SUPER + l" }, command = "move_window.py right", opts = { repeating = true } },


    -- Special workspaces
    { key = { "s" }, dispatch = hl.dsp.workspace.toggle_special("magic") },
    { key = { "SHIFT + s" }, dispatch = hl.dsp.window.move({ workspace = "special:magic" }) },

    -- Laptop binds 
    { mod = "", key = { "XF86AudioRaiseVolume" }, command = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+", opts = { locked = true, repeating = true } },
    { mod = "", key = { "XF86AudioLowerVolume" }, command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-", opts = { locked = true, repeating = true } },
    { mod = "", key = { "XF86AudioMute" },        command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", opts = { locked = true } },
    { mod = "", key = { "XF86AudioMicMute" },     command = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", opts = { locked = true } },

    { mod = "", key = { "XF86MonBrightnessUp" },   command = "brightnessctl -e4 -n2 set 5%+", opts = { locked = true, repeating = true } },
    { mod = "", key = { "XF86MonBrightnessDown" }, command = "brightnessctl -e4 -n2 set 5%-", opts = { locked = true, repeating = true } },

    { mod = "", key = { "XF86AudioNext" },  command = "playerctl next",       opts = { locked = true } },
    { mod = "", key = { "XF86AudioPause" }, command = "playerctl play-pause", opts = { locked = true } },
    { mod = "", key = { "XF86AudioPlay" },  command = "playerctl play-pause", opts = { locked = true } },
    { mod = "", key = { "XF86AudioPrev" },  command = "playerctl previous",   opts = { locked = true } },

	-- Screenshot
	{ mod = subMod, key = { "SHIFT + s" }, command = "grimblast copy area" },

    -- Exit
    { key = {"DELETE"}, command = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit" }
}

-- Directional motions
for key, dir in pairs(directions) do
    table.insert(globalAppBinds, {
        key = { key },
        dispatch = hl.dsp.focus({ direction = dir }),
    })

    table.insert(globalAppBinds, {
        key = { "SHIFT + " .. key },
        dispatch = hl.dsp.window.move({ direction = dir }),
    })
end

for i = 1, #keyboardString do
    local key = keyboardString:sub(i, i)

    hl.bind(mainMod .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. "SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Resize motions
for key, dir in pairs(directions) do
    local delta = resizeDelta[dir]

    table.insert(globalAppBinds, {
        mod = subMod,
        key = { "SHIFT + " .. key },
        dispatch = hl.dsp.window.resize({
            x = delta.x,
            y = delta.y,
            relative = true,
        }),
        opts = { repeating = true },
    })
end

-- Cursor size
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Trackpad gestures
hl.gesture({ fingers = 3, direction = "swipe", action = "move" })
hl.gesture({ fingers = 3, direction = "pinchin", action = "float" })
hl.gesture({ fingers = 3, direction = "pinchout", action = "float" })
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })

hl.config({
    input = {
        kb_layout  = "us",
        kb_options = "caps:escape",
        follow_mouse = 1,
        sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification. 
        touchpad = { natural_scroll = true } },
})

-- Keybind glue
for _, bind in ipairs(globalAppBinds) do
    local key = bind.key[keybindIndex] or bind.key[1]
    local mod = bind.mod
    if mod == nil then
        mod = mainMod
    end
    
    local fullKey
    
    if mod == "" then
        fullKey = key
    else
        fullKey = mod .. key
    end
    
    local action
    if bind.command then
        action = hl.dsp.exec_cmd(bind.command)
    else
        action = bind.dispatch
    end

    hl.bind(fullKey, action, bind.opts or {})
end


