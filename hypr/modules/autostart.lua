-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("vesktop")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("aww img ~/walls/wallhaven-9512z8_2560x1440.png")
	hl.exec_cmd("qs")
	hl.exec_cmd("mpd")
end)
