-- ~/.config/hypr/modules/monitors.lua

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

if Hostname == "sier" then

    hl.monitor({
		output = "DP-2",
		mode = "3440x1440@239.99Hz",
		position = "1080x0",
		scale = 1,
    })

    hl.monitor({
		output = "DP-3",
		mode = "1920x1080@60.00000",
		position = "0x-282",
        transform = 1,
		scale = 1,
    })

	hl.workspace_rule({ workspace = "1", monitor = "DP-3" })
	hl.workspace_rule({ workspace = "6", monitor = "DP-2" }) 

elseif Hostname == "koch" then

    hl.monitor({
		output = "",
		mode = "highres",
		position = "auto",
		scale = 1,
    }) 

    hl.monitor({
		output = "",
		mode = "1920x1080@60.00",
		position = "auto",
		scale = 1,
    })

elseif Hostname == "cross" then

    hl.monitor({
		output = "",
		mode = "preferred",
		position = "auto",
        transform = 1,
		scale = 1,
    })

else 

    hl.monitor({
		output = "",
		position = "auto",
		mode = "preferred",
		scale = 1,
    })

end

