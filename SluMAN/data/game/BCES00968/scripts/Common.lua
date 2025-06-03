gameName = "Unknown"

-- enable controls dynamically based on the detected game
function sly_trilogy_enable_controls(gameName)
	local controls = {
		["setCoinsButton"] = {
			["Sly 1"] = false,
			["Sly 2"] = true,
			["Sly 3"] = true
		}
	}
	for controlName, d in pairs(controls) do
		local control = Trainer.GetControlByName(controlName)
		if control ~= nil then
			control.Enabled = d[gameName]
		end
	end
end

function sly_trilogy_load()
	sly_trilogy_detect_game()
end

function sly_trilogy_detect_game()
	local addresses = {
		["Sly 1"] = 0x33E1F8,
		["Sly 2"] = 0x38BB50,
		["Sly 3"] = 0x426550
	}
	for name, addr in pairs(addresses) do
        local bytes = API:ReadMemory(addr, 9)
		local str = ""
		for i = 0, bytes.Length-1 do
			str = str .. string.char(bytes[i])
		end
		if str == "1017.0103" then
			gameName = name
		elseif str == "0524.2241" then
			gameName = name
		elseif str == "1222.1218" then
			gameName = name
		else
			gameName = "Unknown"
		end

		if gameName ~= "Unknown" then
			break
		end
	end
	Trainer.GetControlByName("gameNameLbl").Text = "Detected Game: " .. gameName
	sly_trilogy_enable_controls(gameName)
end
