-- Loading related functions

function sly3_load_location(location_name)
	sly3_insta_load()
end

function sly3_load()
	Memory.WriteInt(0x78D2C4, 6)
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