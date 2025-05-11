function load_job_helper(character_id, job_id, cp_id, location, map)
	
	sly2_set_map(map)
	Memory.WriteInt(0x7A830C, character_id)
	Memory.WriteInt(0x4FEBF4, job_id)
	Memory.WriteInt(0x4FEBFC, cp_id)
	Memory.WriteInt(0x7B4C98, location)
	
	-- disco demolitions is weird an requires this to work
	if (cp_id==2060 or cp_id==2888) then 
	Memory.WriteInt(0x4FEBF8, -1) 
	Memory.WriteInt(0x4FEBF4, -1)
	else Memory.WriteInt(0x4FEBF8, cp_id) end

	-- not play Paris intro cutscene
	if job_id<2000 then Memory.WriteInt(0x7A9AC0, 3) end
	
	Memory.WriteInt(0x7B4C54, 0) -- load type
	Memory.WriteInt(0x7B4C50, 1) -- trigger a load

end

function JobLoader(
	characterId,
	jobId,
	checkpointId,
	spawnLocationId,
	mapName)
	
	ResetJob(jobId)
	SetCharacter(characterId)
	SetJobIndex(jobId)
	SetMap("Y$KF" .. mapName)
	SetJobCheckPointIndex(checkpointId)
	SetSpawnLocationIndex(spawnLocationId)
	LoadGame(6)

end

function sly2_change_job_state(values, base)
	i = 1
	while values[i] do
		Memory.WriteInt(base,values[i])
		i=i+1
		base=base+0x4
	end
end

function sly2_job_loader(character_id, job_id, cp_id, location, map, values, base)
	sly2_change_job_state(values, base)
	load_job_helper(character_id, job_id, cp_id, location, map)
end

function ResetJob(jobId)
	if     jobId < 0    then return
	elseif jobId < 1697 then Memory.WriteTable(DAG_EP0_ADDR, DAG_EP0_STAR)
	elseif jobId < 1795 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_DAY0)
	elseif jobId < 1796 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_BREA)
	elseif jobId < 1827 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_DAY2)
	elseif jobId < 1859 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_DAY1)
	elseif jobId < 1882 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_DAY2)
	elseif jobId < 1900 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_DISC)
	elseif jobId < 1912 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_DAY1)
	elseif jobId < 2003 then Memory.WriteTable(DAG_EP1_ADDR, DAG_EP1_OPER)
	elseif jobId < 2004 then Memory.WriteTable(DAG_EP2_ADDR, DAG_EP2_DAY0)
	elseif jobId ==2042 then Memory.WriteTable(DAG_EP2_ADDR, DAG_EP2_DAY2)
	elseif jobId < 2077 then Memory.WriteTable(DAG_EP2_ADDR, DAG_EP2_DAY1)
	elseif jobId < 2085 then Memory.WriteTable(DAG_EP2_ADDR, DAG_EP2_DANC)
	elseif jobId < 2111 then Memory.WriteTable(DAG_EP2_ADDR, DAG_EP2_DAY2)
	elseif jobId < 2192 then Memory.WriteTable(DAG_EP2_ADDR, DAG_EP2_OPER)
	elseif jobId < 2193 then Memory.WriteTable(DAG_EP3_ADDR, DAG_EP3_DAY0)
	elseif jobId ==2235 then Memory.WriteTable(DAG_EP3_ADDR, DAG_EP3_DAY2)
	elseif jobId < 2255 then Memory.WriteTable(DAG_EP3_ADDR, DAG_EP3_DAY1)
	elseif jobId < 2318 then Memory.WriteTable(DAG_EP3_ADDR, DAG_EP3_DAY2)
	elseif jobId < 2411 then Memory.WriteTable(DAG_EP3_ADDR, DAG_EP3_OPER)
	elseif jobId < 2412 then Memory.WriteTable(DAG_EP4_ADDR, DAG_EP4_DAY0)
	elseif jobId < 2428 then Memory.WriteTable(DAG_EP4_ADDR, DAG_EP4_TRAI)
	elseif jobId < 2448 then Memory.WriteTable(DAG_EP4_ADDR, DAG_EP4_WALL)
	elseif jobId < 2553 then Memory.WriteTable(DAG_EP4_ADDR, DAG_EP4_DAY2)
	elseif jobId < 2645 then Memory.WriteTable(DAG_EP4_ADDR, DAG_EP4_OPER)
	elseif jobId < 2662 then Memory.WriteTable(DAG_EP5_ADDR, DAG_EP5_DAY0)
	elseif jobId < 2711 then Memory.WriteTable(DAG_EP5_ADDR, DAG_EP5_DAY1)
	elseif jobId < 2765 then Memory.WriteTable(DAG_EP5_ADDR, DAG_EP5_DAY2)
	elseif jobId < 2860 then Memory.WriteTable(DAG_EP5_ADDR, DAG_EP5_OPER)
	elseif jobId < 2883 then Memory.WriteTable(DAG_EP6_ADDR, DAG_EP6_DAY0)
	elseif jobId < 2909 then Memory.WriteTable(DAG_EP6_ADDR, DAG_EP6_DAY1)
	elseif jobId < 2962 then Memory.WriteTable(DAG_EP6_ADDR, DAG_EP6_DAY2)
	elseif jobId < 3037 then Memory.WriteTable(DAG_EP6_ADDR, DAG_EP6_OPER)
	elseif jobId < 3056 then Memory.WriteTable(DAG_EP7_ADDR, DAG_EP7_DAY0)
	elseif jobId < 3130 then Memory.WriteTable(DAG_EP7_ADDR, DAG_EP7_DAY1)
	elseif jobId < 3202 then Memory.WriteTable(DAG_EP7_ADDR, DAG_EP7_DAY2)
	elseif jobId < 3352 then Memory.WriteTable(DAG_EP7_ADDR, DAG_EP7_OPER)
	elseif jobId < 3390 then Memory.WriteTable(DAG_EP8_ADDR, DAG_EP8_DAY0)
	elseif jobId < 3464 then Memory.WriteTable(DAG_EP8_ADDR, DAG_EP8_DAY1)
	elseif jobId < 3477 then Memory.WriteTable(DAG_EP8_ADDR, DAG_EP8_MEGA)
	elseif jobId < 3500 then Memory.WriteTable(DAG_EP8_ADDR, DAG_EP8_CARM)
	end
end

function ResetPreviousJob()
	Memory.WriteInt(0x4FEBF4, -1)
	Memory.WriteInt(0x4FEBF8, -1)
	Memory.WriteInt(0x4FEBFC, -1)
	local current_job = Memory.ReadInt(0x4FEBF4)
	ResetJob(current_job)
end

function sly2_load_job(index)
	-- Loads a job based on the selection in the dropdown menu
	ResetPreviousJob()

	local name = Trainer.GetControlByName('jobSelectDropDown').Items[index] 
	-- using names instead of indices in case the order or contents are later changed

	-- If you change the names, remember to also change the name in trainer.json!
	if		name == "Cairo Museum Break-in"			then JobLoader(7, 1696, 1584, 148457, "jb_intro")
	elseif	name == "Satellite Sabotage"			then JobLoader(7, 1784, 1785, 122409, "f_nightclub_exterior")
	elseif	name == "Breaking and Entering"			then JobLoader(7, 1795, 1797, 397,    "f_nightclub_cellar")
	elseif	name == " [BnE] Crawl"					then JobLoader(7, 1795, 1802, 122447, "f_nightclub_cellar")
	elseif	name == " [BnE] Yellow Lasers"			then JobLoader(7, 1795, 1808, 122448, "f_nightclub_cellar")
	elseif	name == " [BnE] Print Room"				then JobLoader(7, 1795, 1814, 402,    "f_nightclub_heist")
	elseif	name == "Bug Dimitri\'s Office"			then JobLoader(7, 1833, 1834, 122459, "f_nightclub_exterior")
	elseif	name == " [BDO] Nightclub"				then JobLoader(7, 1833, 1834, 398,    "f_nightclub_disco")
	elseif	name == "Follow Dimitri"				then JobLoader(7, 1841, 1585, 122473, "f_nightclub_exterior")
	elseif	name == " [FD] Follow"					then JobLoader(7, 1841, 1842, 122475, "f_nightclub_exterior")
	elseif	name == "Waterpump Destruction"			then JobLoader(9, 1900, 1901, 399,    "f_nightclub_waterpump")
	elseif	name == "Silence the Alarms"			then JobLoader(9, 1826, 1586, 122451, "f_nightclub_exterior")
	elseif	name == "Moonlight Rendezvous"			then JobLoader(7, 1874, 1875, 122519, "f_nightclub_exterior")
	elseif	name == "Theater Pickpocketing"			then JobLoader(7, 1859, 1588, 400,    "f_nightclub_moulinrouge")
	elseif	name == "Disco Demolitions"				then JobLoader(8, 1882, 1587, 401,    "f_nightclub_disco")
	elseif	name == "OP: Thunder Beak"				then JobLoader(8, 1912, 1913, 27280,  "f_nightclub_exterior")
	elseif	name == " [TB] Steal the Key"			then JobLoader(7, 1912, 1923, 27280,  "f_nightclub_exterior")
	elseif	name == " [TB] Climb the Peacock"		then JobLoader(7, 1912, 1929, 27280,  "f_nightclub_exterior")
	elseif	name == " [TB] Dimitri Fight"			then JobLoader(7, 1912, 1943, 121308, "f_nightclub_heist")
	elseif	name == "Recon the Ballroom"			then JobLoader(7, 2003, 2006, 49223, "i_palace_ext")
	elseif	name == " [RtB] Pictures"				then JobLoader(7, 2003, 2007, 104738, "i_palace_ballroom")
	elseif	name == "Lower the Drawbridge"			then JobLoader(7, 2022, 2024, 105705, "i_palace_ext")
	elseif	name == "Steal a Tuxedo"				then JobLoader(7, 2059, 2060, 105779, "i_palace_int")
	elseif	name == "Battle the Chopper"			then JobLoader(9, 2034, 2035, 105722, "i_palace_ext")
	elseif	name == " [BtC] Chopper Fight"			then JobLoader(9, 2034, 2038, 105722, "i_palace_ext")
	elseif	name == "Dominate the Dance Floor"		then JobLoader(7, 2077, 2079, 105063, "i_palace_ext")
	elseif	name == " [DtDF] Dance"					then JobLoader(7, 2077, 2081, 105063, "i_palace_ballroom")
	elseif	name == "RC Bombing Run"				then JobLoader(8, 2085, 2087, 0,      "i_palace_ext")
	elseif	name == " [RBR] Destroy the Jeep"		then JobLoader(8, 2085, 2089, 0,      "i_palace_ext")
	elseif	name == "Elephant Rampage"				then JobLoader(7, 2092, 2094, 105619, "i_palace_ext")
	elseif	name == " [ER] Climb the Elephants"		then JobLoader(7, 2092, 2097, 105619, "i_palace_ext")
	elseif	name == "Boardroom Brawl"				then JobLoader(7, 2042, 1589, 105734, "i_palace_ext")
	elseif	name == " [BB] Protect Bentley"			then JobLoader(9, 2042, 1592, 105764, "i_palace_basement")
	elseif	name == "OP: Hippo Drop"				then JobLoader(8, 2111, 1593, 76733,  "i_palace_ext")
	elseif	name == " [HD] Second Floor"			then JobLoader(8, 2111, 2126, 105827, "i_palace_ext")
	elseif	name == " [HD] Dance"					then JobLoader(7, 2111, 1594, 105063, "i_palace_ballroom")
	elseif	name == " [HD] Protect Murray"			then JobLoader(9, 2141, 2143, 105685, "i_palace_ext")
	elseif	name == "Spice Room Recon"				then JobLoader(7, 2192, 2193, 403,    "i_temple_ext")
	elseif	name == " [SRR] Interior"				then JobLoader(7, 2192, 2196, 398,    "i_temple_int")
	elseif	name == "Freeing the Elephant"			then JobLoader(7, 2214, 2217, 96699,  "i_temple_ext")
	elseif	name == "Bug Rajan's Office"			then JobLoader(7, 2209, 2210, 96698,  "i_temple_ext")
	elseif	name == " [BRO] Office"					then JobLoader(7, 2209, 2210, 397,  "i_temple_int")
	elseif	name == "Leading Rajan"					then JobLoader(8, 2254, 2261, 96737,  "i_temple_ext")
	elseif	name == "Blow the Dam"					then JobLoader(8, 2302, 2305, 17505,  "i_temple_ext")
	elseif	name == "Spice Grinder Destruction"		then JobLoader(7, 2286, 2287, 400,    "i_temple_int")
	elseif	name == "Neyla's Secret"				then JobLoader(7, 2235, 2236, 401,    "i_temple_ext")
	elseif	name == "Rip-Off the Ruby"				then JobLoader(7, 2308, 2309, 96658,  "i_temple_ext")
	elseif	name == "OP: Wet Tiger"					then JobLoader(9, 2318, 2320, 33676,  "i_temple_ext")
	elseif	name == " [WT] Rajan fight"				then JobLoader(9, 2346, 2354, 96835,  "i_temple_ext")
	elseif	name == "Eavesdrop on Contessa"			then JobLoader(8, 2411, 2420, 17366,  "p_prison_ext")
	elseif	name == "Train Hack"					then JobLoader(8, 2427, 2433, 76660,  "p_prison_ext")
	elseif	name == "Wall Bombing"					then JobLoader(8, 2447, 2450, 76682,  "p_prison_ext")
	elseif	name == "Code Capture"					then JobLoader(7, 2505, 2507, 76753,  "p_prison_ext")
	elseif	name == "Lightning Action"				then JobLoader(7, 2473, 2475, 76716,  "p_prison_ext")
	elseif	name == "Close to Contessa"				then JobLoader(7, 2530, 2537, 76776,  "p_prison_ext")
	elseif	name == "Big House Brawl"				then JobLoader(7, 2464, 2465, 76697,  "p_prison_ext")
	elseif	name == "Disguise Bridge"				then JobLoader(7, 2494, 2495, 76733,  "p_prison_ext")
	elseif	name == "OP: Trojan Tank"				then JobLoader(8, 2553, 2556, 76786,  "p_prison_ext")
	elseif	name == "Know Your Enemy"				then JobLoader(7, 2645, 2646, 49223,	"p_castle_ext")
	elseif	name == "Ghost Capture"					then JobLoader(7, 2662, 2663, 59748,	"p_castle_ext")
	elseif	name == "Kidnap the General"			then JobLoader(9, 2701, 2702, 59820,	"p_castle_ext")
	elseif	name == "Mojo Trap Action"				then JobLoader(8, 2683, 2689, 393,	"p_castle_ewoktrainer")
	elseif	name == "Crypt Hack"					then JobLoader(8, 2746, 2748, 59882,	"p_castle_heist")
	elseif	name == "Tank Showdown"					then JobLoader(9, 2734, 2735, 59868,	"p_castle_ext")
	elseif	name == "Stealing Voices"				then JobLoader(7, 2711, 2712, 59827,	"p_castle_ext")
	elseif	name == "OP: High Road"					then JobLoader(9, 2765, 2766, 27280,	"p_castle_ext")
	elseif  name == "Cabin Crimes"					then JobLoader(7, 2860, 2861, 49223,	"c_train_ext")
	elseif  name == "Spice in the Sky"				then JobLoader(7, 2883, 2888, 49254,	"c_train_ext")
	elseif  name == "A Friend in Need"				then JobLoader(7, 2909, 2912, 49280,	"c_train_ext")
	elseif  name == "Ride the Iron Horse"			then JobLoader(8, 2904, 2905, 49276,	"c_train_ext")
	elseif  name == "Aerial Assault"				then JobLoader(8, 2933, 2934, 49304,	"c_train_ext")
	elseif  name == "Bear Cub Kidnapping"			then JobLoader(9, 2945, 2946, 49324,	"c_train_ext")
	elseif  name == "Theft on the Rails"			then JobLoader(7, 2939, 2940, 49310,	"c_train_ext")
	elseif  name == "OP: Choo-Choo"					then JobLoader(9, 2962, 2965, 27280,	"c_train_ext")
	elseif  name == "Recon the Sawmill"				then JobLoader(7, 3037, 3038, 33420,	"c_sawmill_ext")
	elseif  name == "Laser Redirection"				then JobLoader(7, 3101, 3102, 393,	"c_sawmill_burn")
	elseif  name == "Bearcave Bugging"				then JobLoader(7, 3056, 3057, 33437,	"c_sawmill_ext")
	elseif  name == "RC Combat Club"				then JobLoader(9, 3083, 3087, 33479,	"c_sawmill_ext")
	elseif  name == "Old Grizzle Face"				then JobLoader(9, 3146, 3149, 33583,	"c_sawmill_ext")
	elseif  name == "Lighthouse Break In"			then JobLoader(7, 3130, 3132, 33551,	"c_sawmill_ext")
	elseif  name == "Thermal Ride"					then JobLoader(7, 3188, 3190, 33645,	"c_sawmill_ext")
	elseif  name == "Boat Hack"						then JobLoader(8, 3156, 3158, 33596,	"c_sawmill_ext")
	elseif  name == "OP: Canada Games"				then JobLoader(8, 3202, 3208, 33664,	"c_sawmill_ext")
	elseif  name == "Blimp HQ Recon"				then JobLoader(7, 3352, 3354, 17366,	"a_blimp_ext")
	elseif  name == "Bentley/Murray Team Up"		then JobLoader(8, 3431, 3433, 17466,	"a_blimp_ext")
	elseif  name == "Murray/Sly Tag Team"			then JobLoader(9, 3401, 3403, 17420,	"a_blimp_ext")
	elseif  name == "Sly/Bentley Conspire"			then JobLoader(7, 3416, 3419, 17451,	"a_blimp_ext")
	elseif  name == "Charged TNT Run"				then JobLoader(7, 3390, 3391, 17401,	"a_blimp_ext")
	elseif  name == "Mega-Jump Job"					then JobLoader(7, 3464, 3466, 17485,	"a_blimp_ext")
	elseif  name == "Showdown with Clock-La"		then JobLoader(7, 3477, 3479, 17485,	"a_blimp_ext")
	end
end


function sly2_reset_job()
	Memory.WriteInt(0x4FEBF4, -1)
	Memory.WriteInt(0x4FEBF8, -1)
	Memory.WriteInt(0x4FEBFC, -1)
end

function SetJobCheckPointIndex(value)
	Memory.WriteInt(0x4FEBF8, value)
	Memory.WriteInt(0x4FEBFC, value)
end

function SetJobIndex(value)
	Memory.WriteInt(0x4FEBF4, value)
end

function SetSpawnLocationIndex(value)
	Memory.WriteInt(0x7B4C98, value)
end