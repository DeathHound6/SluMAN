function get_map_aob_value(name)
	-- Returns the map FK$Y code corresponding the desired map

	if	    name == "Main Menu"						then return "Y$KFdvd_menu"
	elseif  name == "Hazard Room"					then return "Y$KFi_trainer"
	elseif  name == "Venice Hub"					then return "Y$KFv_ext"
	elseif  name == "    Canal Chase"				then return "Y$KFv_canal"
	elseif  name == "    Coffee House"				then return "Y$KFv_apt"
	elseif  name == "    Opera House"				then return "Y$KFv_gauntlet"
	elseif  name == "    Police Station"			then return "Y$KFv_interpol"
	elseif  name == "Outback Hub"					then return "Y$KFo_ext"
	elseif  name == "    Ayer's Rock"				then return "Y$KFo_quarry"
	elseif  name == "    Oil Field"					then return "Y$KFo_arena"
	elseif  name == "    Cave 1"					then return "Y$KFo_cave_a"
	elseif  name == "    Cave 2"					then return "Y$KFo_cave_b"
	elseif  name == "    Cave 3"					then return "Y$KFo_cave_murray"
	elseif  name == "    Lemonade Bar"				then return "Y$KFo_bar"
	elseif  name == "Holland Hub"					then return "Y$KFh_ext"
	elseif  name == "    Hotel"						then return "Y$KFh_hotel"
	elseif  name == "    Black Baron's Hangar"		then return "Y$KFh_hangar_b"
	elseif  name == "    Cooper Gang Hangar"		then return "Y$KFh_hangar_a"
	elseif  name == "    Team Belgium's Hangar"		then return "Y$KFh_hangar_c"
	elseif  name == "    Sewer"						then return "Y$KFh_sewer"
	elseif  name == "    Dogfight Arena"			then return "Y$KFh_dogfight"
	elseif  name == "    Hackathon Map"				then return "Y$KFh_hack"
	elseif  name == "China Hub"						then return "Y$KFc_ext"
	elseif  name == "    Intro"						then return "Y$KFc_intro"
	elseif  name == "    Flashback"					then return "Y$KFc_flashback"
	elseif  name == "    Tsao's Battleground"		then return "Y$KFc_forest"
	elseif  name == "    Panda King's House"		then return "Y$KFc_apt"
	elseif  name == "    Tsao's Business Center"	then return "Y$KFc_hall_a"
	elseif  name == "    Palace"					then return "Y$KFc_hall_b"
	elseif  name == "    Treasure Temple"			then return "Y$KFc_tilt_hall"
	elseif  name == "Pirate Hub"					then return "Y$KFp_ext"
	elseif  name == "    Sailing Map"				then return "Y$KFp_at_sea"
	elseif  name == "    Underwater Shipwreck"		then return "Y$KFp_dive"
	elseif  name == "    Dagger Island"				then return "Y$KFp_island_map"
	elseif  name == "Kaine Island"					then return "Y$KFm_ext"
	elseif  name == "    Underwater"				then return "Y$KFm_underwater"
	elseif  name == "    Cooper Vault"				then return "Y$KFm_vault"
	elseif  name == "    Gauntlet"					then return "Y$KFm_gauntlet"
	elseif  name == "    Inner Sanctum"				then return "Y$KFm_boss"
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
	Memory.WriteInt(0x78D2C8, 0)
	Memory.WriteInt(0x78D2CC, 0)
	Memory.WriteInt(0x78D2D0, 0)
	Memory.WriteInt(0x78D2D4, 0)
	Memory.WriteInt(0x78D2D8, 0)
	Memory.WriteInt(0x78D2DC, 0)
	Memory.WriteInt(0x78D2E0, 0)
	Memory.WriteInt(0x78D2E4, 0)
	-- Sets the map name
	API:WriteMemory(0x78D2C8, map_name)
	-- Sets the spawn location as default
	-- If this is not handled, player might spawn in void
	--print(map_name)
	--print(get_default_spawn_location(map_name).tostring())
	--API:WriteMemory(0x78D308, get_default_spawn_location(map_name))
end

function sly3_load_map(map_name)
	sly3_set_map(map_name)
	sly3_reset_job()
	sly3_load()
end