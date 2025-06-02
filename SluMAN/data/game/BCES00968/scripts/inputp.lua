-- 48b976
-- 48B97E
--[[
if string.find(tostring(Racman.API), "RPCS3") then 
	Racman:MakeAddressInputProviderIfNull(0x48B976, 0x1, false, 0x48b8fc, true, false)
else
	Racman:MakeAddressInputProviderIfNull(0x48B976, 0x1, true, 0x48b8fc, false, false)
end
]]--