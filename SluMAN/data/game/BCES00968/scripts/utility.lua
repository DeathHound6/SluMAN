function sly_trilogy_set_coin_count(coins)
	local addr = 0
	-- TODO: Add Sly 1
	if gameName == "Sly 2" then
		addr = 0x7349AC
	elseif gameName == "Sly 3" then
		addr = 0x657284
	end
	Memory.WriteInt(addr, coins)
end

function sly_trilogy_set_character(characterId)
local addr = 0
	-- TODO: Add Sly 1 and Sly 3
	if gameName == "Sly 2" then
		addr = 0x73490C
	end
	Memory.WriteInt(addr, characterId)
end