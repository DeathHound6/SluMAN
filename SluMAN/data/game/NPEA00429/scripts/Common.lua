function sly4_set_coincount(coins)
	Memory.WriteInt(0x336011e0, coins)
end

function sly4_get_cointcount()
	return Memory.ReadInt(0x3E8BF4)
end

function sly4_save_pos()
	sly1_saved_pos = API:ReadMemory(Memory.ReadInt(0x429904) + 0x100, 12)
	sly1_saved_vel = API:ReadMemory(Memory.ReadInt(0x429904) + 0x150, 12)
end

function sly4_load_pos()
	if sly1_saved_pos ~= nil then
		API:WriteMemory(Memory.ReadInt(0x429904) + 0x100, sly1_saved_pos)
	end
	if sly1_saved_vel ~= nil then
		API:WriteMemory(Memory.ReadInt(0x429904) + 0x150, sly1_saved_vel)
	end
end

function sly4_unlock_gadgets()
	local table = {
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1
	}
	API:WriteMemory(0x3e8c02, Convert.TableToByteArray(table))
end

function sly4_remove_gadgets()
	local table = {
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0
	}
	API:WriteMemory(0x3e8c02, Convert.TableToByteArray(table))
end

local sly1_freeze_charms_subid = nil
function rc4_set_freeze_charms(enabled)
	if enabled then
		sly1_freeze_charms_subid = API:FreezeMemory(0x3e8bf0, Convert.IntToByteArray(200,4))
	else
		API:ReleaseSubID(sly1_freeze_charms_subid)
	end
end