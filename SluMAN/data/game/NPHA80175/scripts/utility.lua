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

function sly2_wait(ms)
    local start = os.clock()
    local target = start + (ms / 1000)
    while os.clock() < target do
        -- yield occasionally
    end
end

function sly2_skip_helper() 

	-- Addresses
	frame_counter_address = 0x39E4BF54
	dialuogue_state_address = 0x39E4BF70
	loading_state_address = 0x7A7200
	pause_state_address = 0x4FFE84

	-- Constants
	frame_counter_lower_limit = 10
	game_is_loading_value = 2
	five_seconds = 5
	pause_available_value = 7
	tenth_of_second = 100
	dialogue_playing = 1
	dialogue_not_playing = 0

	dialogue_state = Memory.ReadInt(dialuogue_state_address)

	-- If trying to skip slightly early, try again after a short wait
	if dialogue_state ~= dialogue_playing then
		sly2_wait(tenth_of_second)
		dialogue_state = Memory.ReadInt(dialuogue_state_address)
		if (dialogue_state ~= dialogue_playing) then return end
	end

	frame_counter = Memory.ReadInt(frame_counter_address)
	pause_state = 0

	if frame_counter > frame_counter_lower_limit then Memory.WriteInt(dialuogue_state_address, dialogue_not_playing) end

	-- Keep checking until dialogue is finished or loading screen appears
	time_since_dialogue = os.clock()
	while pause_state ~= pause_available_value do

		-- Break if theres been too long since last dialogue
		if (os.clock() - time_since_dialogue > five_seconds) then break end
		
		-- Break if loading screen occurs
		loading_state = Memory.ReadInt(loading_state_address)
		if (loading_state == game_is_loading_value) then break end
			
		dialogue_state = Memory.ReadInt(dialuogue_state_address)
		frame_counter = Memory.ReadInt(frame_counter_address)

		if dialogue_state == dialogue_playing then
			time_since_dialogue = os.clock()
			if (frame_counter > frame_counter_lower_limit) then Memory.WriteInt(dialuogue_state_address, dialogue_not_playing) end
		end

		sly2_wait(tenth_of_second)

		pause_state = Memory.ReadInt(pause_state_address)

	end
end

function sly2_skip_FMV()

	-- Dialogue
	sly2_skip_helper()

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