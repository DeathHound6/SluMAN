function sly3_set_coincount(coins)
	Memory.WriteInt(0x6CC808, coins)
end

function sly3_get_cointcount()
	return Memory.ReadInt(0x6CC808)
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

function sly3_reload_cp()
	Memory.WriteInt(0x78D2C4, 4)

	Memory.WriteInt(0x5EB488, 2117)
	Memory.WriteInt(0x5EB48C, 2154)
	Memory.WriteInt(0x5EB490, 2154)

	Memory.WriteInt(0x78D2C0, 1)
end

function sly3_set_map(map_name)
	-- Loads a map from the memory
	-- Spawn location should be spesified separately	

	-- map_name: string (such as "v_ext" or "h_hotel")

	-- Clears the memory
	Memory.WriteInt(0x78D2C8, 0)
	Memory.WriteInt(0x78D2CC, 0)
	Memory.WriteInt(0x78D2D0, 0)
	Memory.WriteInt(0x78D2D4, 0)
	Memory.WriteInt(0x78D2D8, 0)
	Memory.WriteInt(0x78D2DC, 0)
	Memory.WriteInt(0x78D2E0, 0)
	Memory.WriteInt(0x78D2E4, 0)

	-- Sets the map name and reloads the game
	API:WriteMemory(0x78D2C8, "Y$KF" .. map_name)

end


function sly3_load_map(map_name)
	sly3_set_map(map_name)
	sly3_load()
end


function sly3_load_location(location_name)
	sly3_insta_load()
end



function sly3_load()
	Memory.WriteInt(0x78D2C4, 14)
	Memory.WriteInt(0x78D2C0, 1)
end

function sly3_insta_load()
	Memory.WriteInt(0x78D2C4, 0)
	Memory.WriteInt(0x78D2C0, 1)
end

function sly3_full_load()
	Memory.WriteInt(0x78D2C4, 15)
	Memory.WriteInt(0x78D2C0, 1)
end

function sly3_get_coordinates(entity_address)
	trf_address = Memory.ReadInt(entity_address+0x44)
	x = Memory.ReadFloat(trf_address+0x130)
	y = Memory.ReadFloat(trf_address+0x134)
	z = Memory.ReadFloat(trf_address+0x138)
	return {x,y,z}
end

function sly3_load_job(job_index)
	rl_value = 0
	job_id = sly3_get_job_id(job_index)

	if		job_id == 1798	then 
		rl_value = 1799
		sly3_set_map("m_ext")
	elseif	job_id == 2117  then 
		rl_value = 2118
		sly3_set_map("v_ext")
	elseif	job_id == 2261	then 
		rl_value = 2268
		sly3_set_map("v_ext")
	elseif	job_id == 2314	then 
		rl_value = 2315
		sly3_set_map("v_ext")
	elseif	job_id == 2360	then 
		rl_value = 2362
		sly3_set_map("v_ext")
	elseif	job_id == 2170	then 
		rl_value = 2172
		sly3_set_map("v_ext")
	elseif	job_id == 2199	then 
		rl_value = 2202
		sly3_set_map("v_ext")
	elseif	job_id == 2218	then 
		rl_value = 2223
		sly3_set_map("v_ext")
	elseif	job_id == 2382	then 
		rl_value = 2383
		sly3_set_map("v_ext")
	elseif	job_id == 2448	then 
		rl_value = 2453
		sly3_set_map("v_ext")
	else					     
		return
	end

	Memory.WriteInt(0x5EB488, job_id)
	Memory.WriteInt(0x5EB490, rl_value)
	sly3_load()
	

end


function sly3_get_job_id(index)
	if		index == 0	then return 1798
	elseif	index == 1	then return 2117
	elseif	index == 2	then return 2261
	elseif	index == 3	then return 2314
	elseif	index == 4	then return 2360
	elseif	index == 5	then return 2170
	elseif	index == 6	then return 2199
	elseif	index == 7	then return 2218
	elseif	index == 8	then return 2382
	elseif	index == 9	then return 2448
	else				     return 0
	end
end



function toBits(num, bits)
    -- returns a table of bits
    local t={} -- will contain the bits
    for b=bits,1,-1 do
        rest=math.fmod(num,2)
        t[b]=rest
        num=(num-rest)/2
    end
    if num==0 then return t else return {'Not enough bits to represent this number'}end
end