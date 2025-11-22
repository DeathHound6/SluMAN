function sly2_set_gadget_state(name, state)
	if name == "trigger_bomb" then sly2_set_gadget(1, state)
	elseif name == "size_destabilizer" then sly2_set_gadget(16, state)
	elseif name == "snooze_bomb" then sly2_set_gadget(15, state)
	elseif name == "adrenaline_burst" then sly2_set_gadget(14, state)
	elseif name == "health_extractor" then sly2_set_gadget(13, state)
	elseif name == "hover_pack" then sly2_set_gadget(12, state)
	elseif name == "reduction_bomb" then sly2_set_gadget(11, state)
	elseif name == "temporal_lock" then sly2_set_gadget(10, state)
	elseif name == "fists_of_flame" then sly2_set_gadget(9, state)
	elseif name == "turnbuckle_launch" then sly2_set_gadget(24, state)
	elseif name == "juggernaut_throw" then sly2_set_gadget(23, state)
	elseif name == "atlas_strength" then sly2_set_gadget(22, state)
	elseif name == "diablo_fire_slam" then sly2_set_gadget(21, state)
	elseif name == "berserker_charge" then sly2_set_gadget(20, state)
	elseif name == "guttural_roar" then sly2_set_gadget(19, state)
	elseif name == "raging_inferno_flop" then sly2_set_gadget(18, state)
	elseif name == "smoke_bomb" then sly2_set_gadget(17, state)
	elseif name == "mega_jump" then sly2_set_gadget(25, state)
	elseif name == "feral_pounce" then sly2_set_gadget(26, state)
	elseif name == "thief_reflexes" then sly2_set_gadget(27, state)
	elseif name == "silent_obliteration" then sly2_set_gadget(28, state)
	elseif name == "paraglider" then sly2_set_gadget(29, state)
	elseif name == "alarm_clock" then sly2_set_gadget(30, state)
	elseif name == "stealth_slide" then sly2_set_gadget(31, state)
	elseif name == "combat_dodge" then sly2_set_gadget(32, state)
	elseif name == "lighting_spin" then sly2_set_gadget(33, state)
	elseif name == "music_box" then sly2_set_gadget(34, state)
	elseif name == "rage_bomb" then sly2_set_gadget(35, state)
	elseif name == "long_toss" then sly2_set_gadget(36, state)
	elseif name == "voltage_attack" then sly2_set_gadget(37, state)
	elseif name == "insanity_strike" then sly2_set_gadget(38, state)
	elseif name == "knockout_dive" then sly2_set_gadget(39, state)
	elseif name == "time_rush" then sly2_set_gadget(46, state)
	elseif name == "tom" then sly2_set_gadget(47, state)
	elseif name == "shadow_power" then sly2_set_gadget(48, state)
	
	end

	-- Unbind gadget when disabled
	if state == 0 then
		sly2_bind_gadget(name, 4)
	end

end

function sly2_bind_gadget(name, button_index)
	local gadgets = {}
	local base = 0x7A836C -- Region starts at Sly L1 gadget
	local gadget_index = 0

	if name == "trigger_bomb" then gadget_index = 7
	elseif name == "size_destabilizer" then gadget_index = 8
	elseif name == "snooze_bomb" then gadget_index = 9
	elseif name == "adrenaline_burst" then gadget_index = 10
	elseif name == "health_extractor" then gadget_index = 11
	elseif name == "hover_pack" then gadget_index = 12
	elseif name == "reduction_bomb" then gadget_index = 13
	elseif name == "temporal_lock" then gadget_index = 14
	elseif name == "fists_of_flame" then gadget_index = 15
	elseif name == "turnbuckle_launch" then gadget_index = 16
	elseif name == "diablo_fire_slam" then gadget_index = 19
	elseif name == "berserker_charge" then gadget_index = 20
	elseif name == "guttural_roar" then gadget_index = 21
	elseif name == "raging_inferno_flop" then gadget_index = 22
	elseif name == "smoke_bomb" then gadget_index = 23
	elseif name == "mega_jump" then gadget_index = 31
	elseif name == "feral_pounce" then gadget_index = 30
	elseif name == "thief_reflexes" then gadget_index = 29
	elseif name == "alarm_clock" then gadget_index = 26
	elseif name == "stealth_slide" then gadget_index = 25
	elseif name == "combat_dodge" then gadget_index = 24
	elseif name == "lighting_spin" then gadget_index = 39
	elseif name == "music_box" then gadget_index = 38
	elseif name == "rage_bomb" then gadget_index = 37
	elseif name == "voltage_attack" then gadget_index = 35
	elseif name == "insanity_strike" then gadget_index = 34
	elseif name == "knockout_dive" then gadget_index = 33
	elseif name == "time_rush" then gadget_index = 42
	elseif name == "tom" then gadget_index = 41
	elseif name == "shadow_power" then gadget_index = 40
	end

	-- Check first if gadget is already binded and unbind in that case
	for i = 0, 15 do
		if gadget_index == Memory.ReadInt(base + i * 4) then
			Memory.WriteInt(base + i * 4, -1)
			break
		end
	end

	if button_index == 4 then return end

	if gadget_index > 22 then
		-- Sly
		Memory.WriteInt(base + button_index * 4, gadget_index)
	elseif gadget_index > 14 then
		-- Murray
		Memory.WriteInt(base + (button_index + 12) * 4, gadget_index)
	elseif gadget_index > 6 then
		-- Bentley
		Memory.WriteInt(base + (button_index + 6) * 4, gadget_index)
		
	else return
	end
	sly2_set_gadget_state(name, 1)
end

function change_gadget_state(new_state)
	local menu_name = Trainer.GetControlByName("gadgetSelectDropDown").Text
	local name = format_string(menu_name)
	sly2_set_gadget_state(name, new_state)
end

function bind_gadget(button_index)
	local menu_name = Trainer.GetControlByName("gadgetSelectDropDown").Text
	local name = format_string(menu_name)
	sly2_bind_gadget(name, button_index)
end

function sly2_unlock_all_gadgets()
	local table = { 255, 255, 255, 255, 255, 255, 255, 255 }
	API:WriteMemory(0x7A83A8, Convert.TableToByteArray(table))
end

function format_string(input)
    local formatted = string.gsub(input, " ", "_")
	formatted = string.gsub(formatted, "-", "_")
    formatted = string.lower(formatted)
    return formatted
end

function sly2_get_unlocked_gadgets()
	local gadgets = {}
	for i = 0, 7 do
		local byte = Memory.ReadByte(0x7A83A8 + i)
		local bits = byte_to_bits(byte)

		for j, bit in ipairs(bits) do
			gadgets[i * 8 + j] = bit
		end
	end
	return gadgets
end

function sly2_set_unlocked_gadgets(gadgets)
	for i = 0, 1 do
		local bits = {}
		for j = 1, 32 do
			bits[j] = gadgets[32 * i + j]
		end
		Memory.WriteInt(0x7A83A8 + 4 * i, bits_to_int32(bits))
	end
end

function sly2_set_gadget(index, value)
	local gadgets = sly2_get_unlocked_gadgets()
	gadgets[index] = value
	sly2_set_unlocked_gadgets(gadgets)
end

function byte_to_bits(byte)
    local bits = {}
    for i = 7, 0, -1 do
        bits[#bits + 1] = (byte >> i) & 1
    end
    return bits
end

-- Convert array of 8 bits to single byte
function bits_to_int32(bits)
    local value = 0
    for i = 1, 32 do
        value = (value << 1) | bits[i]
    end
    return value
end