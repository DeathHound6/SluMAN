-- Helper methods to make working with the API easier.
require 'Convert'

Memory = {}

local bigendian = API:GetType().Name ~= "PCSX2"

if bigendian then
    Console.Log("Using big-endian mode")
else
    Console.Log("Using little-endian mode")
end

-- Write an int (32-bit) to memory
Memory.WriteInt = function(addr, int)
    API:WriteMemory(addr, Convert.IntToByteArray(int, 4, bigendian))
end

-- Read an int (32-bit) from memory.
Memory.ReadInt = function(addr, pid)
    return Convert.ByteArrayToInt(API:ReadMemory(addr, 4), bigendian)
end

-- Write a single byte to memory.
Memory.WriteByte = function(addr, byte)
    API:WriteMemory(addr, Convert.TableToByteArray({byte}))
end

-- Read a single byte from memory.
Memory.ReadByte = function(addr)
    return Convert.ByteArrayToInt(API:ReadMemory(addr, 1))
end

Memory.ReadBytes = function(addr, size)
    return Convert.ByteArrayToInt(API:ReadMemory(addr, size))
end

-- Write a float (4-byte) to memory
Memory.WriteFloat = function(addr, float)
    if bigendian then
        API:WriteMemory(addr, Convert.ReverseArray(Convert.FloatToByteArray(float)))
    else
        API:WriteMemory(addr, Convert.FloatToByteArray(float))
    end
end

-- Read a float (4-byte) to memory.
Memory.ReadFloat = function(addr, pid)
    return Convert.ByteArrayToFloat(API:ReadMemory(addr, 4), bigendian)
end


-- Write a table of integers (8-bit) to memory
-- Limiting the amount of values written at once with 'slice_size'
Memory.WriteTable = function(addr, table)
    local slice_size = 128
    local num_slices = math.ceil(#values / slice_size)
    for i = 1, num_slices do
        local start_index = (i - 1) * slice_size + 1
        local end_index = math.min(i * slice_size, #values)
        local slice = {}
        for j = start_index, end_index do
            table.insert(slice, values[j])
        end
        API:WriteMemory(address + (i - 1) * slice_size, Convert.TableToByteArray(slice))
    end
end