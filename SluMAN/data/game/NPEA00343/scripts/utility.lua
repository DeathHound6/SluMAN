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

function sly3_skip_FMV()
	-- Splash FMV
	if (Memory.ReadInt(0x303E5ECC) > 10) then
		Memory.WriteInt(0x303E5EC8, 1)
	end

	-- Outro/Chalktalk FMV
	if (Memory.ReadInt(0x303F256C) > 10) then
		Memory.WriteInt(0x303F2568, 1)
	end

	-- Intro FMV
	if (Memory.ReadInt(0x303F6C4C) > 10) then
		Memory.WriteInt(0x303F6C48, 1)
	end

	-- Dialogues
	if (Memory.ReadInt(0x39B13F54) > 10) then
		-- Skips the current dialogue to the end
		Memory.WriteInt(0x39B13F70, 0)
	end

	Memory.WriteInt(0x3A2E0B28, 1)

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