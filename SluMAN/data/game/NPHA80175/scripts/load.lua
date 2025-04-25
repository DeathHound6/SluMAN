-- Loading related functions

function sly2_reload()
	Memory.WriteInt(0x7B4C54, 0)
	Memory.WriteInt(0x7B4C50, 1)
end

function sly2_full_load()
	Memory.WriteInt(0x7B4C54, 17)
	Memory.WriteInt(0x7B4C50, 1)
end