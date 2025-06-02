function sly_trilogy_set_coin_count(coins)
	local addr = 0
	-- TODO: Add Sly 1 and Sly 3
	if gameName == "Sly 2" then
		addr = 0x7349AC
	end
	Memory.WriteInt(addr, coins)
end

function sly_trilogy_set_character(characterId)
	Memory.WriteInt(0x73490C, characterId)
end