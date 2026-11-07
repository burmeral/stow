-- ~/.config/hypr/modules/decor.lua

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- Overrides

-- hl.window_rule({
--   match   = { class = "kitty" },
--   opacity = "0.8 override 0.8 override 0.8 override",
--   rounding     = 20,
-- })

-- Universal

hl.config({
    general = {

        -- Border size
        gaps_in  = 5,
        gaps_out = 20,
        border_size = 0,

        -- Border colors
        col = {

            active_border   = {
                colors = {
                    "rgba(33ccffee)", 
                    "rgba(00ff99ee)" 
                }, angle = 45 }, 

            inactive_border = 
                    "rgba(595959aa)",
        },

    },

    decoration = {
        rounding           = 20,
        rounding_power     = 2,

        active_opacity     = 1.0,
        inactive_opacity   = 1.0,

        shadow = {
            enabled        = false,
            range          = 1,
            render_power   = 3,
            color          = 0xee1a1a1a,
        },

        blur = {
            enabled        = true,
            size           = 3,
            passes         = 2,
            vibrancy       = 0.1696,
        },

        glow = {
            enabled        = false,
            range          = 3,
            render_power   = 1,
            color          = 0xee1a1a1a,
        },

    },

  -- No default wallpaper 
  misc = { force_default_wallpaper = 0, disable_hyprland_logo = true } 

})

