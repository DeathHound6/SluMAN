function SetJobIndex(value)
	-- TODO: Add Sly 3
	if gameName == "Sly 2" then
		Memory.WriteInt(0x4895F4, value)
	end
end

function SetJobCheckPointIndex(value)
	-- TODO: Add Sly 3
	if gameName == "Sly 2" then
		Memory.WriteInt(0x4895F8, value)
		Memory.WriteInt(0x4895FC, value)
	end
end

function sly_trilogy_reset_job()
	-- TODO: Add Sly 3
	if gameName == "Sly 2" then
		Memory.WriteInt(0x4895F4, -1)
		Memory.WriteInt(0x4895F8, -1)
		Memory.WriteInt(0x4895FC, -1)
	end
end

--[[
function ResetPreviousJob()
	sly_trilogy_reset_job()
	local current_job = Memory.ReadInt(0x4895F4)
	ResetJob(current_job)
end
]]--