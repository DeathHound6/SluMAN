function sly3_set_gadget_state(name, state)
	print("Setting gadget state: " .. name .. " to " .. tostring(state))
	if name == "fishing_pole" then sly3_set_gadget(1, state)
	elseif name == "trigger_bomb" then sly3_set_gadget(2, state)
	elseif name == "bentley_bomb" then sly3_set_gadget(4, state)
	elseif name == "binocucom" then sly3_set_gadget(5, state)
	elseif name == "attacks" then sly3_set_gadget(6, state)
	elseif name == "rage_bomb" then sly3_set_gadget(9, state)
	elseif name == "size_destabilizer" then sly3_set_gadget(10, state)
	elseif name == "grapple_cam" then sly3_set_gadget(11, state)
	elseif name == "insanity_strike" then sly3_set_gadget(12, state)
	elseif name == "hover_pack" then sly3_set_gadget(13, state)
	elseif name == "health_extractor" then sly3_set_gadget(14, state)
	elseif name == "adrenaline_burst" then sly3_set_gadget(15, state)
	elseif name == "alarm_clock" then sly3_set_gadget(16, state)
	elseif name == "raging_inferno_flop" then sly3_set_gadget(17, state)
	elseif name == "temporal_lock" then sly3_set_gadget(18, state)
	elseif name == "fists_of_flame" then sly3_set_gadget(19, state)
	elseif name == "guttural_roar" then sly3_set_gadget(20, state)
	elseif name == "juggernaut_throw" then sly3_set_gadget(21, state)
	elseif name == "berserker_charge" then sly3_set_gadget(22, state)
	elseif name == "be_the_ball" then sly3_set_gadget(23, state)
	elseif name == "reduction_bomb" then sly3_set_gadget(24, state)
	elseif name == "knockout_dive" then sly3_set_gadget(25, state)
	elseif name == "mega_jump" then sly3_set_gadget(26, state)
	elseif name == "feral_pounce" then sly3_set_gadget(27, state)
	elseif name == "silent_obliteration" then sly3_set_gadget(28, state)
	elseif name == "paraglider" then sly3_set_gadget(29, state)
	elseif name == "combat_dodge" then sly3_set_gadget(30, state)
	elseif name == "smoke_bomb" then sly3_set_gadget(31, state)
	elseif name == "diablo_fire_slam" then sly3_set_gadget(32, state)
	elseif name == "photographer_disguise" then sly3_set_gadget(33, state)
	elseif name == "venice_disguise" then sly3_set_gadget(34, state)
	elseif name == "shield" then sly3_set_gadget(35, state)
	elseif name == "treasure_map" then sly3_set_gadget(36, state)
	elseif name == "rocket_boots" then sly3_set_gadget(37, state)
	elseif name == "shadow_power_2" then sly3_set_gadget(38, state)
	elseif name == "thief_reflexes" then sly3_set_gadget(39, state)
	elseif name == "shadow_power_1" then sly3_set_gadget(40, state)
	elseif name == "push_attack_1" then sly3_set_gadget(41, state)
	elseif name == "jump_attack_3" then sly3_set_gadget(42, state)
	elseif name == "jump_attack_2" then sly3_set_gadget(43, state)
	elseif name == "jump_attack_1" then sly3_set_gadget(44, state)
	elseif name == "spin_attack_3" then sly3_set_gadget(45, state)
	elseif name == "spin_attack_2" then sly3_set_gadget(46, state)
	elseif name == "spin_attack_1" then sly3_set_gadget(47, state)
	elseif name == "pirate_disguise" then sly3_set_gadget(48, state)
	elseif name == "push_attack_3" then sly3_set_gadget(55, state)
	elseif name == "push_attack_2" then sly3_set_gadget(56, state)
	end
end

function sly3_remove_all_gadgets()
	local table = { 0, 0, 0, 0, 0, 0, 0, 0 }
	API:WriteMemory(0x6CC7F8, Convert.TableToByteArray(table))
end

function sly3_unlock_all_gadgets()
	local table = { 255, 255, 255, 255, 255, 255, 255, 255 }
	API:WriteMemory(0x6CC7F8, Convert.TableToByteArray(table))
end

function sly3_get_unlocked_gadgets()
	local gadgets = {}
	for i = 0, 7 do
		local byte = Memory.ReadByte(0x6CC7F8 + i)
		local bits = Convert.ByteToBits(byte)

		for j, bit in ipairs(bits) do
			gadgets[i * 8 + j] = bit
		end
	end
	return gadgets
end

function sly3_set_unlocked_gadgets(gadgets)
	for i = 0, 1 do
		local bits = {}
		for j = 1, 32 do
			bits[j] = gadgets[32 * i + j]
		end
		Memory.WriteInt(0x6CC7F8 + 4 * i, Convert.BitsToInt(bits))
	end
end

function sly3_set_gadget(index, value)
	local gadgets = sly3_get_unlocked_gadgets()
	gadgets[index] = value
	sly3_set_unlocked_gadgets(gadgets)
end

function sly3_bind_gadget(name, button_index)
	local gadgets = {}
	local base = 0x6CC7B0
	local gadget_index = 0

	if name == "fishing_pole" then gadget_index = 7
	elseif name == "trigger_bomb" then gadget_index = 6
	elseif name == "rage_bomb" then gadget_index = 15
	elseif name == "size_destabilizer" then gadget_index = 14
	elseif name == "grapple_cam" then gadget_index = 13
	elseif name == "insanity_strike" then gadget_index = 12
	elseif name == "health_extractor" then gadget_index = 10
	elseif name == "adrenaline_burst" then gadget_index = 9
	elseif name == "alarm_clock" then gadget_index = 8
	elseif name == "raging_inferno_flop" then gadget_index = 23
	elseif name == "temporal_lock" then gadget_index = 22
	elseif name == "fists_of_flame" then gadget_index = 21
	elseif name == "guttural_roar" then gadget_index = 20
	elseif name == "berserker_charge" then gadget_index = 18
	elseif name == "be_the_ball" then gadget_index = 17
	elseif name == "reduction_bomb" then gadget_index = 16
	elseif name == "knockout_dive" then gadget_index = 31
	elseif name == "mega_jump" then gadget_index = 30
	elseif name == "feral_pounce" then gadget_index = 29
	elseif name == "combat_dodge" then gadget_index = 26
	elseif name == "smoke_bomb" then gadget_index = 25
	elseif name == "diablo_fire_slam" then gadget_index = 24
	elseif name == "photographer_disguise" then gadget_index = 39
	elseif name == "venice_disguise" then gadget_index = 38
	elseif name == "shield" then gadget_index = 37
	elseif name == "treasure_map" then gadget_index = 36
	elseif name == "rocket_boots" then gadget_index = 35
	elseif name == "shadow_power_2" then gadget_index = 34
	elseif name == "thief_reflexes" then gadget_index = 33
	elseif name == "shadow_power_1" then gadget_index = 32
	elseif name == "pirate_disguise" then gadget_index = 40
	end

	-- Check first if gadget is already binded and unbind in that case
	for i = 1, 9 do
		if gadget_index == Memory.ReadInt(base + i * 4) then
			Memory.WriteInt(base + i * 4, -1)
			break
		end
	end

	if button_index == 4 then return end

	if gadget_index < 17 or gadget_index == 24 then
		Memory.WriteInt(base + (button_index + 3) * 4, gadget_index)
	elseif gadget_index < 24 or gadget_index == 32 then
		Memory.WriteInt(base + (button_index + 6) * 4, gadget_index)
	elseif gadget_index < 57 then
		Memory.WriteInt(base + button_index * 4, gadget_index)
	else return
	end
	sly3_set_gadget_state(name, 1)
end

function format_string(input)
    local formatted = string.gsub(input, " ", "_")
	formatted = string.gsub(formatted, "-", "_")
    formatted = string.lower(formatted)
    return formatted
end
