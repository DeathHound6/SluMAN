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
	return ""
end

function get_reload_spawn_value( name)
	if		name == "Safe House"					then return 424
	elseif	name == "Police HQ Start"				then return 49981
	elseif	name == "In front of Safe House"		then return 44438
	elseif  name == "Outside Police HQ"				then return 51210
	elseif  name == "Top of a building"				then return 0
	end
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

	-- Sets the map name and reloads the game
	API:WriteMemory(0x78D2C8, map_name)

end

function sly3_load_map(map_name)
	sly3_set_map(map_name)
	sly3_reset_job()
	sly3_load()
end