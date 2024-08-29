ss_x = 0
ss_y = 0
ss_z = 0
ss_coins = 0
ss_health = 0
ss_juice = 0

infinite_jumps_id = -1


function set_coins(coins)
	Memory.WriteInt(0x6CC808, coins)
end

function get_coins()
	return Memory.ReadInt(0x6CC808)
end

function sly3_save_state()
	ss_coins = get_coins()
	entity_address = Memory.ReadInt(0x5EC654)
	trf_address = Memory.ReadInt(entity_address+0x44)
	sly_x = Memory.ReadFloat(trf_address+0x130)
	sly_y = Memory.ReadFloat(trf_address+0x134)
	sly_z = Memory.ReadFloat(trf_address+0x138)
end

function sly3_load_state()
	set_coins(ss_coins)

	trf_address = Memory.ReadInt(entity_address+0x44)
	Memory.WriteFloat(trf_address+0x130, ss_x)
	Memory.WriteFloat(trf_address+0x134, ss_y)
	Memory.WriteFloat(trf_address+0x138, ss_z)
end

function sly3_unlock_all_gadgets()
	local table = { 255, 255, 255, 255, 255, 255, 255, 255 }
	API:WriteMemory(0x6CC7F8, Convert.TableToByteArray(table))
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
	-- Restores the juice meter back to normal
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x17C,1)
end

function sly3_remove_invulnerability()
	-- Restores the juice meter back to normal
	entity_address = Memory.ReadInt(0x5EC654)
	Memory.WriteInt(entity_address + 0x17C,0)
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

function sly3_disable_guard_ai()
	Memory.WriteInt(0x5EC6CC, 1)
end

function sly3_restore_guard_ai()
	Memory.WriteInt(0x5EC6CC, 0)
end
