inv_freeze = -1

function sly2_set_coin_count(coins)
	Memory.WriteInt(0x7A83B0, coins)
end

function sly2_unlock_all_gadgets()
	local table = { 255, 255, 255, 255, 255, 255, 255, 255 }
	API:WriteMemory(0x7A83A8, Convert.TableToByteArray(table))
end

function sly2_kill_active_character()
	entity_address = Memory.ReadInt(0x49E290)
	Memory.WriteInt(entity_address + 0xDD4, 8)
end

function sly2_infinite_juice()
	cur_char = Memory.ReadInt(0x7A830C)
	if cur_char==7 then API:FreezeMemory(0x7A8364, 100)
	elseif cur_char==8 then API:FreezeMemory(0x7A837C, 100)
	elseif cur_char==9 then API:FreezeMemory(0x7A8394, 100)
	end
end

function sly2_infinite_health()
	cur_char = Memory.ReadInt(0x7A830C)
	if cur_char==7 then API:FreezeMemory(0x7A8360, 40)
	elseif cur_char==8 then API:FreezeMemory(0x7A8378, 40)
	elseif cur_char==9 then API:FreezeMemory(0x7A8390, 60)
	end
end

function SetCharacter(characterId)
	Memory.WriteInt(0x7A830C, characterId)
end

function sly2_set_health(health)
	local character = Memory.ReadInt(0x7A830C)
	if character == 7 then Memory.WriteInt(0x7A8360, health)
	elseif character == 8 then Memory.WriteInt(0x7A8378, health)
	elseif character == 9 then Memory.WriteInt(0x7A8390, health)
	end
end


function sly2_activate_invulnerability()
	entity_address = Memory.ReadInt(0x49E290)
	inv_freeze = API:FreezeMemory(entity_address+0x27C, 1)
end

function sly2_remove_invulnerability()
	entity_address = Memory.ReadInt(0x49E290)
	if inv_freeze>-1 then API:ReleaseSubID(inv_freeze) end
end

function sly3_restore_health()
	-- Restores the health back to normal (not for Murray tho)
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x168,40)
	Memory.WriteInt(entity_address + 0x16C,40)
end

function sly3_remove_all_gadgets()
	local table = { 0, 0, 0, 0, 0, 0, 0, 0 }
	API:WriteMemory(0x6CC7F8, Convert.TableToByteArray(table))
end

function sly3_get_coordinates(entity_address)
	trf_address = Memory.ReadInt(entity_address+0x44)
	x = Memory.ReadFloat(trf_address+0x130)
	y = Memory.ReadFloat(trf_address+0x134)
	z = Memory.ReadFloat(trf_address+0x138)
	return {x,y,z}
end