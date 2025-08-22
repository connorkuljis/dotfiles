-- lua/radio_chatter/init.lua
local M = {}

M.config = {
	backend = "auto", -- "piper" | "spd-say" | "espeak-ng" | "pico2wave" | "auto"
	-- Default phrases per event
	phrases = {
		VimEnter = "Weapons hot.",
		BufWritePost = "Payload delivered.",
		DiagnosticChanged = "Pull up.",
		VimLeavePre = "Strike package away.",
	},
	-- tuning
	espeak = { rate = 170, pitch = 40, voice = nil },
	spdsay = { voice = nil, rate = nil },      -- e.g., { voice = "male3", rate = "-20" }
	pico = { lang = "en-GB", player = "paplay" }, -- or "aplay"
	piper = {
		model = os.getenv("PIPER_MODEL") or "/path/to/en_US-lessac-medium.onnx",
		sample_rate = 22050, -- use the model's sample rate
		player = "aplay", -- "aplay" or "paplay"
		speaker = nil, -- integer for multi-speaker models
		extra = {},    -- e.g., {"--length_scale", "0.9"}
	},
}

local function have(bin) return vim.fn.executable(bin) == 1 end

local function detect_backend()
	if M.config.backend ~= "auto" then return M.config.backend end
	if have("piper") then return "piper" end
	if have("spd-say") then return "spd-say" end
	if have("espeak-ng") then return "espeak-ng" end
	if have("pico2wave") then return "pico2wave" end
	return nil
end

local function build_cmd(text)
	local b = detect_backend()
	if not b then return nil end

	if b == "spd-say" then
		local c = { "spd-say" }
		if M.config.spdsay.voice then vim.list_extend(c, { "-o", M.config.spdsay.voice }) end
		if M.config.spdsay.rate then vim.list_extend(c, { "-r", M.config.spdsay.rate }) end
		table.insert(c, text); return c
	end

	if b == "espeak-ng" then
		local c = { "espeak-ng" }
		if M.config.espeak.voice then vim.list_extend(c, { "-v", M.config.espeak.voice }) end
		if M.config.espeak.rate then vim.list_extend(c, { "-s", tostring(M.config.espeak.rate) }) end
		if M.config.espeak.pitch then vim.list_extend(c, { "-p", tostring(M.config.espeak.pitch) }) end
		table.insert(c, text); return c
	end

	if b == "pico2wave" then
		local tmp = vim.fn.tempname() .. ".wav"
		local c = {
			"bash", "-lc",
			string.format("pico2wave -l %s -w %q %q && %s %q && rm -f %q",
				M.config.pico.lang, tmp, text, M.config.pico.player, tmp, tmp)
		}
		return c
	end

	if b == "piper" then
		-- stream raw PCM to player for near-zero latency
		local model = vim.fn.shellescape(M.config.piper.model)
		local rate = tostring(M.config.piper.sample_rate or 22050)
		local player = M.config.piper.player or "aplay"
		local spk = M.config.piper.speaker and (" -s " .. tostring(M.config.piper.speaker)) or ""
		local extra = ""
		if M.config.piper.extra and #M.config.piper.extra > 0 then
			extra = " " .. table.concat(M.config.piper.extra, " ")
		end
		local cmd = string.format(
			[[bash -lc 'printf %%s %q | piper --model %s%s --output-raw%s | %s -r %s -f S16_LE -t raw -']],
			text, model, spk, extra, player, rate
		)
		return { "bash", "-lc", cmd }
	end

	return nil
end

local function say(text)
	local cmd = build_cmd(text)
	if not cmd then
		vim.notify("[radio-chatter] No TTS backend found", vim.log.levels.WARN)
		return
	end
	vim.fn.jobstart(cmd, { detach = true })
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
	local aug = vim.api.nvim_create_augroup("RadioChatter", { clear = true })
	for event, phrase in pairs(M.config.phrases) do
		vim.api.nvim_create_autocmd(event, {
			group = aug,
			callback = function() say(phrase) end,
		})
	end
end

return M
