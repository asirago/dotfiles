local hypr = { "ctrl", "cmd", "option", "shift" }

-- CHROME
hs.hotkey.bind(hypr, "h", function()
	local chrome = hs.application.find("chrome")
	if chrome:isFrontmost() then
		chrome:hide()
	else
		hs.application.launchOrFocus("/Applications/Google Chrome.app")
	end
end)

-- ALACRITTY
hs.hotkey.bind({ "ctrl" }, "`", function()
	local alacritty = hs.application.find("alacritty")
	if alacritty:isFrontmost() then
		alacritty:hide()
	else
		hs.application.launchOrFocus("/Applications/Alacritty.app")
	end
end)

-- VSCODE
hs.hotkey.bind({ "cmd" }, "`", function()
	local code = hs.application.find("code")
	if code:isFrontmost() then
		code:hide()
	else
		hs.application.launchOrFocus("/Applications/Visual Studio Code.app")
	end
end)

-- OBSIDIAN
hs.hotkey.bind(hypr, "o", function()
	local obsidian = hs.application.find("obsidian")
	print(obsidian)
	if obsidian:isFrontmost() then
		obsidian:hide()
	else
		hs.application.launchOrFocus("/Applications/Obsidian.app")
	end
end)

-- PLEX
hs.hotkey.bind(hypr, "p", function()
	local plex = hs.application.find("Plex", true, false)
	if plex:isFrontmost() then
		plex:hide()
	else
		hs.application.launchOrFocus("/Applications/Plex.app")
	end
end)

-- NOTION
hs.hotkey.bind(hypr, "n", function()
	local notion = hs.application.find("Notion", true, false)
	if notion:isFrontmost() then
		notion:hide()
	else
		hs.application.launchOrFocus("/Applications/Notion.app")
	end
end)

-- NOTION CALENDAR
hs.hotkey.bind(hypr, "y", function()
	local calendar = hs.application.find("calendar")
	if calendar:isFrontmost() then
		calendar:hide()
	else
		hs.application.launchOrFocus("/Applications/Notion Calendar.app")
	end
end)

-- DISCORD
hs.hotkey.bind(hypr, "i", function()
	local discord = hs.application.find("Discord", true, false)
	if discord:isFrontmost() then
		discord:hide()
	else
		hs.application.launchOrFocus("/Applications/Discord.app")
	end
end)

hs.application.enableSpotlightForNameSearches(true)

hs.hotkey.bind(hypr, "r", function()
	hs.reload()
end)
