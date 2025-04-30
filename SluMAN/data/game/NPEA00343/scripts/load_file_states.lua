function write_table_slices(address, values)
    local slice_size = 64
    local num_slices = math.ceil(#values / slice_size)
    for i = 1, num_slices do
        local start_index = (i - 1) * slice_size + 1
        local end_index = math.min(i * slice_size, #values)
        local slice = {}
        for j = start_index, end_index do
            table.insert(slice, values[j])
        end
        Memory.WriteTable(address + (i - 1) * slice_size, slice)
    end
end

function load_run_file(name)
    sly3_reset_job()
    Memory.WriteFloat(0x589A3C, 0) -- noob mode off
    Memory.WriteTable(0x6CD034, dag_table_cooper_vault_finished)

    if name == "ep1" then
        local start_address = 0x6CD764
        local values = dag_table_ep1_start
        write_table_slices(start_address, values)
        sly3_set_map("Y$KFv_ext")
        Memory.WriteInt(0x78D308, 424) -- Spawn to hideout
        load(18)
        API:WriteMemory(0x6CC7F8, Convert.TableToByteArray({255, 1, 0, 2, 0, 2, 124, 0}))

    elseif name == "ep2" then
        local start_address = 0x6CE314
        local values = dag_table_ep2_start
        write_table_slices(start_address, values)
        sly3_set_map("Y$KFo_ext")
        Memory.WriteInt(0x78D308, 424) -- Spawn to hideout
        load(18)
        API:WriteMemory(0x6CC7F8, Convert.TableToByteArray({255, 7, 4, 134, 64, 134, 124, 0}))

    elseif name == "ep3" then
        local start_address = 0x6CED80
        local values = dag_table_ep3_start
        write_table_slices(start_address, values)
        sly3_set_map("Y$KFh_ext")
        Memory.WriteInt(0x78D308, 424) -- Spawn to hideout
        load(18)
        API:WriteMemory(0x6CC7F8, Convert.TableToByteArray({255, 31, 28, 142, 72, 150, 125, 0}))

    elseif name == "ep4" then
        local start_address = 0x6CF688
        local values = dag_table_ep4_start
        write_table_slices(start_address, values)
        sly3_set_map("Y$KFc_ext")
        Memory.WriteInt(0x78D308, 424) -- Spawn to hideout
        load(18)
        API:WriteMemory(0x6CC7F8, Convert.TableToByteArray({255, 127, 126, 158, 73, 190, 9, 0}))

    elseif name == "ep5" then
        local start_address = 0x6D0680
        local values = dag_table_ep5_start
        write_table_slices(start_address, values)
        sly3_set_map("Y$KFp_ext")
        Memory.WriteInt(0x78D308, 424) -- Spawn to hideout
        load(18)
        API:WriteMemory(0x6CC7F8, Convert.TableToByteArray({255, 255, 255, 191, 207, 254, 11, 0}))

    elseif name == "ep6_any" then
        local start_address = 0x6D1258
        local values = dag_table_ep6_start
        write_table_slices(start_address, values)
        Memory.WriteInt(0x78D308, 16386)
        load_job_helper(4342, 1842, 18, "Y$KFm_ext")
        -- Gadgets
        API:WriteMemory(0x6CC7F8, Convert.TableToByteArray({255, 255, 255, 191, 223, 255, 11, 0}))

    elseif name == "ep6_ngp" then
        local start_address = 0x6D1258
        local values = dag_table_ep6_ce_start
        write_table_slices(start_address, values)
        Memory.WriteInt(0x78D308, 16386)
        load_job_helper(4342, 1842, 18, "Y$KFm_ext")
        -- Set noob mode to max
        Memory.WriteFloat(0x6CCDA0, 1)
        Memory.WriteFloat(0x6CCDC0, 1)
        Memory.WriteFloat(0x6CCD90, 1)
        Memory.WriteFloat(0x6CCD80, 1)
        Memory.WriteFloat(0x6CCD60, 1)
        Memory.WriteFloat(0x6CCD80, 1)
        Memory.WriteFloat(0x6CCDD0, 1)
        Memory.WriteFloat(0x6CCD70, 1)
        -- Gadgets
        API:WriteMemory(0x6CC7F8, Convert.TableToByteArray({255, 255, 255, 191, 223, 255, 11, 0}))

    end
end

function sly3_load_run_file()
    local name = Trainer.GetControlByName('runFileDropDown').Text
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