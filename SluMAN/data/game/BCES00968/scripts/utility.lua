function sly_trilogy_set_coin_count(coins)
	-- TODO: Add Sly 1
	if gameName == "Sly 2" then
		Memory.WriteInt(0x7349AC, coins)
	elseif gameName == "Sly 3" then
		Memory.WriteInt(0x657284, coins)
	end
end

function sly_trilogy_set_character(characterId)
	-- TODO: Add Sly 1 and Sly 3
	if gameName == "Sly 2" then
		Memory.WriteInt(0x73490C, characterId)
	end
end