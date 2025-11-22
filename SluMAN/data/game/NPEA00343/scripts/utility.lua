infinite_jumps_id = -1
game_clock_id = -1
time_variable = os.clock()

function sly3_set_coincount(coins)
	Memory.WriteInt(0x6CC808, coins)
end

function sly3_get_coincount()
	return Memory.ReadInt(0x6CC808)
end

function sly3_set_language(index)
	-- 1 = English
	-- 2 = French
	-- 3 = Italian
	-- 4 = German
	-- 5 = Spanish
	-- 7 = Dutch
	-- 8 = Danish
	-- 9 = Norwegian
	-- 10 = Swedish
	-- 11 = Finnish
	Memory.WriteInt(0x7E28F0, index)
end

function change_language(name)
	if name == "English" then sly3_set_language(1)
	elseif name == "French" then sly3_set_language(2)
	elseif name == "Italian" then sly3_set_language(3)
	elseif name == "German" then sly3_set_language(4)
	elseif name == "Spanish" then sly3_set_language(5)
	elseif name == "Portuguese" then sly3_set_language(6)
	elseif name == "Dutch" then sly3_set_language(7)
	elseif name == "Danish" then sly3_set_language(8)
	elseif name == "Norwegian" then sly3_set_language(9)
	elseif name == "Swedish" then sly3_set_language(10)
	elseif name == "Finnish" then sly3_set_language(11)
	else
		print("Error reading language: language {"..tostring(name).."} does not exists.")
	end
	load(134)
end

function sly3_get_language()
	return Memory.ReadInt(0x7E28F0)
end

function sly3_infinite_juice()
	-- Fake infinite, adds a shit ton of juice tho
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x170,16777215)
	Memory.WriteInt(entity_address + 0x174,16777215)
end

function sly3_infinite_health()
	-- Fake infinite, adds a shit ton of health tho
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x168,16777215)
	Memory.WriteInt(entity_address + 0x16C,16777215)
end

function sly3_restore_juice()
	-- Restores the juice meter back to normal
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x170,100)
	Memory.WriteInt(entity_address + 0x174,100)
end

function sly3_activate_invulnerability()
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x17C,1)
end

function sly3_remove_invulnerability()
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x17C,0)
end

function sly3_restore_health()
	-- Restores the health back to normal (not for Murray tho)
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x168,40)
	Memory.WriteInt(entity_address + 0x16C,40)
end

function sly3_set_health(health)
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x168,health)
end

function change_health(delta)
	local entity_address = Memory.ReadInt(0x5EC654)
	local curr_health = Memory.ReadInt(entity_address + 0x168)
	Memory.WriteInt(entity_address + 0x168, curr_health+delta)

end

function sly3_get_coordinates(entity_address)
	trf_address = Memory.ReadInt(entity_address+0x44)
	x = Memory.ReadFloat(trf_address+0x130)
	y = Memory.ReadFloat(trf_address+0x134)
	z = Memory.ReadFloat(trf_address+0x138)
	return {x,y,z}
end

function sly3_wait(ms)
	local curr_time = os.clock()
    local target_time = curr_time + (ms / 1000)
    while curr_time < target_time do
        curr_time = os.clock()
    end
end

function sly3_skip_helper() 

	-- Addresses
	frame_counter_address = 0x39B13F54
	dialuogue_state_address = 0x39B13F70
	loading_state_address = 0x6CB600
	pause_state_address = 0x5EC6C4

	-- Constants
	frame_counter_lower_limit = 10
	game_is_loading_value = 2
	five_seconds = 5
	pause_available_value = 0
	pause_not_available_value = 1
	tenth_of_second = 100
	dialogue_playing = 1
	dialogue_not_playing = 0

	dialogue_state = Memory.ReadInt(dialuogue_state_address)

	-- If trying to skip slightly early, try again after a short wait
	if dialogue_state ~= dialogue_playing then
		sly3_wait(tenth_of_second)
		dialogue_state = Memory.ReadInt(dialuogue_state_address)
		if (dialogue_state ~= dialogue_playing) then return end
	end

	frame_counter = Memory.ReadInt(frame_counter_address)
	pause_state = pause_not_available_value

	sly3_wait(tenth_of_second)

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

		sly3_wait(tenth_of_second)

		pause_state = Memory.ReadInt(pause_state_address)

	end
end

function sly3_skip_FMV()

	-- Dialogue
	sly3_skip_helper()

	-- FMV
	if (Memory.ReadInt(0x83C8BC) == 0) then
		Memory.WriteInt(0x83C8BC, 2)
	end
end

function sly3_activate_infinite_jumps()
	-- Restores the juice meter back to normal
	entity_address = Memory.ReadInt(0x5EC654)
	infinite_jumps_id = API:FreezeMemory(entity_address + 0x33B, Convert.IntToByteArray(0, 4, true))
end

function sly3_remove_infinite_jumps()
	-- Restores the juice meter back to normal
	if (infinite_jumps_id ~= -1) then
		API:ReleaseSubID(infinite_jumps_id)
	end
end

function sly3_freeze_game_clock()
	Memory.WriteFloat(0x5898B8, 0)
	game_clock_id = API:FreezeMemory(0x5898B8, Convert.FloatToByteArray(0))
end

function sly3_unfreeze_game_clock()
	if (game_clock_id ~= -1) then
		API:ReleaseSubID(game_clock_id)
	end
	Memory.WriteFloat(0x5898B8, 1)
end

function set_clock_speed(speed)
	Memory.WriteFloat(0x5898B8, speed)
end

function get_clock_speed()
	return Memory.ReadFloat(0x5898B8)
end

function sly3_disable_guard_ai()
	Memory.WriteInt(0x5EC6CC, 1)
end

function sly3_restore_guard_ai()
	Memory.WriteInt(0x5EC6CC, 0)
end