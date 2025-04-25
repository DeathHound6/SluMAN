function get_map_aob_value(name)
	-- Returns the map FK$Y code corresponding the desired map

	if	    name == "Museum"						then return "Y$KFjb_intro"
	elseif  name == "DVD Menu"						then return "Y$KFdvd_menu"
	elseif  name == "Paris Hub"						then return "Y$KFf_nightclub_exterior"
	elseif  name == "    Wine Cellar"				then return "Y$KFf_nightclub_cellar"
	elseif  name == "    Disco"						then return "Y$KFf_nightclub_disco"
	elseif  name == "    Print Room"				then return "Y$KFf_nightclub_heist"
	elseif  name == "    Theater"					then return "Y$KFf_nightclub_moulinrouge"
	elseif  name == "    Pump Room"					then return "Y$KFf_nightclub_waterpump"
	elseif  name == "Palace Hub"					then return "Y$KFi_palace_ext"
	elseif  name == "    Hotel"						then return "Y$KFi_palace_int"
	elseif  name == "    Basement"					then return "Y$KFi_palace_basement"
	elseif  name == "    Ballroom"					then return "Y$KFi_palace_ballroom"
	elseif  name == "Temple Hub"					then return "Y$KFi_temple_ext"
	elseif  name == "    Temple Interior"			then return "Y$KFi_temple_int"
	elseif  name == "Prison Hub"					then return "Y$KFp_prison_ext"
	elseif  name == "    Jail"						then return "Y$KFp_prison_int"
	elseif  name == "    Prison Vault"				then return "Y$KFp_prison_vault"
	elseif  name == "Castle Hub"					then return "Y$KFp_castle_ext"
	elseif  name == "    Interior"					then return "Y$KFp_castle_int"
	elseif  name == "    Waterrails"				then return "Y$KFp_castle_waterrails"
	elseif  name == "    Guardbreak"				then return "Y$KFp_castle_guardbreak"
	elseif  name == "    Wolftomb"					then return "Y$KFp_castle_wolftomb"
	elseif  name == "    Heist"						then return "Y$KFp_castle_heist"
	elseif  name == "    Ewoktrainer"				then return "Y$KFp_castle_ewoktrainer"
	elseif  name == "    Ewoktomb"					then return "Y$KFp_castle_ewoktomb"
	elseif  name == "    Ewokhall"					then return "Y$KFp_castle_ewokhall"
	elseif  name == "    Ewokwater"					then return "Y$KFp_castle_ewokwater"
	elseif  name == "Canada Hub"					then return "Y$KFc_train_ext"
	elseif  name == "    Cabins"					then return "Y$KFc_train_cabins"
	elseif  name == "    Train A"					then return "Y$KFc_train_a"
	elseif  name == "    Train B"					then return "Y$KFc_train_b"
	elseif  name == "    Train C"					then return "Y$KFc_train_c"
	elseif  name == "Sawmill Hub"					then return "Y$KFc_sawmill_ext"
	elseif  name == "    Mulch"						then return "Y$KFc_sawmill_mulch"
	elseif  name == "    Burn"						then return "Y$KFc_sawmill_burn"
	elseif  name == "    Lighthouse"				then return "Y$KFc_sawmill_lighthouse"
	elseif  name == "    Bearcave"					then return "Y$KFc_sawmill_bearcave"
	elseif  name == "    Bison\'s Saw"				then return "Y$KFc_sawmill_boss"
	elseif  name == "Blimp Hub"						then return "Y$KFa_blimp_ext"
	elseif  name == "    Arpeggio\'s Blimp"			then return "Y$KFa_blimp_int"
	elseif  name == "    Engine 1"					then return "Y$KFa_blimp_engine_room_murray"
	elseif  name == "    Engine 2"					then return "Y$KFa_blimp_engine_room_bentley"
	elseif  name == "    Engine 3"					then return "Y$KFa_blimp_engine_room_jt"
	elseif  name == "    Clock-La"					then return "Y$KFa_blimp_boss_final"
	end
	return ""
end

function sly2_set_map(map_name)
	-- Loads a map from the memory
	-- Spawn location should be spesified separately	

	-- map_name: string (such as "v_ext" or "h_hotel")

	-- Clears the memory
	Memory.WriteInt(0x7B4C58, 0)
	Memory.WriteInt(0x7B4C5C, 0)
	Memory.WriteInt(0x7B4C60, 0)
	Memory.WriteInt(0x7B4C64, 0)
	Memory.WriteInt(0x7B4C68, 0)
	Memory.WriteInt(0x7B4C6C, 0)
	Memory.WriteInt(0x7B4C70, 0)
	Memory.WriteInt(0x7B4C74, 0)
	Memory.WriteInt(0x7B4C78, 0)

	-- Sets the map name and reloads the game
	API:WriteMemory(0x7B4C58, map_name)

end

function sly2_load_map(map_name)
	sly2_set_map(map_name)
	sly2_reset_previous_job()
	sly2_reset_job()
	sly2_reload()
end