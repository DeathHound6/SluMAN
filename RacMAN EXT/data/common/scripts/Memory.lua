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

Memory.WriteTable = function(addr, table)
    API:WriteMemory(addr, Convert.TableToByteArray(table))
end