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

function skip_dialogue()
	if (Memory.ReadInt(0x39E4BF54) > 20) then
		Memory.WriteInt(0x39E4BF70, 0)
	end
end

function Wait(ms)
    local start = os.clock()
    local target = start + (ms / 1000)
    while os.clock() < target do
        -- yield occasionally
    end
end

function skip_helper() 

	frame_counter = Memory.ReadInt(0x39E4BF54)
	dialogue_state = Memory.ReadInt(0x39E4BF70)
	pause_state = 0

	if dialogue_state ~= 1 then
		Wait(100)
		if (Memory.ReadInt(0x39E4BF70) ~= 1) then return end
	end

	if frame_counter > 20 then Memory.WriteInt(0x39E4BF70, 0) end

	Wait(100)

	time_since_dialogue = os.clock()
	while pause_state ~= 7 do

		if (os.clock() - time_since_dialogue > 5) then break end -- Too long since last dialogue
			
		if Memory.ReadInt(0x7A7200) == 2 then break end -- Loading
			
		dialogue_state = Memory.ReadInt(0x39E4BF70)
		frame_counter = Memory.ReadInt(0x39E4BF54)
		pause_state = Memory.ReadInt(0x4FFE84)

		if dialogue_state == 1 then
			time_since_dialogue = os.clock()
			if (frame_counter > 20) then Memory.WriteInt(0x39E4BF70, 0) end
		end

		Wait(100)

	end
end

function sly2_skip_FMV()

	-- Dialogue
	skip_helper()

	--FMV
	if (Memory.ReadInt(0x9066FC) == 0) then
		Memory.WriteInt(0x9066FC, 2)
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