-- config/theme.lua

local M = {}

-- Return "light" or "dark" based on GNOME color-scheme or default to dark
function M.get_system_theme()
	-- Only attempt GNOME detection when running under a Linux desktop with XDG_CURRENT_DESKTOP or GNOME_SESSION_ID
	local desktop = os.getenv("XDG_CURRENT_DESKTOP")
		or os.getenv("DESKTOP_SESSION")
		or os.getenv("GDMSESSION")
	if not desktop or not desktop:lower():match("gnome") then
		-- Not GNOME desktop detected; don't call gsettings
		return "dark"
	end

	local ok, handle = pcall(
		io.popen,
		"gsettings get org.gnome.desktop.interface color-scheme"
	)
	if not ok or not handle then
		return "dark"
	end

	local result = handle:read("*a")
	handle:close()
	if not result then
		return "dark"
	end

	result = result:gsub("%s+", "")
	result = result:gsub("'", "")

	local themes = {
		["prefer-dark"] = "dark",
		["default"] = "light",
		["auto"] = "light",
	}

	return themes[result] or "dark"
end

return M
