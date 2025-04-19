function sly3_get_active_character()
	local char_pointer = Memory.ReadInt(0x5EC654)
	local char_id = Memory.ReadInt(char_pointer + 0x18)
	return char_id
end

function sly3_set_active_character(char_id)
	Memory.WriteInt(0x5EA000, char_id)
end

function sly3_get_available_characters()
	local char_states = {0,0,0,0,0,0,0,0,0,0}
	local addresses = {0x5ED940, 0x509614, 0x5EE978, 0x6D38F0, 0x5096F8, 0x5EE980, 0x5EE97C, 0x78C3A4, 0x78C390, 0x78C1DC}
	local names = {"sly", "bentley", "murray", "guru", "carmelita", "penelope", "panda_king", "dimitri", "rc_car", "rc_copter"}

	-- Character is available if it has a pointer address
	for i = 1, #addresses do
		if Memory.ReadInt(addresses[i]) > 0 then
			char_states[i] = 1
		end
	end

	-- DEBUG PRINT
	for i = 1, #chars do
		print(tostring(char_states[i]) .. " " .. names[i])
	end
	-- END DEBUG

	return chars
end