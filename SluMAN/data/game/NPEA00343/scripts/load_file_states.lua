function set_run_file_state(dag_address, dag_table, map_name, spawn_location, gadgets)
    sly3_reset_job()
    Memory.WriteFloat(0x589A3C, 0) 
    Memory.WriteTable(dag_ep0_addr, dag_ep0_fini)
    Memory.WriteTable(dag_address, dag_table)
    sly3_set_map(map_name)
    Memory.WriteInt(0x78D308, spawn_location) 
    API:WriteMemory(0x6CC7F8, Convert.TableToByteArray(gadgets))
end

function load_run_file(name)
    local gadgets = {}
    if name == "ep1" then
        gadgets = {255, 1, 0, 2, 0, 2, 124, 0}
        set_run_file_state(dag_ep1_addr, dag_ep1_day0, "Y$KFv_ext", 424, gadgets)
        load(18)

    elseif name == "ep2" then
        gadgets = {255, 7, 4, 134, 64, 134, 124, 0}
        set_run_file_state(dag_ep2_addr, dag_ep2_day0, "Y$KFo_ext", 424, gadgets)
        load(18)

    elseif name == "ep3" then
        gadgets = {255, 31, 28, 142, 72, 150, 125, 0}
        set_run_file_state(dag_ep3_addr, dag_ep3_day0, "Y$KFh_ext", 424, gadgets)
        load(18)

    elseif name == "ep4" then
        gadgets = {255, 127, 126, 158, 73, 190, 9, 0}
        set_run_file_state(dag_ep4_addr, dag_ep4_day1, "Y$KFc_ext", 424)
        load(18)

    elseif name == "ep5" then
        gadgets = {255, 255, 255, 191, 207, 254, 11, 0}
        set_run_file_state(dag_ep5_addr, dag_ep5_day0, "Y$KFp_ext", 424, gadgets)
        load(18)

    elseif name == "ep6_any" then
        gadgets = {255, 255, 255, 191, 223, 255, 11, 0}
        set_run_file_state(dag_ep6_addr, dag_ep6_any, "Y$KFm_ext", 16386, gadgets)
        load_job_helper(4342, 1842, 18, "Y$KFm_ext")

    elseif name == "ep6_ngp" then
        gadgets = {255, 255, 255, 191, 223, 255, 11, 0}
        set_run_file_state(dag_ep6_addr, dag_ep6_ngp, "Y$KFm_ext", 16386, gadgets)
        -- Set noob mode to max
        Memory.WriteFloat(0x6CCDA0, 1)
        Memory.WriteFloat(0x6CCDC0, 1)
        Memory.WriteFloat(0x6CCD90, 1)
        Memory.WriteFloat(0x6CCD80, 1)
        Memory.WriteFloat(0x6CCD60, 1)
        Memory.WriteFloat(0x6CCD80, 1)
        Memory.WriteFloat(0x6CCDD0, 1)
        Memory.WriteFloat(0x6CCD70, 1)
    end
end

function load_run_file(name)
    if name == "Episode 1" then load_run_file("ep1")
    elseif name == "Episode 2" then load_run_file("ep2")
    elseif name == "Episode 3" then load_run_file("ep3")
    elseif name == "Episode 4" then load_run_file("ep4")
    elseif name == "Episode 5" then load_run_file("ep5")
    elseif name == "Episode 6 Any% (No CE)" then load_run_file("ep6_any")
    elseif name == "Episode 6 NG+ (CE)" then load_run_file("ep6_ngp")
    else
        print("Error reading run file: run file {"..tostring(name).."} does not exist.")
    end
end