hs.hotkey.bind({ "ctrl" }, "§", function()
	local ghostty = hs.application.find("ghostty")
	if ghostty:isFrontmost() then
		ghostty:hide()
	else
		hs.application.launchOrFocus("/Applications/Ghostty.app")
	end
end)

hs.hotkey.bind({ "cmd" }, "`", function()
	local code = hs.application.find("code")
	if code:isFrontmost() then
		code:hide()
	else
		hs.application.launchOrFocus("/Applications/Visual Studio Code.app")
	end
end)

hs.hotkey.bind("option", "o", function()
	local obsidian = hs.application.find("obsidian")
	if obsidian and obsidian:isFrontmost() then
		obsidian:hide()
	else
		hs.application.launchOrFocus("/Applications/Obsidian.app")
	end
end)

hs.hotkey.bind("option", "n", function()
	local notion = hs.application.find("Notion", true, false)
	if notion and notion:isFrontmost() then
		notion:hide()
	else
		hs.application.launchOrFocus("/Applications/Notion.app")
	end
end)

hs.application.enableSpotlightForNameSearches(true)
