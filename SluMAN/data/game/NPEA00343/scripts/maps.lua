function get_map_aob_value(name)
	-- Returns the map FK$Y code corresponding the desired map
	local map_name = get_map_true_name(name)
	if map_name == "" then return "" end
	return ("Y$KF" .. get_map_true_name(name))
end

function get_map_true_name(name)
	if	    name == "Main Menu"						then return "dvd_menu"
	elseif  name == "Hazard Room"					then return "i_trainer"
	elseif  name == "Venice Hub"					then return "v_ext"
	elseif  name == "    Canal Chase"				then return "v_canal"
	elseif  name == "    Coffee House"				then return "v_apt"
	elseif  name == "    Opera House"				then return "v_gauntlet"
	elseif  name == "    Police Station"			then return "v_interpol"
	elseif  name == "Outback Hub"					then return "o_ext"
	elseif  name == "    Ayer's Rock"				then return "o_quarry"
	elseif  name == "    Oil Field"					then return "o_arena"
	elseif  name == "    Cave 1"					then return "o_cave_a"
	elseif  name == "    Cave 2"					then return "o_cave_b"
	elseif  name == "    Cave 3"					then return "o_cave_murray"
	elseif  name == "    Lemonade Bar"				then return "o_bar"
	elseif  name == "Holland Hub"					then return "h_ext"
	elseif  name == "    Hotel"						then return "h_hotel"
	elseif  name == "    Black Baron's Hangar"		then return "h_hangar_b"
	elseif  name == "    Cooper Gang Hangar"		then return "h_hangar_a"
	elseif  name == "    Team Belgium's Hangar"		then return "h_hangar_c"
	elseif  name == "    Sewer"						then return "h_sewer"
	elseif  name == "    Dogfight Arena"			then return "h_dogfight"
	elseif  name == "    Hackathon Map"				then return "h_hack"
	elseif  name == "China Hub"						then return "c_ext"
	elseif  name == "    Intro"						then return "c_intro"
	elseif  name == "    Flashback"					then return "c_flashback"
	elseif  name == "    Tsao's Battleground"		then return "c_forest"
	elseif  name == "    Panda King's House"		then return "c_apt"
	elseif  name == "    Tsao's Business Center"	then return "c_hall_a"
	elseif  name == "    Palace"					then return "c_hall_b"
	elseif  name == "    Treasure Temple"			then return "c_tilt_hall"
	elseif  name == "Pirate Hub"					then return "p_ext"
	elseif  name == "    Sailing Map"				then return "p_at_sea"
	elseif  name == "    Underwater Shipwreck"		then return "p_dive"
	elseif  name == "    Dagger Island"				then return "p_island_map"
	elseif  name == "Kaine Island"					then return "m_ext"
	elseif  name == "    Underwater"				then return "m_underwater"
	elseif  name == "    Cooper Vault"				then return "m_vault"
	elseif  name == "    Gauntlet"					then return "m_gauntlet"
	elseif  name == "    Inner Sanctum"				then return "m_boss"
	end
	--print("Error reading map name: option {"...name..."} does not exists")
	return ""
end

function get_default_spawn_location(map_name)
	-- Return the default spawn location ID for the map
	if	    map_name == "Y$KFdvd_menu"			then return 0
	elseif  map_name == "Y$KFi_trainer"			then return 424
	elseif  map_name == "Y$KFv_ext"				then return 44438
	elseif  map_name == "Y$KFv_canal"			then return 0
	elseif  map_name == "Y$KFv_apt"				then return 0
	elseif  map_name == "Y$KFv_gauntlet"		then return 0
	elseif  map_name == "Y$KFv_interpol"		then return 0
	elseif  map_name == "Y$KFo_ext"				then return 44438
	elseif  map_name == "Y$KFo_quarry"			then return 0
	elseif  map_name == "Y$KFo_arena"			then return 0
	elseif  map_name == "Y$KFo_cave_a"			then return 0
	elseif  map_name == "Y$KFo_cave_b"			then return 0
	elseif  map_name == "Y$KFo_cave_murray"		then return 0
	elseif  map_name == "Y$KFo_bar"				then return 0
	elseif  map_name == "Y$KFh_ext"				then return 44438
	elseif  map_name == "Y$KFh_hotel"			then return 0
	elseif  map_name == "Y$KFh_hangar_b"		then return 0
	elseif  map_name == "Y$KFh_hangar_a"		then return 0
	elseif  map_name == "Y$KFh_hangar_c"		then return 0
	elseif  map_name == "Y$KFh_sewer"			then return 0
	elseif  map_name == "Y$KFh_dogfight"		then return 0
	elseif  map_name == "Y$KFh_hack"			then return 0
	elseif  map_name == "Y$KFc_ext"				then return 44438
	elseif  map_name == "Y$KFc_intro"			then return 0
	elseif  map_name == "Y$KFc_flashback"		then return 0
	elseif  map_name == "Y$KFc_forest"			then return 0
	elseif  map_name == "Y$KFc_apt"				then return 0
	elseif  map_name == "Y$KFc_hall_a"			then return 0
	elseif  map_name == "Y$KFc_hall_b"			then return 0
	elseif  map_name == "Y$KFc_tilt_hall"		then return 0
	elseif  map_name == "Y$KFp_ext"				then return 44438
	elseif  map_name == "Y$KFp_at_sea"			then return 0
	elseif  map_name == "Y$KFp_dive"			then return 0
	elseif  map_name == "Y$KFp_island_map"		then return 0
	elseif  map_name == "Y$KFm_ext"				then return 15022
	elseif  map_name == "Y$KFm_underwater"		then return 0
	elseif  map_name == "Y$KFm_vault"			then return 0
	elseif  map_name == "Y$KFm_gauntlet"		then return 0
	elseif  map_name == "Y$KFm_boss"			then return 0
	end
	--print("Error reading map name: map name {"...map_name..."} does not exists.")
	return 0
end

function sly3_set_map(map_name)
	-- Loads a map from the memory
	-- Spawn location should be spesified separately	
	-- map_name: string (such as "v_ext" or "h_hotel")
	-- Clears the memory
	for i = 0,7 do
		Memory.WriteInt(0x78D2C8 + (i * 4), 0)
	end
	-- Sets the map name
	API:WriteMemory(0x78D2C8, map_name)
	-- Sets the spawn location as default
	-- If this is not handled, player might spawn in void
	--, get_default_spawn_location(map_name))
end

function sly3_load_map(map_name)
	sly3_set_map(map_name)
	Memory.WriteInt(0x78D308, get_default_spawn_location(map_name))
	local warp_locations = sly3_get_current_warp_locations()
	MainForm:ClearDropDown("warpLocationDropDown")
	for i = 1, #warp_locations do
		print(tostring(warp_locations[i]))
		MainForm:AddItemToDropDown( warp_locations[i], "warpLocationDropDown")
	end
	sly3_reset_job()
	sly3_load()
end

function sly3_get_current_warp_locations()
	local map_name = get_map_true_name(Trainer.GetControlByName("mapsDropDown").Text)
	if	    map_name == "dvd_menu"			then return {""}
	elseif  map_name == "i_trainer"			then return {""}
	elseif  map_name == "v_ext"				then return {"Safehouse", "Police HQ", "Opera House", "Coffee House 1", "Coffee House 2", "Coffee House 3", "Rialto Bridge", "Firework Shop"}
	elseif  map_name == "v_canal"			then return {""}
	elseif  map_name == "v_apt"				then return {"Coffee House 1", "Coffee House 2", "Coffee House 3"}
	elseif  map_name == "v_gauntlet"		then return {"Main Entrance", "Pump Room", "Cellar Entrance", "Water Room Entrance", "Water Room Exit", "Computer Room"}
	elseif  map_name == "v_interpol"		then return {"Cell", "Office"}
	elseif  map_name == "o_ext"				then return {""}
	elseif  map_name == "o_quarry"			then return {""}
	elseif  map_name == "o_arena"			then return {""}
	elseif  map_name == "o_cave_a"			then return {""}
	elseif  map_name == "o_cave_b"			then return {""}
	elseif  map_name == "o_cave_murray"		then return {""}
	elseif  map_name == "o_bar"				then return {""}
	elseif  map_name == "h_ext"				then return {""}
	elseif  map_name == "h_hotel"			then return {""}
	elseif  map_name == "h_hangar_b"		then return {""}
	elseif  map_name == "h_hangar_a"		then return {""}
	elseif  map_name == "h_hangar_c"		then return {""}
	elseif  map_name == "h_sewer"			then return {""}
	elseif  map_name == "h_dogfight"		then return {""}
	elseif  map_name == "h_hack"			then return {""}
	elseif  map_name == "c_ext"				then return {""}
	elseif  map_name == "c_intro"			then return {""}
	elseif  map_name == "c_flashback"		then return {""}
	elseif  map_name == "c_forest"			then return {""}
	elseif  map_name == "c_apt"				then return {""}
	elseif  map_name == "c_hall_a"			then return {""}
	elseif  map_name == "c_hall_b"			then return {""}
	elseif  map_name == "c_tilt_hall"		then return {""}
	elseif  map_name == "p_ext"				then return {""}
	elseif  map_name == "p_at_sea"			then return {""}
	elseif  map_name == "p_dive"			then return {""}
	elseif  map_name == "p_island_map"		then return {""}
	elseif  map_name == "m_ext"				then return {""}
	elseif  map_name == "m_underwater"		then return {""}
	elseif  map_name == "m_vault"			then return {""}
	elseif  map_name == "m_gauntlet"		then return {""}
	elseif  map_name == "m_boss"			then return {""}
	end
end