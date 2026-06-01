local M = {}

--- Configuration options for auto_color_scheme
---@class AutoColorSchemeConfig
---@field enabled boolean Whether to enable the plugin (default: true)
---@field auto_set_background boolean Whether to automatically set the background when the module is loaded (default: true)
---@field fallback_theme string Fallback background theme when system theme detection fails (default: "dark")

---@type AutoColorSchemeConfig
M.config = {
	-- Whether to enable the plugin
	enabled = true,
	-- Whether to automatically set the background when the module is loaded
	auto_set_background = true,
	-- Fallback background theme when system theme detection fails
	fallback_theme = "dark",
}

--- Setup function to configure the module
---@param opts? AutoColorSchemeConfig|nil Optional configuration options
function M.setup(opts)
	if opts then
		M.config = vim.tbl_deep_extend("force", M.config, opts)
	end

	-- Do nothing if the plugin is disabled
	if not M.config.enabled then
		return
	end

	-- Automatically set background if configured to do so
	if M.config.auto_set_background then
		M.set_background()
	end
end

-- Return "light" or "dark" based on GNOME color-scheme or default to configured fallback
function M.get_system_theme()
	-- Only attempt GNOME detection when running under a Linux desktop with XDG_CURRENT_DESKTOP or GNOME_SESSION_ID
	local desktop = os.getenv("XDG_CURRENT_DESKTOP") or os.getenv("DESKTOP_SESSION") or os.getenv("GDMSESSION")
	if not desktop or not desktop:lower():match("gnome") then
		-- Not GNOME desktop detected; return fallback theme
		return M.config.fallback_theme
	end

	local ok, handle = pcall(io.popen, "gsettings get org.gnome.desktop.interface color-scheme")
	if not ok or not handle then
		return M.config.fallback_theme
	end

	local result = handle:read("*a")
	handle:close()
	if not result then
		return M.config.fallback_theme
	end

	result = result:gsub("%s+", "")
	result = result:gsub("'", "")

	local themes = {
		["prefer-dark"] = "dark",
		["default"] = "light",
		["auto"] = "light",
	}

	return themes[result] or M.config.fallback_theme
end

-- Set the background color in Neovim based on the system theme
function M.set_background()
	local bg = M.get_system_theme()
	vim.cmd("set background=" .. bg)
	return bg
end

return M
