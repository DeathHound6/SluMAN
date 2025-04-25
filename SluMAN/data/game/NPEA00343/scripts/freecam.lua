-- TODO
-- trying to test functionality in Venice Hub
-- not safe to use yet

function activate_freecam()

	table_entity = 0x35B0C0C0
	table_transform = Memory.ReadInt(table_entity + 0x44)
	
	character_entity = Memory.ReadInt(0x5EC654)
	character_transform = Memory.ReadInt(character_entity + 0x44)

	cx = Memory.ReadFloat(character_transform + 0x130)
	cy = Memory.ReadFloat(character_transform + 0x134)
	cz = Memory.ReadFloat(character_transform + 0x138)

	health_gui = Memory.ReadInt(character_entity + 0x164)
	Memory.WriteInt(health_gui + 0xC, 1)
	Memory.WriteInt(health_gui + 0x54, 1)

	Memory.WriteFloat(table_transform + 0x70, cx)
	Memory.WriteFloat(table_transform + 0x74, cy)
	Memory.WriteFloat(table_transform + 0x78, cz)

	camera_focus = 0x366EA200
	camera_reset = 0x36947138

	-- 
	Memory.WriteFloat(table_entity + 0x104, 0)

	-- Set focus to hideout table
	Memory.WriteInt(camera_focus, table_entity)
	Memory.WriteInt(camera_reset, table_entity)

end

function update_freecam()

	z = Memory.ReadInt(0x35B0C0C0 + 0x44)+0x78
	Memory.WriteFloat(z,Memory.ReadFloat(z)+1)

end

function deactivate_freecam()

	table_entity = 0x35B0C0C0
	table_transform = Memory.ReadInt(table_entity + 0x44)
	
	character_entity = Memory.ReadInt(0x5EC654)

	health_gui = Memory.ReadInt(character_entity + 0x164)
	Memory.WriteInt(health_gui + 0xC, 2)
	Memory.WriteInt(health_gui + 0x54, 1)

	--Memory.WriteFloat(table_transform + 0x70, cx)
	--Memory.WriteFloat(table_transform + 0x74, cy)
	--Memory.WriteFloat(table_transform + 0x78, cz)

	camera_focus = 0x366EA200
	camera_reset = 0x36947138

	-- Opacity
	Memory.WriteFloat(table_entity + 0x104, 1)

	-- Set focus back to character
	Memory.WriteInt(camera_focus, character_entity)
	Memory.WriteInt(camera_reset, character_entity)

end
